# 🖥️ TIÊU CHUẨN DESIGN SYSTEM CHUYÊN BIỆT CHO WTS WEB TRADING (GATE 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Áp dụng cho**: `MAPS-W-Design` / Hệ thống giao dịch Web Trading System (WTS) MASHK.  
> **Nguyên tắc**: Chuẩn hóa Web Native 100%, tỷ lệ sử dụng Component $\ge 95\%$, Viewport $1440/1600/1920\text{px}$, Font `Hando` số thẳng hàng (`tnum`), cấm áp dụng quy chuẩn Mobile (lề 16px, Bottom Sheet).

---

## 🧩 1. DANH MỤC MASTER COMPONENTS WTS BẮT BUỘC DÙNG
Mọi phần tử trên giao diện WTS bắt buộc phải ánh xạ hoặc kế thừa từ thư viện linh kiện Web chuẩn:
1. **`wts-data-table`**: Bảng dữ liệu tài chính hỗ trợ 3 mật độ (Compact 28px, Regular 36px, Relaxed 48px), sticky header.
2. **`wts-split-pane`**: Bộ chia màn hình Two-Pane & Three-Pane cuộn độc lập với đường kẻ phân cách $1\text{px}$.
3. **`wts-order-entry-pad`**: Bàn đặt lệnh Desktop tích hợp stepper giá theo Tick size, phím tắt nhanh và dải % sức mua.
4. **`wts-depth-ladder`**: Sổ lệnh độ sâu L2 tích hợp thanh nhiệt thanh khoản (depth bars).
5. **`wts-global-header`**: Thanh điều hướng đỉnh cao $48\text{px}$, Market Status Badges, tìm kiếm `Cmd+K`.
6. **`wts-modal-and-drawer`**: Hộp thoại Desktop bo góc `R12/R16`, backdrop blur, phím `Esc` và Flyout drawer.

---

## 🔒 2. BỘ CHỐT CHẶN BẤT BIẾN CHO WTS DESIGN SYSTEM
1. **Viewport & Container Compliance**:
   - Màn hình thiết kế bắt buộc nằm trong các khổ chuẩn: $1440\text{px}$ (Laptop), $1600\text{px}$ (Trader Display), $1920\text{px}$ (Ultra-wide) hoặc `Fluid 100%`.
   - **Tự động Rớt (0đ)**: Nếu màn hình WTS bị ép về khổ hẹp mobile ($375\text{px}$ hoặc $\le 450\text{px}$).
2. **Typography Binding & Tabular Numbers (`tnum`)**:
   - 100% layer chữ liên kết font `Hando`. Cấm tuyệt đối rò rỉ font `Inter`.
   - Toàn bộ số liệu tài chính (thị giá, khối lượng, lãi lỗ %, số dư) bắt buộc kích hoạt `font-feature-settings: "tnum" 1`.
3. **Desktop Radius & Zero Mobile Bottom Sheets**:
   - Hộp thoại Modal bo góc `R12` hoặc `R16`.
   - **Cấm Tuyệt Đối**: Cấm dùng Bottom Sheet bo góc lớn `R28` của di động trên giao diện WTS Desktop.
4. **Spacing & Margin Compliance**:
   - Lề trang ngoài tối thiểu $24\text{px}\text{--}48\text{px}$ (theo hệ lưới 8pt). Cấm bắt lỗi lề $16\text{px}$ của Mobile.
5. **Token Purity**:
   - Fills và Strokes bắt buộc liên kết với bộ Token WTS (`var(--wts-bg-app)`, `var(--wts-bg-surface-01)`, `var(--wts-border-subtle)`). Cấm dùng mã màu hex thô không qua token.
