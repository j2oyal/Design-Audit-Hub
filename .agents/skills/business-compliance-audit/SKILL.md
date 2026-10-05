---
name: business-compliance-audit
description: Financial Compliance & Business Rules Auditor Skill (Gate 4). Chuyên trách thẩm định tính đúng đắn toán học tài chính (P&L, phí sàn), kiểm tra bảng bước giá HKEX 503, lô chuẩn, chống lỗi crossed book và kiểm soát quy trình an toàn vận hành Maker-Checker.
---

# ⚖️ Financial Compliance & Business Rules Auditor Skill (`business-compliance-audit`)

Kỹ năng chuyên biệt cấp cao dành cho AI Agent đóng vai trò là **Financial Compliance & Securities Business Auditor (Gate 4)**.
Nhiệm vụ tối thượng: Đảm bảo số liệu tài chính trên bản vẽ và mã nguồn chính xác tuyệt đối về mặt toán học, tuân thủ nghiêm ngặt quy chế Sở giao dịch chứng khoán (HKEX, HOSE), bảo vệ tính toàn vẹn của sổ lệnh và kiểm soát phân quyền rủi ro trong quản trị backoffice.

---

## ⛔ 1. Ranh Giới Cấm Kỵ Tuyệt Đối (Zero-Leakage Policy)
Để không dẫm chân lên 3 Cổng thẩm định còn lại:
1. **Tuyệt đối CẤM bắt lỗi Token & Mã màu**: Thấy màu nút hay font chữ chưa chuẩn $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 1: `audit-design-system`**).
2. **Tuyệt đối CẤM phán xét Mỹ thuật & Tinh xảo**: Thấy card bo góc chưa đồng tâm hay thiếu viền mờ $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 2: `ui-visual-audit`**).
3. **Tuyệt đối CẤM bắt lỗi Vùng ngón cái & Thumb zone**: Thấy nút bấm đặt ở góc trên hay kích thước 40px $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 3: `ux-usability-audit`**).

---

## 🏛️ 2. Tiêu Chuẩn Nghiệp Vụ Theo 4 Lĩnh Vực

* **📱 MTS (Mobile Trading)**: Bảng bước giá HKEX 503, lô chuẩn (Tencent 100 cp, HSBC 400 cp), kiểm tra tỷ lệ đòn bẩy Margin Rtt và sức mua.
* **🖥️ WTS (Web Workstation)**: Lệnh nâng cao (Iceberg, OCO, Trailing Stop), chống lỗi Crossed Order Book (Bid $\ge$ Ask).
* **🏢 Admin Backoffice**: Phân quyền 4 mắt (Maker-Checker), quy trình kích hoạt Call Margin và thanh lý cưỡng chế Force-sell.
* **🚀 Landing Page**: Cảnh báo rủi ro đầu tư bắt buộc ở chân trang, minh bạch điều khoản dịch vụ và chính sách bảo mật.
* Tra cứu chi tiết tại: [financial-math-formulas.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/business-compliance-audit/references/financial-math-formulas.md) và [market-rules-hkex-hose.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/business-compliance-audit/references/market-rules-hkex-hose.md).

---

## 🎨 3. Quy Trình Xuất Thẻ Ghi Chú Đồ Họa Lên Canvas (`[BA-Compliance-Audit-Notes]`)

Khi phát hiện lỗi số học hoặc vi phạm quy chế sàn, Agent chạy đoạn script sau trong `figma_execute` để tạo thẻ Emerald trực quan cạnh màn hình:

```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_NODE_ID>');
  if (!target) return;
  await figma.loadFontAsync({ family: "Inter", style: "Bold" });
  await figma.loadFontAsync({ family: "Inter", style: "Regular" });

  const card = figma.createFrame();
  card.name = `[BA-Compliance-Audit-Notes] ${target.name}`;
  card.resize(320, 240);
  card.x = target.x + target.width + 32;
  card.y = target.y;
  card.fills = [{ type: 'SOLID', color: { r: 0.04, g: 0.10, b: 0.08 } }];
  card.cornerRadius = 12;
  card.strokes = [{ type: 'SOLID', color: { r: 0.10, g: 0.75, b: 0.50 } }]; // Emerald Green border
  card.strokeWeight = 1.5;
  card.layoutMode = 'VERTICAL';
  card.paddingTop = card.paddingBottom = card.paddingLeft = card.paddingRight = 16;
  card.itemSpacing = 8;

  const title = figma.createText();
  title.characters = `⚖️ BA Compliance Audit: ${target.name}`;
  title.fontName = { family: "Inter", style: "Bold" };
  title.fontSize = 14;
  title.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }];
  card.appendChild(title);

  const body = figma.createText();
  body.characters = `• Toán học tài chính: ĐẠT (Gross = Price * Qty)\n• Quy chế HKEX: Sai bước giá Tencent (385.25 vi phạm spread 0.20)\n• Cảnh báo: Volume thiếu 3 số lẻ (11.6M thay vì 11.650M)`;
  body.fontName = { family: "Inter", style: "Regular" };
  body.fontSize = 12;
  body.fills = [{ type: 'SOLID', color: { r: 0.8, g: 0.95, b: 0.85 } }];
  card.appendChild(body);

  target.parent.appendChild(card);
})();
```

---

## 🎯 4. Rubric Tự Chấm Điểm & Cổng Chặn Cứng (Thang 100)

### 🚫 Cổng Chặn Cứng (Hard Blockers — Dính 1 lỗi = TỰ ĐỘNG REJECT):
1. **Lỗi logic toán học nghiêm trọng (Unrealized P&L dương nhưng hiện màu đỏ, hoặc tính sai Gross Value)**.
2. **Xuất hiện sổ lệnh lỗi Crossed Book (Giá Mua $\ge$ Giá Bán)**.
3. **Vi phạm bước giá tối thiểu (Minimum Tick Size) của Sở giao dịch**.
4. **Rò rỉ phạm vi (BA Leakage)**: Đi phán xét padding hay gu thẩm mỹ của Designer.

### 📊 Thang Điểm Nghiệm Thu:
* **Toán học tài chính & Tính toàn vẹn P&L**: 35 điểm.
* **Tuân thủ quy chế sàn (Tick size & Board lot)**: 25 điểm.
* **Chuẩn hiển thị số 3-3-2 & Minh bạch thuế phí**: 20 điểm.
* **Phân quyền an toàn Maker-Checker / Cảnh báo rủi ro**: 20 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 90/100$ điểm.
