# 🧠 BIÊN BẢN THẨM ĐỊNH CHUYÊN SÂU GATE 3: UX & USABILITY AUDIT
## ADMIN BACKOFFICE OPERATIONS (MASHK LANDING PAGE CMS)

- **Mã vé thẩm định**: `TASK-20261007-093124-UX-AUDIT`
- **Mục tiêu thẩm định**: Figma Section Node `25493:60175` (`02. MVP Screens (Mockup UI)`)
- **URL Figma**: `https://www.figma.com/design/1bkQMosF8oqtOPhJIxJMk4/-Admin--MASHK---Design-System?node-id=25493-60175`
- **Tập tin Figma**: `[Admin] MASHK - Design System` (File Key: `1bkQMosF8oqtOPhJIxJMk4`)
- **Không gian sản xuất (Maker)**: `Admin-Design`
- **Tòa án thẩm định**: `Design-Audit-Hub` (Gate 3: UX Usability Auditor)
- **Hồ sơ chuyên môn (Profile)**: `Admin Backoffice Operations`
- **Thời điểm thẩm định**: 2026-10-07 09:39:00
- **Phán quyết cuối cùng**: ❌ **`FAIL / REWORK_REQUIRED` (Điểm số: 35 / 100 — Ngưỡng đạt $\ge 85/100$)**

---

## ⛔ 1. TUÂN THỦ NGUYÊN TẮC ZERO-LEAKAGE (RÀO CHẮN CẤM DẪM CHÂN)
Căn cứ Hiến chương Điều hướng `AGENTS.md` và Kỹ năng chuyên trách `ux-usability-audit`:
1. **Không bắt lỗi Token & Màu sắc**: Bỏ qua 100% (Ủy quyền cho **Gate 1: DS-Audit**).
2. **Không phán xét Mỹ thuật & Tinh xảo**: Bỏ qua 100% (Ủy quyền cho **Gate 2: UI-Audit**).
3. **Không bắt lỗi Tính toán Nghiệp vụ & Tài chính**: Bỏ qua 100% (Ủy quyền cho **Gate 4: BA-Audit**).
4. **Tập trung 100% vào Công thái học & Luồng tương tác Quản trị (Admin Backoffice Usability)**.

---

## 📊 2. BẢNG TỔNG HỢP KẾT QUẢ THEO 4 TRỤ CỘT ADMIN (THANG 100)

| Trụ Cột Đánh Giá | Trọng Số | Điểm Đạt | Trạng Thái | Phát Hiện Cốt Lõi |
| :--- | :---: | :---: | :---: | :--- |
| **Trụ cột 1: Ma Sát An Toàn Tác Vụ Phá Hủy**<br>*(Destructive Safety Friction & Poka-Yoke)* | 35 điểm | **10 / 35** | ❌ **FAIL** | Nút Delete/Reject/Unpublish nằm trần dạng text link trong bảng; hoàn toàn **THIẾU** Modal cảnh báo 2 bước + Nhập lý do (Audit Trail). |
| **Trụ cột 2: Hiệu Suất Thao Tác Hàng Loạt**<br>*(Bulk Operations & Selection Bar)* | 25 điểm | **5 / 25** | ❌ **FAIL** | Checkbox trong các ô dữ liệu bị ẩn (`hidden="true"`); 0/14 bảng có `Floating Bulk Action Bar`; thiếu banner `Select All across pages`. |
| **Trụ cột 3: Duy Trì Bộ Lọc & Điều Hướng**<br>*(Filter Persistence & Navigation Flow)* | 20 điểm | **10 / 20** | ⚠️ **PARTIAL** | Có search và dropdown filter cơ bản; có breadcrumb trên A02 nhưng thiếu `Active Filter Chips`, thiếu nút `Clear All`, thiếu Unsaved Changes Guard. |
| **Trụ cột 4: Skeleton Loading & Empty State**<br>*(Chỉ Dẫn Trạng Thái Rỗng & Nạp Dữ Liệu)* | 20 điểm | **10 / 20** | ⚠️ **PARTIAL** | Modal A01 đạt chuẩn Non-disabled CTA và hướng dẫn rõ ràng (90/100). Tuy nhiên **0/15 màn hình có Empty State** và **0/15 màn hình có Skeleton loading**. |
| **TỔNG KẾT ĐIỂM SỐ GATE 3** | **100 điểm** | **35 / 100** | ❌ **FAIL** | **KHÔNG ĐẠT TIÊU CHUẨN XUẤT XƯỞNG (REWORK REQUIRED)** |

---

## 🔍 3. BẢNG PHÂN TÍCH CHI TIẾT THEO TỪNG MÀN HÌNH MVP

| Màn Hình | Node ID | Điểm UX | Trạng Thái | Chi Tiết Lỗi Công Thái Học & Khuyến Nghị Khắc Phục |
| :--- | :---: | :---: | :---: | :--- |
| **A00 – Analytics Dashboard** | `25493:76949` | 60/100 | ⚠️ WARNING | • Thiếu đồng bộ khoảng ngày lọc (`01 Sep 2026 → 29 Sep 2026`) lên URL query params.<br>• Thiếu thiết kế Zero-data khi khoảng ngày chọn chưa có dữ liệu traffic.<br>• Các Widget KPI và đồ thị thiếu Skeleton placeholder khi query dữ liệu nặng. |
| **A01 – Corporate Web Pages** | `25493:60176` | 35/100 | ❌ FAIL | • 🚨 **CRITICAL**: Checkbox cột và hàng đang bị ẩn (`hidden="true"`), không thể chọn dòng.<br>• 🚨 **CRITICAL**: Thiếu `Floating Bulk Action Bar` (Xuất bản/Gỡ/Xóa/Gán nhãn hàng loạt).<br>• 🚨 Nút `Delete` nằm trần dạng text link đỏ trong hàng, thiếu Destructive Modal 2 bước bảo vệ.<br>• Thiếu Empty State khi tìm kiếm/lọc trả về 0 kết quả. |
| **A01 – Create Modal** | `25493:83896` | 90/100 | ✅ PASS | • ĐẠT: Đủ 3 lối thoát hiểm (Icon Close `[×]`, nút Cancel, Scrim backdrop).<br>• ĐẠT: Non-disabled CTA active, helper text chi tiết, Slug preview trực quan.<br>• Gợi ý: Bổ sung cảnh báo Unsaved Changes khi click backdrop lúc form đã có text gõ dở. |
| **A02 – Page Editor** | `25502:39392` | 65/100 | ⚠️ WARNING | • ĐẠT: Breadcrumbs định vị rõ ràng (`Dashboard / Corporate Web Pages / Home Page / Edit`).<br>• 🚨 **CRITICAL**: Cần Poka-Yoke Dialog cảnh báo mất dữ liệu khi admin click breadcrumb hoặc chuyển trang mà chưa lưu.<br>• Cần hiển thị rõ trạng thái lưu nháp thời gian thực (*"Draft auto-saved 2m ago"*). |
| **A03 – Campaigns** | `25493:94162` | 35/100 | ❌ FAIL | • 🚨 Nút `Delete` nằm trần dạng text link trong bảng (`Sustainable Investing`). Thiếu Modal 2 bước + Nhập lý do xóa.<br>• Bảng không có checkbox khả dụng, thiếu Floating Bulk Action Bar.<br>• Thiếu Empty State khi chưa có chiến dịch nào được tạo. |
| **A04 – Banners & Popups** | `25493:98800` | 35/100 | ❌ FAIL | • 🚨 Thao tác xóa banner ảnh hưởng trực tiếp đến người dùng bên ngoài, thiếu modal xác nhận an toàn.<br>• Thiếu Floating Action Bar để Bật/Tắt (Toggle Active) hàng loạt banner. |
| **A05 – Media Library / Publishing** | `25504:47809` | 40/100 | ❌ FAIL | • 🚨 Ghi chú có đề cập `DELETE / RESTORE` và `Unpublish At` nhưng hoàn toàn thiếu component Modal xác nhận kèm trường nhập lý do (Audit Trail).<br>• Thiếu Floating Action Bar để chọn nhiều file di chuyển thư mục hoặc xóa hàng loạt.<br>• Thiếu khu vực kéo thả (Drag & Drop zone) kèm progress bar hiển thị dung lượng. |
| **A06 – SEO & Analytics / Localization** | `25504:49986` | 60/100 | ⚠️ WARNING | • Form cấu hình dài nhiều trường, cần chia accordion/tab giảm tải nhận thức (Hick's Law).<br>• Cần hiển thị đếm số ký tự thời gian thực cho Meta Title ($\le 60$) và Meta Description ($\le 160$). |
| **A07 – Workflow / Approval** | `25504:51594` | 30/100 | ❌ FAIL | • 🚨 **CRITICAL**: Nút `Reject` nằm trực tiếp cạnh `Approve`. **BẮT BUỘC phải mở Modal yêu cầu nhập lý do từ chối (Rejection Reason)**, tuyệt đối không được từ chối âm thầm.<br>• Cần Floating Action Bar để cấp quản lý duyệt/từ chối nhanh nhiều đầu mục (Bulk Approval).<br>• Cần hiển thị Timeline lịch sử xét duyệt rõ ràng trên drawer chi tiết. |
| **A08 – Roles & Permissions** | `25504:53465` | 35/100 | ❌ FAIL | • 🚨 **CRITICAL**: Nút `Save Permissions` và thu hồi quyền quản trị bắt buộc có Modal tóm tắt phân quyền thay đổi trước khi ghi đè.<br>• Cảnh báo Unsaved Changes khi rời tab mà chưa bấm lưu ma trận quyền.<br>• Hỗ trợ gán vai trò hàng loạt cho danh sách người dùng. |
| **A09 – Structured Content** | `25504:57810` | 40/100 | ❌ FAIL | • Xóa schema cấu trúc dữ liệu cần modal xác nhận tránh phá vỡ dữ liệu liên kết.<br>• Thiếu Floating Action Bar cho các bản ghi nội dung được chọn. |
| **A10 – Forms & Leads** | `25493:79195` | 35/100 | ❌ FAIL | • Xóa schema biểu mẫu hoặc xóa lead khách hàng cần hộp thoại xác nhận.<br>• Bảng lead cần Floating Bar hỗ trợ xuất Excel hàng loạt hoặc phân bổ tư vấn viên. |
| **A11 – Legal & Compliance** | `25504:63264` | 40/100 | ❌ FAIL | • Thu hồi văn bản pháp lý đang áp dụng cần lưu vết kiểm toán và lý do bắt buộc.<br>• Cần Poka-Yoke cảnh báo khi thao tác chỉnh sửa trên phiên bản văn bản cũ (Archived version). |
| **A12 – Search & Discovery** | `25504:67455` | 40/100 | ❌ FAIL | • Xóa quy tắc tìm kiếm / từ đồng nghĩa cần modal xác nhận an toàn.<br>• Thiếu thiết kế màn hình kết quả tìm kiếm không có dữ liệu (Empty State) kèm gợi ý từ khóa. |
| **A13 – Common Components & Links** | `25506:71009` | 40/100 | ❌ FAIL | • 🚨 **CRITICAL**: Chỉnh sửa link toàn cục ảnh hưởng toàn bộ website, cần Modal cảnh báo phạm vi ảnh hưởng (Impact Scope Dialog).<br>• Thiếu Floating Action Bar cho thao tác cập nhật hàng loạt. |

---

## 🛠️ 4. BỘ YÊU CẦU SỬA ĐỔI BẮT BUỘC (MANDATORY REWORK ITEMS FOR MAKER)

Để đủ điều kiện nghiệm thu xuất xưởng tại Gate 3, Maker Agent (`Admin-Design`) bắt buộc phải thiết kế bổ sung 4 nhóm giải pháp công thái học sau:

1. **Thiết kế Component `Floating Bulk Action Bar` (Thanh Tác Vụ Nổi Hàng Loạt)**:
   - Hiển thị checkbox trên cột đầu tiên của mọi bảng dữ liệu.
   - Khi tick chọn $\ge 1$ dòng: Xuất hiện thanh nổi ở đáy màn hình hoặc trên thanh phân trang.
   - Chứa: Bộ đếm số lượng chọn (`X selected`), các nút `Bulk Publish / Approve`, `Bulk Unpublish`, `Bulk Delete`, `Bulk Export`, và nút `Deselect All [×]`.
   - Banner mở rộng: *"Đã chọn 5 dòng trên trang này. [Chọn toàn bộ X dòng thỏa mãn bộ lọc]"*.

2. **Thiết kế Component `Destructive Confirmation Modal` (Modal Xác Nhận 2 Bước)**:
   - Header cảnh báo mức độ nghiêm trọng (Danger/Warning).
   - Nội dung mô tả rõ phạm vi và hậu quả tác động (ví dụ: *"Thao tác này sẽ gỡ bài viết khỏi cổng thông tin công cộng"*).
   - **Trường văn bản bắt buộc**: `Nhập lý do thực hiện (Bắt buộc để lưu vết Audit Trail)`.
   - Nút hành động: `Hủy bỏ` (Secondary) và `Xác nhận [Xóa / Gỡ / Từ chối]` (Destructive Red).

3. **Cơ Chế Poka-Yoke & Unsaved Changes Guard**:
   - Đối với `A02 (Editor)` và `A08 (Permissions Matrix)`: Khi người dùng đã chỉnh sửa form/checkbox mà bấm Breadcrumb hoặc chuyển menu điều hướng: Xuất hiện modal cảnh báo *"Bạn có thay đổi chưa lưu. Bạn có muốn Lưu nháp (Save Draft) trước khi rời đi không?"*.
   - Đối với `A07 (Workflow Reject)`: Bắt buộc mở Modal nhập lý do từ chối trước khi chuyển trạng thái về `REJECTED`.

4. **Thiết Kế Mẫu `Empty State` & `Skeleton Loading`**:
   - 1 Master Component `Empty State` chuẩn: Icon minh họa + Tiêu đề thông báo + Mô tả nguyên nhân + Nút hành động trực tiếp (*"Xóa bộ lọc"* hoặc *"+ Tạo mới"*).
   - 1 Master Component `Skeleton Loading` cho bảng dữ liệu và Dashboard KPI cards.

---
*Biên bản được ban hành chính thức bởi Chánh Án Điều Hướng & Senior UX Auditor (Gate 3 - Design-Audit-Hub).*
