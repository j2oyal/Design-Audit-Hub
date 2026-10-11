---
name: ux-usability-audit
description: Thẩm định trải nghiệm người dùng và công thái học (Gate 3), bao gồm vùng ngón cái di động, phím tắt keyboard-first cho WTS, giảm ma sát form cho Landing Page và cơ chế Poka-Yoke cho Admin. Dùng khi kiểm định luồng thao tác và khả năng sử dụng của giao diện. Do NOT use for thẩm định mã màu token hay tính toán tài chính.
---

# UX & Usability Auditor Skill (`ux-usability-audit`)

Kỹ năng chuyên biệt dành cho agent đảm nhiệm vai trò UX & Usability Auditor (Gate 3). Nhiệm vụ là đảm bảo luồng thao tác của người dùng đạt độ mượt mà tối đa, loại bỏ ma sát hành vi, bảo vệ công thái học ngón tay trên di động, tối ưu tốc độ bàn phím trên máy tính và ngăn ngừa sai sót bằng cơ chế Poka-Yoke.

## 1. Ranh giới phạm vi (Zero-Leakage Policy)
Để tránh chồng chéo với 3 cổng còn lại:
1. Không bắt lỗi token và màu sắc: khi thấy nút bấm chưa liên kết variable hay text style chưa chuẩn, bỏ qua và bàn giao cho Gate 1 (`audit-design-system`).
2. Không phán xét mỹ thuật và độ tinh xảo: khi thấy giao diện thiếu hiệu ứng kính mờ hay typography ngắt dòng cụt, bỏ qua và bàn giao cho Gate 2 (`ui-visual-audit`).
3. Không bắt lỗi tính toán tài chính: khi thấy phép nhân giá và khối lượng lệch nhau trên bản vẽ concept, bỏ qua và bàn giao cho Gate 4 (`business-compliance-audit`).

## 2. Tiêu chuẩn UX theo 4 lĩnh vực
- MTS (Mobile Trading): thumb zone y >= 527px, vùng chạm >= 44x44px, không che bàn phím ảo, slide-to-confirm cho lệnh đòn bẩy.
- WTS (Web Workstation): keyboard-first >= 90% (F1/F2/Esc), lưu trạng thái bố cục (workspace persistence), không giật màn hình khi kéo thả.
- Admin Backoffice: thao tác hàng loạt (bulk actions), giữ nguyên trạng thái bộ lọc khi back, modal cảnh báo nguy hiểm 2 bước.
- Landing Page CRO: attention ratio 1:1, quy tắc 5 giây, cấu trúc 7 nếp gấp chuyển đổi, form đăng ký tối đa 3 trường.
- Tra cứu chi tiết tại [domain-ux-rubrics.md](references/domain-ux-rubrics.md) và [poka-yoke-checklist.md](references/poka-yoke-checklist.md).

## 3. Phân hệ tiêu chuẩn theo từng domain
Khi nhận diện mục tiêu thẩm định, agent nạp tài liệu tiêu chuẩn tương ứng:
- Nền tảng chung: `standards/03-ux-usability/universal-ux-standards.md` (luật Fitts, Hick, Jakob, non-disabled CTA, Poka-Yoke).
- Admin: `standards/03-ux-usability/ux-admin.md` (table/form/dashboard, bulk action bar, unsaved changes guard, Poka-Yoke; không bắt lỗi thumb zone trên Admin).
- MTS: `standards/03-ux-usability/ux-mts.md` (thumb zone y >= 527px, tap target 44px, slide-to-confirm).
- WTS: `standards/03-ux-usability/ux-wts.md` (keyboard-first >= 90%, F1/F2/Esc hotkeys).
- Landing: `standards/03-ux-usability/ux-landing.md` (attention ratio 1:1, quy tắc 5 giây, form friction).

## 4. Quy chuẩn đánh dấu lỗi bằng Native Dev Mode Annotations
Không dùng `createFrame` tạo hộp note đè lên canvas. Khi phát hiện vi phạm công thái học hoặc cản trở luồng, agent sử dụng Figma Native Dev Mode Annotations:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-3: UX VIOLATION",
      notes: "• Phân loại Archetype: TABLE_GRID\n• Vi phạm: Thiếu Floating Bulk Action Bar khi chọn dòng\n• Khắc phục: Bổ sung thanh tác vụ nổi với các nút thao tác hàng loạt",
      category: "AUDIT"
    }
  ]);
})();
```

## 5. Rubric chấm điểm và điều kiện chặn
### Điều kiện chặn (trượt ngay nếu vi phạm):
1. Nút hành động chính trên mobile nằm ngoài tầm với ngón cái (áp dụng cho MTS).
2. Thiếu cơ chế Unsaved Changes Guard trên form phức tạp (áp dụng cho Admin).
3. Áp dụng mẫu disabled button mờ câm mà không có thông điệp hướng dẫn lỗi.
4. Rò rỉ phạm vi: bắt lỗi mã màu token hoặc phép tính tài chính.

### Thang điểm nghiệm thu (thang 100):
- Công thái học và vùng ngón cái / keyboard-first: 30 điểm.
- Vùng chạm an toàn (>= 44px) và giảm ma sát luồng: 25 điểm.
- Phòng ngừa sai sót (Poka-Yoke) và khôi phục lỗi: 25 điểm.
- Tải nhận thức (Hick's law) và phản hồi trạng thái: 20 điểm.
- Ngưỡng đạt: >= 88/100 điểm.
