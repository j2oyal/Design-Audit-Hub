# 🏛️ 7 Trụ Cột Kỹ Thuật Thép Design System ([MTS] MASHK)

Tài liệu này đặc tả chi tiết 7 Trụ Cột Kỹ Thuật Thép dùng để thanh tra, thẩm định chuyên sâu toàn bộ các màn hình thiết kế trên Figma cho dự án `[MTS] MASHK` & `[Core] MASHK`.

---

## 🏛️ Trụ Cột 1: Componentization & Bộ 3 Linh Kiện Cốt Lõi (Trio Engine)

1. **Quét Plain Frame Đội Lốt Component**:
   - Tìm các node `type === 'FRAME'` không có tiền tố ID `I` (không phải remote instance) nhưng được đặt tên là `Button`, `Icon-box`, `Tab`, `Tag`, `Badge`, `Card`, `Table`...
   - Bắt buộc thay thế bằng các master components chính thống từ thư viện `[MTS] MASHK - Design System`:
     - Trang `1. Action` $\to$ `1.1. Icon-button`, `1.2. Icon-box`, `1.3. Button`.
     - Trang `20. Tabs` $\to$ `Tabs`, `Tab-single-unit`.
     - Trang `13. Item-list` $\to$ `Item-list`, `List-item/Stock-list`.
2. **Bắt Lỗi Bỏ Qua Bộ 3 Linh Kiện Cốt Lõi (Bypassing Trio Components)**:
   - **Linh kiện 1: Tên mã, Giá, % thay đổi**: Bắt buộc dùng component **`Quote` / `Quote-item` / `Quote-combo`**. Cấm vẽ các text layer rời rạc để hiển thị giá và ticker.
   - **Linh kiện 2: Tiêu đề phân đoạn (Section Heading)**: Bắt buộc dùng component **`Text-section`** (có vạch xanh thương hiệu mép trái). Cấm dùng raw text layer `Heading`.
   - **Linh kiện 3: Khung danh sách lặp lại**: Bắt buộc bọc qua component **`Item-list`** (`fc905219f3ec1eee587fd62488a5c6665b6842f2`, các variant `Quantity=1..20`) và hoán đổi đúng 5 họ `List-item` nghiệp vụ. Cấm đặt các dòng dữ liệu tự do trong một frame tùy tiện.
3. **Phát Hiện Hack Component Swap & Slot Misuse**:
   - Ép cả thanh `Tabs` ngang vào slot vốn chỉ dành cho `Icon-button` đơn lẻ trong `Top-bar`.
   - Dùng component `progress-bar` (vốn là stepper onboarding) làm thanh Quota.

---

## 🎨 Trụ Cột 2: Token Architecture & Dual Theming (Dark/Light Mode Ready)

1. **Bắt Lỗi Chí Mạng Canvas Root Frame Chưa Bind Token (Vỡ Dark Mode)**:
   - Màn hình chính (`Frame 375x812`) **BẮT BUỘC PHẢI BIND BIẾN `surface/01`** (`#FFFFFF` Light / `#121418` Dark).
   - Nếu frame gốc mang màu trắng cứng `#FFFFFF` không bind token $\implies$ Gắn cờ **🔴 CRITICAL**: Khi chuyển Variable Mode sang Dark Mode, toàn bộ các thành phần con chuyển sang tối nhưng nền app vẫn trắng bóc, làm hỏng toàn bộ giao diện!
2. **Quét Fills & Strokes Cứng (Hardcoded Hex)**:
   - Quét toàn bộ các node hiển thị: background card, container, divider, border, text có màu HEX cứng (`#FFFFFF`, `#1E1E1E`, `#F42525`...) mà không có `boundVariables.fills`, `boundVariables.strokes`, `fillStyleId` hoặc `strokeStyleId`.
   - Bắt lỗi hardcode `opacity` (ví dụ `0.3`, `0.6`) thay vì bind vào token Surface Alpha hoặc Text Tertiary.
3. **Bộ Semantic Token Chuẩn**:
   - Mặt phẳng: `surface/01` đến `surface/05`.
   - Chữ viết: `text/primary`, `text/secondary`, `text/tertiary`, `text/disabled`.
   - Viền kẻ: `divider/solid-on-1-2`, `divider/solid-on-3-4-5`, `divider/screen-divider`.
   - Màu tài chính: `stock/increase`, `stock/decrease`.

---

## 🔤 Trụ Cột 3: Typography & Multi-DS Conflict (`Hando` Độc Tôn)

1. **Định Luật Độc Tôn Font `Hando`**:
   - Thư viện hiện hành của MASHK dùng font thương hiệu duy nhất: **`Hando`** (`Hando Bold`, `Hando Semi Bold`, `Hando Regular`).
   - Thư viện Core cũ hoặc style cũ dùng: **`Inter`**.
   - Bất kỳ text layer nào của giao diện UI đang hiển thị dính font `Inter` đều bị gắn cờ **🟠 HIGH** kèm Node ID cụ thể để migrate sang `Hando`.
   - *(Ngoại lệ duy nhất: Font native `SF Pro` trong component `Status-bar` của iOS).*
2. **Bắt Lỗi Gãy Text Style Do Inline Formatting**:
   - Khi một text layer có nhiều segments với style khác nhau (ví dụ chữ "Available " là Regular còn "36.270%" là SemiBold trong cùng 1 text node), thuộc tính `textStyleId` ở cấp node sẽ thành `figma.mixed` hoặc null. Cần chỉ rõ để designer nhận biết.
3. **Thang Đo Typography 8 Bậc Chuẩn Hóa**:
   - `Heading32` (32px / LH 48px), `H5` (24px / LH 32px), `H6` (20px / LH 28px), `Sub` (18px / LH 24px), `BodyL` (16px / LH 24px), `BodyM` (14px / LH 20px), `CaptionL` (12px / LH 16px), `CaptionS` (10px / LH 14px).
4. **Quy Chuẩn Định Dạng Số Thập Phân & Căn Thẳng Hàng (Quy Tắc 3 - 3 - 2)**:
   - **Thị Giá Cổ Phiếu / Index**: Cố định **3 chữ số thập phân** (`HK$ 513.000`, `385.200`, `15.000`, `0.125`). Đệm đủ 3 số 0, không bắt lỗi tick size nếu giá gốc hợp lệ.
   - **Khối Lượng (Volume K/M/B)**: Cố định **3 chữ số thập phân** (`11.650M`, `30.423K`, `1.250B`). Bắt lỗi nếu viết tắt `11.6M` hay `11.65M`.
   - **Giá Trị Giao Dịch / Thành Tiền / Vốn Hóa**: Cố định **2 chữ số thập phân** (`23.32M`, `130.43M`, `HK$ 7,700.00`). Bắt lỗi nếu ghi 3 số lẻ (`23.320M`).

---

## 📏 Trụ Cột 4: Thang Đo Khoảng Cách & Bội Số 4px (Spacing Drift)

1. **Nguyên Lý Bội Số 4px (The 4px Grid System)**:
   - Thang chuẩn: $\mathbf{[0px, 2px, 4px, 8px, 12px, 16px, 20px, 24px, 32px, 40px, 48px, 60px]}$.
   - Bắt mọi khoảng cách Auto-Layout mang giá trị lẻ do kéo chuột: `3px`, `5px`, `7px`, `9px`, `11px`, `13px`, `15px`, `17px`, `21px`, `25px`...
2. **Quy Chuẩn Lề Viewport & Vùng Nội Dung An Toàn**:
   - Mọi màn hình MASHK (Width `375px`) **bắt buộc có đệm lề trái/phải cố định là `16px`** (`paddingLeft = paddingRight = 16px`), tạo ra vùng nội dung an toàn **`Content Width = 343px`**.
3. **Đệm Đáy An Toàn `60px` (`P60`)**:
   - Bắt buộc chừa khoảng đệm an toàn `60px` ở đáy màn hình có chứa thanh nút cố định (`Button-bar` hoặc bottom navigation) để chống che khuất nội dung.
4. **Quy Tắc Seamless Container & Vật Cản UI**:
   - Khi Section chạm sát mép đáy Top-bar (`gap = 0px` cơ học) nhưng bên trong có `paddingTop >= 12px - 16px` $\implies$ Thiết kế **Seamless Container** hợp lệ, ghi nhận Pass.
   - Nhận diện `Divider 8px`, `Card`, `Filter Chips` là **Vật cản thị giác**, đo thành cặp nhịp đối xứng quanh Divider (`24px | [8px] | 24px`).

---

## 🔲 Trụ Cột 5: Bậc Thang Bo Góc Đồng Tâm (Concentric Radius Hierarchy)

1. **Bộ Thang Bo Góc 8 Bậc Chuẩn Mực MASHK**:
   - `R0` (`0px`): Viewport Root, Thanh Divider.
   - `R4` (`4px`): Tag mini, Checkbox con, Tooltip.
   - `R8` (`8px`): Nút bấm nhỏ, Ô nhập liệu Text-Input, Badge vuông.
   - `R12` (`12px`): Thẻ Card danh mục trong Section, Nút bấm Large 48px.
   - `R16` (`16px`): Khung Card độc lập lớn, Hộp thoại Modal Dialog.
   - `R20` (`20px`): Container tổng hợp, Hero Banner.
   - **`R28` (`28px`)**: **ĐỘC QUYỀN MASHK — Khung trượt Bottom Sheet kéo từ đáy**.
   - `R100` (`9999px`): Pill Capsule (Badge viên nhộng, Drag handle, Tab Level 2).
2. **Bắt Lỗi Bo Góc Dị Biệt (Odd Radius Drift)**:
   - Gắn cờ các bo góc ngoài quy chuẩn: `3px`, `5px`, `6px`, `7px`, `9px`, `10px`, `14px`, `15px`, `18px`, `22px`...
3. **Bắt Lỗi Vi Phạm Bo Góc Bottom Sheet**:
   - Bắt buộc gắn cờ nếu khung Bottom Sheet dùng bo góc `16px`, `20px` thay vì chuẩn thương hiệu **`28px`**.
4. **Định Luật Bo Góc Đồng Tâm Quang Học**:
   $$\mathbf{r_{\text{in}} \approx r_{\text{out}} - w_{\text{padding}}}$$
   - Khung ngoài bo `16px`, padding `12px` $\implies$ Phần tử con bên trong bắt buộc bo $\approx 4\text{px}$. Bắt lỗi nếu phần tử con bo $\ge 16\text{px}$ làm phình góc trong dị dạng.

---

## ➖ Trụ Cột 6: Quy Chuẩn Phân Tuyến & Đường Kẻ (Divider Hygiene)

1. **Bắt Lỗi Vẽ "Phân Tuyến Lậu" (Raw Rectangle Ban)**:
   - Cấm tự vẽ một Frame hoặc Rectangle cao `8px` hoặc `1px` rồi tô màu xám làm đường phân cách.
   - Toàn bộ đường kẻ bắt buộc sử dụng **Component Set `Divider` chính thống (13 biến thể, Key: `3dc68834e86994f2f6cec9f1cc4796028fcc5522`)**:
     - Ngăn cách 2 Section độc lập: Dùng **`screen divider` (Cao `8px`, Width `375px`)**.
     - Ngăn cách dòng trên Surface 01 & 02: Dùng **`solid-on-1-2` (Cao `1px`, Width `375px`)**.
     - Ngăn cách dòng bên trong Card / Bottom Sheet: Dùng **`solid-on-3-4-5` (Cao `1px`)**.
     - Vết xé hóa đơn: Dùng **`dash-on-1-2` / `dash-on-3-4-5`**.
2. **Bắt Lỗi Divider Chèn Sai Vị Trí (Disruption Drift)**:
   - Cấm chèn `Divider 8px` giữa thanh `Tabs` và `Table-header` (tạo khoảng đứt gãy thị giác vô lý).

---

## 🧹 Trụ Cột 7: Vệ Sinh UI Kit & Dọn Rác Placeholder (Placeholder Cleanup)

1. **Quét Rác Placeholder Của Master Component**:
   - Quét và cắm cờ các chuỗi text mặc định còn sót lại: `"Title"`, `"Subtitle"`, `"Header"`, `"Label"`, `"Placeholder"`, `"Item"`, `"Description"`, `"Lorem ipsum..."`, `"Text"`, `"Button"`, `"--"`, `"..."`, `"N/A"`, `"0000"`.
2. **Dữ Liệu Mockup Copy-Paste Lặp Lại Thô Thiển (Cloned Visual Noise)**:
   - Toàn bộ 5–6 dòng dữ liệu trong một bảng danh sách lặp lại 100% từng con số, mã cổ phiếu và tên doanh nghiệp.
