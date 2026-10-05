# 📱 TIÊU CHUẨN UX DÀNH CHO MTS (MOBILE TRADING APP)
## MOBILE TRADING USABILITY & ERGONOMICS SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Dự án áp dụng**: Ứng dụng giao dịch chứng khoán di động.

---

## 🏛️ 1. CÔNG THÁI HỌC VÙNG NGÓN CÁI (THUMB ZONE)
* **Vùng Tự Nhiên ($y \ge 527\text{px}$)**: $100\%$ các thao tác Mua/Bán, bàn phím số và xác nhận lệnh phải với tới được bằng ngón cái của 1 tay.
* **Tối Thiểu Hóa Số Bước Chạm (Taps-to-Trade)**:
  * Từ màn hình xem mã đến khi gửi lệnh thành công không được vượt quá **3 bước chạm** (1 Tap mở Order pad ──▶ 1 Tap chọn % sức mua ──▶ 1 Tap/Slide gửi lệnh).

---

## 🛡️ 2. POKA-YOKE CHỐNG BẤM TRƯỢT & BẤM NHẦM
1. **Khoảng Cách An Toàn Giữa Nút Mua & Bán**: Khoảng cách tối thiểu giữa 2 nút là **`12px`**, không để 2 nút liền kề nhau gây bấm nhầm lúc thị trường sập.
2. **Cơ Chế Trượt Để Xác Nhận (Slide to Confirm)**: Áp dụng thanh trượt vuốt ngang cho các lệnh ký quỹ Margin hoặc giá trị lớn để loại bỏ hoàn toàn khả năng vô tình chạm tay vào màn hình.
3. **Chống Va Chạm Bàn Phím Số Ảo**: Tự động nâng toàn bộ form lên tối thiểu $280\text{px}$ khi active ô nhập liệu.
