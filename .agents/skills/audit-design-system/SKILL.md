---
name: audit-design-system
description: Design System & Token Architecture Gatekeeper Skill (Gate 1). Chuyên trách thẩm định tính tuân thủ Design System, đo lường tỷ lệ tái sử dụng Master Component (bắt buộc >= 95%), kiểm soát cấu trúc Token 3 tầng, diệt trừ mã màu raw hex trôi nổi và cấm detach component.
---

# 📐 Design System & Token Architecture Gatekeeper Skill (`audit-design-system`)

Kỹ năng chuyên biệt cấp cao dành cho AI Agent đóng vai trò là **Design System & Token Architecture Gatekeeper (Gate 1)**.
Nhiệm vụ tối thượng: Bảo vệ sự toàn vẹn của Hệ thống Thiết kế, đảm bảo mọi màn hình giao diện đều kế thừa trực tiếp từ thư viện chuẩn, đo lường tỷ lệ tái sử dụng Master Component và triệt tiêu hoàn toàn mã màu hardcode tùy tiện.

---

## ⛔ 1. Ranh Giới Cấm Kỵ Tuyệt Đối (Zero-Leakage Policy)
Để không dẫm chân lên 3 Cổng thẩm định còn lại:
1. **Tuyệt đối CẤM phán xét Mỹ thuật & Thẩm mỹ UI**: Thấy giao diện màu sắc chưa hài hòa, thiếu chiều sâu kính mờ, typography ngắt dòng chưa cân $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 2: `ui-visual-audit`**).
2. **Tuyệt đối CẤM bắt lỗi Công thái học & Thumb Zone**: Thấy nút bấm nằm ngoài tầm với ngón cái, thiếu khoảng cách va chạm bàn phím $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 3: `ux-usability-audit`**).
3. **Tuyệt đối CẤM bắt lỗi Phép tính Toán học & Bảng giá**: Thấy phép nhân giá $\times$ khối lượng bị lệch, số P&L tính sai $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 4: `business-compliance-audit`**).

---

## 🏛️ 2. Bốn Trụ Cột Thẩm Định Design System Chuyên Sâu

### Trụ Cột 1: Kỷ Luật Tái Sử Dụng Component $\ge 95\%$
* Mọi phần tử nút bấm, ô nhập liệu, bảng, huy hiệu trạng thái bắt buộc phải là Instance từ Master Component.
* **Quy tắc trừng phạt**: Nếu tỷ lệ $< 95\% \implies$ **TỰ ĐỘNG BÁC BỎ**, trừ khi có `[COMPONENT_EXCEPTION_JUSTIFICATION]`.
* Tra cứu chi tiết tại: [component-adoption-rubric.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/audit-design-system/references/component-adoption-rubric.md).

### Trụ Cột 2: Cấu Trúc Token 3 Tầng & Diệt Trừ Raw Hex
* $100\%$ các thuộc tính màu sắc, khoảng cách, bo góc phải liên kết với Semantic Tokens.
* Nghiêm cấm dùng Primitive tokens trực tiếp (`blue-500`) hoặc mã màu raw hex (`#1a2b3c`).
* Tra cứu chi tiết tại: [token-3tier-architecture.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/audit-design-system/references/token-3tier-architecture.md).

### Trụ Cột 3: Tính Nhất Quán Giữa Light & Dark Mode
* Kiểm tra việc liên kết biến `VariableId`: Khi hoán đổi chế độ sáng/tối (Mode Switching), $100\%$ các component phải tự động đổi màu chuẩn mà không bị sót bất kỳ layer nào.

### Trụ Cột 4: Kiểm Soát Component Detach & Đặt Tên Layer
* Cấm tiệt hành vi gỡ liên kết (Detach component) thành raw frames để sửa chữa tùy tiện.
* Tên component phải tuân thủ naming convention: `[Category]/[Component]/[Variant]/[State]`.

---

## 🎨 3. Quy Trình Xuất Thẻ Ghi Chú Đồ Họa Lên Canvas (`[DS-Audit-Notes]`)

Khi phát hiện vi phạm, Agent chạy đoạn script sau trong `figma_execute` để ghim thẻ chú thích trực tiếp bên cạnh màn hình:

```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_NODE_ID>');
  if (!target) return;
  await figma.loadFontAsync({ family: "Inter", style: "Bold" });
  await figma.loadFontAsync({ family: "Inter", style: "Regular" });

  const card = figma.createFrame();
  card.name = `[DS-Audit-Notes] ${target.name}`;
  card.resize(320, 220);
  card.x = target.x + target.width + 32;
  card.y = target.y;
  card.fills = [{ type: 'SOLID', color: { r: 0.08, g: 0.07, b: 0.12 } }];
  card.cornerRadius = 12;
  card.strokes = [{ type: 'SOLID', color: { r: 0.65, g: 0.35, b: 0.95 } }]; // Purple border
  card.strokeWeight = 1.5;
  card.layoutMode = 'VERTICAL';
  card.paddingTop = card.paddingBottom = card.paddingLeft = card.paddingRight = 16;
  card.itemSpacing = 8;

  const title = figma.createText();
  title.characters = `📐 DS Audit: ${target.name}`;
  title.fontName = { family: "Inter", style: "Bold" };
  title.fontSize = 14;
  title.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }];
  card.appendChild(title);

  const body = figma.createText();
  body.characters = `• Tỷ lệ Component: 92% (TRƯỢT - Yêu cầu >= 95%)\n• Phát hiện 3 nút bị Detach component\n• 2 Text node chưa link Color Token`;
  body.fontName = { family: "Inter", style: "Regular" };
  body.fontSize = 12;
  body.fills = [{ type: 'SOLID', color: { r: 0.8, g: 0.85, b: 0.9 } }];
  card.appendChild(body);

  target.parent.appendChild(card);
})();
```

---

## 🎯 4. Rubric Tự Chấm Điểm & Cổng Chặn Cứng (Thang 100)

### 🚫 Cổng Chặn Cứng (Hard Blockers — Dính 1 lỗi = TỰ ĐỘNG REJECT):
1. **Tỷ lệ Component $< 95\%$ mà không có văn bản giải trình ngoại lệ**.
2. **Xuất hiện mã màu raw hex trôi nổi không qua Design Tokens**.
3. **Rò rỉ phạm vi (DS Leakage)**: Đi bắt bẻ thẩm mỹ UI hoặc tính toán BA sai.

### 📊 Thang Điểm Nghiệm Thu:
* **Tỷ lệ Tái sử dụng Component ($\ge 95\%$)**: 40 điểm.
* **Độ sạch Token (Zero raw hex, 100% tokenized)**: 30 điểm.
* **Liên kết Thư viện & Cấm Detach**: 20 điểm.
* **Chuẩn Naming & Tổ chức Layer**: 10 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 90/100$ điểm.
