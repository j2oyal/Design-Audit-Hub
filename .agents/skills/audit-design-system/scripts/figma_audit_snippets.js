/**
 * Figma Plugin API Audit Snippets for [MTS] & [Core] MASHK Design System
 * Run these inside figma_execute
 * Full 7-Pillar Scanning + Dev Mode Annotations + Visual Card Generator
 */

export function isNodeVisible(node) {
  let curr = node;
  while (curr && curr.type !== 'PAGE' && curr.type !== 'DOCUMENT') {
    if (curr.visible === false) return false;
    curr = curr.parent;
  }
  return true;
}

export function getVisibleNodes(root) {
  const result = [];
  function traverse(node) {
    if (node.visible === false) return;
    result.push(node);
    if ('children' in node && Array.isArray(node.children)) {
      for (const child of node.children) traverse(child);
    }
  }
  traverse(root);
  return result;
}

/**
 * Audit toàn diện 7 Trụ Cột Kỹ Thuật trên một màn hình đơn lẻ (Single Screen Deep Audit)
 */
export async function auditSingleScreen(frameNodeId, options = { autoAnnotate: false }) {
  const frame = await figma.getNodeByIdAsync(frameNodeId);
  if (!frame) return { error: `Frame ${frameNodeId} not found` };
  if (frame.visible === false) return { error: `Frame ${frameNodeId} is hidden (visible: false)` };

  const allNodes = getVisibleNodes(frame);
  const customFrames = [];
  const interTexts = [];
  const unboundFills = [];
  const unboundStrokes = [];
  const oddSpacings = [];
  const oddRadii = [];
  const rawDividers = [];
  const placeholders = [];
  const fontMap = {};
  const annotationsPayload = [];

  const validRadii = [0, 2, 4, 8, 12, 16, 20, 28, 9999];
  const validSpacings = [0, 2, 4, 8, 12, 16, 20, 24, 32, 40, 48, 60];
  const placeholderPatterns = ['title', 'label', 'placeholder', 'lorem ipsum', 'item', 'description', '0000', '--'];

  // Trụ cột 2: Kiểm tra Canvas Root Frame có bind surface/01 không
  let rootCanvasBound = false;
  if (frame.fills && Array.isArray(frame.fills) && frame.fills[0]?.type === 'SOLID') {
    rootCanvasBound = Boolean(frame.boundVariables?.fills?.[0] || frame.fillStyleId);
  }
  if (!rootCanvasBound) {
    annotationsPayload.push({
      nodeId: frame.id,
      label: '🔴 Critical: Canvas Root chưa bind surface/01',
      properties: [
        { key: 'Rủi ro', value: 'Bị vỡ nền trắng khi người dùng chuyển sang Dark Mode' },
        { key: 'Khắc phục', value: 'Gán biến màu surface/01 cho frame gốc' }
      ]
    });
  }

  for (const n of allNodes) {
    if (n.type === 'SECTION') continue;

    // Bỏ qua các sticker note, canvas specs
    let isCanvasNote = false;
    let p = n.parent;
    while (p && p.type !== 'PAGE' && p.type !== 'DOCUMENT') {
      const pName = p.name.toLowerCase();
      if (pName.includes('note') || pName.includes('.sign') || pName.includes('spec')) {
        isCanvasNote = true;
        break;
      }
      p = p.parent;
    }
    if (isCanvasNote) continue;

    // Trụ cột 1: Custom Plain Frame đội lốt Component
    if (n.type === 'FRAME' && !n.id.startsWith('I') && n.id !== frame.id) {
      const lower = n.name.toLowerCase();
      if (['button', 'tabs', 'icon-box', 'tag', 'badge', 'card', 'table'].includes(lower)) {
        customFrames.push({ id: n.id, name: n.name, parent: n.parent?.name });
        annotationsPayload.push({
          nodeId: n.id,
          label: '🔴 Plain Frame đội lốt ' + n.name,
          properties: [
            { key: 'Hiện trạng', value: 'Vẽ frame thủ công thay vì dùng Remote Instance' },
            { key: 'Khắc phục', value: 'Thay bằng Master Component tương ứng từ thư viện [MTS]' }
          ]
        });
      }
    }

    // Trụ cột 3: Typography Hando vs Inter
    if (n.type === 'TEXT') {
      const isStatusBar = (n.parent && n.parent.name === 'Time Style') || (n.parent && n.parent.name === 'Status-bar');
      try {
        const segs = n.getStyledTextSegments(['fontName', 'textStyleId']);
        for (const s of segs) {
          const fam = s.fontName?.family || 'unknown';
          fontMap[fam] = (fontMap[fam] || 0) + 1;
          if (fam === 'Inter' && !isStatusBar) {
            interTexts.push({ id: n.id, name: n.name, text: n.characters.slice(0, 30), parent: n.parent?.name });
            annotationsPayload.push({
              nodeId: n.id,
              label: '🟠 Rò rỉ font cũ: Inter',
              properties: [
                { key: 'Font hiện tại', value: 'Inter' },
                { key: 'Chuẩn MASHK', value: 'Độc tôn font thương hiệu Hando' }
              ]
            });
            break;
          }
        }
      } catch (e) {}

      // Trụ cột 7: Dọn placeholder
      const txt = n.characters.trim().toLowerCase();
      if (placeholderPatterns.includes(txt) || txt.startsWith('lorem')) {
        placeholders.push({ id: n.id, text: n.characters.slice(0, 30), parent: n.parent?.name });
      }
    }

    // Trụ cột 2: Fills & Strokes cứng
    if (n.fills && Array.isArray(n.fills)) {
      for (let i = 0; i < n.fills.length; i++) {
        const fill = n.fills[i];
        if (fill.type === 'SOLID' && fill.visible !== false) {
          const isBound = (n.boundVariables?.fills?.[i]) || n.fillStyleId;
          const isFlagOrVector = n.type === 'VECTOR' && (n.name === 'Vector' || n.name.includes('path'));
          const isStatusBar = (n.parent && n.parent.name === 'Status-bar');
          if (!isBound && !isFlagOrVector && !isStatusBar) {
            unboundFills.push({ id: n.id, name: n.name, parent: n.parent?.name });
            break;
          }
        }
      }
    }

    // Trụ cột 4: Spacing Auto-Layout lẻ
    if (n.type === 'FRAME' && n.layoutMode !== 'NONE') {
      const checks = [
        { k: 'gap', v: n.itemSpacing },
        { k: 'padT', v: n.paddingTop },
        { k: 'padB', v: n.paddingBottom },
        { k: 'padL', v: n.paddingLeft },
        { k: 'padR', v: n.paddingRight }
      ];
      for (const c of checks) {
        if (typeof c.v === 'number' && !validSpacings.includes(c.v)) {
          oddSpacings.push({ id: n.id, name: n.name, prop: c.k, value: c.v });
          break;
        }
      }
    }

    // Trụ cột 5: Bo góc dị biệt
    if ('cornerRadius' in n && typeof n.cornerRadius === 'number') {
      if (!validRadii.includes(n.cornerRadius)) {
        oddRadii.push({ id: n.id, name: n.name, radius: n.cornerRadius });
      }
    }

    // Trụ cột 6: Raw Divider
    if (n.type === 'FRAME' && !n.id.startsWith('I')) {
      if ((n.height === 8 || n.height === 1) && n.width >= 300) {
        if (n.name.toLowerCase().includes('divider') || n.name.toLowerCase().includes('line')) {
          rawDividers.push({ id: n.id, name: n.name, height: n.height });
        }
      }
    }
  }

  // Tự động ghim Dev Mode Annotations nếu có yêu cầu
  if (options.autoAnnotate && annotationsPayload.length > 0) {
    try {
      await figma.setNodeAnnotationsAsync(annotationsPayload.slice(0, 30));
    } catch (e) {
      console.warn("Could not set annotations: " + e.message);
    }
  }

  return {
    screenId: frame.id,
    screenName: frame.name,
    totalNodes: allNodes.length,
    rootCanvasBound: rootCanvasBound,
    summary: {
      customFramesCount: customFrames.length,
      interTextsCount: interTexts.length,
      unboundFillsCount: unboundFills.length,
      oddSpacingsCount: oddSpacings.length,
      oddRadiiCount: oddRadii.length,
      rawDividersCount: rawDividers.length,
      placeholdersCount: placeholders.length,
      annotationsCreated: annotationsPayload.length
    },
    samples: {
      customFrames: customFrames.slice(0, 5),
      interTexts: interTexts.slice(0, 5),
      unboundFills: unboundFills.slice(0, 5),
      oddSpacings: oddSpacings.slice(0, 5),
      oddRadii: oddRadii.slice(0, 5)
    }
  };
}
