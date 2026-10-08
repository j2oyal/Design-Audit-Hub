# 🌐 International Market Trading Rules & Regulatory Matrix (HKEX, US, CN, KR)

Tài liệu đối chiếu chuyên sâu luật sàn, khung giờ, cơ chế khớp lệnh và các trường hợp ngoại lệ cho 4 thị trường trọng điểm.

---

## 1. Thị Trường Hồng Kông (HKEX - Hong Kong Exchanges and Clearing)

### 1.1. Khung Giờ & Hành Vi Các Phiên Giao Dịch
| Khung Giờ (HKT) | Tên Phiên | Hành Vi Cho Phép | Hành Vi Cấm Đoán (Bắt Lỗi Mockup) |
| :--- | :--- | :--- | :--- |
| **09:00 – 09:15** | Order Input (POS) | Nhập, sửa, hủy lệnh At-Auction / At-Auction Limit. | Không khớp lệnh. |
| **09:15 – 09:20** | **No-Cancellation Window (POS)** | **CHỈ ĐƯỢC NHẬP LỆNH MỚI**. | 🚨 **CẤM SỬA VÀ CẤM HỦY LỆNH**. Nút Cancel/Modify phải bị khóa. |
| **09:20 – 09:22** | Random Matching | Hệ thống tự động khớp ngẫu nhiên xác định giá mở cửa (IEP). | Cấm mọi thao tác đặt/sửa/hủy. |
| **09:22 – 09:28** | Order Matching | Khớp toàn bộ các lệnh thỏa mãn giá IEP. | Đóng băng nhận lệnh. |
| **09:28 – 09:30** | Blocking / Reset | Hệ thống chuẩn bị chuyển sang phiên liên tục. | Đóng băng toàn bộ. |
| **09:30 – 12:00** | Continuous Trading (Morning) | Khớp liên tục theo thứ tự Ưu tiên Giá $\to$ Thời gian. | Khớp lệnh bình thường. |
| **12:00 – 13:00** | **Lunch Break (Nghỉ Trưa)** | Được đặt lệnh chờ cho phiên chiều. | 🚨 **KHÔNG KHỚP LỆNH**. Biểu đồ không nhảy nến realtime, cấm nhãn `Market Open`. |
| **13:00 – 16:00** | Continuous Trading (Afternoon) | Khớp liên tục phiên chiều. | Khớp lệnh bình thường. |
| **16:00 – 16:01** | Reference Price Fixing (CAS) | Tính giá tham chiếu đóng cửa (trung bình 5 snapshot cuối). | Không nhận lệnh. |
| **16:01 – 16:06** | Order Input (CAS) | Nhập, sửa, hủy lệnh At-Auction trong biên độ $\pm 5\%$. | Biên độ giá ngoài $\pm 5\%$ bị từ chối. |
| **16:06 – 16:08** | **No-Cancellation Window (CAS)** | Chỉ được nhập lệnh mới. | 🚨 **CẤM HỦY VÀ CẤM SỬA LỆNH**. |
| **16:08 – 16:10** | Random Closing | Đóng cửa ngẫu nhiên kết thúc ngày giao dịch. | Hệ thống tự chốt giá đóng cửa. |

### 1.2. Phái Sinh CBBC (Callable Bull/Bear Contracts)
- **Bull Contract (Kỳ vọng tăng)**: $\text{Call Price} \ge \text{Strike Price}$.
- **Bear Contract (Kỳ vọng giảm)**: $\text{Call Price} \le \text{Strike Price}$.
- **Sự kiện MCE (Mandatory Call Event)**:
  * Khi $\text{Underlying Price} \le \text{Call Price}$ đối với Bull $\implies$ Kích hoạt MCE ngay lập tức.
  * Khi $\text{Underlying Price} \ge \text{Call Price}$ đối với Bear $\implies$ Kích hoạt MCE ngay lập tức.
  * Hợp đồng chấm dứt giao dịch, chuyển sang định giá giá trị thanh lý còn lại (Residual Value). Mọi nút Mua/Bán phải bị khóa cứng.

---

## 2. Thị Trường Hoa Kỳ (US - NYSE / NASDAQ)

### 2.1. Khung Giờ Giao Dịch
- **Pre-Market**: `04:00 – 09:30 EST` (Chỉ chấp nhận lệnh Limit, không có lệnh Market).
- **Regular Hours**: `09:30 – 16:00 EST` (**Xuyên suốt qua trưa, TUYỆT ĐỐI KHÔNG CÓ NGHỈ TRƯA**).
- **After-Hours**: `16:00 – 20:00 EST` (Chỉ chấp nhận lệnh Limit).

### 2.2. Quy Tắc Day Trading (PDT - Pattern Day Trader)
- Áp dụng cho tài khoản Ký quỹ (Margin Account) có tài sản ròng rỗi (Equity) $< \$25,000$.
- Tối đa **3 lượt Day Trade** (mua và bán cùng 1 mã cổ phiếu trong cùng một ngày làm việc) trong chu kỳ 5 ngày làm việc cuốn chiếu.
- Nếu thực hiện lượt thứ 4 $\implies$ Tài khoản bị gắn cờ PDT và bị đóng băng giao dịch trong 90 ngày (trừ khi nộp thêm tiền để đạt $\ge \$25,000$).

### 2.3. Cổ Phiếu Lẻ (Fractional Shares)
- Cho phép mua cổ phiếu bằng tiền USD (ví dụ: mua $\$100$ cổ phiếu Tesla).
- Khối lượng có thể lẻ đến 6 chữ số thập phân (`0.452183 shares`).
- **Ràng buộc nghiệp vụ**: Cổ phiếu lẻ thường chỉ được khớp bằng lệnh Market trong Regular Hours; không hỗ trợ lệnh Limit ngoài giờ hoặc lệnh điều kiện Stop nâng cao.

---

## 3. Thị Trường Trung Quốc (China A-Shares - SSE / SZSE)

### 3.1. Luật T+1 Settlement & Bán Cổ Phiếu
- Mua hôm nay $T$ $\implies$ **CHỈ ĐƯỢC BÁN VÀO NGÀY LÀM VIỆC TIẾP THEO $T+1$**.
- Nghiêm cấm hoàn toàn hành vi mua đi bán lại trong ngày (T+0 Day Trade).
- **Quy tắc UI bắt buộc**: Form Bán phải tách thành 2 trường riêng biệt:
  * `Tổng số lượng nắm giữ (持股数)`: Bao gồm cả cổ phiếu vừa mua phiên sáng.
  * `Số lượng khả dụng để bán (可卖数)`: Chỉ tính cổ phiếu đã hoàn tất T+1. Nếu vừa mua sáng nay thì khả dụng bán $= 0$.

### 3.2. Giới Hạn Biên Độ Trần / Sàn (Price Limits)
- Cổ phiếu bảng chính (Main Board): Biên độ $\pm 10\%$ so với giá đóng cửa phiên trước.
- Cổ phiếu bảng ChiNext & STAR Market (Khoa học công nghệ): Biên độ $\pm 20\%$.
- Cổ phiếu cảnh báo rủi ro đặc biệt (ST / *ST): Biên độ $\pm 5\%$.
- Cổ phiếu chạm giá trần (Limit Up) $\implies$ Khối lượng dư mua lớn, không ai bán.
- Cổ phiếu chạm giá sàn (Limit Down) $\implies$ Khối lượng dư bán lớn, không ai mua.

---

## 4. Thị Trường Hàn Quốc (KRX - KOSPI / KOSDAQ)

### 4.1. Hệ Thống Màu Sắc Giao Dịch
- **Tăng giá / Có lãi**: **MÀU ĐỎ (RED)**.
- **Giảm giá / Thua lỗ**: **MÀU XANH DƯƠNG (BLUE)** (Khác hoàn toàn với chuẩn phương Tây dùng Xanh Lá).
- Không đổi: Màu Xám hoặc Trắng.

### 4.2. Khung Giờ & Nghỉ Trưa
- Giờ giao dịch chính thức: `09:00 – 15:30 KST`.
- **Giao dịch liên tục xuyên suốt qua trưa, HOÀN TOÀN KHÔNG NGHỈ TRƯA**. Bắt lỗi nếu vẽ "Lunch Break" cho mã KOSPI/KOSDAQ.
