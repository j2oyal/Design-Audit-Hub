# 🏢 TIÊU CHUẨN DESIGN SYSTEM CHUYÊN BIỆT CHO ADMIN BACKOFFICE (GATE 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Áp dụng cho**: `Admin-Design` / Cổng Quản trị Vận hành & CMS MASHK.  
> **Nguyên tắc**: Zero-Tolerance đối với raw hex, cấm Detach component, kiểm toán đệ quy sâu từng cell của Data Grid (Anti-Monolithic-Wrapping).

---

## 🧩 1. DANH MỤC MASTER COMPONENTS ADMIN BẮT BUỘC DÙNG
Mọi phần tử trên màn hình Admin bắt buộc phải kế thừa trực tiếp từ thư viện Master Components:
1. **`Building-Blocks/table-cell`** (`Node ID: 3913:54247`): Đơn vị ô nguyên tử bắt buộc cho mọi bảng dữ liệu.
2. **`❖ Markets Overview Table`** (`Node ID: 25431:200305`): Bảng danh mục thị trường mẫu.
3. **`❖ Admin-Data-Grid (A11)`** (`Node ID: 25586:14686`): Khung bảng dữ liệu quản trị chuẩn.
4. **`Admin-Tabs / Segmented Control`** (`Node ID: 16137:26933`): Thanh chuyển tab danh mục.
5. **`Divider`** (`Node ID: 19839:0`): Đường kẻ phân cách sử dụng token `divider/solid-on-1-2`.
6. **`Select-Input`**, **`Button`**, **`Admin-Status-Badge`**: Các thành phần điều khiển chuẩn.

---

## 🔒 2. BỘ 7 CHỐT CHẶN BẤT BIẾN CHO DATA GRID (7 ZERO-DEFECT INVARIANTS)
Nghiêm cấm hành vi bọc một khối frame tự vẽ bên trong một vỏ wrapper giả vờ là component. Kiểm toán viên Gate 1 bắt buộc phải duyệt đệ quy sâu vào từng ô/dòng và kiểm tra đủ 7 điều kiện:

1. **Typography Binding (100%)**:
   - 100% layer chữ phải liên kết với `textStyleId` hợp lệ từ Design System (`textStyleId !== ""`).
   - CẤM gán `fontSize` thô vì sẽ làm đứt liên kết TextStyle.
2. **Table Row Sizing (FILL)**:
   - 100% các hàng của bảng (`Header Row`, `Row *`) phải mang `layoutSizingHorizontal = "FILL"`, `layoutAlign = "STRETCH"`.
3. **Zero Dead Space & Context-First Growth**:
   - Bắt buộc phải có 1 cột văn bản mang `layoutGrow = 1` và `layoutSizingHorizontal = "FILL"` để kéo dãn khít mép phải của bảng.
   - **ƯU TIÊN TUYỆT ĐỐI**: Cột mang dữ liệu ngữ cảnh quan trọng/dài nhất trong bảng (`Page Name`, `Content / Record`, `Banner Name`, `Campaign Name`, `Form Name`...) phải là cột mang `layoutGrow = 1`. Cột `ACTIONS` KHÔNG ĐƯỢC nuốt trọn layoutGrow mà chỉ giữ fixed/hug width vừa vặn (140px – 180px, `layoutGrow = 0`).
4. **Zero Double Border (Không viền đôi)**:
   - Header row phải có 0 stroke ngoài (`strokes = []`). Mọi đường kẻ phân cách bảng bắt buộc phải nằm bên trong instance cell hoặc dùng component `Divider`.
5. **Cell Whitelisting (100%)**:
   - 100% ô bảng phải là instance từ Master Component `Building-Blocks/table-cell` (`3913:54247`).
6. **Action Column & Title Alignment (BẮT BUỘC CĂN PHẢI - 100%)**:
   - Cột Action (cả Table Header `TH [ACTIONS]` lẫn toàn bộ ô dữ liệu `TD [ACTIONS]`) **BẮT BUỘC mang `primaryAxisAlignItems = "MAX"`**.
   - **Tiêu đề Table Header**: Text layer của chữ "ACTIONS" **BẮT BUỘC CĂN PHẢI (`textAlignHorizontal = "RIGHT"`)** để gióng thẳng hàng dọc 100% với các nút action bên dưới.
7. **Zero Text Collision & Overflow (Không tràn / Không đè lấn chữ)**:
   - CẤM nhồi nhét Badge trạng thái chung với nút hành động vào một ô hẹp (<160px) gây tràn khung và đè chữ lên cột bên cạnh (`ACTOR`). Ô bảng phải bật `clipsContent = true` và các phần tử con có padding tối thiểu 8px.

---

## 🎨 3. BẢNG TRA CỨU SEMANTIC TOKENS ADMIN
* **Nền Card**: `boundVariables.fills` liên kết với `surface/01`.
* **Nền Table Header**: `boundVariables.fills` liên kết với `surface/02`.
* **Đường kẻ / Viền**: Token `divider/solid-on-1-2` (`VariableID: a299887b6fb84d286b08b2bfc9951f3b42495b50/17369:129`).
* **Huy hiệu Semantic**:
  - `Active / Settled`: Green semantic badge.
  - `Pending / In Review`: Amber semantic badge.
  - `Suspended / Failed`: Red semantic badge.
  - `Draft / Inactive`: Slate gray semantic badge.

---

## 🛠️ 4. QUY CHUẨN BÀN GIAO KHẮC PHỤC HÀNH ĐỘNG ĐƯỢC (ACTIONABLE REMEDIATION)
Khi phát hiện vi phạm, Gate 1 Auditor **BẮT BUỘC CHỈ RÕ 3 YẾU TỐ**:
1. **Node ID & Tên phần tử vi phạm**: (Ví dụ: `Tabs Container Row` - `25504:46482`).
2. **Master Component tương ứng trong Thư viện**: (Ví dụ: `Admin-Tabs / Segmented Control` - `16137:26933`).
3. **Hướng dẫn ánh xạ thuộc tính (Props Mapping)**: Variant name, active state, icons để Maker thay thế ngay.
