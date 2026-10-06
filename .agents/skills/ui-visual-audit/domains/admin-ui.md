# 🏢 TIÊU CHUẨN MỸ THUẬT & VISUAL POLISH CHO ADMIN BACKOFFICE (GATE 2)

> **Cổng thẩm định**: GATE 2 (UI-Audit)  
> **Áp dụng cho**: `Admin-Design` / Cổng Quản trị Vận hành & CMS MASHK.  
> **Trọng tâm**: Mật độ dòng chuẩn B2B, Căn lề số học 100%, Bảng màu Semantic trạng thái, Modal cảnh báo phá hủy và Độ tương phản WCAG 2.1 AA thực tế.

---

## 📋 1. MẬT ĐỘ BẢNG DỮ LIỆU CHUẨN B2B (ROW HEIGHT DENSITY)
* **Compact Mode ($28\text{px} - 32\text{px}$)**: Màn hình đối soát nhiều giao dịch.
* **Standard Mode ($36\text{px} - 40\text{px}$)**: Mặc định cho danh sách dữ liệu (Users, Pages, Articles).
* **Relaxed Mode ($48\text{px}$)**: Dòng có ảnh avatar, thumbnail media hoặc nhiều badge.

---

## 🔢 2. CĂN LỀ SỐ HỌC NGHIÊM NGẶT (STRICT NUMERICAL ALIGNMENT)
Bắt buộc tuân thủ nguyên tắc thị giác:
* **Căn phải ($100\%$)**: Toàn bộ số liệu có thể so sánh, cộng trừ hoặc thống kê (Giá trị, Tiền tệ, Số dư, Lượt xem, Tỷ lệ %) kèm thuộc tính CSS `font-variant-numeric: tabular-nums`.
* **Căn trái**: Văn bản tên gọi, tiêu đề bài viết, email, URL slug, mô tả.
* **Căn giữa**: Dữ liệu có độ dài cố định hoặc định danh (Số thứ tự `#`, Mã ID, Ngày tháng `YYYY-MM-DD`, Badges, Nút Action).

---

## 🏷️ 3. MÃ MÀU SEMANTIC TRẠNG THÁI QUẢN TRỊ
Tuyệt đối không dùng màu sắc tự do. Chỉ sử dụng 4 màu trạng thái chuẩn:
* **Hoạt động / Xuất bản (Active / Published / Settled)**: Green semantic (`#10B981` / `#059669`).
* **Chờ duyệt / Cảnh báo (Pending / In Review / Warning)**: Amber semantic (`#F59E0B` / `#D97706`).
* **Đình chỉ / Thất bại / Từ chối (Suspended / Rejected / Danger)**: Red semantic (`#EF4444` / `#DC2626`).
* **Bản nháp / Vô hiệu (Draft / Inactive)**: Slate Gray semantic (`#64748B` / `#475569`).

---

## 🚨 4. HỘP THOẠI CẢNH BÁO NGUY HIỂM (DESTRUCTIVE MODAL CONFIRMATION)
* Đối với các hành động nhạy cảm (Xóa dữ liệu, Gỡ bài xuất bản, Khóa tài khoản, Từ chối duyệt):
  1. Hộp thoại có viền hoặc icon cảnh báo màu đỏ (`border-red-500/50`).
  2. Bắt buộc có ô nhập lý do can thiệp (Reason text area) để lưu vết kiểm toán (Audit Trail).
  3. Nút hành động chính mang biến thể `Destructive Solid Button` màu đỏ.

---

## 👁️ 5. ĐỘ TƯƠNG PHẢN WCAG 2.1 AA (COMPUTED EFFECTIVE BACKGROUND)
* Tỷ lệ tương phản tối thiểu **$\ge 4.5:1$** cho văn bản thường và **$\ge 3.0:1$** cho tiêu đề lớn.
* Khi script kiểm tra tương phản, bắt buộc xác định **Lớp nền thực tế (Effective Background)** của Card/Modal thay vì giả định nền trắng tổng thể, tránh việc cảnh báo nhầm (false positives).
