# 🛡️ CHECKLIST POKA-YOKE & PHÒNG NGỪA SAI SÓT TRONG THIẾT KẾ

Poka-Yoke (ポカヨケ) là nguyên lý kỹ nghệ Nhật Bản nhằm thiết kế sản phẩm sao cho **người dùng không thể làm sai, hoặc nếu làm sai thì hệ thống tự động cảnh báo và hướng dẫn khắc phục ngay lập tức**.

---

## 1. NGUYÊN TẮC "NON-DISABLED CTA" (CẤM NÚT MỜ VÔ CỚ)
* **Vấn đề**: Nhiều designer đặt nút ở trạng thái mờ (disabled gray `opacity: 0.4`) khi người dùng chưa điền đủ form. Người dùng không hiểu tại sao mình bị chặn và tỷ lệ bỏ rơi form tăng vọt.
* **Quy tắc chuẩn**:
  * Nút CTA chính luôn giữ trạng thái active có thể bấm được.
  * Khi người dùng bấm nút: Hệ thống cuộn ngay đến ô bị thiếu/lỗi, viền ô đỏ lên và xuất hiện tooltip hướng dẫn ngắn gọn: *"Vui lòng nhập khối lượng chia hết cho 100 cp"*.

---

## 2. CHỐNG THAO TÁC NHẦM LÚC HOẢNG LOẠN (PANIC-MODE POKA-YOKE)
1. **Phân Biệt Mua / Bán**:
   * Nút Mua (Xanh) và Bán (Đỏ) phải khác biệt hoàn toàn về màu sắc, icon, nhãn chữ và vị trí.
   * Cấm đặt 2 nút dính sát nhau.
2. **Trượt Để Xác Nhận (Slide to Confirm)**:
   * Loại bỏ nguy cơ "vô tình chạm ngón tay" bằng cách bắt buộc vuốt ngang một thanh trượt để kích hoạt lệnh giao dịch đòn bẩy cao.
3. **Cảnh Báo Lệch Giá Bất Thường (Out-of-market Alert)**:
   * Nếu người dùng gõ giá chênh lệch quá $10\%$ so với giá thị trường hiện tại: Xuất hiện hộp thoại cảnh báo: *"Giá bạn nhập (420.00) cao hơn 15% so với giá gần nhất (365.00). Bạn có chắc chắn muốn tiếp tục?"*.

---

## 3. LỐI THOÁT HIỂM KHẨN CẤP (EMERGENCY EXIT)
* Mọi modal, drawer, bottom-sheet bắt buộc phải có ít nhất **2 cách để thoát ra an toàn**:
  1. Bấm nút dấu nhân `×` hoặc nút "Hủy".
  2. Bấm vào vùng màn che bên ngoài (Backdrop click) hoặc nhấn phím `Esc` trên bàn phím.
