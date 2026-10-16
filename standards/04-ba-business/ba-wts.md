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
2. **Thang bước giá chuẩn đầy đủ HKEX (Rule 503 Spread Table)**:
   - HKEX áp dụng thang bước giá bậc thang theo thị giá (Rule 503 / Second Schedule of the Rules of the Exchange), bao gồm đầy đủ 11 mức từ HK$ 0.010 đến HK$ 9,995.00:
     * **HK$ 0.010 – HK$ 0.250**: Bước giá `0.001` (ví dụ: `0.123`, `0.245`)
     * **HK$ 0.250 – HK$ 0.500**: Bước giá `0.005` (ví dụ: `0.255`, `0.480`)
     * **HK$ 0.500 – HK$ 10.000**: Bước giá `0.010` (ví dụ: `1.25`, `9.99`)
     * **HK$ 10.000 – HK$ 20.000**: Bước giá `0.020` (ví dụ: `10.02`, `19.98`)
     * **HK$ 20.000 – HK$ 100.000**: Bước giá `0.050` (ví dụ: `20.05`, `99.95`)
     * **HK$ 100.000 – HK$ 200.000**: Bước giá `0.100` (ví dụ: `100.10`, `199.90`)
     * **HK$ 200.000 – HK$ 500.000**: Bước giá `0.200` (ví dụ: Tencent `385.20`, BYD `245.60`)
     * **HK$ 500.000 – HK$ 1,000.000**: Bước giá `0.500` (ví dụ: `500.50`, `999.50`)
     * **HK$ 1,000.000 – HK$ 2,000.000**: Bước giá `1.000` (ví dụ: `1,250.00`)
     * **HK$ 2,000.000 – HK$ 5,000.000**: Bước giá `2.000` (ví dụ: `2,500.00`)
     * **HK$ 5,000.000 – HK$ 9,995.000**: Bước giá `5.000` (ví dụ: `7,500.00` - trần thị giá HKEX)

3. **Lộ trình cải cách bước giá HKEX (Spread Reduction Initiative 2025/2026)**:
   - **Bối cảnh & Căn cứ**: HKEX triển khai lộ trình cải cách giảm bước giá tối thiểu (Consultation Conclusions 12/2024 theo kiến nghị của Task Force on Enhancing Stock Market Liquidity) nhằm thu hẹp chênh lệch bid-ask spread, giảm chi phí giao dịch và tăng tính thanh khoản thị trường.
   - **Phạm vi áp dụng**: Áp dụng cho Cổ phiếu thông thường (Equities), Quỹ đầu tư bất động sản (REITs) và Chứng quyền cổ phiếu (Equity Warrants). *Không áp dụng* cho ETPs/ETFs, Công cụ nợ (Debt Securities), và Chứng quyền phái sinh/CBBCs (vốn có thang spread riêng).
   - **Lộ trình 2 giai đoạn**:
     * **Giai đoạn 1 (Phase 1 - Hiệu lực từ 04/08/2025)**:
       - Khoảng giá **HK$ 10.00 – HK$ 20.00**: Bước giá giảm 50% từ `0.020` xuống **`0.010`**.
       - Khoảng giá **HK$ 20.00 – HK$ 50.00**: Bước giá giảm 60% từ `0.050` xuống **`0.020`**.
       - Khoảng giá **HK$ 50.00 – HK$ 100.00**: Giữ nguyên `0.050`.
     * **Giai đoạn 2 (Phase 2 - Hiệu lực từ 03/08/2026)**:
       - Khoảng giá **HK$ 0.50 – HK$ 10.00**: Bước giá giảm 50% từ `0.010` xuống **`0.005`** (hợp nhất với dải HK$ 0.25 - HK$ 0.50 thành một dải thống nhất HK$ 0.25 - HK$ 10.00 với bước giá 0.005).

   - **Bảng đối chiếu bước giá HKEX Tổng hợp (Standard vs Phase 1 vs Phase 2)**:

| Dải thị giá cổ phiếu (HKD) | Thang chuẩn truyền thống (Rule 503) | Phase 1 (Từ 04/08/2025) | Phase 2 (Từ 03/08/2026) | Mức giảm | Phân loại & Ví dụ mã |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **0.010 – 0.250** | `0.001` | `0.001` | `0.001` | Giữ nguyên | Penny stocks |
| **0.250 – 0.500** | `0.005` | `0.005` | `0.005` | Giữ nguyên | Hợp nhất dải trong Phase 2 |
| **0.500 – 10.000** | `0.010` | `0.010` | **`0.005`** | **-50%** | Mid / Small-cap |
| **10.000 – 20.000** | `0.020` | **`0.010`** | **`0.010`** | **-50%** | Thanh khoản cao |
| **20.000 – 50.000** | `0.050` | **`0.020`** | **`0.020`** | **-60%** | Thanh khoản cao |
| **50.000 – 100.000** | `0.050` | `0.050` | `0.050` | Giữ nguyên | Bluechips tầm trung |
| **100.000 – 200.000** | `0.100` | `0.100` | `0.100` | Giữ nguyên | Bluechips lớn |
| **200.000 – 500.000** | `0.200` | `0.200` | `0.200` | Giữ nguyên | Tencent (00700), BYD (01211) |
| **500.000 – 1,000.000** | `0.500` | `0.500` | `0.500` | Giữ nguyên | Thị giá cao |
| **1,000.000 – 2,000.000** | `1.000` | `1.000` | `1.000` | Giữ nguyên | Thị giá siêu cao |
| **2,000.000 – 5,000.000** | `2.000` | `2.000` | `2.000` | Giữ nguyên | Thị giá siêu cao |
| **5,000.000 – 9,995.000** | `5.000` | `5.000` | `5.000` | Giữ nguyên | Trần thị giá HKEX |

4. **Quy tắc thẩm định Gate 4 (BA-Audit Compliance Guideline)**:
   - **Cơ chế chấp nhận kép (Dual-Compliance)**: Gate 4 phải chấp nhận cả hai trường hợp:
     1. Hệ thống chạy theo Thang chuẩn truyền thống (Standard Rule 503).
     2. Hệ thống đã kích hoạt bước giá cải cách theo Lộ trình Spread Reduction (Phase 1 hoặc Phase 2).
   - **Chống bắt lỗi sai (Zero False Positives)**: Tuyệt đối KHÔNG đánh lỗi vi phạm nếu màn hình WTS hiển thị bước giá `0.010` tại dải HK$ 10 – 20, bước giá `0.020` tại dải HK$ 20 – 50 (Phase 1), hoặc bước giá `0.005` tại dải HK$ 0.50 – 10 (Phase 2).
   - **Quy tắc điều khiển Stepper & Ô nhập giá**: Nút tăng/giảm `+` / `-` Stepper và validation ô nhập giá trên form đặt lệnh WTS bắt buộc nhảy đúng bước giá theo thị giá hiện tại (căn cứ theo thang chuẩn hoặc thang cải cách tương ứng).
5. **Phiên giao dịch & Lệnh ngoài giờ**:
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
