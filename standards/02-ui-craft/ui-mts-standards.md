# 📱 TIÊU CHUẨN THIẾT KẾ GIAO DIỆN MTS (MOBILE TRADING SYSTEM)
## MOBILE TRADING UI/UX SPECIFICATIONS (LEVEL 1)

> **Tài liệu chuẩn hóa chuyên sâu**: Ứng dụng giao dịch chứng khoán di động bỏ túi (iOS / Android).  
> **Tham chiếu chuẩn mực**: Steven Hoober Ergonomics, Apple Human Interface Guidelines, Mirae Asset MASHK MTS.

---

## 🏛️ TRIẾT LÝ: GIAO DỊCH 1 TAY AN TOÀN TRONG MỌI HOÀN CẢNH
MTS phục vụ nhà đầu tư di động: trên tàu điện, ngoài quán cà phê, khi đi bộ. Giao diện phải đảm bảo thao tác **nhanh như chớp bằng 1 ngón cái** nhưng có **lá chắn an toàn tuyệt đối chống bấm nhầm**.

```text
                     4 TRỤ CỘT THẨM MỸ MTS DI ĐỘNG
                                   │
     ┌──────────────────┬──────────┴──────────┬──────────────────┐
     ▼                  ▼                     ▼                  ▼
1. VÙNG NGÓN CÁI   2. VÙNG CHẠM AN TOÀN  3. DUAL-CODING     4. CHỐNG VA CHẠM
 (THUMB ZONE)       (>= 44x44px)          MÀU SẮC P&L        BÀN PHÍM SỐ
```

---

## 👍 1. BẢN ĐỒ CÔNG THÁI HỌC VÙNG NGÓN CÁI (THUMB ZONE)

Theo nghiên cứu công thái học Steven Hoober (trên khung hình chuẩn 375x812):
* **Vùng Tự Nhiên ($y \ge 527\text{px}$ - 1/3 dưới màn hình)**:
  * Nơi đặt Bàn phím số ảo (Keypad), Nút Mua/Bán, Thanh trượt % sức mua (`25%, 50%, 75%, 100%`) và nút Xác Nhận Đặt Lệnh.
  * $100\%$ các hành động cốt lõi phải với tới được bằng ngón cái mà không cần đổi tư thế cầm máy.
* **Vùng Khó Với ($y \le 200\text{px}$ - 1/4 trên màn hình)**:
  * Chỉ dùng để hiển thị biểu đồ xu hướng, tên mã cổ phiếu, giá hiện tại và nút Quay lại (Back).
  * Tuyệt đối cấm đặt nút xác nhận lệnh quan trọng ở đỉnh màn hình.

---

## 🔘 2. VÙNG CHẠM AN TOÀN TỐI THIỂU (APPLE HIG $\ge 44 \times 44\text{PX}$)

* Mọi phần tử tương tác (Nút bấm, nút tăng/giảm bước giá Stepper, nút chuyển tab thị trường) phải có diện tích chạm thực tế **$\ge 44 \times 44\text{px}$**.
* Bỏ qua icon nhỏ bên trong nếu container bọc ngoài đã đủ $44\text{px}$.
* Nút Mua (Xanh) và Nút Bán (Đỏ) phải có khoảng cách đệm an toàn tối thiểu **`12px`**, không đặt sát sạt nhau gây chạm nhầm khi rung lắc.

---

## ♿ 3. DUAL-CODING CHO NGƯỜI MÙ MÀU (ACCESSIBILITY WCAG 2.1)

Tuyệt đối không chỉ dùng màu sắc để truyền tải lãi/lỗ hoặc hành động:
* **Hiển thị P&L**: Bắt buộc có **dấu cộng `+`** (lãi) hoặc **dấu trừ `-`** (lỗ) đi kèm màu xanh/đỏ:
  * Chuẩn: `+12.50%` (Xanh), `-3.20%` (Đỏ).
  * Cấm: Chỉ ghi `12.50%` màu xanh hoặc `3.20%` màu đỏ.
* **Phân biệt Lệnh**: Nút Mua và Bán phải có chữ viết rõ ràng ("MUA" / "BÁN"), không chỉ dựa vào màu nút.

---

## ⌨️ 4. CHỐNG VA CHẠM BÀN PHÍM ẢO (KEYPAD COLLISION PUSH-UP)

* Khi ô nhập Giá hoặc Khối lượng được kích hoạt, bàn phím số bật lên cao khoảng $280\text{px} - 320\text{px}$ từ đáy màn hình.
* Toàn bộ form nhập liệu và dòng hiển thị **Tổng Tiền Ước Tính** phải tự động đẩy lên phía trên bàn phím (`padding-bottom: 300px` hoặc tự động cuộn), không được để bàn phím che khuất số tiền phải trả.

---

## 🛡️ 5. CƠ CHẾ POKA-YOKE CHỐNG ĐẶT LỆNH NHẦM
* **Trượt để Đặt Lệnh (Slide to Confirm)** hoặc Popup xác nhận 2 bước cho các lệnh có giá trị lớn hơn $10,000\text{ HKD}$.
* **Kiểm tra Sức Mua Thời Gian Thực**: Nút đặt lệnh tự động chuyển sang trạng thái cảnh báo nếu số tiền vượt quá sức mua, không cho phép gửi lệnh rác lên Sở.
