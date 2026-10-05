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

## 🎨 6. Quy Trình Xuất Thẻ Ghi Chú Đồ Họa Lên Canvas (`[UI-Visual-Audit-Notes]`)

Khi phát hiện lỗi thẩm mỹ hoặc AI-slop, Agent chạy đoạn script sau trong `figma_execute` để tạo thẻ Cyan trực quan cạnh màn hình:

```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_NODE_ID>');
  if (!target) return;
  await figma.loadFontAsync({ family: "Inter", style: "Bold" });
  await figma.loadFontAsync({ family: "Inter", style: "Regular" });

  const card = figma.createFrame();
  card.name = `[UI-Visual-Audit-Notes] ${target.name}`;
  card.resize(320, 220);
  card.x = target.x + target.width + 32;
  card.y = target.y;
  card.fills = [{ type: 'SOLID', color: { r: 0.05, g: 0.08, b: 0.12 } }];
  card.cornerRadius = 12;
  card.strokes = [{ type: 'SOLID', color: { r: 0.02, g: 0.75, b: 0.85 } }]; // Cyan border
  card.strokeWeight = 1.5;
  card.layoutMode = 'VERTICAL';
  card.paddingTop = card.paddingBottom = card.paddingLeft = card.paddingRight = 16;
  card.itemSpacing = 8;

  const title = figma.createText();
  title.characters = `🎨 UI Visual Audit: ${target.name}`;
  title.fontName = { family: "Inter", style: "Bold" };
  title.fontSize = 14;
  title.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }];
  card.appendChild(title);

  const body = figma.createText();
  body.characters = `• Cân bằng quang học: Đạt 88/100 (PASS)\n• Bo góc đồng tâm: Đạt Rcha = Rcon + Pad\n• Cảnh báo: Tiêu đề thiếu text-wrap balance`;
  body.fontName = { family: "Inter", style: "Regular" };
  body.fontSize = 12;
  body.fills = [{ type: 'SOLID', color: { r: 0.8, g: 0.85, b: 0.9 } }];
  card.appendChild(body);

  target.parent.appendChild(card);
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
