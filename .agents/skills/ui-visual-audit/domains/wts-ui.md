# 🖥️ TIÊU CHUẨN MỸ THUẬT & VISUAL CRAFT CHO WTS WEB TRADING (GATE 2)

> **Cổng thẩm định**: GATE 2 (UI-Audit)  
> **Áp dụng cho**: `MAPS-W-Design` / Hệ thống giao dịch Web Trading System (WTS) MASHK.  
> **Trọng tâm**: Khả năng quét mắt nhanh (Data Glanceability), Bảng màu Dark Cockpit chuẩn tài chính, Căn lề số học 100%, Thanh cuộn mỏng 6px, Không lỗi AI-slop và Đạt chuẩn WCAG 2.1 AA/AAA.

---

## 🎨 1. BẢNG MÀU GIAO DỊCH DARK COCKPIT CHUẨN TÀI CHÍNH
- **Nền Giao Diện**: Dark Cockpit First (`#090D16` / `#0F172A`). Bề mặt thẻ Card (`#1E293B`).
- **Màu Ngữ Nghĩa Khớp Lệnh (Semantic Trading)**:
  - Tăng giá / Mua (Buy): Xanh lá chuẩn (`#1AB74E`). Nền bán trong suốt `rgba(26, 183, 78, 0.12)`.
  - Giảm giá / Bán (Sell): Đỏ chuẩn (`#F74747`). Nền bán trong suốt `rgba(247, 71, 71, 0.12)`.
  - Tham chiếu / Đứng giá (Flat): Vàng cam (`#EAB308`).
- **Độ Tương Phản WCAG 2.1 AA/AAA**:
  - Tương phản văn bản trên nền tối $\ge 4.5:1$ (đạt AA) đối với body text và $\ge 7:1$ (đạt AAA) đối với các con số thị giá quan trọng.

---

## 🔢 2. CĂN LỀ & ĐỊNH DẠNG SỐ HỌC NGHIÊM NGẶT
1. **Căn phải 100%**: Tất cả các cột số liệu (Giá, Khối lượng, Lãi lỗ, Sức mua, Tỷ lệ %) bắt buộc căn phải và thẳng hàng dọc tuyệt đối.
2. **Căn trái 100%**: Mã cổ phiếu, Tên công ty, Loại lệnh, Tên thị trường.
3. **Căn giữa**: Thao tác Action, Badges trạng thái ngắn, Checkbox chọn dòng.
4. **Quy tắc 3 - 3 - 2**:
   - Thị giá: 3 chữ số thập phân (`HK$ 385.200`, `0.125`).
   - Khối lượng: 3 chữ số thập phân (`18.420M`, `50.000K`).
   - Tiền tệ & Vốn hóa: 2 chữ số thập phân (`HK$ 10,000,000.00`).

---

## 🪟 3. THANH CUỘN & HIỆU ỨNG THỊ GIÁC (VISUAL REFINEMENT)
- **Thanh cuộn siêu mỏng**: Bề rộng tối đa $6\text{px}$, màu xám nhạt mờ (`rgba(148, 163, 184, 0.3)`), bo góc $4\text{px}$. Cấm dùng thanh cuộn mặc định to bản của trình duyệt gây vỡ lề bảng biểu.
- **Zebra Striping & Hover State**: Màu nền hàng xen kẽ tinh tế, đổi màu nền rõ nét khi rê chuột để mắt không bị nhảy dòng khi quét bảng giá dài.
- **Diệt trừ AI-slop**: Cấm gradient màu tím/hồng neon kỳ dị, cấm đổ bóng mờ nhòe quá mức (over-blur glow) làm mỏi mắt trader trong phiên giao dịch kéo dài.
