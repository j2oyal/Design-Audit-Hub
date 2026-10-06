# 🧠 BÁO CÁO THẨM ĐỊNH CHUYÊN SÂU GATE 3: UX & USABILITY AUDIT
## HỆ THỐNG QUẢN TRỊ ADMIN BACKOFFICE (MASHK CMS)

- **Mã vé nhiệm vụ**: `TASK-20261006-094309-AUDIT`
- **Mục tiêu thẩm định**: Section Node `25493:60175` (`02. MVP Screens (Mockup UI)`)
- **Tập tin Figma**: `[Admin] MASHK - Design System` (File Key: `1bkQMosF8oqtOPhJIxJMk4`)
- **Không gian sản xuất (Maker)**: `Admin-Design`
- **Đơn vị thẩm định (Auditor)**: `Design-Audit-Hub` (Gate 3: UX Usability Auditor)
- **Hồ sơ chuyên môn (Profile)**: `Admin Backoffice Operations`
- **Thời điểm hoàn tất**: 2026-10-06 09:55:00
- **Phán quyết Gate 3**: **`FAIL / REWORK_REQUIRED` (Điểm số: 40/100 — Ngưỡng đạt $\ge 85/100$)**

---

## 🏛️ 1. PHẠM VI & NGUYÊN TẮC THẨM ĐỊNH (ZERO-LEAKAGE POLICY)
Tuân thủ nghiêm ngặt ranh giới chuyên môn theo `ux-usability-audit` Skill:
1. **Không bắt lỗi Token & Màu sắc**: Toàn quyền thuộc về **Gate 1 (DS-Audit)**.
2. **Không phán xét Mỹ thuật & Đồ họa**: Toàn quyền thuộc về **Gate 2 (UI-Audit)**.
3. **Không bắt lỗi Tính toán Nghiệp vụ & Tài chính**: Toàn quyền thuộc về **Gate 4 (BA-Audit)**.
4. **Tập trung 100% vào Công thái học Quản trị & Usability**:
   - Ma sát an toàn tác vụ phá hủy (Destructive Safety Friction & Poka-Yoke).
   - Hiệu suất thao tác hàng loạt (Bulk Operations & Floating Action Bar).
   - Duy trì trạng thái bộ lọc khi điều hướng (Filter & Pagination Persistence).
   - Chỉ dẫn trạng thái rỗng và nạp dữ liệu (Empty State Guidance & Skeleton Loading).
   - Nguyên tắc Non-disabled CTA & Emergency Exit.

---

## 📊 2. BẢNG ĐIỂM NGHIỆM THU THEO HỒ SƠ ADMIN (THANG 100)

| Trụ Cột Đánh Giá | Tiêu Chuẩn Rubric | Điểm Đạt | Trạng Thái | Phát Hiện Trọng Tâm |
| :--- | :--- | :---: | :---: | :--- |
| **Trụ cột 1: Ma Sát An Toàn Tác Vụ Phá Hủy** | Bắt buộc Modal cảnh báo 2 bước + Nhập lý do (Audit Trail) cho Delete / Reject / Unpublish / Revoke | **10 / 35** | ❌ **FAIL** | Các nút Delete/Reject/Unpublish nằm trần trong bảng; hoàn toàn THIẾU màn hình/component Destructive Confirmation Modal. |
| **Trụ cột 2: Hiệu Suất Thao Tác Hàng Loạt** | Checkbox chọn trang/đa trang + Thanh tác vụ nổi (Floating Action Bar) xuất hiện khi chọn $\ge 1$ dòng | **10 / 25** | ❌ **FAIL** | Có checkbox từng dòng nhưng 0/14 bảng có Floating Action Bar (để duyệt/xóa/xuất hàng loạt); thiếu banner Select All across pages. |
| **Trụ cột 3: Duy Trì Bộ Lọc Khi Điều Hướng** | Giữ nguyên filter/search/pagination khi Back từ trang chi tiết; URL query sync; Active Filter Chips | **10 / 20** | ⚠️ **PARTIAL** | Có search và dropdown filter; có breadcrumbs trên A02 nhưng thiếu Active Filter Chips xóa nhanh và cơ chế ghi nhớ state. |
| **Trụ cột 4: Skeleton Loading & Empty State** | Thiết kế Empty State (Icon + Thông điệp + Action CTA); Skeleton placeholders chống giật khung hình | **10 / 20** | ⚠️ **PARTIAL** | Modal A01 đạt chuẩn Non-disabled CTA, nhưng 0/15 màn hình có thiết kế Empty State và 0/15 màn hình có Skeleton loading. |
| **TỔNG KẾT GATE 3** | **Ngưỡng Đạt: $\ge 85 / 100$** | **40 / 100** | ❌ **FAIL** | **BẮT BUỘC KHẮC PHỤC (REWORK REQUIRED)** |

---

## 🔍 3. CHI TIẾT PHÁT HIỆN TRÊN TỪNG MÀN HÌNH (15 MVP SCREENS)

### 1. `A00 – Analytics Dashboard` (`25493:76949`) — 60/100 (WARNING)
- **State Persistence**: Cần sync khoảng ngày lọc (`01 Sep 2026 → 29 Sep 2026`) lên URL query params để chia sẻ view quản trị và tránh bị reset khi F5.
- **Empty State**: Thiếu layout Zero-data khi khoảng ngày được chọn chưa có dữ liệu traffic.
- **Skeleton Loading**: Các widget KPI và Chart cần khung Skeleton xám nhấp nháy trong lúc truy vấn dữ liệu nặng.

### 2. `A01 – Corporate Web Pages (Page List)` (`25493:60176`) — 40/100 (FAIL - CỐT LÕI)
- 🚨 **Bulk Operations [CRITICAL]**: Bảng có cột Checkbox nhưng **THIẾU Floating Bulk Action Bar** xuất hiện khi tích chọn (cần hỗ trợ: *Xuất bản hàng loạt / Gỡ hàng loạt / Xóa hàng loạt / Gán danh mục*).
- 🚨 **Select All Across Pages**: Thiếu thông báo mở rộng vùng chọn: *"Đã chọn 10 trang trên trang hiện tại. [Chọn toàn bộ 142 trang phù hợp]"*.
- 🚨 **Destructive Safety**: Nút "Delete" trong hàng chưa có Destructive Confirmation Modal 2 bước bảo vệ.
- **Empty State**: Thiếu giao diện khi kết quả tìm kiếm/lọc trả về 0 kết quả.

### 3. `A01 – Corporate Web Pages_ Create Modal` (`25493:83896`) — 90/100 (PASS)
- ✅ **Emergency Exit**: ĐẠT - Hỗ trợ đủ 3 lối thoát an toàn (Nút đóng `[×]` góc phải, nút `Cancel` ở footer, và click vào Backdrop Scrim).
- ✅ **Non-disabled CTA**: Nút `Create & Open Editor` luôn active, có helper text hướng dẫn cụ thể.
- ✅ **Poka-Yoke Slug**: Có preview đường dẫn trực tiếp và kiểm tra tính duy nhất theo Region/Language.
- 💡 **Khuyến nghị**: Bổ sung popup cảnh báo *"Unsaved Changes"* nếu người dùng bấm ra ngoài Scrim khi đã nhập dữ liệu.

### 4. `A02 – Pages / Page Editor` (`25502:39392`) — 65/100 (WARNING)
- ✅ **Navigation**: Có Breadcrumb định vị rõ ràng (`Dashboard / Corporate Web Pages / Home Page / Edit`).
- 🚨 **Poka-Yoke [CRITICAL]**: Cần dialog cảnh báo mất dữ liệu khi admin ấn Back hoặc điều hướng sang trang khác mà chưa lưu.
- **Auto-save Feedback**: Cần hiển thị huy hiệu trạng thái lưu nháp tự động (*"Draft auto-saved 2m ago"*).

### 5. `A03 – Campaigns` (`25493:94162`) — 40/100 (FAIL)
- 🚨 **Destructive Safety**: Nút `Delete` nằm trần dạng text link trong cột hành động. Thiếu modal xác nhận 2 bước kèm lý do xóa.
- 🚨 **Bulk Operations**: Thiếu Floating Action Bar cho các chiến dịch được tick chọn.
- **Empty State**: Thiếu thiết kế khi chưa có chiến dịch nào được tạo.

### 6. `A04 – Banners & Popups` (`25493:98800`) — 40/100 (FAIL)
- 🚨 **Destructive Safety**: Thao tác xóa banner ảnh hưởng trực tiếp đến giao diện bên ngoài của khách hàng, cần modal xác nhận kèm cảnh báo phạm vi ảnh hưởng.
- 🚨 **Bulk Operations**: Thiếu thanh tác vụ nổi để Bật/Tắt (Toggle Active) hàng loạt banner.

### 7. `A05 – Media Library / Publishing` (`25504:47809`) — 45/100 (FAIL - CỐT LÕI)
- 🚨 **Destructive Safety [CRITICAL]**: Có tác vụ `DELETE / RESTORE` và `Unpublish At`, bắt buộc phải có Modal xác nhận kèm trường nhập lý do gỡ/xóa tài nguyên để lưu vết kiểm toán (Audit Trail).
- 🚨 **Bulk Management**: Quản lý media cần thanh nổi Floating Bar để di chuyển thư mục hoặc xóa hàng loạt file.
- **Upload UX**: Bổ sung khu vực kéo thả (Drag & Drop zone) kèm progress bar hiển thị dung lượng.

### 8. `A06 – SEO & Analytics / Localization` (`25504:49986`) — 60/100 (WARNING)
- **Form Cognitive Load**: Biểu mẫu cấu hình SEO nhiều trường dài, cần chia accordion hoặc tab để giảm tải nhận thức (Hick's Law).
- **Poka-Yoke Character Count**: Hiển thị bộ đếm ký tự thời gian thực cho Meta Title (tối đa 60) và Meta Description (tối đa 160).

### 9. `A07 – Workflow / Approval` (`25504:51594`) — 35/100 (FAIL - CỐT LÕI)
- 🚨 **Destructive Safety [CRITICAL]**: Nút `Button: Reject` (Từ chối duyệt) **BẮT BUỘC phải mở Modal yêu cầu nhập lý do từ chối (Rejection Reason)**, tuyệt đối không được từ chối âm thầm không có phản hồi.
- 🚨 **Bulk Approval**: Cần Floating Action Bar để cấp lãnh đạo có thể phê duyệt hoặc từ chối nhanh nhiều đầu mục mà không phải bấm từng dòng.
- **Audit Trail**: Hiển thị Timeline trực quan các bước xét duyệt (Người tạo $\rightarrow$ Người duyệt $\rightarrow$ Trạng thái $\rightarrow$ Thời gian).

### 10. `A08 – Roles & Permissions` (`25504:53465`) — 40/100 (FAIL - CỐT LÕI)
- 🚨 **High-Impact Safety [CRITICAL]**: Nút `Save Permissions` và hành động thu hồi quyền quản trị viên tác động nghiêm trọng đến bảo mật. Bắt buộc có Modal tóm tắt các quyền vừa thêm/bớt trước khi thực thi.
- 🚨 **Unsaved Guard**: Cảnh báo khi người dùng rời tab phân quyền mà chưa bấm lưu ma trận quyền.
- **Bulk Assignment**: Hỗ trợ gán vai trò hàng loạt cho danh sách người dùng.

### 11. `A09 – Structured Content` (`25504:57810`) — 45/100 (FAIL)
- **Destructive Safety**: Xóa dữ liệu có cấu trúc cần modal xác nhận tránh hỏng dữ liệu liên kết.
- **Bulk Actions**: Thiếu Floating Action Bar cho các bản ghi nội dung được chọn.

### 12. `A10 – Forms & Leads` (`25493:79195`) — 40/100 (FAIL)
- **Destructive Safety**: Xóa schema biểu mẫu hoặc xóa lead khách hàng cần hộp thoại xác nhận.
- **Bulk Export / Reassign**: Bảng danh sách lead cần thanh Floating Bar cho phép Xuất Excel hàng loạt hoặc Chuyển giao tư vấn viên hàng loạt.

### 13. `A11 – Legal & Compliance` (`25504:63264`) — 45/100 (FAIL)
- **Destructive Safety**: Thu hồi văn bản pháp lý đang áp dụng cần lưu vết kiểm toán và lý do thu hồi.
- **Version Switcher**: Cần cảnh báo Poka-Yoke khi người dùng thao tác chỉnh sửa trên phiên bản văn bản cũ (Archived version).

### 14. `A12 – Search & Discovery` (`25504:67455`) — 45/100 (FAIL)
- **Destructive Safety**: Xóa quy tắc tìm kiếm / từ đồng nghĩa cần modal xác nhận.
- **Empty State**: Thiết kế màn hình kết quả tìm kiếm không có dữ liệu kèm gợi ý từ khóa thay thế.

### 15. `A13 – Common Components & Links` (`25506:71009`) — 45/100 (FAIL)
- 🚨 **Global Impact Warning [CRITICAL]**: Chỉnh sửa link toàn cục ảnh hưởng đến toàn bộ website, cần Modal cảnh báo phạm vi ảnh hưởng (Impact Scope Dialog) liệt kê số lượng trang sẽ bị thay đổi.
- **Bulk Operations**: Thiếu Floating Action Bar cho thao tác kích hoạt/ngưng sử dụng hàng loạt component.

---

## 🎨 4. TRẠNG THÁI XUẤT THẺ GHI CHÚ TRÊN CANVAS FIGMA
Đã chạy kịch bản tự động xuất **15 Thẻ Ghi Chú Đồ Họa Blue (`[UX-Usability-Audit-Notes]`)** đặt ngay dưới từng màn hình tương ứng trong Section `25493:60175`:
- `[UX-Usability-Audit-Notes] A00 – Analytics Dashboard` (`25518:83105`)
- `[UX-Usability-Audit-Notes] A01 – Corporate Web Pages (Page List)` (`25518:83110`)
- `[UX-Usability-Audit-Notes] A01 – Corporate Web Pages_ Create Modal` (`25518:83115`)
- `[UX-Usability-Audit-Notes] A02 – Pages / Page Editor` (`25518:83120`)
- `[UX-Usability-Audit-Notes] A03 – Campaigns` (`25518:83125`)
- `[UX-Usability-Audit-Notes] A04 – Banners & Popups` (`25518:83130`)
- `[UX-Usability-Audit-Notes] A05 – Media Library / Publishing` (`25518:83135`)
- `[UX-Usability-Audit-Notes] A06 – SEO & Analytics / Localization` (`25518:83140`)
- `[UX-Usability-Audit-Notes] A07 – Workflow / Approval` (`25518:83145`)
- `[UX-Usability-Audit-Notes] A08 – Roles & Permissions` (`25518:83150`)
- `[UX-Usability-Audit-Notes] A09 – Structured Content` (`25518:83155`)
- `[UX-Usability-Audit-Notes] A10 – Forms & Leads` (`25518:83160`)
- `[UX-Usability-Audit-Notes] A11 – Legal & Compliance` (`25518:83165`)
- `[UX-Usability-Audit-Notes] A12 – Search & Discovery` (`25518:83170`)
- `[UX-Usability-Audit-Notes] A13 – Common Components & Links` (`25518:83175`)

Section `25493:60175` đã được tự động co giãn chiều cao lên $2,750\text{px}$ để chứa toàn bộ các thẻ ghi chú một cách cân đối, không đè lấn lên các frame giao diện.

---

## 🛠️ 5. YÊU CẦU SỬA ĐỔI CHO XƯỞNG CHẾ TÁC (REWORK ACTION ITEMS)

Maker Agent (`Admin-Design`) bắt buộc phải bổ sung 3 nhóm thành phần sau để vượt qua Gate 3:

1. **Thiết kế Component `Floating Bulk Action Bar`**:
   - Neo ở đáy màn hình hoặc trôi trên thanh phân trang khi có ít nhất 1 checkbox được chọn.
   - Chứa thông tin: `[X] items selected`, nút `Bulk Approve / Publish`, `Bulk Export`, `Bulk Delete / Deactivate`, và nút `Deselect All [×]`.
2. **Thiết kế Component `Destructive Confirmation Modal` (2-Step Modal)**:
   - Header cảnh báo màu đỏ/cam (`Warning / Danger`).
   - Body giải thích tác động cụ thể (ví dụ: *"Hành động này sẽ gỡ trang khỏi toàn bộ website"*).
   - Ô nhập văn bản bắt buộc: `Lý do thực hiện (Bắt buộc để lưu Audit Trail)`.
   - Nút hành động: `Hủy bỏ` (Secondary) và `Xác nhận xóa / Từ chối` (Destructive Red Button).
3. **Thiết kế Layout Mẫu cho `Empty State` & `Skeleton Loading`**:
   - 1 biến thể Empty State chuẩn: Icon minh họa + Tiêu đề *"Không có dữ liệu phù hợp"* + Nút giải quyết (*"Xóa bộ lọc"* hoặc *"Tạo mới"*).
   - 1 biến thể Skeleton Loading cho Data Table và KPI Cards.

---
*Báo cáo được lập bởi Chief Design Auditor & Senior UX Auditor (Gate 3 tai Design-Audit-Hub).*
