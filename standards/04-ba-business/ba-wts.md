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

---

## 📈 3. QUY CÁCH LÔ GIAO DỊCH (BOARD LOT) & BƯỚC GIÁ ĐỘNG (TICK SIZE)
1. **Quy cách lô giao dịch (Board Lot)**:
   - HKEX không có quy chuẩn lô 100 cố định cho toàn sàn như US/VN. Mỗi mã có kích thước lô riêng (ví dụ: Tencent 100 cp/lô, HSBC 400 cp/lô, BYD 500 cp/lô).
   - Form đặt lệnh WTS bắt buộc hiển thị số lượng theo Lô chuẩn và tự động nhân ra tổng số lượng cổ phiếu. Lệnh lô lẻ (Odd lot) bắt buộc có cảnh báo thanh khoản kém.
2. **Thang bước giá động (Dynamic Tick Size)**:
   - Dưới HK$ 0.25: 0.001
   - HK$ 0.25 - HK$ 0.50: 0.005
   - HK$ 0.50 - HK$ 10.00: 0.010
   - HK$ 10.00 - HK$ 20.00: 0.020
   - HK$ 20.00 - HK$ 100.00: 0.050
   - HK$ 100.00 - HK$ 200.00: 0.100
   - HK$ 200.00 - HK$ 500.00: 0.200
   - Nút tăng/giảm Stepper trên WTS bắt buộc nhảy đúng bước giá theo thị giá hiện tại.
3. **Phiên giao dịch & Lệnh ngoài giờ**:
   - Khớp lệnh liên tục: 09:30 – 12:00 và 13:00 – 16:00 (Hồng Kông).
   - Phiên nghỉ trưa (12:00 – 13:00): Không khớp lệnh. WTS phải hiển thị trạng thái "Midday Break".

---

## 🛡️ 4. TỶ LỆ KÝ QUỸ DUY TRÌ (MARGIN RTT) & KHÓA TỶ GIÁ FX
1. **Công thức Tỷ lệ ký quỹ duy trì (Maintenance Margin Ratio - Rtt)**:
   $$\text{Rtt} = \frac{\text{Tổng giá trị tài sản ròng}}{\text{Tổng dư nợ Margin}} \times 100\%$$
2. **Ngưỡng cảnh báo rủi ro**:
   - $\text{Rtt} \ge 150\%$: An toàn (Màu xanh `#1AB74E`).
   - $130\% \le \text{Rtt} < 150\%$: Cảnh báo (Màu vàng `#EAB308`).
   - $\text{Rtt} < 130\%$: Gọi ký quỹ bổ sung (Margin Call - Màu đỏ `#F74747`).
   - $\text{Rtt} \le 110\%$: Bắt buộc bán giải chấp (Force Sell).
   - WTS Portfolio bắt buộc có đồng hồ đo trực quan thể hiện rõ các mốc an toàn này.
3. **Cơ chế khóa tỷ giá FX (15s)**:
   - Khi hoán đổi tiền tệ đa thị trường (HKD $\leftrightarrow$ USD $\leftrightarrow$ CNY), WTS bắt buộc áp dụng:
     1. Tỷ giá hiển thị kèm đồng hồ đếm ngược $15\text{s}$ bảo lưu giá.
     2. Khi hết 15s, tự động cập nhật tỷ giá mới hoặc yêu cầu người dùng xác nhận lại trước khi trừ tiền.
