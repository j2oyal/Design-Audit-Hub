# 🧠 TIÊU CHUẨN TRẢI NGHIỆM NGƯỜI DÙNG & CÔNG THÁI HỌC TOÀN CẦU (LEVEL 0)
## UNIVERSAL UX & USABILITY PRINCIPLES (GATE 3: UX-AUDIT)

> **Tài liệu tham chiếu chuẩn hóa nền tảng cho GATE 3 (UX-Audit)**  
> **Phạm vi áp dụng**: BẮT BUỘC cho toàn bộ luồng tương tác và trải nghiệm người dùng.

---

## 🏛️ 1. CÁC ĐỊNH LUẬT TÂM LÝ HỌC HÀNH VI BẤT BIẾN

### 1.1. Định Luật Fitts (Fitts's Law — Tốc Độ & Độ Chính Xác)
Thời gian chạm tới một mục tiêu phụ thuộc vào **khoảng cách di chuyển** và **kích thước của mục tiêu**:
* Nút bấm hành động chính phải đủ lớn và đặt ở vị trí thuận tay nhất.
* Kích thước vùng tương tác tối thiểu: $\ge 44 \times 44\text{px}$ trên Mobile; $\ge 32 \times 32\text{px}$ trên Desktop.

### 1.2. Định Luật Hick (Hick's Law — Tải Nhận Thức)
Thời gian ra quyết định tăng theo cấp số nhân với **số lượng lựa chọn**:
* Không đưa ra quá 5-7 lựa chọn cùng một lúc trên một màn hình đơn lẻ.
* Áp dụng kỹ thuật **Hiển thị Tăng dần (Progressive Disclosure)**: Ẩn các tính năng nâng cao vào lớp thứ 2, chỉ đưa các thao tác cốt lõi ra lớp đầu tiên.

### 1.3. Định Luật Jakob (Jakob's Law — Thói Quen Người Dùng)
Người dùng dành phần lớn thời gian ở các ứng dụng khác. Họ kỳ vọng ứng dụng của bạn hoạt động giống như những gì họ đã quen thuộc:
* Đặt nút Mua ở bên trái/trên, nút Bán ở bên phải/dưới theo thông lệ quốc tế.
* Đặt biểu tượng Giỏ hàng / Portfolio / Profile ở các vị trí chuẩn mực (góc trên hoặc thanh điều hướng đáy).

---

## 🛡️ 2. PHÒNG NGỪA SAI SÓT (POKA-YOKE & ERROR RECOVERY)

1. **Nguyên Tắc "Non-Disabled CTA" (Không Làm Mờ Nút Bấm Vô Cớ)**:
   * **Cấm**: Làm mờ nút (disabled gray) mà không giải thích tại sao không bấm được. Người dùng sẽ hoang mang không biết mình điền thiếu cái gì.
   * **Chuẩn**: Nút bấm luôn có thể click. Khi click, hệ thống trỏ thẳng vào ô bị lỗi kèm thông điệp hỗ trợ: *"Vui lòng nhập giá lớn hơn 0"*.
2. **Cơ Chế Thoát Hiểm Khẩn Cấp (Emergency Exit)**:
   * Luôn có nút "Hủy", phím `Esc`, hoặc thao tác vuốt xuống để thoát khỏi trạng thái mà không gây rủi ro.
3. **Phản Hồi Trạng Thái (System Status Visibility)**:
   * Mọi thao tác gửi lệnh, lưu dữ liệu, xóa mục bắt buộc phải có phản hồi thị giác ngay trong vòng **`100ms - 300ms`** (Toast notification, Skeleton pulse, hoặc Checkmark animation).
