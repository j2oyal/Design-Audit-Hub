# 🏢 TIÊU CHUẨN THIẾT KẾ GIAO DIỆN ADMIN (BACKOFFICE & MIDDLE-OFFICE)
## ENTERPRISE ADMIN OPERATIONS UI/UX SPECIFICATIONS (LEVEL 1)

> **Tài liệu chuẩn hóa chuyên sâu**: Cổng điều hành quản trị, giám sát rủi ro, đối soát giao dịch và vận hành backoffice.  
> **Tham chiếu chuẩn mực**: Nielsen Norman Group B2B Enterprise Guidelines, Ant Design Pro, Salesforce Lightning.

---

## 🏛️ TRIẾT LÝ: TRẢI NGHIỆM ĐỐI SOÁT CHÍNH XÁC VÀ AN TOÀN DỮ LIỆU
Người vận hành Backoffice chịu trách nhiệm duyệt hàng nghìn hồ sơ, can thiệp tài khoản và kiểm soát rủi ro hệ thống. Giao diện phải **tối đa hóa hiệu suất xử lý dữ liệu lớn** nhưng **chặn đứng mọi nguy cơ thao tác sai lầm mang tính phá hủy**.

```text
                     4 TRỤ CỘT THẨM MỸ ADMIN BACKOFFICE
                                     │
     ┌──────────────────┬────────────┴───────┬──────────────────┐
     ▼                  ▼                    ▼                  ▼
1. DATA GRID MẬT ĐỘ 2. CĂN LỀ SỐ HỌC     3. MAKER-CHECKER   4. SKELETON &
  CHUẨN B2B           TUYỆT ĐỐI 100%       & MODAL AN TOÀN    EMPTY STATES
```

---

## 📋 1. QUY CHUẨN BẢNG DỮ LIỆU MẬT ĐỘ CAO (HIGH-DENSITY DATA GRIDS)

1. **3 Mức Chiều Cao Dòng (Row Heights)**:
   * **Compact Mode ($28\text{px} - 32\text{px}$)**: Dành cho màn hình đối soát hàng nghìn giao dịch tài chính.
   * **Standard Mode ($36\text{px} - 40\text{px}$)**: Mặc định cho danh sách người dùng, danh sách lệnh chờ duyệt.
   * **Relaxed Mode ($48\text{px}$)**: Dành cho các dòng có kèm ảnh đại diện hoặc nhiều thẻ trạng thái.
2. **Khả Năng Phân Trang & Bộ Lọc Đa Tầng (Facet Filters)**:
   * Luôn có thanh tìm kiếm nhanh, bộ lọc theo ngày tháng (`DateRangePicker`), trạng thái (Status dropdown) và nút Reset bộ lọc.
   * Chân trang luôn có phân trang rõ ràng: Tổng số dòng, số dòng trên mỗi trang (`10/25/50/100`), và số trang hiện tại.

---

## 🔢 2. CĂN LỀ SỐ HỌC NGHIÊM NGẶT (STRICT NUMERICAL ALIGNMENT)

Bắt buộc tuân thủ nguyên tắc thị giác 3 cột:
1. **Căn phải ($100\%$)**: Toàn bộ số liệu có thể so sánh hoặc cộng trừ (Giá trị giao dịch, Số dư tiền mặt, Hạn mức Margin, Lãi/Lỗ, Phí hoa hồng) kèm thuộc tính CSS `tabular-nums`.
2. **Căn trái**: Văn bản diễn giải (Tên khách hàng, Email, Tên quỹ, Mã chứng khoán, Địa chỉ).
3. **Căn giữa**: Dữ liệu có độ dài cố định hoặc định danh (Số thứ tự `#`, Mã ISIN, Ngày tháng `YYYY-MM-DD`, Status Badges, Nút Action).

---

## 🏷️ 3. MÃ MÀU SEMANTIC TRẠNG THÁI QUẢN TRỊ

Tuyệt đối không dùng màu sắc trang trí tự do. Chỉ sử dụng 4 màu trạng thái chuẩn:
* **Thành công / Hoạt động (Active / Settled)**: Xanh ngọc (`#10B981` / `#059669`).
* **Chờ duyệt / Cảnh báo (Pending / In Review)**: Vàng hổ phách (`#F59E0B` / `#D97706`).
* **Đình chỉ / Thất bại (Suspended / Failed)**: Đỏ rực (`#EF4444` / `#DC2626`).
* **Bản nháp / Vô hiệu (Draft / Inactive)**: Xám Slate (`#64748B` / `#475569`).

---

## 🚨 4. BẢO VỆ HÀNH ĐỘNG PHÁ HỦY (DESTRUCTIVE MODAL CONFIRMATION)

* **Các hành động nhạy cảm**: Xóa tài khoản, Cưỡng chế bán cổ phiếu (Force-sell), Khóa đăng nhập, Tăng trần tín dụng.
* **Quy chuẩn hiển thị Modal Cảnh Báo**:
  1. Hộp thoại nổi bật với viền đỏ cảnh báo (`border-red-500/50`) và icon Tam giác Nguy hiểm.
  2. Bắt buộc yêu cầu người dùng nhập lý do can thiệp (Reason text area) hoặc gõ lại từ xác nhận (ví dụ: gõ chữ `XÁC NHẬN`).
  3. Áp dụng cơ chế **Maker-Checker**: Người khởi tạo yêu cầu không được phép tự phê duyệt yêu cầu của chính mình.

---

## 💀 5. XỬ LÝ TRẠNG THÁI RỖNG & ĐANG NẠP (SKELETON & EMPTY STATES)
* Khi đang tải dữ liệu: Bắt buộc dùng hiệu ứng nhịp thở **Skeleton Loading Pulse** mô phỏng đúng cấu trúc bảng, không để màn hình trắng xóa hoặc xoay vòng đơn điệu.
* Khi không có dữ liệu: Hiển thị icon minh họa trang nhã kèm thông điệp: *"Chưa có giao dịch nào phù hợp với bộ lọc"* cùng nút *"Đặt lại bộ lọc"*.
