# 📐 TIÊU CHUẨN DESIGN SYSTEM & TOKEN TOÀN CẦU (LEVEL 0)
## UNIVERSAL DESIGN SYSTEM & TOKEN ARCHITECTURE STANDARDS

> **Tài liệu tham chiếu chuẩn hóa nền tảng cho GATE 1 (DS-Audit)**  
> **Phạm vi áp dụng**: BẮT BUỘC cho toàn bộ giao diện và mã nguồn frontend.

---

## 🏛️ 1. NGUYÊN TẮC CỐT LÕI BẤT KHẢ XÂM PHẠM

### 1.1. Luật Tỷ Lệ Tái Sử Dụng Component $\ge 95\%$
* Mọi giao diện (Figma layer hoặc mã HTML/JSX) bắt buộc phải sử dụng Master Components từ Design System.
* **Ngưỡng sàn**: $\text{Adoption Rate} \ge 95\%$.
* **Cơ chế**:
  * Dưới $95\%$ $\implies$ **TỰ ĐỘNG BÁC BỎ (REWORK_REQUIRED)**.
  * Chỉ chấp thuận ngoại lệ nếu có khối giải trình kỹ thuật rõ ràng:
    `[COMPONENT_EXCEPTION_JUSTIFICATION]: <Lý do kiến trúc / Nghiệp vụ đặc thù>`

### 1.2. Kỷ Luật Độ Sạch Token (Zero Raw Hex & Zero Detached Components)
* **Cấm 100% mã màu trôi nổi**: Nghiêm cấm xuất hiện `#1a2b3c`, `#ff0000`, `rgb(...)` trong class style hoặc inline-styles.
* **Cấm Detach Component trong Figma**: Tuyệt đối không được gỡ liên kết (detach) component thành các raw frame đơn lẻ.

---

## 🏗️ 2. KIẾN TRÚC TOKEN 3 TẦNG (3-TIER TOKEN HIERARCHY)

Mọi biến token bắt buộc phải tuân theo mô hình 3 tầng phân cấp:

```text
[TẦNG 1: GLOBAL / PRIMITIVE]  -->  [TẦNG 2: SEMANTIC / ALIAS]  -->  [TẦNG 3: COMPONENT SCOPED]
(blue-500, gray-900, 16px)        (color-brand-primary, bg-canvas)   (btn-primary-bg, table-row-h)
```

1. **Global Tokens (Primitive)**: Giá trị thô bất biến (`blue.500 = #3B82F6`, `space.16 = 16px`). Không dùng trực tiếp vào giao diện.
2. **Semantic Tokens (Alias)**: Gắn liền với ngữ nghĩa (`bg.surface.card`, `color.text.primary`, `color.status.danger`). Đây là tầng đổi màu chính khi chuyển Light/Dark mode.
3. **Component Tokens**: Gắn với từng phần tử cụ thể (`btn.primary.bg = var(--color-brand-primary)`).

---

## 🏷️ 3. QUY ƯỚC ĐẶT TÊN TOKEN CHUẨN (NAMING CONVENTION)

Cấu trúc tên biến token bắt buộc tuân theo:
$$\text{[category]-[property]-[variant]-[state]}$$

* *Ví dụ*:
  * `color-text-primary-hover`
  * `btn-primary-bg-active`
  * `input-border-danger-focus`
  * `table-row-height-compact`
