# 🏢 TIÊU CHUẨN UX DÀNH CHO ADMIN (BACKOFFICE OPERATIONS)
## ENTERPRISE ADMIN BACKOFFICE USABILITY SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 3 (UX-Audit)  
> **Dự án áp dụng**: Cổng Quản trị Vận hành & Middle Office.

---

## ⚡ 1. HIỆU SUẤT THAO TÁC HÀNG LOẠT (BULK OPERATIONS)
* Hỗ trợ chọn nhanh toàn bộ dòng trên trang hoặc toàn bộ dữ liệu lọc được (`Select All Across Pages`).
* Thanh tác vụ nổi (Floating Action Bar) xuất hiện ngay khi có ít nhất 1 dòng được chọn (cho phép Duyệt hàng loạt, Khóa hàng loạt, hoặc Xuất báo cáo).

---

## 🔍 2. DUY TRÌ BỘ LỌC KHI ĐIỀU HƯỚNG (FILTER STATE PERSISTENCE)
* Khi người dùng bấm vào xem chi tiết một User/Lệnh giao dịch rồi bấm nút "Quay lại" (Back): Bộ lọc tìm kiếm, phân trang và vị trí cuộn chuột phải được giữ nguyên vẹn, không được reset về trang 1.

---

## 🛡️ 3. MA TÁT AN TOÀN TRONG TÁC VỤ PHÁ HỦY (SAFETY FRICTION)
* Không được cho phép xóa dữ liệu quan trọng chỉ bằng 1 cú click chuột đơn giản.
* Bắt buộc có ma sát an toàn: Xác nhận 2 bước + Nhập lý do bằng chữ + Ghi nhận vết kiểm toán (Audit Trail) người thực hiện.
