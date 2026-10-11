---
name: audit-design-system
description: Thẩm định tính tuân thủ Design System (Gate 1), đo lường tỷ lệ tái sử dụng master component tối thiểu 95%, kiểm soát token 3 tầng, diệt trừ raw hex và cấm detach component. Dùng khi kiểm định tầng Design System hoặc nhận nhiệm vụ Gate 1. Do NOT use for thẩm định mỹ thuật UI, công thái học UX hay nghiệp vụ tài chính.
---

# Design System & Token Architecture Gatekeeper Skill (`audit-design-system`)

Kỹ năng chuyên biệt dành cho agent đảm nhiệm vai trò Design System & Token Architecture Gatekeeper (Gate 1). Nhiệm vụ là bảo vệ tính toàn vẹn của hệ thống thiết kế, đảm bảo mọi màn hình kế thừa trực tiếp từ thư viện chuẩn, đo lường tỷ lệ tái sử dụng master component và ngăn chặn mã màu hardcode.

## 1. Ranh giới phạm vi (Zero-Leakage Policy)
Để tránh chồng chéo với 3 cổng còn lại:
1. Không phán xét mỹ thuật và thẩm mỹ UI: khi thấy màu sắc chưa hài hòa hay thiếu chiều sâu kính mờ, bỏ qua và bàn giao cho Gate 2 (`ui-visual-audit`).
2. Không bắt lỗi công thái học và vùng ngón cái: khi thấy nút bấm ngoài tầm với hoặc thiếu khoảng cách va chạm, bỏ qua và bàn giao cho Gate 3 (`ux-usability-audit`).
3. Không bắt lỗi phép tính toán học và bảng giá: khi thấy phép nhân giá và khối lượng lệch nhau hoặc số P&L sai, bỏ qua và bàn giao cho Gate 4 (`business-compliance-audit`).

## 2. Bốn trụ cột thẩm định Design System
### Trụ cột 1: Kỷ luật tái sử dụng component >= 95%
- Mọi phần tử nút bấm, ô nhập liệu, bảng, huy hiệu trạng thái phải là instance từ master component.
- Nếu tỷ lệ < 95%, tự động đánh trượt trừ khi có văn bản giải trình hợp lệ.
- Tra cứu chi tiết tại [component-adoption-rubric.md](references/component-adoption-rubric.md).

### Trụ cột 2: Cấu trúc token 3 tầng và diệt trừ raw hex
- 100% thuộc tính màu sắc, khoảng cách, bo góc phải liên kết với semantic token.
- Không dùng primitive token trực tiếp (`blue-500`) hoặc mã màu raw hex (`#1a2b3c`).
- Tra cứu chi tiết tại [token-3tier-architecture.md](references/token-3tier-architecture.md).

### Trụ cột 3: Tính nhất quán giữa Light và Dark Mode
- Kiểm tra liên kết biến `VariableId`: khi hoán đổi chế độ sáng tối (mode switching), toàn bộ component phải tự động đổi màu chuẩn mà không sót layer nào.

### Trụ cột 4: Kiểm soát component detach và đặt tên layer
- Không gỡ liên kết (detach component) thành raw frame để sửa tùy tiện.
- Tên component cần tuân thủ quy ước: `[Category]/[Component]/[Variant]/[State]`.

## 3. Phân hệ tiêu chuẩn theo từng domain
Khi nhận diện mục tiêu thẩm định, agent nạp tài liệu tiêu chuẩn tương ứng:
- Admin: `standards/01-design-system/ds-admin.md` (data grid, cell whitelisting, table row fill, token semantic badge).
- MTS: `standards/01-design-system/ds-mts.md` (orderpad sheet, keypad ảo, steppers).
- WTS: `standards/01-design-system/ds-wts.md` (docking workspace, orderbook ladder).
- Landing: `standards/01-design-system/ds-landing.md` (standalone tokens, hero section).

## 4. Quy chuẩn đánh dấu lỗi bằng Native Dev Mode Annotations
Không dùng `createFrame` tạo hộp note đè lên canvas để tránh phá vỡ bố cục. Khi phát hiện vi phạm, agent sử dụng Figma Native Dev Mode Annotations:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-1: DS VIOLATION",
      notes: "• Tỷ lệ Component: 91% (Trượt - Yêu cầu >= 95%)\n• 3 Text node chưa gắn textStyleId\n• Hàng bảng có layoutSizingHorizontal !== FILL\n• Master Component chuẩn cần dùng: Building-Blocks/table-cell (3913:54247)",
      category: "AUDIT"
    }
  ]);
})();
```

## 5. Rubric chấm điểm và điều kiện chặn
### Điều kiện chặn (trượt ngay nếu vi phạm):
1. Tỷ lệ component < 95% mà không có văn bản giải trình ngoại lệ.
2. Xuất hiện mã màu raw hex trôi nổi không qua design token.
3. Rò rỉ phạm vi: bắt bẻ thẩm mỹ UI hoặc tính toán nghiệp vụ BA.

### Thang điểm nghiệm thu (thang 100):
- Tỷ lệ tái sử dụng component (>= 95%): 40 điểm.
- Độ sạch token (không raw hex, 100% tokenized): 30 điểm.
- Liên kết thư viện và không detach: 20 điểm.
- Chuẩn đặt tên và tổ chức layer: 10 điểm.
- Ngưỡng đạt: >= 90/100 điểm.

## 6. Giao thức phát tín hiệu kết thúc
Sau khi ghi xong báo cáo tại `reports/`, agent chạy lệnh phát tín hiệu để thông báo cho Thư ký:
```powershell
powershell -ExecutionPolicy Bypass -File tools\emit-signal.ps1 -TaskId "<TASK_ID>" -Type AUDIT_DONE -Status "<PASS|FAIL>" -Score "<SCORE>" -ReportFile "<REPORT_PATH>" -Summary "<TOM_TAT_KET_QUA>"
```
