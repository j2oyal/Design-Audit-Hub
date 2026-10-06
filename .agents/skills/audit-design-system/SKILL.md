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

## 🗺️ 3. Phân Hệ Tiêu Chuẩn Theo Từng Domain (Domain Standards)
Khi nhận diện mục tiêu thẩm định, Agent bắt buộc nạp tài liệu tiêu chuẩn tương ứng:
* **🏢 ADMIN**: [domains/admin-ds.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/audit-design-system/domains/admin-ds.md) (Bộ 5 Invariants Data Grid, Cell Whitelisting `3913:54247`, Table Row FILL, Token Semantic Badge).
* **📱 MTS**: [standards/01-design-system/ds-mts.md](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-mts.md) (OrderPad sheet, Keypad ảo, Steppers).
* **🖥️ WTS**: [standards/01-design-system/ds-wts.md](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-wts.md) (Docking workspace, OrderBook ladder).
* **🚀 LANDING**: [standards/01-design-system/ds-landing.md](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-landing.md) (Standalone tokens, Hero section).

---

## 🏷️ 4. Quy Chuẩn Đánh Dấu Lỗi Bằng Native Dev Mode Annotations (CẤM XẢ RÁC CANVAS)

> **CẢNH BÁO BẤT DI BẤT DỊCH**: TUYỆT ĐỐI CẤM dùng `createFrame` tạo các hộp note dán đè lên Canvas (`appendChild(card)`). Hành vi này làm hỏng cấu trúc canvas và phá vỡ bố cục Section.

Khi phát hiện vi phạm, Agent BẮT BUỘC sử dụng **Figma Native Dev Mode Annotations**:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-1: DS VIOLATION",
      notes: "• Tỷ lệ Component: 91% (TRƯỢT - Yêu cầu >= 95%)\n• 3 Text node chưa gắn textStyleId\n• Hàng bảng có layoutSizingHorizontal !== FILL\n• Master Component chuẩn cần dùng: Building-Blocks/table-cell (3913:54247)",
      category: "AUDIT"
    }
  ]);
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

---

## 📡 5. Quy Chuẩn Bắn Tín Hiệu Kết Thúc (Signal Emitting Protocol)
Sau khi ghi xong báo cáo Markdown tại `reports/`, Agent BẮT BUỘC chạy lệnh phát tín hiệu để thông báo ngay cho Thư ký:
```powershell
powershell -ExecutionPolicy Bypass -File tools\emit-signal.ps1 -TaskId "<TASK_ID>" -Type AUDIT_DONE -Status "<PASS|FAIL>" -Score "<SCORE>" -ReportFile "<REPORT_PATH>" -Summary "<TÓM TẮT KẾT QUẢ>"
```
Tín hiệu này giúp Thư ký nhận diện kết quả tự động mà không cần Người dùng phải can thiệp thủ công.
