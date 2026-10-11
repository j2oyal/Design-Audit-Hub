# 🖥️ TIÊU CHUẨN UX DÀNH CHO WTS (WEB WORKSTATION)
## WEB TRADING WORKSTATION USABILITY SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Dự án áp dụng**: Trạm làm việc giao dịch chứng khoán chuyên nghiệp Desktop/Web.

---

## ⌨️ 1. CÔNG THÁI HỌC BÀN PHÍM LÀ VUA (KEYBOARD-FIRST ERGONOMICS)
* **$90\%$ Thao Tác Qua Phím Tắt**: Hỗ trợ di chuyển giữa các widget bằng phím Tab hoặc mũi tên, mở lệnh nhanh bằng `[F1]` Mua, `[F2]` Bán, hủy lệnh bằng `[Esc]`.
* **Bộ Nhớ Cơ Bắp (Muscle Memory)**: Vị trí các phím tắt phải cố định và cho phép người dùng tùy biến (Custom hotkey bindings).

---

## 🖥️ 2. LƯU TRỮ TRẠNG THÁI LÀM VIỆC (WORKSPACE PERSISTENCE)
* Khi người dùng kéo thả, thay đổi kích thước bảng, thêm bớt chỉ báo biểu đồ TradingView: Toàn bộ cấu hình phải được lưu tự động (Persistent Layout).
* Khi F5 tải lại trang hoặc mở trình duyệt vào ngày hôm sau: Giao diện phải khôi phục $100\%$ vị trí các cửa sổ con mà không bắt người dùng xếp lại từ đầu.
* Hỗ trợ **Đa màn hình (Multi-Monitor Pop-out)**: Cho phép mở sổ lệnh hoặc đồ thị sang cửa sổ trình duyệt độc lập.

---

## 📐 3. CƠ CHẾ CUỘN TWO-PANE ĐỘC LẬP & VÙNG AN TOÀN 684PX
1. **Bài toán chiều cao an toàn ($684\text{px}$)**:
   - Trên màn hình $1600 \times 900\text{px}$, vùng an toàn không cần cuộn là $684\text{px}$ (vùng trọng yếu $\sim 650\text{px}$).
   - Cột Trái (Tài sản / Sức mua / Bàn đặt lệnh) bắt buộc giữ cố định trong tầm mắt.
   - Cột Phải (Danh mục vị thế / Sổ lệnh) cuộn độc lập (`overflow-y: auto`).
   - **Lỗi Nghiêm Trọng (Reject Ngay)**: Nếu thông tin Sức mua (Buying Power) hoặc Nút xác nhận đặt lệnh bị trôi mất khỏi màn hình khi người dùng lăn chuột duyệt danh sách.
2. **Luồng thao tác bàn phím chuẩn Desktop**:
   - `B` / `S`: Đổi nhanh sang Mua / Bán.
   - `Up` / `Down`: Tăng giảm 1 bước giá Tick size.
   - `Enter`: Mở popup xác nhận hoặc gửi lệnh.
   - `Esc`: Đóng Modal, đóng Drawer hoặc hủy chọn lệnh.
   - `Ctrl+K` / `Cmd+K`: Mở Command Palette tìm nhanh mã cổ phiếu hoặc tính năng.

---

## 🛡️ 4. POKA-YOKE CHỐNG ĐẶT LỆNH NHẦM & NON-DISABLED CTA
1. **Nguyên tắc nút bấm không vô hiệu hóa âm thầm (Non-disabled CTA Principle)**:
   - Không vô hiệu hóa nút bấm đặt lệnh một cách âm thầm khi thiếu sức mua hoặc sai thông số. Nút bấm phải luôn phản hồi và hiển thị thông báo/Tooltip chỉ rõ nguyên nhân (ví dụ: *"Sức mua hiện có HK$ 45,000 không đủ cho lệnh HK$ 80,000. Bấm để nạp thêm"*).
2. **Double Confirmation cho Lệnh Lớn / Lệnh Thị Trường**:
   - Lệnh có giá trị lớn ($> 100,000\text{ HKD}$) hoặc lệnh thị trường (Market Order) bắt buộc có popup xác nhận tóm tắt: Tên mã, Khối lượng, Giá tối đa và Tổng tiền.
