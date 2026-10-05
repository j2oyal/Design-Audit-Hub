# 💎 BỘ QUY CHUẨN THẨM MỸ & NGHỆ THUẬT THỊ GIÁC TOÀN CẦU (LEVEL 0)
## UNIVERSAL UI/UX VISUAL CRAFT & AESTHETIC STANDARDS

> **Tài liệu tham chiếu chuẩn hóa nền tảng (Single Source of Truth - SSOT)**  
> **Phạm vi áp dụng**: BẮT BUỘC cho toàn bộ sản phẩm (MTS, WTS, Admin, Landing Page).

---

## 🏛️ TRIẾT LÝ: VẺ ĐẸP LÀ KẾT QUẢ CỦA TRẬT TỰ TOÁN HỌC
"Đẹp" trong kỹ nghệ phần mềm tài chính và công nghệ cao không phải là cảm tính cá nhân. Vẻ đẹp thị giác bắt nguồn từ **Trật tự Toán học (Mathematical Order)**, **Quy luật Tâm lý học Nhận thức (Cognitive Psychology)** và **Cân bằng Quang học (Optical Craftsmanship)**.

```text
                        ┌────────────────────────────────────────────────────────┐
                        │   TẦNG 0: BỘ QUY CHUẨN THẨM MỸ TOÀN CẦU (Tài liệu này) │
                        └───────────────────────────┬────────────────────────────┘
                                                    │ Thừa kế
                 ┌───────────────────┬──────────────┴─────┬───────────────────┐
                 ▼                   ▼                    ▼                   ▼
         [ui-mts-standards]  [ui-wts-standards]   [ui-admin-standards] [ui-landing-standards]
         (Mobile Trading)    (Web Workstation)    (Backoffice Ops)     (CRO Marketing)
```

---

## 📐 1. TOÁN HỌC TYPOGRAPHY (TYPOGRAPHIC MATH)

### 1.1. Thang Tỷ Lệ Cấp Số Nhân (Modular Scale)
Không bao giờ chọn cỡ chữ ngẫu nhiên. Mọi cỡ chữ phải tuân theo công thức cấp số nhân:
$$\text{Size}_n = \text{Base} \times r^n$$
* **Hệ thống Web & Editorial / Landing Page**: Áp dụng tỷ lệ **Major Third ($r = 1.250$)**.
* **Hệ thống Data-Dense (MTS, WTS, Admin)**: Áp dụng tỷ lệ **Minor Third ($r = 1.200$)** để bảo toàn mật độ thông tin.

### 1.2. Chiều Cao Dòng Quang Học (Optical Line-Height)
* **Chữ càng to, line-height càng thu hẹp**:
  * Display / Hero ($\ge 40\text{px}$): $1.05\times - 1.15\times$ (giữ khối chữ cô đọng).
  * Heading ($20\text{px} - 36\text{px}$): $1.20\times - 1.30\times$.
  * Body Text ($14\text{px} - 16\text{px}$): $1.45\times - 1.60\times$ (cho mắt khoảng nghỉ khi chuyển dòng).
  * Micro Data ($10\text{px} - 12\text{px}$): $1.30\times - 1.40\times$.

### 1.3. Tracking Nghịch Đảo (Inverted Letter-Spacing)
* Heading lớn ($> 32\text{px}$): Tracking âm **$-1\%$ đến $-0.5\%$** (tạo độ đanh thép, vững chãi).
* Body text ($14-16\text{px}$): Tracking trung tính **$0\%$**.
* All-caps / Nhãn phụ ($\le 11\text{px}$): Tracking dương **$+4\%$ đến $+8\%$** (chống dính nét).

### 1.4. Tabular Numbers Bắt Buộc
Mọi số liệu tài chính, số đếm, phần trăm, thời gian bắt buộc dùng:
```css
font-variant-numeric: tabular-nums;
font-feature-settings: "tnum";
```

---

## 🌌 2. NHỊP ĐIỆU KHÔNG GIAN & GESTALT PROXIMITY

### 2.1. Hệ Thống Lưới 4px / 8px Cơ Bản
$100\%$ các khoảng cách (Padding, Margin, Gap) bắt buộc là bội số của **`4px/8px`**:
$$\text{Spacing} \in \{2, 4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128, 160\}$$
* **Cấm số lẻ**: Tuyệt đối cấm các khoảng cách ngẫu nhiên `7px, 11px, 13px, 19px`.

### 2.2. Định Luật Khoảng Cách Gestalt (Law of Proximity)
Khoảng cách thể hiện mối quan hệ ngữ nghĩa:
$$S_{\text{outer}} \ge 2 \times S_{\text{inner}}$$
* Khoảng cách giữa 2 Card độc lập ($S_{\text{outer}}$) phải lớn gấp ít nhất $2\text{ lần}$ khoảng cách giữa tiêu đề và nội dung con bên trong Card ($S_{\text{inner}}$).

---

## 🔘 3. TOÁN HỌC BO GÓC ĐỒNG TÂM (CONCENTRIC RADIUS MATH)

Khi lồng Container bo góc con vào Container bo góc cha, bắt buộc tuân theo:
$$R_{\text{cha}} = R_{\text{con}} + \text{Padding}$$
* *Ví dụ*: Card cha có `padding: 16px`, nút con bên trong có `border-radius: 8px` $\implies$ Bo góc Card cha phải là $8 + 16 = \mathbf{24\text{px}}$.
* Nếu đặt $R_{\text{cha}} = R_{\text{con}} = 8\text{px}$, mắt người sẽ cảm thấy góc ngoài bị nhọn và góc trong bị lồi (Visual Pinching).

---

## 👁️ 4. TƯƠNG PHẢN WCAG 2.1 AA & CÂN BẰNG QUANG HỌC

1. **Tỷ Lệ Tương Phản Tối Thiểu**:
   * Text thông thường: Tối thiểu **$4.5:1$** so với nền.
   * Text kích thước lớn ($\ge 18\text{pt}$ hoặc $14\text{pt}$ bold): Tối thiểu **$3:1$**.
2. **Cân Bằng Quang Học Hình Học (Geometric Optical Balance)**:
   * Icon hình tròn nhìn có vẻ nhỏ hơn Icon hình vuông cùng kích thước $\implies$ Icon tròn cần tăng đường kính thêm $1\text{px} - 2\text{px}$ để tạo cảm giác cân bằng thị giác.

---

## 🚫 5. BỘ LỌC TIÊU DIỆT AI-SLOP (THE ANTI-SLOP MANIFESTO)

Tuyệt đối cấm 5 lỗi rập khuôn AI phổ biến:
1. ❌ **Bảng màu kem đất sét**: Nền kem vàng nhờ nhợt (`#F4F1EA`) đi cùng điểm nhấn màu đất nung (`#D97757`).
2. ❌ **Đen - Neon đơn điệu**: Nền đen tuyền với đúng 1 màu xanh neon chói gắt.
3. ❌ **Card SaaS rập khuôn**: Cắt vụn màn hình thành các card bo tròn đều tăm tắp với bóng xám đục `rgba(0,0,0,0.1)`.
4. ❌ **Spam ALL-CAPS & Mũi tên**: Gắn nhãn in hoa và ký hiệu `→` vô tội vạ vào mọi nút bấm.
5. ❌ **Thiếu bản sắc thương hiệu**: Giao diện chứng khoán chuyên nghiệp bị vẽ giống hệt giao diện bán trà sữa.

---

## 🔄 6. NGUYÊN TẮC ĐẦY ĐỦ 5 TRẠNG THÁI (5-STATE COMPLETENESS)
Nghiêm cấm chỉ thiết kế "Happy Path". Mọi component tương tác phải có đủ 5 trạng thái:
1. **Default**: Trạng thái nghỉ chuẩn mực.
2. **Hover**: Phản hồi xúc giác thị giác (độ sáng viền hoặc màu sắc tăng nhẹ 5-8%).
3. **Active / Focus**: Có vòng chỉ thị tiêu điểm (focus ring 2px) đạt chuẩn WCAG.
4. **Loading / Skeleton**: Hiệu ứng chuyển động mượt mà (shimmer/pulse), không giật layout.
5. **Empty / Error**: Minh họa nhẹ nhàng, thông điệp hướng dẫn rõ ràng giải pháp khắc phục.
