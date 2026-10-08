# 🖥️ TIÊU CHUẨN CÔNG THÁI HỌC & UX TRADING CHO WTS WEB (GATE 3)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Áp dụng cho**: `MAPS-W-Design` / Hệ thống giao dịch Web Trading System (WTS) MASHK.  
> **Trọng tâm**: Cơ chế cuộn Two-Pane độc lập, Vùng an toàn chiều cao 684px, Công thái học bàn phím & chuột, Poka-Yoke chống đặt lệnh nhầm và Phím tắt nhanh.

---

## 📜 1. TIÊU CHUẨN CUỘN TWO-PANE ĐỘC LẬP (INDEPENDENT SCROLL)
- **Bài toán chiều cao an toàn ($684\text{px}$)**:
  - Trên màn hình $1600 \times 900\text{px}$, vùng an toàn không cần cuộn là $684\text{px}$ (vùng trọng yếu $\sim 650\text{px}$).
  - Cột Trái (Tài sản / Sức mua / Bàn đặt lệnh) bắt buộc giữ cố định trong tầm mắt.
  - Cột Phải (Danh mục vị thế / Sổ lệnh) cuộn độc lập (`overflow-y: auto`).
  - **Lỗi Nghiêm Trọng (Reject Ngay)**: Nếu thông tin Sức mua (Buying Power) hoặc Nút xác nhận đặt lệnh bị trôi mất khỏi màn hình khi người dùng lăn chuột duyệt danh sách.

---

## ⌨️ 2. CÔNG THÁI HỌC BÀN PHÍM & PHÍM TẮT (KEYBOARD HOTKEYS)
- Bàn giao dịch Desktop bắt buộc hỗ trợ luồng thao tác bằng bàn phím mượt mà:
  - `B` / `S`: Đổi nhanh sang Mua / Bán.
  - `Up` / `Down`: Tăng giảm 1 bước giá Tick size.
  - `Enter`: Mở popup xác nhận hoặc gửi lệnh.
  - `Esc`: Đóng Modal, đóng Drawer hoặc hủy chọn lệnh.
  - `Ctrl+K` / `Cmd+K`: Mở Command Palette tìm nhanh mã cổ phiếu hoặc tính năng.

---

## 🛡️ 3. POKA-YOKE CHỐNG ĐẶT LỆNH NHẦM & TRUYỀN THÔNG ĐỦ THÔNG TIN
- **Non-disabled CTA Principle**:
  - Không vô hiệu hóa nút bấm đặt lệnh một cách âm thầm khi thiếu sức mua hoặc sai thông số. Nút bấm phải luôn phản hồi và hiển thị thông báo/Tooltip chỉ rõ nguyên nhân (ví dụ: *"Sức mua hiện có HK$ 45,000 không đủ cho lệnh HK$ 80,000. Bấm để nạp thêm"*).
- **Double Confirmation cho Lệnh Lớn / Lệnh Thị Trường**:
  - Lệnh có giá trị lớn ($> 100,000\text{ HKD}$) hoặc lệnh thị trường (Market Order) bắt buộc có popup xác nhận tóm tắt: Tên mã, Khối lượng, Giá tối đa và Tổng tiền.
