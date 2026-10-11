---
name: ui-visual-audit
description: Thẩm định chất lượng mỹ thuật thị giác (Gate 2), bài trừ AI-slop, kiểm tra cân bằng quang học, độ tương phản WCAG 2.1 AA, thứ bậc thị giác và tiêu chuẩn vi mô Vercel. Dùng khi kiểm định mỹ thuật giao diện hoặc nhận nhiệm vụ Gate 2. Do NOT use for kiểm tra token variable, công thái học thao tác hay logic nghiệp vụ.
---

# UI Visual Craft & Aesthetics Audit Skill (`ui-visual-audit`)

Kỹ năng chuyên biệt dành cho agent đảm nhiệm vai trò Visual Craft & Art Direction Auditor (Gate 2). Nhiệm vụ là đảm bảo mọi giao diện đạt độ tinh xảo thị giác tối đa, sở hữu bản sắc độc bản và loại bỏ hoàn toàn biểu hiện của AI-slop.

## 1. Ranh giới phạm vi (Zero-Leakage Policy)
Để tránh chồng chéo với 3 cổng còn lại:
1. Bỏ qua kiểm tra token và layer: không kiểm tra component có liên kết thư viện hay bị detach (thuộc Gate 1 `audit-design-system`).
2. Bỏ qua vị trí ngón tay và vùng chạm: không phán xét nút bấm thuận tay hay vùng chạm (thuộc Gate 3 `ux-usability-audit`).
3. Bỏ qua phép tính số học và bước giá: không phán xét phép nhân giá và khối lượng (thuộc Gate 4 `business-compliance-audit`).

## 2. Năm trụ cột thẩm định mỹ thuật thị giác
1. Bài trừ AI-slop: không dùng nền kem đất sét (`#F4F1EA` kèm font serif và accent `#D97757`), không dùng nền đen với duy nhất 1 màu neon chói lòa, không chia nhỏ nội dung thành các card SaaS bo góc rập khuôn với bóng mờ đục `rgba(0,0,0,0.1)`, không spam nhãn all-caps và mũi tên tràn lan. Tra cứu chi tiết tại [anti-ai-slop-catalog.md](references/anti-ai-slop-catalog.md).
2. Thứ bậc thị giác và cân bằng quang học: mắt người dùng nhận diện rõ điểm neo chính (primary anchor), nội dung bổ trợ (secondary) và chi tiết vi mô (metadata). Tỷ lệ chênh lệch cỡ chữ giữa heading và body text tối thiểu scale ratio >= 1.25. Tra cứu tại [optical-balance-matrix.md](references/optical-balance-matrix.md).
3. Tương phản WCAG 2.1 AA: tỷ lệ tương phản chữ trên nền tối thiểu 4.5:1 cho text thường và 3:1 cho text lớn (>= 18pt hoặc 14pt bold). Tránh dùng màu xám quá nhạt trên nền tối gây mỏi mắt.
4. Tiêu chuẩn vi mô Vercel: số liệu tài chính và thống kê cần dùng `font-variant-numeric: tabular-nums`. Tiêu đề dài cần `text-wrap: balance` để ngắt dòng đối xứng. Khoảng cách giữa số và đơn vị dùng dấu cách không ngắt để tránh rơi chữ.
5. Chiều sâu bề mặt và xử lý viền: sử dụng backdrop-blur và viền bán trong suốt hợp lý. Bo góc cần có nhịp điệu nhất quán trên cùng một cấp độ phần tử.

## 3. Phân hệ tiêu chuẩn theo từng domain
Khi nhận diện mục tiêu thẩm định, agent nạp tài liệu tiêu chuẩn tương ứng:
- Nền tảng chung: `standards/02-ui-craft/universal-ui-standards.md` (toán học typography, Gestalt proximity, bo góc đồng tâm, WCAG 4.5:1).
- Admin: `standards/02-ui-craft/ui-admin-standards.md` (mật độ 28/36/48px, căn lề số học 100% kèm tabular-nums, palette semantic, modal cảnh báo).
- MTS: `standards/02-ui-craft/ui-mts-standards.md` (vùng chạm >= 44px, dual-coding P&L, tương phản ngoài trời).
- WTS: `standards/02-ui-craft/ui-wts-standards.md` (dark mode chuyên sâu, micro-polish Vercel).
- Landing: `standards/02-ui-craft/ui-landing-standards.md` (7 nếp gấp CRO, khoảng thở 120px-160px, glassmorphism).

## 4. Quy chuẩn đánh dấu lỗi bằng Native Dev Mode Annotations
Không dùng `createFrame` tạo hộp note đè lên canvas. Khi phát hiện vi phạm mỹ thuật hoặc AI-slop, agent sử dụng Figma Native Dev Mode Annotations:
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

## 5. Rubric chấm điểm và điều kiện chặn
### Điều kiện chặn (trượt ngay nếu vi phạm):
1. Mắc lỗi AI-slop nghiêm trọng (nền kem đất sét, card SaaS bóng mờ đục).
2. Độ tương phản chữ và nền vi phạm WCAG 2.1 AA (< 3.0:1 cho text thường).
3. Rò rỉ phạm vi: phán xét component detach hoặc tính toán số học tài chính.

### Thang điểm nghiệm thu (thang 100):
- Chống AI-slop và tính độc bản: 30 điểm.
- Thứ bậc thị giác và cân bằng quang học: 25 điểm.
- Tương phản WCAG và độ dễ đọc: 25 điểm.
- Tiêu chuẩn vi mô Vercel và bo góc: 20 điểm.
- Ngưỡng đạt: >= 85/100 điểm.
