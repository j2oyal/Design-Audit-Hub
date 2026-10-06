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

---

## 🔍 3. QUY CHUẨN KIỂM TOÁN CHIỀU SÂU & CHỐNG BỌC NGUYÊN KHỐI (DEEP-INSPECTION POLICY)

### 3.1. Chống Thủ Thuật Bọc Nguyên Khối (Anti-Monolithic-Wrapping):
* Nghiêm cấm chấm điểm Adoption Rate dựa trên wrapper instance vỏ ngoài.
* Đối với các component tổ hợp (`Admin-Data-Grid`, `Admin-Filter-Bar`, `Admin-Tabs`, `Stat Card Grid`), kiểm toán viên Gate 1 **BẮT BUỘC PHẢI DUYỆT ĐỆ QUY SÂU** vào từng phần tử nguyên tử con (Cells, Rows, Text, Buttons, Badges).
* Một component chỉ được xem là ĐẠT CHUẨN khi 100% phần tử con nguyên tử bên trong đạt tiêu chuẩn Design System.

### 3.2. Bộ 7 Chốt Chặn Bắt Buộc Khi Chấm Gate 1 (Zero-Defect Gate 1 Invariants):
1. **Typography Binding**: 100% layer chữ phải gắn `textStyleId` hợp lệ từ Design System (`textStyleId !== ""`). Tuyệt đối cấm gán fontSize tùy tiện.
2. **Table Row Sizing**: 100% các hàng của bảng (`Header Row`, `Row *`) phải mang `layoutSizingHorizontal = "FILL"`, `layoutAlign = "STRETCH"`.
3. **Zero Dead Space & Context-First Growth**: Phải tồn tại 1 cột mang `layoutGrow = 1` và `layoutSizingHorizontal = "FILL"`. ƯU TIÊN cột ngữ cảnh chính quan trọng/dài nhất của bảng (`Page Name`, `Content / Record`, `Banner Name`...) mang `layoutGrow = 1`. Cột `ACTIONS` KHÔNG ĐƯỢC nuốt trọn layoutGrow, chỉ giữ width vừa vặn (140px – 180px, `layoutGrow = 0`).
4. **Zero Double Border**: Header row phải có 0 stroke ngoài (`strokes = []`), đường kẻ phân cách phải nằm trong instance cell.
5. **Cell Whitelisting**: 100% ô bảng phải là instance từ Master Component `Building-Blocks/table-cell` (`3913:54247`).
6. **Action Column & Title Alignment**: Cột Action (Header `TH [ACTIONS]` và Data `TD [ACTIONS]`) BẮT BUỘC mang `primaryAxisAlignItems = "MAX"` (căn phải). Tiêu đề chữ "ACTIONS" trên Table Header BẮT BUỘC căn phải (`textAlignHorizontal = "RIGHT"`) gióng thẳng hàng 100% với các nút thao tác bên dưới.
7. **Zero Text Collision & Overflow**: Tuyệt đối không nhồi nhét Badge + Action Buttons vào chung ô hẹp (<160px) gây tràn chữ đè lấn lên cột tiếp theo. Bật `clipsContent = true` và đảm bảo padding tối thiểu 8px.

---

## 🛠️ 4. TIÊU CHUẨN BÀN GIAO KHẮC PHỤC HÀNH ĐỘNG ĐƯỢC (ACTIONABLE REMEDIATION HANDOFF)
* **Tuyệt đối cấm báo lỗi chung chung**: Khi bắt lỗi màn hình trượt tỷ lệ component adoption, auditor **BẮT BUỘC PHẢI CHỈ RÕ**:
  1. **Node ID & Tên phần tử vi phạm**: Xác định chính xác khung hình tự dựng (Ví dụ: `Tabs Container Row` - `25504:46482`).
  2. **Master Component tương ứng trong Thư viện**: Chỉ định Master Component chuẩn cần thay thế (Ví dụ: Master Component `Admin-Tabs / Segmented Control` - Node `16137:26933`).
  3. **Hướng dẫn ánh xạ thuộc tính (Component Props Mapping)**: Hướng dẫn cấu hình variant, labels, icons tương đương để Maker Agent có thể khắc phục ngay mà không phải thiết kế mò mẫm.
