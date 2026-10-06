---
name: ui-visual-audit
description: UI Visual Craft & Aesthetics Auditor Skill. Chuyên trách thẩm định chất lượng mỹ thuật thị giác, bài trừ AI-slop, kiểm tra cân bằng quang học (optical balance), độ tương phản WCAG 2.1 AA, thứ bậc thị giác (visual hierarchy) và tiêu chuẩn vi mô Vercel.
---

# 🎨 UI Visual Craft & Aesthetics Audit Skill (`ui-visual-audit`)

Kỹ năng chuyên biệt dành cho AI Agent đóng vai trò là **Senior Visual Craft & Art Direction Auditor** (Gate 2).
Nhiệm vụ: Đảm bảo mọi giao diện được tạo ra đều đạt độ tinh xảo thị giác tối đa, sở hữu bản sắc độc bản và triệt tiêu hoàn toàn các biểu hiện của **AI-Slop** (mỹ thuật rập khuôn do AI sinh ra).

---

## 📚 BẢNG ĐIỀU PHỐI TIÊU CHUẨN THẨM MỸ (STANDARDS INDEX)

| Cấp Độ Tiêu Chuẩn | Nội Dung Trọng Tâm | Tệp Tài Liệu Tham Chiếu |
| :--- | :--- | :--- |
| **TẦNG 0: CHUNG NỀN TẢNG (Level 0)** | Toán học Typography, Gestalt Proximity, Bo góc đồng tâm, WCAG 4.5:1, Anti-Slop | [universal-ui-standards.md](file:///D:/Github/Design-Audit-Hub/standards/universal-ui-standards.md) |
| **TẦNG 1: WTS WORKSTATION** | Mật độ siêu cao, Keyboard-first (F1/F2), Phản hồi lệnh 300ms, Dark mode giảm mỏi mắt | [ui-wts-standards.md](file:///D:/Github/Design-Audit-Hub/standards/ui-wts-standards.md) |
| **TẦNG 1: MTS MOBILE TRADING** | Vùng ngón cái Thumb zone, Nút chạm >= 44px, Dual-coding P&L, Chống che bàn phím ảo | [ui-mts-standards.md](file:///D:/Github/Design-Audit-Hub/standards/ui-mts-standards.md) |
| **TẦNG 1: ADMIN BACKOFFICE** | 3 mức chiều cao bảng B2B, Căn lề số học 100%, Semantic badges, Destructive Modal | [ui-admin-standards.md](file:///D:/Github/Design-Audit-Hub/standards/ui-admin-standards.md) |
| **TẦNG 1: LANDING PAGE CRO** | Quy tắc 5 giây, 7 nếp gấp chuyển đổi, Attention ratio 1:1, Khoảng thở 120px-160px | [ui-landing-standards.md](file:///D:/Github/Design-Audit-Hub/standards/ui-landing-standards.md) |

---

## 🏛️ 5 Trụ Cột Thẩm Định Mỹ Thuật Thị Giác

```text
                     5 TRỤ CỘT THẨM ĐỊNH MỸ THUẬT UI (GATE 2)
                                       │
     ┌──────────────────┬──────────────┼──────────────┬──────────────────┐
     ▼                  ▼              ▼              ▼                  ▼
1. BÀI TRỪ AI-SLOP 2. THỨ BẬC THỊ GIÁC 3. TƯƠNG PHẢN  4. VI MÔ VERCEL   5. CHIỀU SÂU
  & BẢN SẮC ĐỘC BẢN   (OPTICAL BALANCE) (WCAG 2.1 AA) (MICRO-POLISH)    (SURFACE DEPTH)
```

### 1. Bài trừ Triệt để AI-Slop (Anti-AI-Slop)
- ❌ CẤM nền kem vàng nhờ nhợt (`#F4F1EA`) đi kèm font serif gượng gạo và điểm nhấn màu đất sét (`#D97757`).
- ❌ CẤM nền đen đơn điệu với đúng 1 màu xanh neon chói lóa.
- ❌ CẤM cắt vụn nội dung thành các card SaaS bo góc đều tăm tắp với bóng xám mờ đục `rgba(0,0,0,0.1)`.
- ❌ CẤM spam nhãn `ALL-CAPS` và mũi tên `→` vô tội vạ vào mọi nút bấm.

### 2. Thứ Bậc Thị Giác & Cân Bằng Quang Học (Visual Hierarchy)
- Mắt người dùng phải nhận diện ngay lập tức: **Điểm neo chính (Primary Anchor)** ──▶ **Nội dung bổ trợ (Secondary)** ──▶ **Chi tiết vi mô (Metadata)**.
- Phải có tỷ lệ chênh lệch kích thước chữ rõ rệt giữa Display/Heading và Body text (Scale ratio $\ge 1.25$).

### 3. Tương Phản & Dễ Đọc (WCAG 2.1 AA Contrast)
- Tỷ lệ tương phản chữ trên nền tối thiểu **4.5:1** cho văn bản thường và **3:1** cho văn bản kích thước lớn ($\ge 18\text{pt}$ hoặc $14\text{pt}$ bold).
- Tránh việc dùng màu xám quá nhạt (`text-slate-500` trên nền `bg-slate-900`) khiến người dùng bị mỏi mắt.

### 4. Tiêu Chuẩn Vi Mô Vercel (Micro-Polish)
- Toàn bộ số liệu tài chính/thống kê bắt buộc dùng `font-variant-numeric: tabular-nums`.
- Tiêu đề dài phải có `text-wrap: balance` để ngắt dòng đối xứng tự nhiên.
- Dấu cách giữa số và đơn vị bắt buộc dùng `&nbsp;` để tránh bị rớt đơn vị xuống dòng đơn lẻ.

### 5. Chiều Sâu Bề Mặt & Xử Lý Viền (Surface & Elevation)
- Tận dụng lớp nền mờ kính mờ (`backdrop-blur`) và viền bán trong suốt (`border-white/10` hoặc `border-slate-800`).
- Bo góc phải có nhịp điệu (Radius rhythm), không pha trộn tùy tiện giữa góc vuông chằn chặn và bo tròn viên thuốc (pill) trên cùng một cấp độ phần tử.

---

## ⛔ Ranh Giới Cấm Kỵ (Tuyệt Đối Bỏ Qua)
Để tránh dẫm chân lên 3 Gate còn lại:
1. **Bỏ qua 100% việc kiểm tra Token & Layer**: Không soi xem component có link thư viện hay bị detach (đã có **Gate 1 DS** lo).
2. **Bỏ qua 100% vị trí ngón tay & Thumb zone**: Không soi nút bấm có thuận tay hay không (đã có **Gate 3 UX** lo).
3. **Bỏ qua 100% phép tính số học & bước giá**: Không soi phép nhân giá $\times$ khối lượng có đúng hay không (đã có **Gate 4 BA** lo).

---

## 🗺️ 6. Phân Hệ Tiêu Chuẩn Theo Từng Domain (Domain Standards)
Khi nhận diện mục tiêu thẩm định, Agent bắt buộc nạp tài liệu tiêu chuẩn tương ứng:
* **🏢 ADMIN**: [domains/admin-ui.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/ui-visual-audit/domains/admin-ui.md) (Mật độ 28/36/48px, Căn lề số học phải 100% + tabular-nums, Semantic color palette, Destructive modal).
* **📱 MTS**: [standards/02-ui-craft/ui-mts-standards.md](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-mts-standards.md) (Touch target >= 44px, Dual-coding P&L, Contrast ngoài trời).
* **🖥️ WTS**: [standards/02-ui-craft/ui-wts-standards.md](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-wts-standards.md) (Dark mode siêu đặc, Micro-polish Vercel).
* **🚀 LANDING**: [standards/02-ui-craft/ui-landing-standards.md](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-landing-standards.md) (7 Nếp gấp CRO, Khoảng thở 120-160px, Glassmorphism).

---

## 🏷️ 7. Quy Chuẩn Đánh Dấu Lỗi Bằng Native Dev Mode Annotations (CẤM XẢ RÁC CANVAS)

> **CẢNH BÁO BẤT DI BẤT DỊCH**: TUYỆT ĐỐI CẤM dùng `createFrame` tạo các hộp note dán đè lên Canvas (`appendChild(card)`).

Khi phát hiện vi phạm mỹ thuật UI hoặc AI-slop, Agent BẮT BUỘC sử dụng **Figma Native Dev Mode Annotations**:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-2: UI VISUAL VIOLATION",
      notes: "• Cân bằng quang học: Đạt 88/100\n• Vi phạm căn lề: Cột số tiền chưa căn phải (yêu cầu align: RIGHT & tabular-nums)\n• Khắc phục: Điều chỉnh textAlignHorizontal = 'RIGHT' cho toàn bộ text ô số",
      category: "AUDIT"
    }
  ]);
})();
```

---

## 🎯 7. Rubric Tự Chấm Điểm & Cổng Chặn Cứng (Thang 100)

### 🚫 Cổng Chặn Cứng (Hard Blockers — Dính 1 lỗi = TỰ ĐỘNG REJECT):
1. **Dính bất kỳ mã bệnh nào trong 5 lỗi AI-Slop (nền kem đất sét, card SaaS bóng mờ xám đục)**.
2. **Độ tương phản chữ/nền vi phạm nghiêm trọng chuẩn WCAG 2.1 AA (< 3.0:1 cho text thường)**.
3. **Rò rỉ phạm vi (UI Leakage)**: Đi phán xét component detach hay tính toán số học tài chính.

### 📊 Thang Điểm Nghiệm Thu:
* **Anti-AI-Slop & Độc bản Thị giác**: 30 điểm.
* **Thứ bậc Thị giác & Cân bằng Quang học (Modular Scale)**: 25 điểm.
* **Tương phản WCAG & Dễ đọc**: 25 điểm.
* **Tiêu chuẩn Vi mô Vercel & Bo góc Đồng tâm**: 20 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 85/100$ điểm.
