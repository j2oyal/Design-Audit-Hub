# ⚖️ TIÊU CHUẨN NGHIỆP VỤ & TOÁN HỌC TÀI CHÍNH TOÀN CẦU (LEVEL 0)
## UNIVERSAL BUSINESS & FINANCIAL COMPLIANCE STANDARDS (GATE 4: BA-AUDIT)

> **Tài liệu tham chiếu chuẩn hóa nền tảng cho GATE 4 (BA-Audit)**  
> **Phạm vi áp dụng**: BẮT BUỘC cho toàn bộ hiển thị số liệu tài chính, tính toán và tuân thủ pháp lý.

---

## 🔢 1. ĐỘ CHÍNH XÁC SỐ HỌC (ZERO FLOATING-POINT ERRORS)
* Tuyệt đối không dùng toán tử số thực thông thường của JavaScript (`0.1 + 0.2`) cho các phép tính tiền tệ.
* Bắt buộc sử dụng thư viện số học chính xác cao (`decimal.js`, `bignumber.js`) hoặc quy đổi về đơn vị nhỏ nhất (cents/bps).
* **Tính Toán Lãi / Lỗ (P&L Integrity)**:
  $$\text{Unrealized P&L} = (\text{Market Price} - \text{Cost Price}) \times \text{Quantity}$$
  * $\text{Market Price} > \text{Cost Price} \implies$ Bắt buộc hiển thị số dương `+` và màu Xanh.
  * $\text{Market Price} < \text{Cost Price} \implies$ Bắt buộc hiển thị số âm `-` và màu Đỏ.

---

## 🧾 2. MINH BẠCH THUẾ & PHÍ GIAO DỊCH (FEE DISCLOSURE)
* Mọi màn hình tổng kết lệnh (Order Summary) phải bóc tách minh bạch:
  $$\text{Tổng Tiền Mua} = \text{Giá Trị Lệnh} + \text{Phí Môi Giới} + \text{Thuế/Phí Sàn}$$
  $$\text{Tiền Thực Nhận Bán} = \text{Giá Trị Lệnh} - \text{Phí Môi Giới} - \text{Thuế/Phí Sàn}$$
* Không được giấu phí vào giá hoặc hiển thị số tiền thanh toán không khớp với công thức.
