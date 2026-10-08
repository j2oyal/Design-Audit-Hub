# 🎯 Trading UX & Usability Rubric: HK, CN, KR, US

Bộ tiêu chuẩn thẩm định chuyên sâu trải nghiệm người dùng (UX), tâm lý học hành vi nhà đầu tư, công thái học di động và kiến trúc thông tin (Information Architecture) tối ưu hóa cho **giai đoạn Concept, Wireframe và Prototype** ứng dụng chứng khoán quốc tế: **Hồng Kông (HKEX)**, **Trung Quốc (A-Shares)**, **Hàn Quốc (KRX)**, và **Hoa Kỳ (US)**.

> [!IMPORTANT]
> **Tư Duy Thẩm Định UX Trader-Centric**:
> - **Chấp nhận số liệu Mockup/Fake**: Không bắt bẻ phép tính nhân chia sai hay timestamp demo.
> - **Trọng tâm đánh giá**: Đánh giá cách người dùng tương tác dưới áp lực thời gian thực: ngón tay có với tới nút không, màn hình có bị ngợp số không, khi lố tiền hệ thống có gợi ý tử tế không, và các quy chế sàn có được hỗ trợ trơn tru không.
> - **Zero Design System Leakage**: Tuyệt đối không nhận xét mã màu Hex, Token hay Font chữ.

---

## 🏛️ 5 Tiêu Chuẩn UX & Usability Cốt Lõi Cho Màn Hình Giao Dịch

---

### UX-1. Công Thái Học Bàn Tay & Vùng Chạm (Ergonomics & Thumb Zone)

1. **Vùng Ngón Cái Tự Nhiên (Natural Thumb Zone - $1/3$ Dưới)**:
   - Các hành động chính (Mua/Bán, Nút Đặt lệnh CTA, Stepper `+`/`-`, Chip chọn `%` sức mua) bắt buộc phải nằm ở vùng $1/3$ dưới màn hình.
   - Tránh đặt các nút thường dùng ở góc trên bên trái buộc người dùng phải với ngón hoặc dùng tay thứ hai.
2. **Xung Đột Bàn Phím Số Ảo (Numeric Keypad Collision)**:
   - Khi focus vào ô nhập Giá hoặc Khối lượng, bàn phím số hệ thống bật lên **không được che khuất Nút CTA Đặt lệnh hoặc trường Tổng tiền**.
   - Khuyến nghị: Thiết kế form tự động đẩy lên (Push-up scroll clearance tối thiểu $280\text{px}$) hoặc tích hợp Bàn phím số Native ngay trên layout.
3. **Vùng Cảm Ứng Chống Bấm Trượt (Tap Target $\ge 44 \times 44\text{px}$)**:
   - Các nút Stepper `+` `-`, chip chọn `%`, nút đổi bước giá, icon xóa input bắt buộc đạt diện tích tiếp xúc tối thiểu $44 \times 44\text{px}$ để chống trượt ngón (Fat-finger) khi thị trường biến động mạnh.

---

### UX-2. Tải Nhận Thức & Điểm Neo Thị Giác (Cognitive Load & Visual Scannability)

1. **Định Luật Hick & Bức Tường Số (Wall of Numbers)**:
   - Tránh phơi bày 20–30 chỉ số cùng một cỡ chữ và cùng màu sắc khiến trader bị tê liệt quyết định (Analysis Paralysis).
   - Phân cấp thị giác 3 tầng:
     $$\text{Thị Giá & Biến Động \% (Cực Lớn, Đập Mắt)} \longrightarrow \text{Thông Số Khối Lượng / Sức Mua (Vừa)} \longrightarrow \text{Nhãn Phụ / Timestamp (Nhỏ, Màu Mờ)}$$
2. **Tiết Lộ Lũy Tiến (Progressive Disclosure)**:
   - $80\%$ người dùng phổ thông chỉ cần luồng cơ bản: **Mã $\to$ Giá $\to$ Khối lượng $\to$ Sức mua $\to$ Tổng tiền $\to$ Đặt lệnh**.
   - $20\%$ tính năng nâng cao (Hiệu lực lệnh TIF: Day/GTC, Giao dịch ngoài giờ Extended Hours, Lệnh điều kiện Stop/Limit, Iceberg, Greeks) **phải được gập gọn** trong Accordion `[Thiết lập nâng cao ▾]` hoặc Bottom Sheet.
3. **Điểm Neo & Luồng Quét Mắt (Natural Eye Scanpath)**:
   - Luồng quét mắt tự nhiên từ trên xuống dưới theo mô hình tư duy trader: *Mã CP $\to$ Giá thị trường $\to$ Sức mua khả dụng $\to$ Khối lượng $\to$ Tổng tiền $\to$ CTA*.

---

### UX-3. Ma Sát Tương Tác & Điền Sẵn Thông Minh (Friction & Smart Defaults)

1. **Rút Ngắn Số Bước Chạm (Taps-to-Trade)**:
   - Chuẩn mực: $\le 3\text{ taps}$ cho luồng chuẩn từ Watchlist đến khi gửi lệnh thành công; $\le 1\text{ tap}$ cho Quick Trade.
   - Loại bỏ các bước pop-up trung gian thừa thãi.
2. **Điền Sẵn Thông Minh (Smart Defaults & Auto-fill)**:
   - Tự động điền giá khớp gần nhất (Last Price) vào ô Limit Price khi mở form.
   - **Tự động bo tròn theo Lô chuẩn (Board Lot Rounding)**: Khi bấm chip `100%` sức mua, hệ thống **bắt buộc tự làm tròn xuống bội số lô chuẩn** (ví dụ tính ra 950 cp nhưng mã này lô 400 cp $\implies$ tự động điền 800 cp, cấm để 950 cp rồi báo lỗi).
3. **Triệt Tiêu Chuyển Đổi Ngữ Cảnh (Context Switching Prevention)**:
   - Không bắt người dùng phải back ra ngoài để xem Biểu đồ hay Số dư tiền mặt.
   - Ưu tiên bố cục **Split-view** (nửa trên Chart/Depth, nửa dưới Form Đặt lệnh).

---

### UX-4. Phòng Ngừa Rủi Ro, Tâm Lý Giao Dịch & Phục Hồi Lỗi (Safety & Panic Mitigation)

1. **Phòng Ngừa Bấm Nhầm Phe (Poka-Yoke Buy/Sell Separation)**:
   - Nút Mua và Bán phải phân định rõ ràng bằng màu sắc và vị trí.
   - Khi chuyển tab Mua $\leftrightarrow$ Bán, toàn bộ màu accent của form (nút Submit, viền input) phải đồng bộ đổi màu theo phe.
2. **Phản Hồi Dẫn Dắt Khi Lỗi (Constructive Error Recovery)**:
   - Khi nhập vượt quá sức mua:
     * *UX Kém*: Hiện báo lỗi cụt ngủn *"Lỗi: Không đủ sức mua"*.
     * *UX Tốt*: Gợi ý mang tính xây dựng: *"Sức mua chỉ đủ mua tối đa 300 cổ phiếu. [Bấm vào đây để chọn 300 CP]"*.
3. **Tâm Lý Học Giảm Hoảng Loạn (Panic Mitigation)**:
   - Khi danh mục lỗ nặng hoặc thị trường giảm sốc: Giao diện cần thiết kế dịu mắt, tránh nhấp nháy đỏ chói lóa gây kích động bán tháo hoảng loạn.
   - Cảnh báo Margin Call / Force Sell: Nêu rõ số tiền cần nạp bổ sung kèm nút CTA *"Nạp tiền ngay"* 1-chạm.
4. **Lối Thoát Khẩn Cấp 1-Chạm (Emergency Exit)**:
   - Sổ lệnh chờ có nút **Hủy nhanh 1-chạm** hoặc **Sửa giá nhanh** mà không qua nhiều bước modal xác nhận.
5. **Mẫu Tương Tác Non-Disabled CTA Pattern & Bottom Sheet**:
   - Khi ngoài phiên, nghỉ trưa, ngắt mạch hoặc cổ phiếu bị đình chỉ (`Suspended`): **TUYỆT ĐỐI CẤM NÚT BẤM DISABLED XÁM CHẾT**.
   - Nút vẫn giữ Active; khi chạm vào, UI **bắt buộc mở Bottom Sheet giải thích lý do** (ví dụ thông cáo HKEX, hỏi đặt lệnh chờ phiên kế tiếp) kèm CTA hành động.

---

### UX-5. Tính Đầy Đủ Nghiệp Vụ 4 Thị Trường & Trạng Thái Biên (Domain & Edge States)

1. **Đặc Thù Thị Trường Quốc Tế**:
   - 🇭🇰 **HKEX**: Hiển thị Lô chuẩn (Board lot); Cảnh báo Lô lẻ (Odd lot); Đúng timeline (09:00-09:30 POS, 12:00-13:00 Lunch Break, 16:00-16:10 CAS); Đầy đủ chỉ số Warrants (Strike, Gearing, Premium, Call Price, Expiry).
   - 🇨🇳 **Trung Quốc**: Phân tách Cổ phiếu khả dụng bán (可卖) vs Tổng nắm giữ (T+1); Biên độ trần/sàn $\pm 10\% / \pm 20\%$; Nghỉ trưa 1.5 tiếng (11:30-13:00).
   - 🇰🇷 **Hàn Quốc**: Hệ màu văn hóa Đỏ tăng / Xanh dương giảm; Giao dịch xuyên trưa không nghỉ (09:00-15:30).
   - 🇺🇸 **Hoa Kỳ**: Toggle Extended Hours ngoài giờ; Bộ đếm Day Trade PDT $25k; Mua cổ phiếu lẻ Fractional Shares (Shares vs USD); Giao dịch xuyên trưa không nghỉ.
   - 💱 **Ví Đa Tiền Tệ & FX**: Tỷ giá Live FX rate và tiền quy đổi ước tính; Huy hiệu `Delayed 15m` nếu dùng gói trễ.
2. **Trạng Thái Biên & Độ Bền Giao Diện (Edge States & Resilience)**:
   - **Empty States**: Khi sổ lệnh trống, khi chưa có vị thế $\to$ Hiển thị hình minh họa tinh tế kèm CTA dẫn dắt khám phá thị trường.
   - **Xử lý con số cực trị (Extreme Numbers)**: Không bị tràn dòng, cắt cụt (`...`) khi gặp Penny stock `$0.0001`, Berkshire `$710,000`, hoặc khối lượng hàng triệu đơn vị.
   - **Chỉ báo kết nối dữ liệu**: Trader luôn biết dữ liệu đang xem là Realtime hay đang bị lag (Stale data) do mạng chập chờn.
3. **Chuẩn Tiếp Cận WCAG 2.1 AA Đa Kênh**:
   - Mọi con số Lãi/Lỗ hoặc Tăng/Giảm **BẮT BUỘC ĐI KÈM DẤU `+`/`-` HOẶC MŨI TÊN `▲`/`▼`** (chống mù màu).
   - Nhãn chữ trạng thái (Status Label) trên nền sáng phải đạt tương phản $\ge 4.5:1$.

---

## 2. Bảng Phân Tầng Phát Hiện UX (Severity Rubric)

| Cấp Độ | Biểu Tượng | Định Nghĩa Trong Trải Nghiệm Giao Dịch |
| :--- | :---: | :--- |
| **P0 - Nguy Cơ Sai Sót / Đứt Gãy Luồng (Critical UX Blocker)** | 🚨 | Bàn phím số che mất nút Confirm; bấm nhầm Mua thành Bán do không phân tách rõ; số lượng tính ra không khớp Board lot khiến lệnh bị từ chối; thiếu trường T+1 khả dụng bán dẫn tới vi phạm luật sàn. |
| **P1 - Rào Cản Trải Nghiệm & Tải Nhận Thức (Major UX Friction)** | ⚠️ | Bức tường số 25 chỉ số không phân cấp; bắt trader thoát màn hình để xem biểu đồ hoặc số dư; thiếu lối thoát khẩn cấp 1-chạm; nút Disabled xám chết im lặng không phản hồi; vi phạm WCAG mù màu. |
| **P2 - Tối Ưu Hóa & Tiện Ích Đẳng Cấp (UX Polish & Delight)** | 💡 | Tự động làm tròn số lượng theo lô chuẩn; gợi ý sức mua tối đa khi nhập lố tiền; empty state sinh động có CTA dẫn dắt; chuyển đổi mượt mà giữa Shares vs USD. |
