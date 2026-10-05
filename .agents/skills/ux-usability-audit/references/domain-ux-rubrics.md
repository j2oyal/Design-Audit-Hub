# 🧠 THANG ĐIỂM CHUYÊN SÂU UX & USABILITY THEO 4 LĨNH VỰC (DOMAIN RUBRICS)

Thang điểm 100 điểm áp dụng riêng biệt cho từng hình thái sản phẩm:

---

## 1. 📱 HỒ SƠ MTS (MOBILE TRADING APP) — THANG 100
* **Trụ cột 1: Công thái học Thumb Zone ($y \ge 527\text{px}$)** — **30 điểm**:
  * $100\%$ các hành động cốt lõi (Mua/Bán, Keypad, Confirm) nằm ở $1/3$ dưới màn hình.
  * Không có nguy cơ va chạm bàn phím ảo (khoảng cách đẩy form $\ge 280\text{px}$).
* **Trụ cột 2: Vùng Chạm An Toàn ($\ge 44 \times 44\text{px}$)** — **25 điểm**:
  * Toàn bộ nút bấm, Stepper tăng giảm giá đạt chuẩn Apple HIG.
  * Khoảng cách giữa nút Mua và Bán $\ge 12\text{px}$.
* **Trụ cột 3: Ma Sát Luồng & Taps-to-Trade** — **25 điểm**:
  * Tối đa 3 bước chạm để hoàn tất một lệnh giao dịch.
  * Giá điền sẵn thông minh (Smart Defaults), chip chọn nhanh % sức mua hoạt động mượt mà.
* **Trụ cột 4: Poka-Yoke & Phục Hồi Lỗi** — **20 điểm**:
  * Slide to confirm hoặc xác nhận 2 bước cho lệnh lớn.
  * Áp dụng mẫu Non-disabled CTA kèm thông điệp hỗ trợ.
* 👉 **Ngưỡng Đạt**: $\ge 90/100$ điểm.

---

## 2. 🖥️ HỒ SƠ WTS (WEB TRADING WORKSTATION) — THANG 100
* **Trụ cột 1: Bàn Phím Là Vua (Keyboard-First $90\%+$)** — **30 điểm**:
  * Hỗ trợ đầy đủ phím tắt: `[F1]` Mua, `[F2]` Bán, `[Esc]` Hủy, `[Space]` Đóng vị thế.
  * Huy hiệu phím tắt (Hotkey badges) hiển thị trực quan trên giao diện.
* **Trụ cột 2: Lưu Trữ Cấu Hình (Workspace Persistence)** — **25 điểm**:
  * Ghi nhớ $100\%$ vị trí các bảng và widget sau khi F5 tải lại trang.
* **Trụ cột 3: Quản Lý Phân Tâm Thị Giác (Visual Noise Control)** — **25 điểm**:
  * Bố cục kéo thả linh hoạt (Split-pane) không bị nhảy giật khung khi co giãn.
* **Trụ cột 4: Phản Hồi Trạng Thái Khớp Lệnh Tức Thì** — **20 điểm**:
  * Hiệu ứng chớp giá khớp đúng $300\text{ms}$; cảnh báo trượt giá/thay đổi trạng thái lệnh dưới $100\text{ms}$.
* 👉 **Ngưỡng Đạt**: $\ge 88/100$ điểm.

---

## 3. 🏢 HỒ SƠ ADMIN BACKOFFICE — THANG 100
* **Trụ cột 1: Ma Sát An Toàn Tác Vụ Phá Hủy (Destructive Safety)** — **35 điểm**:
  * Modal cảnh báo 2 bước + Bắt buộc gõ lý do cho các hành động xóa/khóa/force-sell.
* **Trụ cột 2: Hiệu Suất Thao Tác Hàng Loạt (Bulk Operations)** — **25 điểm**:
  * Chọn nhiều dòng qua các trang, thanh tác vụ nổi xuất hiện tức thì.
* **Trụ cột 3: Duy Trì Bộ Lọc Khi Điều Hướng (State Persistence)** — **20 điểm**:
  * Bấm Back không bị mất dữ liệu tìm kiếm và trang hiện tại.
* **Trụ cột 4: Skeleton Loading & Empty State Guidance** — **20 điểm**:
  * Hướng dẫn giải pháp rõ ràng khi danh sách dữ liệu rỗng.
* 👉 **Ngưỡng Đạt**: $\ge 85/100$ điểm.

---

## 4. 🚀 HỒ SƠ LANDING PAGE CRO — THANG 100
* **Trụ cột 1: Tỷ Lệ Chú Ý 1:1 (Attention Ratio)** — **30 điểm**:
  * Triệt tiêu $100\%$ các link điều hướng ngoài lề làm rò rỉ chuyển đổi.
* **Trụ cột 2: Quy Tắc 5 Giây (Above-the-fold Clarity)** — **25 điểm**:
  * Nhận biết ngay lợi ích sản phẩm và nút Primary CTA trong $600\text{px}$ đầu tiên.
* **Trụ cột 3: Cấu Trúc 7 Nếp Gấp Chuyển Đổi Tâm Lý** — **25 điểm**:
  * Hook ──▶ Proof ──▶ Solution ──▶ Showcase ──▶ Testimonials ──▶ FAQ ──▶ Final CTA.
* **Trụ cột 4: Triệt Tiêu Ma Sát Biểu Mẫu (Form Micro-Friction)** — **20 điểm**:
  * Form đăng ký $\le 3$ trường; Microcopy tập trung vào quyền lợi của khách hàng.
* 👉 **Ngưỡng Đạt**: $\ge 85/100$ điểm.
