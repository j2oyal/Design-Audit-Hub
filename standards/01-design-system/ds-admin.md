# 🏢 TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO ADMIN (BACKOFFICE)
## ENTERPRISE ADMIN BACKOFFICE COMPONENT SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: Cổng Quản trị Vận hành, Quản lý Rủi ro, và Backoffice.

---

## 🧩 1. DANH MỤC MASTER COMPONENTS BẮT BUỘC DÙNG
1. **`Admin-Data-Grid`**: Bảng dữ liệu enterprise hỗ trợ phân trang (Pagination), sắp xếp (Sort), chọn nhiều dòng (Multi-row selection), và xuất CSV.
2. **`Admin-Filter-Bar`**: Thanh công cụ lọc đa tầng (`DateRangePicker`, `SelectFilter`, `SearchInput`, `ResetBtn`).
3. **`Admin-Destructive-Dialog`**: Hộp thoại cảnh báo nguy hiểm 2 bước (bắt buộc nhập lý do hoặc gõ chữ xác nhận).
4. **`Admin-Status-Badge`**: Huy hiệu trạng thái với 4 màu semantic chuẩn (`Active`, `Pending`, `Suspended`, `Draft`).
5. **`Admin-Maker-Checker-Tag`**: Thẻ kiểm định hiển thị rõ danh tính người tạo (Maker) và người phê duyệt (Checker).

---

## 🎨 2. QUY CHUẨN TOKEN RIÊNG CHO ADMIN
* `badge-status-active`: `bg: #ECFDF5, text: #065F46` (Light) / `bg: rgba(16,185,129,0.1), text: #10B981` (Dark).
* `badge-status-danger`: `bg: #FEF2F2, text: #991B1B` (Light) / `bg: rgba(239,68,68,0.1), text: #EF4444` (Dark).
* `modal-border-destructive`: `border: 2px solid rgba(239, 68, 68, 0.4)`.
