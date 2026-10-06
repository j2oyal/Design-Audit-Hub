# 🏢 TIÊU CHUẨN CÔNG THÁI HỌC & TRẢI NGHIỆM CHO ADMIN BACKOFFICE (GATE 3)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Áp dụng cho**: `Admin-Design` / Cổng Quản trị Vận hành & CMS MASHK.  
> **Nguyên tắc**: Phân biệt tường minh 3 nhóm Archetypes màn hình Admin, cấm rập khuôn checklist Mobile Thumb Zone cho giao diện Desktop.

---

## ⛔ NGUYÊN TẮC CẤM RẬP KHUÔN (ANTI-TEMPLATE POLICY)
Kiểm toán viên Gate 3 **TUYỆT ĐỐI KHÔNG ĐƯỢC**:
* Ép màn hình Desktop Admin phải có Mobile Thumb Zone ($y \ge 527\text{px}$).
* Ép form Admin phải kiểm tra va chạm bàn phím số ảo di động.
* Đòi hỏi thanh tác vụ chọn nhiều dòng (Floating Action Bar) trên màn hình Dashboard hoặc Form chi tiết.

---

## 🏛️ 1. PHÂN LOẠI 3 NHÓM NGUYÊN MẪU MÀN HÌNH ADMIN (UX ARCHETYPES)

### Archetype 1: Bảng Dữ Liệu & Danh Sách (Table & Data Grids)
*Áp dụng: `A01` (Pages List), `A03` (Campaigns Table), `A04` (Banners Table), `A05` (Media Grid), `A07` (Approvals), `A09`, `A10`, `A12`*
1. **Thao Tác Hàng Loạt (Bulk Operations)**:
   - Checkbox từng dòng đi kèm thanh tác vụ nổi màu tối (`Floating Bulk Action Bar`) xuất hiện khi $\ge 1$ dòng được chọn.
2. **Duy Trì Trạng Thái Bộ Lọc (Filter & Pagination Persistence)**:
   - Khi bấm xem chi tiết rồi bấm Back, từ khóa tìm kiếm và số trang không được bị reset về trang 1.
3. **An Toàn Hành Động Phá Hủy (Destructive Safety Friction)**:
   - Hành động Xóa/Gỡ/Từ chối bắt buộc mở Modal xác nhận 2 bước kèm lý do (Audit trail), không xóa bằng 1 click.

---

### Archetype 2: Biểu Mẫu & Trình Soạn Thảo (Forms & Editors)
*Áp dụng: `A01_M` (Create Modal), `A02` (Page Editor), `A08` (Permissions), `A10` (Form Builder), `A11` (Legal Terms)*
1. **Bảo Vệ Dữ Liệu Chưa Lưu (Unsaved Changes Guard)**:
   - Khi đã nhập liệu mà bấm Back hoặc đóng modal, phải có dialog cảnh báo: *"Bạn có thay đổi chưa lưu. Bạn có chắc muốn rời đi?"*.
2. **Phản Hồi Lưu Nháp Tức Thì (Auto-Save Feedback)**:
   - Phải có nhãn phản hồi trạng thái: *"Bản nháp đã lưu lúc 14:02"* hoặc *"Đang lưu..."*.
3. **Bộ Đếm Ký Tự Giới Hạn (Character Limit Counter)**:
   - Các trường SEO Meta (`A06`, `A02`) phải có bộ đếm ký tự (`45/60 ký tự`).

---

### Archetype 3: Bảng Điều Khiển & Chỉ Số (Dashboards & KPIs)
*Áp dụng: `A00` (Analytics Dashboard), `A06` (SEO Monitoring)*
1. **Bộ Lọc Thời Gian Chuẩn (Date Range Selector)**:
   - Cho phép chọn nhanh: Hôm nay, 7 ngày qua, 30 ngày qua, Tùy chỉnh.
2. **Trạng Thái Rỗng & Tải Dữ Liệu Nặng (Empty State & Skeleton Shimmer)**:
   - Khi không có dữ liệu: Hiển thị Empty State trang nhã.
   - Khi đang tải: Dùng Skeleton Shimmer, cấm giật khung hoặc đơ trắng.
3. **Giải Nghĩa Chỉ Số (Metric Tooltips)**:
   - Mọi biểu đồ và tỷ lệ % phức tạp (CR, Bounce Rate) phải có Tooltip giải thích công thức khi hover.
