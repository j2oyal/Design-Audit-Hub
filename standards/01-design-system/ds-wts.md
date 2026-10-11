# 🖥️ TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO WTS (WEB WORKSTATION)
## WEB TRADING WORKSTATION COMPONENT SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: Web Trading Workstations & Desktop Trading Terminals.

---

## 🧩 1. DANH MỤC MASTER COMPONENTS BẮT BUỘC DÙNG
Mọi phần tử trên giao diện WTS bắt buộc phải ánh xạ hoặc kế thừa từ thư viện linh kiện Web chuẩn:
1. **`wts-data-table` / `WTS-HighDensity-Table`**: Bảng dữ liệu tài chính hỗ trợ 3 mật độ (Compact 28px, Regular 36px, Relaxed 48px), sticky header, ghim cột (`Sticky Col`), đổi cỡ chữ nhanh và căn lề số học.
2. **`wts-split-pane` / `WTS-Split-Workspace`**: Bộ chia màn hình Two-Pane & Three-Pane kéo thả (CSS Split Grid) cuộn độc lập với đường kẻ phân cách 1px, lưu trạng thái layout vào `localStorage`.
3. **`wts-order-entry-pad`**: Bàn đặt lệnh Desktop tích hợp stepper giá theo Tick size, phím tắt nhanh và dải % sức mua.
4. **`wts-depth-ladder` / `WTS-OrderBook-Ladder`**: Sổ lệnh độ sâu L2 hiển thị 10 bước giá Bid/Ask tích hợp thanh nhiệt thanh khoản (depth volume bars).
5. **`wts-global-header`**: Thanh điều hướng đỉnh cao 48px, Market Status Badges, tìm kiếm `Cmd+K`.
6. **`wts-modal-and-drawer`**: Hộp thoại Desktop bo góc `R12/R16`, backdrop blur, phím `Esc` và Flyout drawer.
7. **`WTS-Hotkey-Badge`**: Nhãn chỉ dẫn phím tắt gắn trên góc các nút bấm (`[F1]`, `[F2]`, `[Esc]`, `[Space]`).
8. **`WTS-Status-Bar`**: Dòng trạng thái ở đáy màn hình hiển thị ping latency (ms), kết nối WebSocket, và thời gian thị trường Sở (Market Clock).

---

## 🎨 2. QUY CHUẨN TOKEN RIÊNG CHO WTS
* `table-row-compact`: `--wts-row-height: 28px`.
* `table-row-regular`: `--wts-row-height: 36px`.
* `table-row-relaxed`: `--wts-row-height: 48px`.
* `border-panel-hairline`: `--wts-border-hairline: 1px solid rgba(255, 255, 255, 0.08)`.
* `depth-bid-bg`: `--wts-depth-bid-color: rgba(16, 185, 129, 0.15)`.
* `depth-ask-bg`: `--wts-depth-ask-color: rgba(239, 68, 68, 0.15)`.
* **Token Purity**: Fills và Strokes bắt buộc liên kết với bộ Token WTS (`var(--wts-bg-app)`, `var(--wts-bg-surface-01)`, `var(--wts-border-subtle)`). Cấm dùng mã màu hex thô không qua token.

---

## 📐 3. BỘ QUY CHUẨN KIỂM ĐỊNH WTS DESKTOP
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
