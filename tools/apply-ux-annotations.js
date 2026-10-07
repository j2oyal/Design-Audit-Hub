const http = require('http');
const { annotationsMap } = require('./batch-set-ux-annotations');

async function apply() {
  console.log('Checking connection to Figma Desktop Bridge...');
  
  // Format code to execute in Figma
  const scriptLines = [
    '(async () => {',
    '  const results = [];',
    '  const items = ' + JSON.stringify(annotationsMap) + ';',
    '  for (const item of items) {',
    '    const node = await figma.getNodeByIdAsync(item.nodeId);',
    '    if (!node) {',
    '      results.push({ id: item.nodeId, status: "NOT_FOUND" });',
    '      continue;',
    '    }',
    '    if (node.setAnnotationsAsync) {',
    '      await node.setAnnotationsAsync([{ labelMarkdown: item.markdown }]);',
    '      results.push({ id: item.nodeId, name: item.name, status: "ANNOTATED" });',
    '    } else {',
    '      results.push({ id: item.nodeId, name: item.name, status: "NO_ANNOTATION_API" });',
    '    }',
    '  }',
    '  return results;',
    '})()'
  ];

  const code = scriptLines.join('\n');

  // Probe ports 9223-9232
  const ports = [9223, 9224, 9225, 9226, 9227, 9228, 9229, 9230, 9231, 9232];
  let applied = false;

  for (const p of ports) {
    try {
      const res = await new Promise((resolve, reject) => {
        const postData = JSON.stringify({ code, timeout: 20000 });
        const req = http.request({
          hostname: 'localhost',
          port: p,
          path: '/execute',
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Content-Length': Buffer.byteLength(postData)
          }
        }, (r) => {
          let d = '';
          r.on('data', c => d += c);
          r.on('end', () => {
            try { resolve(JSON.parse(d)); } catch(e) { resolve(null); }
          });
        });
        req.on('error', () => resolve(null));
        req.setTimeout(3000, () => { req.destroy(); resolve(null); });
        req.write(postData);
        req.end();
      });

      if (res && res.success) {
        console.log(`Successfully applied via port ${p}!`);
        console.log(JSON.stringify(res.result, null, 2));
        applied = true;
        break;
      }
    } catch(e) {}
  }

  if (!applied) {
    console.log('Waiting for Desktop Bridge plugin in [Admin] MASHK - Design System...');
  }
}

apply().catch(console.error);
