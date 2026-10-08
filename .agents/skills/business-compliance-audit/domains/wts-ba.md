# 🖥️ TIÊU CHUẨN NGHIỆP VỤ TÀI CHÍNH QUỐC TẾ CHO WTS WEB (GATE 4)

> **Cổng thẩm định**: GATE 4 (BA-Audit)  
> **Áp dụng cho**: `MAPS-W-Design` / Hệ thống giao dịch Web Trading System (WTS) MASHK.  
> **Trọng tâm**: Quy chế sàn giao dịch quốc tế (HKEX, US, China Connect), Bước giá Tick Size, Lô chẵn Board Lot, Công thức tỷ lệ ký quỹ Margin Rtt và Cơ chế khóa tỷ giá FX.

---

## 🏛️ 1. QUY CHẾ THỊ TRƯỜNG CHỨNG KHOÁN HỒNG KÔNG (HKEX)
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

## 📊 2. TÍNH TOÁN ĐÒN BẨY MARGIN & RỦI RO (MARGIN RTT FORMULA)
- **Tỷ lệ ký quỹ duy trì (Maintenance Margin Ratio - Rtt)**:
  $$\text{Rtt} = \frac{\text{Tổng giá trị tài sản ròng}}{\text{Tổng dư nợ Margin}} \times 100\%$$
- **Ngưỡng cảnh báo rủi ro**:
  - $\text{Rtt} \ge 150\%$: An toàn (Màu xanh `#1AB74E`).
  - $130\% \le \text{Rtt} < 150\%$: Cảnh báo (Màu vàng `#EAB308`).
  - $\text{Rtt} < 130\%$: Gọi ký quỹ bổ sung (Margin Call - Màu đỏ `#F74747`).
  - $\text{Rtt} \le 110\%$: Bắt buộc bán giải chấp (Force Sell).
- WTS Portfolio bắt buộc có đồng hồ đo trực quan thể hiện rõ các mốc an toàn này.

---

## ⏱️ 3. CƠ CHẾ KHÓA TỶ GIÁ HOÁN ĐỔI NGOẠI TỆ (FX RATE LOCK)
- Khi hoán đổi tiền tệ đa thị trường (HKD $\leftrightarrow$ USD $\leftrightarrow$ CNY), WTS bắt buộc áp dụng:
  1. Tỷ giá hiển thị kèm đồng hồ đếm ngược $15\text{s}$ bảo lưu giá.
  2. Khi hết 15s, tự động cập nhật tỷ giá mới hoặc yêu cầu người dùng xác nhận lại trước khi trừ tiền.
