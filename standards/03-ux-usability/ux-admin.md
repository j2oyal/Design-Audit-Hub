# 🏢 TIÊU CHUẨN TRẢI NGHIỆM NGƯỜI DÙNG ADMIN (ENTERPRISE UX & USABILITY)
## CONTEXT-AWARE ADMIN USABILITY SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Dự án áp dụng**: Cổng Quản trị Vận hành, CMS, Dashboard & Thiết lập Hệ thống.  
> **Tham chiếu chuẩn mực**: Nielsen Norman Group Enterprise UX Guidelines, Ant Design Enterprise Usability, Carbon Design System Data Patterns.

---

## ⛔ NGUYÊN TẮC CẤM RẬP KHUÔN (ANTI-TEMPLATE AUDIT POLICY)
Auditor **TUYỆT ĐỐI KHÔNG ĐƯỢC** áp dụng chung một checklist mù quáng cho mọi màn hình. Bắt buộc phải nhận diện màn hình thuộc **1 trong 3 Nhóm Nguyên Mẫu (Archetypes)** dưới đây trước khi chấm điểm:

```text
                  3 NHÓM NGUYÊN MẪU MÀN HÌNH ADMIN (UX ARCHETYPES)
                                         │
        ┌────────────────────────────────┼────────────────────────────────┐
        ▼                                ▼                                ▼
1. TABLE & DATA GRIDS           2. FORM & EDITORS               3. DASHBOARDS & KPIS
- A01 (Pages List)              - A01_M (Create Modal)          - A00 (Analytics Dashboard)
- A03 (Campaigns Table)         - A02 (Page Editor)             - A06 (SEO Monitoring)
- A04 (Banners Table)           - A08 (Permissions Matrix)      - A12 (Search Discovery)
- A05 (Media Grid)              - A10 (Forms Config)
- A07 (Approval Table)          - A11 (Legal Versioning)
```

---

## 📋 1. NGUYÊN MẪU 1: BẢNG DỮ LIỆU & DANH SÁCH (TABLE & DATA GRIDS)
*Áp dụng cho: `A01`, `A03`, `A04`, `A05`, `A07`, `A09`, `A10`, `A12`*

1. **Thao Tác Hàng Loạt Chuẩn Enterprise (Bulk Operations Pattern)**:
   - Checkbox từng dòng đi kèm thông báo mở rộng vùng chọn: *"Đã chọn 10 mục trên trang này. [Chọn toàn bộ 142 mục phù hợp]"*.
   - **Floating Action Bar**: Thanh tác vụ nổi màu tối xuất hiện dưới chân trang ngay khi $\ge 1$ dòng được chọn, cung cấp các nút hành động tương ứng (`Xuất bản`, `Gỡ bài`, `Xóa`, `Gán thẻ`).
2. **Duy Trì Trạng Thái Khi Điều Hướng (Filter & Pagination Persistence)**:
   - Khi click vào xem chi tiết một dòng rồi bấm "Back" (Quay lại): Toàn bộ từ khóa tìm kiếm, bộ lọc danh mục, số trang hiện tại và vị trí cuộn chuột phải được giữ nguyên vẹn qua URL Query Params.
3. **Ma Sát An Toàn Tác Vụ Phá Hủy (Destructive Safety Friction)**:
   - Các hành động `Xóa (Delete)`, `Gỡ xuất bản (Unpublish)`, hoặc `Từ chối (Reject)` bắt buộc phải kích hoạt **Destructive Confirmation Modal 2 bước**.
   - Bắt buộc có ô nhập lý do can thiệp (Reason Textarea) để lưu vết kiểm toán (Audit Trail), cấm tuyệt đối xóa bằng 1 cú click đơn giản.

---

## 📝 2. NGUYÊN MẪU 2: BIỂU MẪU & TRÌNH SOẠN THẢO (FORMS & EDITORS)
*Áp dụng cho: `A01_M`, `A02`, `A08`, `A10`, `A11`*

1. **Bảo Vệ Dữ Liệu Chưa Lưu (Unsaved Changes Guard & Poka-Yoke)**:
   - Khi người dùng đã chỉnh sửa form/nội dung mà bấm nút Back, bấm ra ngoài Scrim Modal, hoặc chuyển Tab: Bắt buộc xuất hiện hộp thoại cảnh báo: *"Bạn có thay đổi chưa lưu. Bạn có chắc muốn rời đi không?"*.
2. **Phản Hồi Trạng Thái Lưu Nháp (Auto-Save Feedback)**:
   - Trình soạn thảo (`A02`) phải có nhãn phản hồi thời gian thực: *"Bản nháp đã lưu lúc 14:02"* hoặc *"Đang lưu..."*.
3. **Độ Tải Nhận Thức & Giới Hạn Ký Tự (Cognitive Load & Limits)**:
   - Các trường SEO Meta (`A06, A02`) phải có bộ đếm ký tự thời gian thực (`45/60 ký tự`, đổi màu đỏ khi vượt ngưỡng).
   - Biểu mẫu phức tạp phải được chia Accordion hoặc Tab logic, không kéo dài vô tận gây quá tải nhận thức.

---

## 📊 3. NGUYÊN MẪU 3: BẢNG ĐIỀU KHIỂN & BÁO CÁO (DASHBOARDS & METRICS)
*Áp dụng cho: `A00`, `A06`, `A12`*
*(NGHIÊM CẤM đòi hỏi Floating Bulk Action Bar trên nhóm này)*

1. **Bộ Lọc Khoảng Thời Gian Chuẩn (Date Range Selector Persistence)**:
   - Cho phép chọn nhanh khoảng thời gian (Hôm nay, 7 ngày qua, 30 ngày qua, Tùy chỉnh).
   - Trạng thái ngày lọc phải được đồng bộ vào URL để có thể copy liên kết chia sẻ báo cáo chính xác.
2. **Trạng Thái Dữ Liệu Rỗng & Tải Dữ Liệu Nặng (Empty State & Skeleton Shimmer)**:
   - Khi khoảng thời gian chọn không có dữ liệu: Bắt buộc hiển thị hình vẽ Empty State trang nhã kèm thông điệp hướng dẫn rõ ràng.
   - Khi dữ liệu đang tải: Sử dụng Skeleton Loading nhấp nháy mô phỏng hình dạng card/biểu đồ, cấm để màn hình giật khung hoặc đơ trắng.
3. **Khả Năng Phân Tách Số Liệu (Drill-Down & Tooltips)**:
   - Mọi biểu đồ và tỷ lệ phần trăm (CR, Bounce Rate) phải có Tooltip hiển thị số liệu tuyệt đối khi rê chuột (Hover state).
