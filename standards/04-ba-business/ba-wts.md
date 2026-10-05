# 🖥️ TIÊU CHUẨN NGHIỆP VỤ DÀNH CHO WTS (WEB WORKSTATION)
## INSTITUTIONAL TRADING & ORDERBOOK COMPLIANCE (LEVEL 1)

> **Cổng thẩm định**: GATE 4 (BA-Audit)  
> **Dự án áp dụng**: Trạm làm việc giao dịch chứng khoán chuyên nghiệp Desktop/Web.

---

## ⚡ 1. CÁC LOẠI LỆNH CHUYÊN SÂU (ADVANCED ORDER TYPES)
Workstation chuyên nghiệp phải hỗ trợ và hiển thị đúng logic các loại lệnh:
* **Lệnh Tảng Băng (Iceberg Order)**: Chỉ hiển thị một phần khối lượng thực tế ra sổ lệnh công khai.
* **Lệnh OCO (One-Cancels-the-Other)**: Đặt đồng thời lệnh Chốt lời (Take Profit) và Cắt lỗ (Stop Loss); khi 1 lệnh khớp, lệnh kia tự động hủy.
* **Lệnh Điều Kiện (Trailing Stop)**: Giá cắt lỗ tự động bám đuổi theo đỉnh thị trường với khoảng cách cố định.

---

## 🚫 2. CHỐNG SỔ LỆNH LỖI (CROSSED ORDER BOOK PREVENTION)
* Hệ thống hiển thị sổ lệnh Depth of Market (Level 2) bắt buộc kiểm tra logic:
  $$\text{Highest Bid} < \text{Lowest Ask}$$
* Nếu xuất hiện $\text{Bid} \ge \text{Ask}$ trên màn hình $\implies$ Đánh lỗi nghiêm trọng (Crossed Book Bug), yêu cầu kiểm tra lại websocket stream.
