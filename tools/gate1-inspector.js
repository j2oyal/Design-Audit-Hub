const http = require('http');

function execFigma(code) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({ code, timeout: 60000 });
    // Try ports in priority: FIGMA_BRIDGE_PORT, 9223, 9225, 9226
    const ports = [
      parseInt(process.env.FIGMA_BRIDGE_PORT || '9223', 10),
      9223,
      9225,
      9226
    ];

    function tryNextPort(idx) {
      if (idx >= ports.length) {
        return reject(new Error('Cannot connect to Figma Bridge on any port'));
      }
      const port = ports[idx];
      const req = http.request({
        hostname: 'localhost',
        port: port,
        path: '/execute',
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Content-Length': Buffer.byteLength(postData)
        }
      }, res => {
        let d = '';
        res.on('data', c => d += c);
        res.on('end', () => {
          try {
            const j = JSON.parse(d);
            if (j.success) resolve(j.result);
            else reject(new Error(j.error));
          } catch(e) { reject(e); }
        });
      });
      req.on('error', () => {
        tryNextPort(idx + 1);
      });
      req.write(postData);
      req.end();
    }

    tryNextPort(0);
  });
}

async function run() {
  const code = `
    const section = await figma.getNodeByIdAsync('25493:60175');
    if (!section) return { error: 'Section 25493:60175 not found' };

    // Filter out audit note frames
    const screens = (section.children || []).filter(c => !c.name.includes('-Audit-Notes'));

    const results = [];

    // Official Atomic Library Components Whitelist
    const isAtomicLibraryComponent = (name) => {
      const nl = name.toLowerCase();
      return nl.includes('table-cell') || 
             nl.includes('button') || 
             nl.includes('badge') || 
             nl.includes('input') || 
             nl.includes('select') || 
             nl.includes('divider') ||
             nl.includes('icon');
    };

    for (const screen of screens) {
      let totalStructuralLeaves = 0;
      let validAtomicInstances = 0;
      let rawFramesList = [];

      // Token & Typography Deep Metrics
      let totalSolidFills = 0;
      let boundSolidFills = 0;
      let rawSolidFills = [];

      let totalSolidStrokes = 0;
      let boundSolidStrokes = 0;
      let rawSolidStrokes = [];

      let totalTexts = 0;
      let boundTexts = 0;
      let unboundTexts = [];

      // Table & Layout Deep Metrics
      let tableRowsTotal = 0;
      let tableRowsFill = 0;
      let tableHeaderExtraStrokes = 0;
      let tableDeadSpaces = 0;
      let tableNonInstanceCells = 0;

      function inspectDeep(n, parentIsInstance = false) {
        const isCurrentInstance = n.type === 'INSTANCE';
        const insideInstance = parentIsInstance || isCurrentInstance;

        // 1. Text Layer Deep Inspection
        if (n.type === 'TEXT') {
          totalTexts++;
          if (n.textStyleId && n.textStyleId !== '') {
            boundTexts++;
          } else {
            if (unboundTexts.length < 5) {
              unboundTexts.push({ id: n.id, name: n.name, text: n.characters ? n.characters.slice(0, 20) : '' });
            }
          }
        }

        // 2. Leaf / Structural Accounting
        if (!n.children || n.children.length === 0) {
          totalStructuralLeaves++;
          if (insideInstance) {
            validAtomicInstances++;
          }
        } else if (!insideInstance && (n.type === 'FRAME' || n.type === 'GROUP')) {
          const nl = n.name.toLowerCase();
          if (
            nl.includes('button') || nl.includes('btn') ||
            nl.includes('badge') || nl.includes('tag') ||
            nl.includes('card') || nl.includes('modal') ||
            nl.includes('dialog') || nl.includes('input') ||
            nl.includes('tab') || nl.includes('toggle') ||
            nl.includes('select') || nl.includes('dropdown') ||
            nl.includes('table') || nl.includes('row') ||
            nl.includes('toolbar')
          ) {
            rawFramesList.push({ id: n.id, name: n.name });
          }
        }

        // 3. Fills Deep Inspection
        if (n.fills && Array.isArray(n.fills)) {
          for (const f of n.fills) {
            if (f.type === 'SOLID' && f.visible !== false) {
              totalSolidFills++;
              const isBound = (n.boundVariables && n.boundVariables.fills && n.boundVariables.fills.length > 0) || !!n.fillStyleId;
              if (isBound) {
                boundSolidFills++;
              } else {
                const hex = '#' + 
                  Math.round(f.color.r * 255).toString(16).padStart(2, '0') +
                  Math.round(f.color.g * 255).toString(16).padStart(2, '0') +
                  Math.round(f.color.b * 255).toString(16).padStart(2, '0');
                if (rawSolidFills.length < 5) {
                  rawSolidFills.push({ id: n.id, name: n.name, hex });
                }
              }
            }
          }
        }

        // 4. Strokes Deep Inspection
        if (n.strokes && Array.isArray(n.strokes)) {
          for (const s of n.strokes) {
            if (s.type === 'SOLID' && s.visible !== false) {
              totalSolidStrokes++;
              const isBound = (n.boundVariables && n.boundVariables.strokes && n.boundVariables.strokes.length > 0) || !!n.strokeStyleId;
              if (isBound) {
                boundSolidStrokes++;
              } else {
                const hex = '#' + 
                  Math.round(s.color.r * 255).toString(16).padStart(2, '0') +
                  Math.round(s.color.g * 255).toString(16).padStart(2, '0') +
                  Math.round(s.color.b * 255).toString(16).padStart(2, '0');
                if (rawSolidStrokes.length < 5) {
                  rawSolidStrokes.push({ id: n.id, name: n.name, hex });
                }
              }
            }
          }
        }

        // 5. Table & Row Layout Deep Inspection
        const nl = n.name.toLowerCase();
        const isTableRow = (nl.includes('row') || nl.includes('header')) && n.children && n.children.length >= 2;
        if (isTableRow) {
          tableRowsTotal++;
          if (n.layoutSizingHorizontal === 'FILL') {
            tableRowsFill++;
          }
          if (nl.includes('header')) {
            const visibleStrokes = (n.strokes || []).filter(s => s.visible !== false);
            if (visibleStrokes.length > 0) {
              tableHeaderExtraStrokes += visibleStrokes.length;
            }
          }

          let rowHasGrow = false;
          for (const cell of n.children) {
            if (cell.type !== 'INSTANCE') {
              tableNonInstanceCells++;
            }
            if (cell.layoutGrow === 1 || cell.layoutSizingHorizontal === 'FILL') {
              rowHasGrow = true;
            }
          }
          if (!rowHasGrow) {
            tableDeadSpaces++;
          }
        }

        // RECURSE DEEPLY INTO ALL CHILDREN REGARDLESS OF INSTANCE TYPE
        if (n.children) {
          for (const child of n.children) {
            inspectDeep(child, insideInstance);
          }
        }
      }

      inspectDeep(screen, false);

      const adoptionRate = totalStructuralLeaves > 0 
        ? parseFloat(((validAtomicInstances / totalStructuralLeaves) * 100).toFixed(2)) 
        : 100.0;
      const fillPurityRate = totalSolidFills > 0 
        ? parseFloat(((boundSolidFills / totalSolidFills) * 100).toFixed(2)) 
        : 100.0;
      const typographyRate = totalTexts > 0 
        ? parseFloat(((boundTexts / totalTexts) * 100).toFixed(2)) 
        : 100.0;
      const tableRowFillRate = tableRowsTotal > 0
        ? parseFloat(((tableRowsFill / tableRowsTotal) * 100).toFixed(2))
        : 100.0;

      const isPass = (
        adoptionRate >= 95.0 && 
        rawSolidFills.length === 0 && 
        typographyRate === 100.0 && 
        tableHeaderExtraStrokes === 0 && 
        tableRowFillRate === 100.0
      );

      results.push({
        id: screen.id,
        name: screen.name,
        width: Math.round(screen.width),
        height: Math.round(screen.height),
        totalStructuralLeaves,
        validAtomicInstances,
        adoptionRate,
        rawFramesCount: rawFramesList.length,
        rawFramesSamples: rawFramesList.slice(0, 3),
        fillPurityRate,
        rawSolidFillsCount: totalSolidFills - boundSolidFills,
        rawSolidFillsSamples: rawSolidFills,
        totalTexts,
        boundTexts,
        typographyRate,
        unboundTextsSamples: unboundTexts,
        tableRowsTotal,
        tableRowsFill,
        tableRowFillRate,
        tableHeaderExtraStrokes,
        tableDeadSpaces,
        tableNonInstanceCells,
        isPass
      });
    }

    return results;
  `;

  const list = await execFigma(code);
  if (!list || !Array.isArray(list)) {
    console.error("Execution failed or invalid result:", list);
    return;
  }

  console.log("\n===================================================================================================================");
  console.log(" 🛡️ DESIGN-AUDIT-HUB: PHÁN QUYẾT TOÀ ÁN GATE 1 (DEEP-INSPECTION ENGINE V2) — SECTION 25493:60175");
  console.log(" File Figma: [Admin] MASHK - Design System (Key: 1bkQMosF8oqtOPhJIxJMk4)");
  console.log(" Tiêu chuẩn: standards/01-design-system/ds-admin.md | Khắc phục triệt để lỗ hổng 'Pass ảo 100%'");
  console.log(" 5 Chốt Chặn Bắt Buộc: 1. Adoption >= 95% | 2. Zero Raw Hex | 3. 100% TextStyle | 4. 100% Rows FILL | 5. 0 Double Stroke");
  console.log("===================================================================================================================\n");

  let totalPass = 0;
  let totalFail = 0;

  console.log("| STT | Tên Màn Hình | Node ID | Component | Token Fills | Typography | Table FILL | Header Stroke | Phán Quyết Gate 1 |");
  console.log("| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |");

  list.forEach((s, idx) => {
    if (s.isPass) totalPass++; else totalFail++;
    const status = s.isPass ? "✅ PASS" : "❌ REWORK_REQUIRED";
    console.log(`| ${idx + 1} | ${s.name} | \`${s.id}\` | ${s.adoptionRate}% | ${s.fillPurityRate}% | ${s.typographyRate}% (${s.boundTexts}/${s.totalTexts}) | ${s.tableRowFillRate}% (${s.tableRowsFill}/${s.tableRowsTotal}) | ${s.tableHeaderExtraStrokes} | **${status}** |`);
  });

  console.log("\n-------------------------------------------------------------------------------------------------------------------");
  console.log(`📊 TỔNG HỢP KIỂM TOÁN DEEP-INSPECTION GATE 1:`);
  console.log(` - Tổng số màn hình MVP: ${list.length}`);
  console.log(` - Đạt chuẩn THỰC CHẤT (PASS 5/5 tiêu chí): ${totalPass} màn hình`);
  console.log(` - Vi phạm thực tế (REWORK_REQUIRED): ${totalFail} màn hình`);
  const finalVerdict = totalFail === 0 ? "PASS" : "REWORK_REQUIRED";
  console.log(`👑 PHÁN QUYẾT TỐI CAO GATE 1: [${finalVerdict}]`);
  console.log("===================================================================================================================\n");

  if (totalFail > 0) {
    console.log("🔍 CHI TIẾT CÁC LỖI NỘI TẠI TRONG COMPONENT BỊ PHÁT HIỆN:");
    list.filter(s => !s.isPass).forEach(s => {
      console.log(`\n▶ [${s.name}] (\`${s.id}\`):`);
      if (s.typographyRate < 100.0) {
        console.log(`  - 🔤 Typography chưa bind style: ${s.totalTexts - s.boundTexts} text layer(s) vi phạm`);
        console.log(`    + Mẫu: ${s.unboundTextsSamples.map(t => `"${t.text}" (${t.id})`).join(', ')}`);
      }
      if (s.tableRowFillRate < 100.0) {
        console.log(`  - 📏 Hàng bảng chưa FILL: ${s.tableRowsTotal - s.tableRowsFill} hàng mang kích thước Fixed`);
      }
      if (s.tableHeaderExtraStrokes > 0) {
        console.log(`  - ⚠️ Lỗi viền kép Header: ${s.tableHeaderExtraStrokes} outer stroke thừa`);
      }
      if (s.rawSolidFillsCount > 0) {
        console.log(`  - 🎨 Raw hex trôi nổi: ${s.rawSolidFillsCount} lớp màu`);
      }
    });
  }
}

run().catch(console.error);
