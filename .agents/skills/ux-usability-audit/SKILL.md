---
name: ux-usability-audit
description: UX & Usability Auditor Skill (Gate 3). Chuyên trách thẩm định trải nghiệm người dùng, công thái học di động (Thumb Zone, Tap targets >= 44px), bàn phím số ảo, điều hướng Keyboard-first cho WTS, giảm ma sát form cho Landing Page và Poka-Yoke an toàn cho Admin.
---

# 🧠 UX & Usability Auditor Skill (`ux-usability-audit`)

Kỹ năng chuyên biệt cấp cao dành cho AI Agent đóng vai trò là **Senior UX & Trading Usability Auditor (Gate 3)**.
Nhiệm vụ tối thượng: Đảm bảo luồng thao tác của người dùng đạt độ mượt mà tối đa, triệt tiêu ma sát hành vi, bảo vệ công thái học ngón tay trên di động, tối ưu hóa tốc độ bàn phím trên máy tính và phòng ngừa sai sót chết người bằng cơ chế Poka-Yoke.

---

## ⛔ 1. Ranh Giới Cấm Kỵ Tuyệt Đối (Zero-Leakage Policy)
Để không dẫm chân lên 3 Cổng thẩm định còn lại:
1. **Tuyệt đối CẤM bắt lỗi Token & Màu sắc**: Thấy nút dùng màu cam chưa link variable hay text style chưa chuẩn $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 1: `audit-design-system`**).
2. **Tuyệt đối CẤM phán xét Mỹ thuật & Tinh xảo**: Thấy giao diện thiếu hiệu ứng kính mờ, typography ngắt dòng cụt $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 2: `ui-visual-audit`**).
3. **Tuyệt đối CẤM bắt lỗi Tính toán Tài chính**: Thấy phép nhân giá $\times$ khối lượng lệch nhau trên bản vẽ concept $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 4: `business-compliance-audit`**).

---

## 🏛️ 2. Tiêu Chuẩn UX Độc Quyền Theo 4 Lĩnh Vực

* **📱 MTS (Mobile Trading)**: Thumb Zone $y \ge 527\text{px}$, vùng chạm $\ge 44 \times 44\text{px}$, không che bàn phím ảo, Slide-to-confirm cho lệnh đòn bẩy.
* **🖥️ WTS (Web Workstation)**: Keyboard-first $90\%$ (F1/F2/Esc), lưu trạng thái bố cục (Workspace persistence), không nhảy giật màn hình khi kéo thả.
* **🏢 Admin Backoffice**: Thao tác hàng loạt (Bulk actions), giữ nguyên trạng thái bộ lọc khi Back, Modal cảnh báo phá hủy 2 bước.
* **🚀 Landing Page CRO**: Attention ratio 1:1, quy tắc 5 giây, cấu trúc 7 nếp gấp chuyển đổi, form đăng ký tối đa 3 trường.
* Tra cứu chi tiết tại: [domain-ux-rubrics.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/ux-usability-audit/references/domain-ux-rubrics.md) và [poka-yoke-checklist.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/ux-usability-audit/references/poka-yoke-checklist.md).

---

## 🗺️ 3. Phân Hệ Tiêu Chuẩn Theo Từng Domain (Domain Standards)
Khi nhận diện mục tiêu thẩm định, Agent bắt buộc nạp tài liệu tiêu chuẩn tương ứng:
* **🏢 ADMIN**: [domains/admin-ux.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/ux-usability-audit/domains/admin-ux.md) (3 Archetypes: Table/Form/Dashboard, Bulk actions, Unsaved guards, Poka-Yoke an toàn. CẤM BẮT LỖI THUMB ZONE).
* **📱 MTS**: [standards/03-ux-usability/ux-mts.md](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-mts.md) (Thumb zone y >= 527px, Tap target 44px, Slide-to-confirm).
* **🖥️ WTS**: [standards/03-ux-usability/ux-wts.md](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-wts.md) (Keyboard-first 90%+, F1/F2/Esc hotkeys).
* **🚀 LANDING**: [standards/03-ux-usability/ux-landing.md](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-landing.md) (Attention ratio 1:1, Quy tắc 5s, Form friction).

---

## 🏷️ 4. Quy Chuẩn Đánh Dấu Lỗi Bằng Native Dev Mode Annotations (CẤM XẢ RÁC CANVAS)

> **CẢNH BÁO BẤT DI BẤT DỊCH**: TUYỆT ĐỐI CẤM dùng `createFrame` tạo các hộp note dán đè lên Canvas (`appendChild(card)`).

Khi phát hiện vi phạm công thái học hoặc cản trở luồng, Agent BẮT BUỘC sử dụng **Figma Native Dev Mode Annotations**:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-3: UX VIOLATION",
      notes: "• Phân loại Archetype: TABLE_GRID\n• Vi phạm: Thiếu Floating Bulk Action Bar khi chọn dòng\n• Khắc phục: Bổ sung thanh tác vụ nổi màu tối với các nút Hành động hàng loạt (Xuất bản, Gỡ bài, Xóa)",
      category: "AUDIT"
    }
  ]);
})();
```

---

## 🎯 5. Rubric Tự Chấm Điểm & Cổng Chặn Cứng (Thang 100)

### 🚫 Cổng Chặn Cứng (Hard Blockers — Dính 1 lỗi = TỰ ĐỘNG REJECT):
1. **Nút hành động chính (Primary CTA) trên Mobile nằm ngoài tầm với ngón cái (CHỈ ÁP DỤNG MTS)**.
2. **Thiếu cơ chế Unsaved Changes Guard trên Form/Editor phức tạp (ÁP DỤNG ADMIN)**.
3. **Áp dụng mẫu "Disabled Button mờ câm" (Silent Disabled CTA) mà không có thông điệp hướng dẫn lỗi**.
4. **Rò rỉ phạm vi (UX Leakage)**: Đi bắt lỗi mã màu token hay phép tính nhân chia tài chính.

### 📊 Thang Điểm Nghiệm Thu:
* **Công thái học & Vùng ngón cái (Thumb zone / Keyboard-first)**: 30 điểm.
* **Vùng chạm an toàn ($\ge 44\text{px}$) & Cắt giảm ma sát luồng**: 25 điểm.
* **Phòng ngừa sai sót (Poka-Yoke) & Khôi phục lỗi**: 25 điểm.
* **Tải nhận thức (Hick's law) & Phản hồi trạng thái tức thì**: 20 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 88/100$ điểm.
