# 🖥️ TIÊU CHUẨN THIẾT KẾ GIAO DIỆN WTS (WEB TRADING WORKSTATION)
## WEB TRADING SYSTEM UI/UX SPECIFICATIONS (LEVEL 1)

> **Tài liệu chuẩn hóa chuyên sâu**: Trạm làm việc giao dịch chứng khoán chuyên nghiệp (Desktop/Web Widescreen).  
> **Tham chiếu tinh hoa ngành**: Bloomberg Terminal, TradingView, Refinitiv Eikon, Interactive Brokers TWS.

---

## 🏛️ TRIẾT LÝ: WORKSTATION RA QUYẾT ĐỊNH, KHÔNG PHẢI LÀ DASHBOARD THƯỜNG
Một trạm giao dịch Web Trading không phải là trang web thông tin thông thường. Đó là **Môi trường Ra Quyết Định Áp Lực Cao (High-Stakes Decision-Making Environment)**, nơi tốc độ khớp lệnh tính bằng mili-giây và tiền bạc thay đổi theo từng tích tắc.

```text
                      4 TRỤ CỘT THẨM MỸ WTS WORKSTATION
                                      │
     ┌──────────────────┬─────────────┴─────┬──────────────────┐
     ▼                  ▼                   ▼                  ▼
1. MẬT ĐỘ THÔNG TIN 2. BÀN PHÍM LÀ VUA  3. PHẢN HỒI LỆNH   4. CÔNG THÁI HỌC
  (ULTRA-DENSITY)    (KEYBOARD-FIRST)   TỨC THÌ (LATENCY)   CHỐNG MỎI MẮT
```

---

## 📊 1. MẬT ĐỘ DỮ LIỆU CỰC CAO (ULTRA-HIGH DENSITY)

1. **Kiểm Soát Khoảng Trắng (Controlled Whitespace)**:
   * Khác với Landing Page cần khoảng thở rộng, WTS tối ưu hóa từng pixel hiển thị. Khoảng cách dòng trong bảng giá và sổ lệnh chỉ từ **`24px - 32px`**.
   * Đường phân cách (Dividers) sử dụng viền siêu mảnh **`1px solid rgba(255,255,255,0.08)`** để không làm nặng nề giao diện.
2. **Sổ Lệnh Độ Sâu (DOM / Level 2 Order Book Ladder)**:
   * Thang bậc Bid/Ask phải có thanh đo độ sâu khối lượng (Depth volume bars) chạy nền mờ nhạt phía sau số liệu (`opacity: 0.15 - 0.20`), không làm che mờ chữ số.
   * Số liệu giá và khối lượng bắt buộc căn phải $100\%$ và dùng `tabular-nums`.
3. **Phân Vùng Đa Màn Hình (Multi-Panel Windowing)**:
   * Bố cục dạng CSS Grid kéo thả linh hoạt (Split-pane resizable).
   * Hỗ trợ **Ghim cột (Column Pinning)**: Cột mã cổ phiếu và hành động nhanh luôn được neo cố định khi cuộn ngang.

---

## ⌨️ 2. TRIẾT LÝ "BÀN PHÍM LÀ VUA" (KEYBOARD-FIRST EXECUTION)

Với Day-trader chuyên nghiệp, **$90\%$ thao tác khớp lệnh phải thực hiện qua bàn phím** để triệt tiêu độ trễ rê chuột (mouse input lag) và giảm tải mệt mỏi tâm lý.

1. **Hiển Thị Huy Hiệu Phím Tắt (Hotkey Badges)**:
   * Nút Mua/Bán và các tác vụ nhanh phải gắn kèm nhãn phím tắt tinh tế ở góc nút:
     * `[F1]` hoặc `[B]`: Mua nhanh (Quick Buy).
     * `[F2]` hoặc `[S]`: Bán nhanh (Quick Sell).
     * `[Space]`: Đóng toàn bộ vị thế khẩn cấp (Emergency Flatten).
     * `[Esc]`: Hủy lệnh đang chờ.
2. **Khóa An Toàn Chống Bấm Nhầm (Safety Interlocks)**:
   * Các phím tắt tác động vốn lớn bắt buộc đi kèm tổ hợp phím (ví dụ: `Shift + Enter` hoặc `Alt + B`) để chống lỗi "ngón tay béo" (Fat-finger error).

---

## ⚡ 3. PHẢN HỒI TRẠNG THÁI LỆNH TỨC THÌ (TICK-TO-TRADE FEEDBACK)

1. **Hiệu Ứng Nhấp Nháy Giá Khớp (Price Flash Micro-Interactions)**:
   * Khi có tick giá mới khớp: Ô giá nhấp nháy nền xanh (tăng) hoặc đỏ (giảm) trong đúng **`300ms`** rồi mờ dần về trong suốt (`fade-out`).
   * Không được dùng hiệu ứng giật cục làm phân tâm thị giác trader.
2. **Vòng Đời Trạng Thái Lệnh Minh Bạch**:
   * *Đang gửi*: Icon xoay mảnh màu vàng hổ phách.
   * *Đã khớp*: Đổi màu xanh lá kèm âm thanh phản hồi xúc giác tinh tế.
   * *Khớp 1 phần (Partial Fill)*: Thanh tiến trình mini trực quan hiển thị % khối lượng đã khớp.

---

## 🌑 4. CÔNG THÁI HỌC THỊ GIÁC CHỐNG MỎI MẮT (EYE-STRAIN MITIGATION)

1. **Bảng Màu Dark Mode Tối Ưu Cho 8-12 Tiếng Làm Việc**:
   * Không dùng nền đen tuyền `#000000` tương phản gắt với chữ trắng (gây ảo giác bóng ma khi nhìn lâu).
   * Sử dụng nền **Slate / Zinc siêu sâu**: `#0B0E14` (Base Canvas), `#12161F` (Surface Panels), `#1E2330` (Hover/Card).
2. **Màu Sắc Tài Chính Theo Chuẩn Sở Giao Dịch**:
   * **Xanh lá (`#00C076` / `#10B981`)**: Giá tăng / Lãi.
   * **Đỏ (`#FF4D4F` / `#EF4444`)**: Giá giảm / Lỗ.
   * **Vàng (`#F59E0B`)**: Giá tham chiếu.
   * **Tím (`#A855F7`)**: Giá trần (Ceiling).
   * **Xanh lơ (`#06B6D4`)**: Giá sàn (Floor).
