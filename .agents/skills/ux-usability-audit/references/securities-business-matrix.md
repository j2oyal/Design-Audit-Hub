# 📋 Securities UI Anatomy & Field Completeness Checklist (Checklist Đầy Đủ Trường Thông Tin 4 Thị Trường)

Tài liệu chuẩn hóa danh mục **các trường thông tin (Fields), thành phần điều khiển (UI Controls) và trạng thái hiển thị (Indicators)** bắt buộc hoặc khuyến nghị phải có trên concept giao dịch chứng khoán quốc tế (Hồng Kông, Trung Quốc, Hàn Quốc, Hoa Kỳ).

> [!TIP]
> **Nguyên tắc Concept-First**: Bỏ qua tính toán số liệu giả định (mockup numbers). Chỉ kiểm tra xem **giao diện có thiếu trường thông tin cốt lõi nào không**, và các trường đó được bố trí có thuận tiện cho luồng thao tác (UX) hay không.

---

## 1. Màn Hình Form Đặt Lệnh (Order Placement Form)

### 1.1. Các Trường Thông Tin Chung (Global Essential Fields)
- [ ] **Mã & Tên Cổ Phiếu (Ticker & Name)**: Kèm logo sàn giao dịch (NYSE, NASDAQ, HKEX, SSE, SZSE, KRX).
- [ ] **Thị Giá Hiện Tại & Biến Động (Last Price & Change)**: Kèm dấu `+`/`-` và mũi tên `▲`/`▼`.
- [ ] **Chỉ Báo Độ Tươi Dữ Liệu (Data Freshness Indicator)**: Huy hiệu `Live` hoặc `Delayed 15m` (rất quan trọng cho US và HKEX).
- [ ] **Trạng Thái Phiên (Market Session Status)**: Đang mở (Open), Nghỉ trưa (Lunch Break), Đóng cửa (Closed), Ngoài giờ (Pre/Post-market).
- [ ] **Bộ Chuyển Đổi Chiều Giao Dịch (Buy / Sell Switcher)**: Tách bạch rõ ràng, cố định vị trí.
- [ ] **Bộ Chọn Loại Lệnh (Order Type Selector)**: `Limit (LO)`, `Market (MKT)`, `Stop Limit`, `Trailing Stop`...
- [ ] **Trường Nhập Mức Giá (Price Input)**: Có nút stepper `+` `-` nhảy theo bước giá (Tick size).
- [ ] **Trường Nhập Khối Lượng (Quantity Input)**: Có gợi ý lô chuẩn hoặc stepper.
- [ ] **Các Nút Tắt Tỷ Lệ Sức Mua (Quick Percentage Chips)**: `25%`, `50%`, `75%`, `100%` sức mua.
- [ ] **Tổng Tiền Dự Kiến (Estimated Total)**: Công thức hiển thị rõ ràng: $\text{Giá} \times \text{Khối lượng}$.
- [ ] **Số Dư & Sức Mua (Balance & Purchasing Power)**: Tách biệt Tiền mặt khả dụng vs Sức mua Margin.
- [ ] **Nút Hành Động Chính (Primary CTA Button)**: `Đặt Lệnh Mua / Bán` nổi bật, to rõ.

---

### 1.2. Trường Thông Tin Đặc Thù Từng Thị Trường (Market-Specific Required Fields)

#### 🇭🇰 1. Thị Trường Hồng Kông (HKEX)
- [ ] **Gợi Ý Board Lot Tự Động (Board Lot Display)**:
  * Phải có nhãn hiển thị lô chuẩn của mã đang chọn (ví dụ: `1 Lot = 100 shares` cho Tencent, `1 Lot = 400 shares` cho HSBC).
  * *Thiếu sót thường gặp*: Để ô khối lượng trống trơn hoặc mặc định nhập 100 cho mọi mã.
- [ ] **Chỉ Báo / Cảnh Báo Lô Lẻ (Odd Lot Indicator)**:
  * Khi người dùng nhập khối lượng không tròn Board Lot (ví dụ 250 CP của HSBC), UI phải có nhãn cảnh báo: `Lô lẻ (Odd lot) sẽ giao dịch với giá chiết khấu`.
- [ ] **Bộ Chọn Hiệu Lực Lệnh (Order Validity / TIF)**: `Day (Trong ngày)` hoặc `Good-Til-Date (GTD)`.

---

### 1.3. Khung Giờ Giao Dịch & Các Phiên Đặc Thù 4 Thị Trường (Trading Session Timelines)

Dùng để đối chiếu và bắt lỗi khi Designer đặt tên phiên, vẽ timeline hoặc hiển thị trạng thái giờ giấc:

| Thị trường | Phiên sáng | Nghỉ trưa | Phiên chiều | Phiên đấu giá đặc thù & Lưu ý |
| :--- | :---: | :---: | :---: | :--- |
| 🇭🇰 **Hồng Kông (HKEX)** | **09:30 – 12:00**<br>*(Khớp liên tục)* | **12:00 – 13:00**<br>*(Bắt buộc nhãn `Lunch Break`, cấm `Close`)* | **13:00 – 16:00**<br>*(Khớp liên tục)* | • **09:00 – 09:30**: Pre-Opening Session (POS) gồm 09:00–09:15 Order Input, 09:15–09:20 No Cancel, 09:20–09:22 Random Matching, 09:22–09:28 Order Matching, 09:28–09:30 Quiescent/Reset.<br>• **16:00 – 16:10**: Closing Auction Session (CAS) gồm 16:00–16:01 Reference Price Fixing, 16:01–16:06 Order Input, 16:06–16:08 No Cancel, 16:08–16:10 Random Close.<br>• **VCM**: Kiểm soát biến động ngắt mạch 5 phút (Cooling-off). |
| 🇨🇳 **Trung Quốc (SSE/SZSE)** | **09:30 – 11:30**<br>*(Khớp liên tục)* | **11:30 – 13:00**<br>*(Nghỉ trưa dài 1.5 tiếng)* | **13:00 – 14:57**<br>*(Khớp liên tục)* | • **09:15 – 09:25**: Đấu giá mở cửa (09:20–09:25 cấm rút lệnh).<br>• **14:57 – 15:00**: Đấu giá đóng cửa gom lệnh (Call Auction). |
| 🇰🇷 **Hàn Quốc (KRX)** | **09:00 – 15:30**<br>*(Khớp liên tục thông suốt)* | ❌ **HOÀN TOÀN KHÔNG NGHỈ TRƯA** | *(Thông suốt qua trưa)* | • **08:30 – 09:00**: Pre-Market Session.<br>• **15:20 – 15:30**: Closing Auction.<br>• **15:40 – 18:00**: After-hours Single Price.<br>• 🚨 **Bắt lỗi ngay** nếu concept vẽ màn hình "Nghỉ trưa" cho mã cổ phiếu Hàn Quốc. |
| 🇺🇸 **Hoa Kỳ (NYSE/NASDAQ)** | **09:30 – 16:00 EST**<br>*(Regular Trading Hours)* | ❌ **HOÀN TOÀN KHÔNG NGHỈ TRƯA** | *(Thông suốt qua trưa)* | • **04:00 – 09:30 EST**: Pre-Market.<br>• **16:00 – 20:00 EST**: After-Hours (16:00–20:00 EST).<br>• **LULD Halt**: Tạm ngừng 5 phút khi giá chạm ngưỡng giới hạn.<br>• 🚨 **Bắt lỗi ngay** nếu concept vẽ màn hình "Nghỉ trưa" cho cổ phiếu Mỹ. |

#### 🇨🇳 2. Thị Trường Trung Quốc (China A-Shares / Stock Connect)
- [ ] **Phân Tách Cổ Phiếu Khả Dụng Bán (Available to Sell vs Total Position)**:
  * 🚨 **Thiếu sót nghiêm trọng nhất**: Chỉ hiển thị `Tổng số cổ phiếu đang có` mà không có trường `Khả dụng để bán hôm nay (可卖)`.
  * Do luật **T+1 cấm bán trong ngày**, cổ phiếu vừa mua phiên sáng BẮT BUỘC không được tính vào trường khả dụng để bán.
- [ ] **Gợi Ý Bội Số 100 (100-Share Multiples Indicator)**:
  * Khi Mua: Nhãn ghi chú `Khối lượng phải là bội số của 100`.
  * Khi Bán: Có nút tắt `Bán toàn bộ lô lẻ` nếu tài khoản còn cổ phiếu lẻ $< 100$.
- [ ] **Biên Độ Trần / Sàn Trong Ngày (Ceiling / Floor Limit Display)**:
  * Hiển thị rõ giá Trần (+10%/+20%) và giá Sàn (-10%/-20%) để người dùng biết biên giới hạn.
- [ ] **Nhãn Cảnh Báo Cổ Phiếu ST / *ST (Special Treatment Tag)**:
  * Cổ phiếu có rủi ro cao phải gắn huy hiệu cảnh báo `[ST - Biên độ ±5%]`.

#### 🇰🇷 3. Thị Trường Hàn Quốc (KRX - KOSPI / KOSDAQ)
- [ ] **Hệ Màu Chuẩn Văn Hóa Hàn Quốc (Korean Color Mode)**:
  * Tăng/Lãi: Màu Đỏ (Red).
  * Giảm/Lỗ: **Màu Xanh Dương (Blue)** (không dùng xanh lá mặc định).
- [ ] **Trạng Thái Phiên Thông Suốt (Continuous Session Indicator)**:
  * Không có trạng thái "Nghỉ trưa" trong khung 12:00 - 13:00.
- [ ] **Trường Chọn Lệnh Thị Trường / Lệnh Điều Kiện (Market / Conditional Options)**:
  * Lệnh giới hạn (`지정가`), Lệnh thị trường (`시장가`), Lệnh điều kiện đóng cửa (`조건부지정가`).

#### 🇺🇸 4. Thị Trường Hoa Kỳ (NYSE / NASDAQ)
- [ ] **Toggle Giao Dịch Ngoài Giờ (Extended Hours Trading Toggle)**:
  * Checkbox hoặc Switch: `[ ] Cho phép khớp phiên ngoài giờ (Pre/Post-market)`.
  * Khi bật toggle này, loại lệnh bắt buộc chuyển thành `Limit Order`.
- [ ] **Bộ Đếm Số Lần Day Trade Còn Lại (Day Trades Remaining Counter)**:
  * Với tài khoản Margin: Bắt buộc có dòng hiển thị `Day Trades còn lại: X / 3 (Luật PDT $25k)`.
  * Giúp trader không vô tình làm tài khoản bị phạt đóng băng 90 ngày.
- [ ] **Bộ Chuyển Đổi Mua Theo Cổ Phiếu hoặc Theo Tiền (Shares vs USD Switcher)**:
  * Cho phép người dùng chuyển đổi: `[Mua theo Số Cổ Phiếu]` $\longleftrightarrow$ `[Mua theo Số Tiền USD]` (hỗ trợ Fractional shares).
- [ ] **Bộ Chọn Hiệu Lực Lệnh Nâng Cao (Time-In-Force - TIF)**:
  * `Day`, `GTC (Good 'Til Canceled)`, `Extended Hours (EXT)`.
- [ ] **Thông Báo Chu Kỳ Thanh Toán T+1**:
  * Chú thích hoàn tất thanh toán trong 1 ngày làm việc (T+1).

---

## 2. Màn Hình Xác Nhận Lệnh (Order Confirmation Dialog / Summary Sheet)

- [ ] **Tóm Tắt Chiều Giao Dịch & Mã CP (Action & Symbol)**: Ví dụ: `MUA 200 cổ phiếu NVDA (NASDAQ)`.
- [ ] **Loại Lệnh & Mức Giá Đặt (Order Type & Price)**: Ví dụ: `Limit @ $125.50`.
- [ ] **Giá Trị Lệnh Ước Tính (Estimated Order Value)**: Khối lượng $\times$ Giá.
- [ ] **Minh Bạch Thuế & Phí Ước Tính (Fees & Taxes Breakdown)**:
  * Phí môi giới (Commission).
  * Phí sàn / Thuế (Stamp duty 0.1% HKEX, Phí SEC/FINRA Mỹ, Thuế STT Hàn Quốc).
- [ ] **Thông Tin Quy Đổi Tỷ Giá FX (Nếu Dùng Đồng Tiền Khác)**:
  * Tỷ giá tham chiếu: Ví dụ `1 USD = 7.8250 HKD`.
  * Số tiền ngoại tệ bị trừ ước tính.
- [ ] **Số Dư Sau Khi Khớp Dự Kiến (Estimated Remaining Balance)**: Cho biết số tiền mặt còn lại sau giao dịch.
- [ ] **Cảnh Báo Rủi Ro Nếu Có (Risk Disclaimer Banner)**:
  * Cảnh báo lệnh Market trượt giá.
  * Cảnh báo luật PDT Mỹ hoặc T+1 Trung Quốc.
- [ ] **2 Nút Thao Tác Cân Đối**: Nút `Hủy / Điều chỉnh` và Nút `Xác Nhận Đặt Lệnh` (hoặc thanh trượt `Slide to Confirm`).

---

## 3. Màn Hình Sổ Lệnh & Quản Lý Lệnh Chờ (Order Book & Active Orders)

- [ ] **Bộ Lọc Trạng Thái Lệnh (Status Filter Tabs)**: `Chờ khớp (Pending)`, `Đã khớp (Filled)`, `Đã hủy (Canceled/Rejected)`.
- [ ] **Nút Hủy Lệnh Nhanh 1-Chạm (Quick Cancel Action)**: Nút hủy hiển thị trực tiếp trên từng dòng lệnh chờ, không bắt bấm vào chi tiết mới thấy nút hủy.
- [ ] **Nút Sửa Giá / Khối Lượng Nhanh (Modify Order Action)**: Cho phép sửa lệnh nhanh khi thị trường biến động.
- [ ] **Chỉ Báo Tiến Độ Khớp Lệnh (Fill Progress Indicator)**:
  * Khớp 1 phần: Hiển thị thanh tiến độ hoặc text rõ ràng: `Đã khớp: 300 / 1,000 (30%)`.
- [ ] **Thông Báo Nguyên Nhân Khi Lệnh Bị Từ Chối (Actionable Rejection Reason)**:
  * Ghi rõ lý do thay vì mã code: *"Lệnh bị sàn từ chối do vi phạm quy tắc T+1"* hoặc *"Lệnh bị hủy do hết phiên giao dịch"*.

---

## 4. Màn Hình Quản Lý Danh Mục & Vị Thế (Portfolio & Positions)

- [ ] **Tổng Tài Sản Ròng Quy Đổi (Total Net Worth in Base Currency)**: Kèm % biến động trong ngày.
- [ ] **Ví Đa Tiền Tệ Tách Biệt (Multi-Currency Balances)**: Phân tách rõ các tab hoặc hàng: `HKD`, `USD`, `CNY`, `KRW`.
- [ ] **Phân Định Nguồn Vốn (Cash vs Margin)**:
  * `Tiền mặt khả dụng để rút (Withdrawable Cash)`.
  * `Tiền chờ về chu kỳ T+ (Unsettled Funds)`.
  * `Sức mua có Ký quỹ (Margin Buying Power)`.
- [ ] **Chỉ Số Sức Khỏe Tài Khoản Ký Quỹ (Margin Risk Gauge)**:
  * Hiển thị tỷ lệ an toàn tài khoản với các dải màu trực quan (An toàn $\to$ Chú ý $\to$ Call Margin $\to$ Bán giải chấp).
- [ ] **Danh Sách Vị Thế Nắm Giữ (Positions List)**:
  * Khối lượng nắm giữ & Khối lượng khả dụng bán.
  * Giá vốn trung bình (Avg Cost) vs Giá thị trường (Current Price).
  * Lãi/Lỗ chưa thực hiện (Unrealized P&L) kèm cả **Số tiền tuyệt đối** và **Phần trăm %**.
  * Quy tắc đa kênh: Bắt buộc có dấu `+`/`-` và mũi tên `▲`/`▼`.
- [ ] **Nhãn Sự Kiện Quyền (Corporate Action Tags)**: Huy hiệu `[Ex-Date]` hoặc `[Dividends]` khi cổ phiếu có điều chỉnh kỹ thuật.

---

## 5. Từ Điển Thuật Ngữ Chuẩn & Pre-flight Typo Check (Trading Microcopy Whitelist)

Bảng đối chiếu các thuật ngữ tiếng Anh chuẩn trong giao dịch quốc tế để AI tự động rà quét và bắt lỗi chính tả / dùng từ sai ngữ cảnh:

| Thuật ngữ chuẩn (Whitelist) | Lỗi gõ nhầm / Biến thể sai thường gặp | Ý nghĩa nghiệp vụ |
| :--- | :--- | :--- |
| **`Continuous Trading`** | ❌ `Continous Trading` (thiếu chữ 'u') | Phiên khớp lệnh liên tục |
| **`Pre-Opening Session (POS)`** | ❌ `Pre-Openning`, `Pre-Trade` đơn độc | Phiên đấu giá mở cửa HKEX |
| **`Closing Auction Session (CAS)`** | ❌ `Close Auction`, `End Auction` | Phiên đấu giá đóng cửa HKEX |
| **`Lunch Break` / `Intermission`** | ❌ `Close` (dễ nhầm với đóng cửa hết ngày) | Giờ nghỉ trưa (12:00–13:00 HKEX) |
| **`Day Close` / `Closed`** | ❌ `Day Closing` (khi đã đóng hẳn) | Đóng cửa hết ngày |
| **`Order Cancellation`** | ❌ `Order Cancelation` (1 chữ 'l' kiểu lộn xộn) | Giai đoạn cho phép hủy lệnh |
| **`No Cancellation`** | ❌ `No Cancelation`, `No Cancel` (thiếu ngữ cảnh) | Giai đoạn cấm hủy/sửa lệnh |
| **`Random Matching`** | ❌ `Radom Matching` | Khớp lệnh ngẫu nhiên POS |
| **`Random Closing` / `Random Close`** | ❌ `Radom Close` | Đóng cửa ngẫu nhiên CAS |
| **`Trading Suspended`** | ❌ `Suspension` (khi dùng làm badge trạng thái) | Đình chỉ giao dịch |
| **`Exchange Intervention`** | ❌ `Exchange Intervene` | Sở giao dịch can thiệp |
| **`Volatility Control Mechanism (VCM)`** | ❌ `Volatily Control` | Cơ chế kiểm soát biến động HKEX |
| **`Buying Power`** | ❌ `Buy Power` | Sức mua khả dụng |
| **`Estimated Total`** | ❌ `Estimate Total` | Tổng tiền dự kiến |

