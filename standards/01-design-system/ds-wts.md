# 🖥️ TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO WTS (WEB WORKSTATION)
## WEB TRADING WORKSTATION COMPONENT & TOKEN SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: Web Trading Workstations & Desktop Trading Terminals (`MAPS-W-Design`).  
> **Thư viện SSOT**: `[WTS] MASHK - Design System` (`pRQ696tFkuavjCx7yXVVyL`) và Core Tokens `[Core] MASHK - Design System` (`eMKJHnzrG8RGinpNNSXXiB`).  
> **Nguồn đối chiếu kỹ thuật**: `foundations/ds/ds-registry.json` và `token-architecture.md`.  
> **Ngưỡng Component Adoption bắt buộc**: $\ge 95\%$. Điểm nghiệm thu đạt: $\ge 90/100$.

---

## 🧩 1. QUY CHUẨN MASTER COMPONENTS THẬT THEO REGISTRY

Mọi phần tử trên giao diện WTS bắt buộc phải ánh xạ hoặc kế thừa từ thư viện linh kiện chuẩn `[WTS] MASHK - Design System`. Một instance được xác nhận là chuẩn khi khóa (key 40 hex) của main component hoặc component set chứa nó có mặt trong `ds-registry.json`.

Registry hiện có 2.748 component xuất bản (trong đó 2.554 icon); các linh kiện giao diện nghiệp vụ phân bố theo các nhóm trang:

### 1.1. Bảng Nhóm Trang & Master Components Tiêu Biểu Trong Registry

| Nhóm chức năng | Trang trong file DS | Master Components tiêu biểu trong Registry |
| :--- | :--- | :--- |
| **Bảng dữ liệu (Data Grid)** | `14. Table` | `Table`, `Building-Blocks/table-cell`, `Building Blocks/table-cell 1/header/sort` |
| **Danh sách & Dòng dữ liệu** | `10. Item-list` | `Item-list`, `List-item/Data-row`, `List-item/Order-book`, `List-item/Position`, `List-item/Trade-log`, `List-item/Stock-list`, `List-item/Cash-history` |
| **Báo giá & Sổ lệnh** | `9. Quote` | `Quote-item`, `Quote-combo`, `Currency` |
| **Biểu đồ tài chính** | `5. Chart` | `Chart`, `Chart/CandleStick`, `Chart/Line`, `Chart/Heatmap`, `Chart/Analysis`, `Chart/Profit-Loss-Analysis`, `chart-price-tooltip` |
| **Nhập lệnh & Điều khiển số** | `2.6. Number Input`, `20. Stepper` | `Number`, `Stepper`, `Stepper-combo`, `🔒 Atom-Stepper/Indicator` |
| **Hành động & Nút bấm** | `1.3. Button`, `1.4. Button bar`, `1.1. Icon-button` | `Button`, `Button-bar` |
| **Biểu mẫu & Lựa chọn** | `2.1. Text Input`, `2.2. Text Area`, `2.3. Date Input`, `2.4. Calendar`, `2.5. Search Input`, `2.7. Select List`, `2.8. Select Input`, `2.15. Input-Group` | `Text-Input`, `Text-input`, `Text-Area`, `Select-Input`, `Select-list`, `Calendar`, `Date-Input`, `Search-Input`, `Input-Group` |
| **Điều hướng & Phân vùng** | `11. Navigation-bar`, `15. Tabs`, `12. Pagination`, `6. Chip` | `Header`, `Breadcrumbs`, `navigation-bar`, `Tabs`, `Tab-single-unit`, `Pagination_long`, `Pagination_dot`, `Chip` |
| **Hộp thoại & Lớp phủ** | `7. Dialog`, `17. Tooltip`, `18. Toast`, `1. Scrim`, `2. Banner` | `Dialog`, `tooltip`, `Toast`, `Scrim`, `banner` |
| **Nền tảng & Phân tách** | `13. Surface`, `8. Divider`, `6. Scroll-bar`, `1. Loading`, `3. Avatar&Logo` | `Divider`, `Building Blocks/divider`, `scroll-bar`, `Loading`, `Avatar&Logo` |

### 1.2. Cách Đo Tỷ Lệ Sử Dụng Component (Component Adoption Rate)
* **Công thức đo**: Tính trên layer hiển thị (leaf nodes):
  $$\text{Tỷ lệ Adoption} = \frac{\text{Số leaf nằm trong instance chuẩn}}{\text{Tổng số leaf của màn hình}} \times 100\%$$
* Leaf là layer không có con (chữ, hình, vector). Frame bố cục không có con hiển thị cũng được tính là leaf.
* **Ngưỡng chặn cứng**: Tối thiểu **$95\%$**. Nếu tỷ lệ $< 95\%$, màn hình tự động bị **REJECT (FAIL)** trừ khi designer đã có khối giải trình hợp lệ `[COMPONENT_EXCEPTION_JUSTIFICATION]` (ví dụ vùng biểu đồ nến phức tạp vẽ bằng canvas/webgl); khi đó auditor loại đúng vùng được giải trình, tính lại bằng tay và ghi rõ phép tính.
* **Quy tắc chống Detach**: Nghiêm cấm detach component thành frame thường. Frame vẽ tay mang đúng tên một Master Component của DS (không tính icon) sẽ bị auditor mở node kiểm tra và đánh rớt.
* Instance của component local trong file thiết kế, hoặc lấy từ thư viện ngoài không thuộc `ds-registry.json`, không được tính là chuẩn.

---

## 🎨 2. QUY CHUẨN TOKEN ARCHITECTURE CHO WTS

Hệ thống token tuân thủ nghiêm ngặt mô hình phân tầng giữa Core Tokens (`[Core] MASHK - Design System`) và WTS Platform Tokens (`[WTS] MASHK - Design System`):

### 2.1. Cấu Trúc Collections Hợp Lệ
1. **Từ file Core (`eMKJHnzrG8RGinpNNSXXiB`)**:
   - `Root tokens` (Tầng 1 - Palette Primitives, 126 variables): Thang màu cơ sở (`Neutral`, `Primary`, `Red`, `Green`, `Blue`, `Alpha`,...).
   - `Component tokens` (Tầng 3 - Component-specific, 334 variables): Token chuyên biệt cho component ở cả 2 theme `Light` và `Dark`.
   - `Padding-Spacing-Radius` (Tầng 1 - Kích thước hình học, 35 variables): Thang Spacing `s0`..`s40`, Padding `P0`..`P60`, Radius `R0`..`R100`.
   - `Typography` (Tầng 1 - Kiểu chữ cơ sở, 30 variables): Thang kiểu chữ nền tảng.
   - `Semantic` (Tầng 2 - Ngữ cảnh thị trường, 26 variables): Màu biến động thị trường `marketUp`, `marketDown` với 2 mode `Global` và `China`.
2. **Từ file WTS (`pRQ696tFkuavjCx7yXVVyL`)**:
   - `Component tokens` (Tầng 3 mở rộng WTS, 39 variables): Token tương tác chuột/hover trên Web Desktop (`Light`, `Dark`).
   - `Semantic padding - spacing` (Tầng 2 - Bố cục responsive, 13 variables): Khoảng lề/đệm theo breakpoint (`1920x`, `1440x`, `Ipad - 834x`).
   - `Padding` (Tầng 1 - Kích thước riêng WTS, 2 variables): `P48` (48px) và `P208` (208px).

### 2.2. Quy Tắc Gắn Token Purity
* **Màu sắc (Fills & Strokes)**:
  - 100% layer solid do designer tự vẽ (fill và stroke) bắt buộc phải gắn Variable hoặc Color Style của thư viện. Còn bất kỳ mã màu hex trần nào (Raw Hex) là điều kiện chặn cứng (REJECT).
  - Màu bắt buộc lấy từ collection `Component tokens` hoặc `Semantic`.
  - **Cấm gắn trực tiếp vào `Root tokens` (Tầng 1)** (ví dụ gắn thẳng `Neutral/900`) vì màu sẽ không tự động chuyển đổi giữa Light và Dark theme.
  - Màu tăng/giảm thị trường bắt buộc lấy từ collection `Semantic` (2 mode `Global` và `China`, kích hoạt qua thuộc tính `[data-market="cn"]`), tuyệt đối không tự chọn tay màu xanh/đỏ.
* **Khoảng cách (Spacing & Padding)**:
  - Bắt buộc gắn Variable hoặc thuộc thang kích thước chuẩn: `0, 2, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 48, 60` (các token `s0` đến `s40`, `P48`, `P208`).
* **Bo góc (Radius)**:
  - Bắt buộc gắn Variable hoặc thuộc thang chuẩn: `R0`, `R4`, `R8`, `R12`, `R16`, `R20`, `R24`, `R28`, `R36`, `R100`.
* **Khoảng lề Responsive**:
  - Khoảng lề theo breakpoint bắt buộc lấy từ collection `Semantic padding - spacing` của file WTS (mode `1920x` cho màn hình $\ge 1600\text{px}$, mode `1440x` cho màn hình $1200\text{px}\text{--}1599\text{px}$).

---

## 📐 3. BỘ QUY CHUẨN KIỂM ĐỊNH WTS DESKTOP

1. **Viewport & Container Compliance**:
   - Màn hình thiết kế bắt buộc nằm trong các khổ chuẩn: $1440\text{px}$ (Laptop), $1600\text{px}$ (Trader Display), $1920\text{px}$ (Ultra-wide) hoặc `Fluid 100%`.
   - **Tự động Rớt (0đ)**: Nếu màn hình WTS bị ép về khổ hẹp mobile ($375\text{px}$ hoặc $\le 450\text{px}$). Khổ khác (modal, drawer, component) thì auditor phải ghi rõ loại đối tượng.
2. **Typography Binding & Tabular Numbers (`tnum`)**:
   - 100% layer chữ do designer tự đặt bắt buộc phải gắn Text Style của Design System (`textStyleId !== ""`). Thư viện registry có 37 text style chuẩn: 32 style font `Hando` và 5 style font `Inter`.
   - **Quy tắc Font**: Font thương hiệu là `Hando`. Layer chữ dùng font `Inter` chỉ bị coi là vi phạm khi **không gắn style của DS** (rò rỉ font cũ chưa chuẩn hóa).
   - Thang cỡ chữ hợp lệ theo style: `8, 10, 12, 14, 16, 18, 20, 22, 24, 25, 28, 32`.
   - Toàn bộ số liệu tài chính (thị giá, khối lượng, lãi lỗ %, số dư) bắt buộc kích hoạt `font-variant-numeric: tabular-nums` / `font-feature-settings: "tnum" 1`.
3. **Chiều Cao Dòng Bảng Dữ Liệu (Table Row Heights)**:
   - Hàng bảng dữ liệu tài chính hỗ trợ 3 mức chuẩn: **`28px`** (Compact), **`36px`** (Regular/Standard), hoặc **`48px`** (Relaxed).
4. **Desktop Radius & Cấm Mobile Bottom Sheets**:
   - Hộp thoại Modal/Dialog bắt buộc dùng component từ trang `7. Dialog`, bo góc `R12` hoặc `R16`.
   - **Cấm Tuyệt Đối**: Cấm dùng Bottom Sheet bo góc lớn `R28` của di động trên giao diện WTS Desktop.
5. **Spacing & Margin Compliance**:
   - Lề trang ngoài tối thiểu $24\text{px}\text{--}48\text{px}$ (theo hệ lưới 8pt). Tuyệt đối không áp lề $16\text{px}$ của Mobile lên giao diện Web Desktop.
6. **Quy ước đặt tên Layer**:
   - Tên layer component theo cấu trúc: `[Category]/[Component]/[Variant]/[State]`. Frame bố cục đặt tên theo vai trò chức năng, không để tên mặc định vô nghĩa như `Frame 12`.

---

## 🔍 4. GIỚI HẠN CỦA PHÉP ĐO (AUDIT BOUNDARY)

* **Giới hạn Registry**: Registry là ảnh chụp tại thời điểm ghi trong `meta.scannedAt`. Component mới thêm vào thư viện sau thời điểm đó sẽ bị tính là "không thuộc WTS DS". Khi gặp trường hợp này, auditor nêu tên component trong mục "Chưa kiểm được" và báo người giữ kho quét lại registry; không tự ý coi là đạt.
* **Layer trong Instance**: Layer nằm trong instance là trách nhiệm của Design System nên script không soi sâu từng vector con; override màu trong instance thì auditor soi bằng mắt trên ảnh chụp và mở node kiểm tra khi nghi ngờ.
