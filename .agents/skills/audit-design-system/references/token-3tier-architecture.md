# 🏛️ QUY CHUẨN KIẾN TRÚC DESIGN TOKEN 3 TẦNG (3-TIER ARCHITECTURE)

## 1. MÔ HÌNH PHÂN CẤP TOKEN
Design Token là tế bào cốt lõi của Design System. Mọi biến token bắt buộc phải thuộc vào 1 trong 3 tầng:

```text
[TẦNG 1: PRIMITIVE TOKENS]   ──▶   [TẦNG 2: SEMANTIC ALIAS TOKENS]   ──▶   [TẦNG 3: COMPONENT TOKENS]
- Giá trị màu/thước đo thô         - Ngữ nghĩa theo ngữ cảnh              - Gắn chặt với phần tử UI
- Ví dụ: blue-500, gray-900        - Ví dụ: bg-surface, text-primary      - Ví dụ: btn-primary-bg
```

### 1.1. Tầng 1: Primitive Tokens (Global)
* Đại diện cho giá trị thô vật lý: `#3B82F6`, `#10B981`, `16px`, `8px`.
* **Quy tắc**: Tuyệt đối **KHÔNG dùng trực tiếp Primitive Tokens vào giao diện sản phẩm**. Nếu gán thẳng `blue-500` vào nút bấm, khi chuyển sang chủ đề khác (Theme đổi sang Tím hoặc Xanh lá) hệ thống sẽ bị gãy.

### 1.2. Tầng 2: Semantic Alias Tokens (Contextual)
* Đại diện cho ý nghĩa sử dụng:
  * `color.brand.primary`: Màu đại diện thương hiệu.
  * `color.status.success`: Màu trạng thái thành công/lãi.
  * `color.status.danger`: Màu trạng thái thất bại/lỗ.
  * `bg.surface.canvas`: Màu nền chính của ứng dụng.
  * `bg.surface.card`: Màu nền thẻ phân lớp.
* **Quy tắc**: Đây là tầng chịu trách nhiệm đổi màu khi chuyển đổi giữa **Light Mode** và **Dark Mode**.

### 1.3. Tầng 3: Component-Scoped Tokens
* Thuộc tính riêng của component: `btn.primary.bg`, `table.header.height`, `input.border.focus`.
* Kế thừa trực tiếp từ Tầng 2 (Semantic).

---

## 2. QUY CHUẨN ĐẶT TÊN TOKEN CHUẨN HÓA (NAMING SPEC)
$$\text{[Domain / Category]} - \text{[Element / Group]} - \text{[Property]} - \text{[Variant / State]}$$

* Hợp lệ:
  * `--color-text-primary`
  * `--color-border-card-hover`
  * `--space-padding-table-row`
  * `--radius-card-surface`
* Bất hợp lệ (Bị cắm cờ cảnh báo):
  * `--my-blue-color` (Thiếu ngữ nghĩa)
  * `--button-padding-custom` (Tự chế ngoài chuẩn)
