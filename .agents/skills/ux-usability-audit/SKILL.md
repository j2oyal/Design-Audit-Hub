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

## 🎨 3. Quy Trình Xuất Thẻ Ghi Chú Đồ Họa Lên Canvas (`[UX-Usability-Audit-Notes]`)

Khi phát hiện lỗi công thái học hoặc cản trở luồng tương tác, Agent chạy đoạn script sau trong `figma_execute` để tạo thẻ Blue trực quan cạnh màn hình:

```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_NODE_ID>');
  if (!target) return;
  await figma.loadFontAsync({ family: "Inter", style: "Bold" });
  await figma.loadFontAsync({ family: "Inter", style: "Regular" });

  const card = figma.createFrame();
  card.name = `[UX-Usability-Audit-Notes] ${target.name}`;
  card.resize(320, 240);
  card.x = target.x + target.width + 32;
  card.y = target.y;
  card.fills = [{ type: 'SOLID', color: { r: 0.05, g: 0.07, b: 0.15 } }];
  card.cornerRadius = 12;
  card.strokes = [{ type: 'SOLID', color: { r: 0.25, g: 0.45, b: 0.95 } }]; // Royal Blue border
  card.strokeWeight = 1.5;
  card.layoutMode = 'VERTICAL';
  card.paddingTop = card.paddingBottom = card.paddingLeft = card.paddingRight = 16;
  card.itemSpacing = 8;

  const title = figma.createText();
  title.characters = `🧠 UX Usability Audit: ${target.name}`;
  title.fontName = { family: "Inter", style: "Bold" };
  title.fontSize = 14;
  title.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }];
  card.appendChild(title);

  const body = figma.createText();
  body.characters = `• Thumb Zone: ĐẠT (Nút Mua/Bán neo ở y >= 530px)\n• Cảnh báo: Nút Stepper trừ giá nhỏ (36x36px < 44px)\n• Poka-Yoke: Cần thêm Slide to confirm cho lệnh Margin`;
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
1. **Nút hành động chính (Primary CTA) trên Mobile nằm ngoài tầm với ngón cái ($y < 527\text{px}$)**.
2. **Nút tương tác quan trọng có diện tích chạm $< 44 \times 44\text{px}$ gây nguy cơ bấm trượt**.
3. **Áp dụng mẫu "Disabled Button mờ câm" (Silent Disabled CTA) mà không có thông điệp hướng dẫn lỗi**.
4. **Rò rỉ phạm vi (UX Leakage)**: Đi bắt lỗi mã màu token hay phép tính nhân chia tài chính.

### 📊 Thang Điểm Nghiệm Thu:
* **Công thái học & Vùng ngón cái (Thumb zone / Keyboard-first)**: 30 điểm.
* **Vùng chạm an toàn ($\ge 44\text{px}$) & Cắt giảm ma sát luồng**: 25 điểm.
* **Phòng ngừa sai sót (Poka-Yoke) & Khôi phục lỗi**: 25 điểm.
* **Tải nhận thức (Hick's law) & Phản hồi trạng thái tức thì**: 20 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 88/100$ điểm.
