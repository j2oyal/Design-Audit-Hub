# 📐 Securities Business Audit Rubric & Verification Engine (Bộ Tiêu Chuẩn Thẩm Định Nghiệp Vụ & Số Liệu)

Tài liệu này cung cấp công thức toán học tài chính, bảng tra cứu bước giá, quy tắc lô chuẩn và cơ chế kiểm tra tính hợp lệ nghiệp vụ cho kỹ năng `securities-business-audit`.

---

## 1. Bảng Kiểm Tra Toán Học Tài Chính (Financial Math Checklist)

### 1.1. Công Thức Tính Tiền Lệnh Khớp
| Trường Thông Tin | Công Thức Chuẩn | Lưu Ý Thường Sai Trong Mockup |
| :--- | :--- | :--- |
| **Giá trị lệnh (Gross Order Value)** | $\text{Gross Value} = \text{Price} \times \text{Quantity}$ | Thiếu số 0 hàng chục, nhầm dấu chấm phẩy (`1.500` vs `1,500`). |
| **Tổng tiền MUA (Net Buy Total)** | $\text{Net Buy} = \text{Gross Value} + \text{Phí môi giới} + \text{Thuế/Phí sàn}$ | Mockup thường bỏ qua phí hoặc trừ phí thay vì cộng vào tiền trả. |
| **Tiền thực nhận BÁN (Net Sell Total)** | $\text{Net Sell} = \text{Gross Value} - \text{Phí môi giới} - \text{Thuế/Phí sàn}$ | Mockup thường cộng phí vào tiền nhận. |
| **Biểu phí chuẩn sàn HKEX (Tham khảo)** | • Stamp Duty: $0.10\%$ (làm tròn lên 1 HKD gần nhất)<br>• SFC Transaction Levy: $0.0027\%$<br>• AFRC Transaction Levy: $0.00015\%$<br>• HKEX Trading Fee: $0.00565\%$<br>• Settlement Fee: $0.002\%$ (Min 2 HKD, Max 100 HKD) | Thường phí & thuế chiếm khoảng $0.11\%$ đến $0.14\%$ tổng giá trị giao dịch. |

### 1.2. Công Thức Lãi / Lỗ (P&L Integrity)
| Chỉ Số | Công Thức | Bắt Lỗi Bất Hợp Lý |
| :--- | :--- | :--- |
| **Lãi/Lỗ Tuyệt Đối (Unrealized P&L)** | $\text{P&L} = (\text{Thị Giá Hiện Tại} - \text{Giá Vốn}) \times \text{Số Lượng}$ | • $\text{Thị Giá} > \text{Giá Vốn}$ nhưng hiển thị số âm hoặc màu đỏ.<br>• $\text{Thị Giá} < \text{Giá Vốn}$ nhưng hiển thị số dương hoặc màu xanh. |
| **Tỷ Suất Sinh Lời (% P&L)** | $\% \text{ P&L} = \frac{\text{Thị Giá} - \text{Giá Vốn}}{\text{Giá Vốn}} \times 100\%$ | Giá vốn $\$10$, giá hiện tại $\$15 \implies +50\%$, không thể ghi $+15\%$ hay $+5\%$. |
| **Lãi/Lỗ Thực Hiện (Realized P&L)** | $\text{Realized P&L} = (\text{Giá Bán} - \text{Giá Vốn}) \times \text{KL Bán} - \text{Phí 2 chiều}$ | Tính lãi bán mà không trừ phí giao dịch. |
| **Giá Hòa Vốn (Break-even Price)** | $\text{Break-even} = \text{Giá Vốn} + \frac{\text{Tổng Phí 2 Chiều}}{\text{Số Lượng}}$ | Giá hòa vốn lệnh Mua bắt buộc phải lớn hơn Giá Vốn. |

---

## 2. Bảng Bước Giá Sàn HKEX (Tick Size / Spread Table)

Cổ phiếu trên Sở giao dịch chứng khoán Hồng Kông (HKEX) bắt buộc phải tuân theo bảng bước giá cố định (Bảng Spread Hợp Quy Luật 503):

| Dải Thị Giá Cổ Phiếu (HKD) | Bước Giá Tối Thiểu (Minimum Spread) | Ví Dụ Giá Hợp Lệ | Lỗi Designer Hay Vẽ (Sai Quy Chế) |
| :--- | :---: | :--- | :--- |
| **0.010 đến 0.250** | **0.001** | `0.123`, `0.245`, `0.089` | `0.1235` (4 số lẻ) |
| **0.250 đến 0.500** | **0.005** | `0.255`, `0.300`, `0.485` | `0.252`, `0.301` (không chia hết cho 0.005) |
| **0.500 đến 10.00** | **0.010** | `1.25`, `5.80`, `9.99` | `1.255` (có số lẻ thứ 3) |
| **10.00 đến 20.00** | **0.020** | `10.02`, `15.50`, `19.98` | `10.05`, `15.53` (đuôi lẻ không chia hết cho 0.02) |
| **20.00 đến 100.00** | **0.050** | `20.05`, `45.50`, `99.95` | `20.02`, `45.58` (đuôi không phải .00 hoặc .05) |
| **100.00 đến 200.00** | **0.100** | `100.10`, `150.50`, `199.90` | `100.05`, `150.25` (đuôi không tròn hào .10) |
| **200.00 đến 500.00** *(Tencent, BYD)* | **0.200** | `385.20`, `385.40`, `450.80` | `385.25`, `385.15`, `385.23` (không chia hết cho 0.20) |
| **500.00 đến 1,000.00** | **0.500** | `500.50`, `750.00`, `999.50` | `500.20`, `750.25` (đuôi không phải .00 hoặc .50) |
| **1,000.00 đến 2,000.00** | **1.000** | `1,001.00`, `1,500.00` | `1,000.50` (có hào lẻ) |
| **2,000.00 đến 5,000.00** | **2.000** | `2,002.00`, `3,500.00` | `2,001.00` (giá lẻ 1 đô) |

---

## 3. Bảng Lô Chuẩn (Board Lot) Các Mã Trọng Điểm HKEX

Khác với thị trường Mỹ (1 cổ phiếu / lô), mỗi cổ phiếu HKEX có quy định lô riêng biệt:

| Mã Cổ Phiếu (Ticker) | Tên Doanh Nghiệp | Lô Chuẩn (Board Lot) | Khối Lượng Hợp Lệ Form Chuẩn | Lỗi Designer Hay Vẽ (Sai) |
| :--- | :--- | :---: | :--- | :--- |
| **00700** | Tencent Holdings | **100 shares** | `100`, `200`, `500`, `1,000` | `150 shares`, `1 share` |
| **00005** | HSBC Holdings | **400 shares** | `400`, `800`, `1,200`, `2,000` | `100 shares`, `250 shares` |
| **01211** | BYD Company | **500 shares** | `500`, `1,000`, `1,500` | `100 shares`, `200 shares` |
| **01299** | AIA Group | **200 shares** | `200`, `400`, `600`, `1,000` | `100 shares`, `150 shares` |
| **02318** | Ping An Insurance | **500 shares** | `500`, `1,000`, `1,500` | `100 shares`, `300 shares` |
| **09988** | Alibaba Group | **100 shares** | `100`, `200`, `500` | `50 shares` |
| **01810** | Xiaomi Corporation | **200 shares** | `200`, `400`, `600`, `1,000` | `100 shares` |
| **03690** | Meituan | **100 shares** | `100`, `200`, `500` | `150 shares` |
| **00388** | HKEX Limited | **100 shares** | `100`, `200`, `300` | `50 shares` |

---

## 4. Kiểm Tra Sổ Lệnh & Khớp Lệnh (Order Book Integrity)

```
       [CỘT DƯ MUA - BIDS]                    [CỘT DƯ BÁN - ASKS]
  Thứ Tự      Mức Giá      Khối Lượng    Khối Lượng      Mức Giá      Thứ Tự
  ──────      ───────      ──────────    ──────────      ───────      ──────
  Bid 1 (Cao nhất) $49.80    12,000         8,000       $50.00    Ask 1 (Thấp nhất)
  Bid 2        $49.75        15,000        25,000       $50.05    Ask 2
  Bid 3        $49.70        30,000        18,000       $50.10    Ask 3
  Bid 4        $49.65         8,000        40,000       $50.15    Ask 4
  Bid 5        $49.60        50,000        65,000       $50.20    Ask 5
               GIẢM DẦN                                  TĂNG DẦN
```

### Các Quy Tắc Sống Còn Của Sổ Lệnh:
1. **Quy tắc 1 (Bất biến)**: $\text{Bid 1} < \text{Ask 1}$. Chênh lệch $\text{Spread} = \text{Ask 1} - \text{Bid 1} > 0$.
2. **Quy tắc 2**: Chiều giá Bid **giảm dần** từ trên xuống dưới.
3. **Quy tắc 3**: Chiều giá Ask **tăng dần** từ trên xuống dưới.
4. **Quy tắc 4**: Giá khớp gần nhất (Last Price) phải bằng Bid 1, Ask 1 hoặc nằm giữa. Không thể vẽ Last Price nằm ngoài dải sổ lệnh đang hiển thị mà không có giải thích trượt giá.

---

## 5. Kiểm Tra Tương Thích Loại Lệnh & Hiệu Lực (Order & TIF Matrix)

| Loại Lệnh (Order Type) | Hiệu Lực Hợp Lệ (TIF) | Hiệu Lực Bất Hợp Lệ (Sai Nghiệp Vụ) | Khung Giờ Áp Dụng |
| :--- | :--- | :--- | :--- |
| **Market (Lệnh Thị Trường)** | `Day`, `IOC`, `FOK` | ❌ **`GTC`**, ❌ **`GTD`** *(Cấm lưu lệnh Market qua đêm)* | Phiên liên tục (Continuous Trading) |
| **Limit (Lệnh Giới Hạn)** | `Day`, `GTC`, `GTD`, `IOC`, `FOK` | Không | Mọi phiên (Kể cả Extended Hours) |
| **Stop Loss (Dừng Lỗ)** | `Day`, `GTC`, `GTD` | ❌ `IOC`, ❌ `FOK` | Phiên liên tục |
| **Enhanced Limit (HKEX ELO)** | `Day` | ❌ `GTC` | Phiên liên tục HKEX |
| **At-auction Limit (AO/AL)** | `Pre-opening Session (POS)` | ❌ Phiên liên tục | Chỉ áp dụng `09:00–09:30` |

---

## 6. Công Thức Sức Mua Margin, Live FX & Chuẩn Thập Phân 3-3-2

### 6.1. Sức Mua Ký Quỹ & Đòn Bẩy (Margin Purchasing Power)
$$\text{Sức Mua Tối Đa} = \frac{\text{Tài Sản Ròng (Equity)}}{\text{Tỷ Lệ Ký Quỹ Ban Đầu (Initial Margin Rate)}}$$
- **Ví dụ**: Margin Rate $50\% \implies$ Đòn bẩy tối đa 2x. Tài sản ròng $\$100,000 \implies$ Sức mua tối đa $\$200,000$.
- **Bắt lỗi**: Tài khoản tiền mặt $\$10,000$ HKD nhưng hiển thị Sức mua $\$1,000,000$ HKD (đòn bẩy 100x phi lý cho cổ phiếu); hoặc vượt sức mua nhưng không có cảnh báo vi phạm tỷ lệ duy trì ký quỹ.

### 6.2. Quy Đổi Ngoại Tệ Trực Tiếp (Multi-Currency & Live FX Buffer)
$$\text{Estimated Base Currency Amount} = \text{Order Value (Foreign)} \times \text{FX Rate} \times (1 + \text{FX Buffer})$$
- **FX Buffer**: Đệm trượt giá tỷ giá bắt buộc $1\%\text{--}2\%$ khi dùng tiền cơ sở khác với đồng tiền yết giá cổ phiếu (ví dụ dùng USD mua cổ phiếu định giá HKD).
- **Bắt lỗi**: Form đặt lệnh trừ thẳng tiền USD bằng đúng con số HKD mà không có bước quy đổi tỷ giá và buffer.

### 6.3. Quy Chuẩn Định Dạng Số Thập Phân MASHK (Quy Tắc 3 - 3 - 2)
- **Thị Giá Cổ Phiếu / Index**: Cố định **3 chữ số thập phân** (`HK$ 513.000`, `385.200`, `0.125`). *Lưu ý*: Đệm đủ 3 số 0 là format bắt buộc của MASHK, không bắt lỗi tick size nếu giá gốc chia hết cho bước giá.
- **Khối Lượng Giao Dịch (K/M/B)**: Cố định **3 chữ số thập phân** (`11.650M`, `30.423K`, `1.250B`). Cấm viết tắt thiếu số 0 (`11.6M` hay `11.65M`).
- **Giá Trị Giao Dịch / Vốn Hóa / Số Dư**: Cố định **2 chữ số thập phân** (`23.32M`, `HK$ 7,700.00`). Cấm viết 3 số lẻ (`23.320M`).

