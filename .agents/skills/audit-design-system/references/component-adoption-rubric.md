# 📐 QUY CHUẨN ĐO LƯỜNG TỶ LỆ TÁI SỬ DỤNG COMPONENT (ADOPTION RATE RUBRIC)

## 1. CÔNG THỨC TÍNH TOÁN CHUẨN
Tỷ lệ sử dụng Master Component kế thừa từ Design System được tính toán theo công thức:

$$\text{Component Adoption Rate (\%)} = \left( \frac{N_{\text{standard}}}{N_{\text{standard}} + N_{\text{detached}} + N_{\text{ad-hoc}}} \right) \times 100\%$$

* **$N_{\text{standard}}$**: Số lượng phần tử là Master Component Instances được liên kết từ thư viện chuẩn (hoặc component tags chuẩn trong code như `<Button>`, `<Badge>`, `<Modal>`, `<Table>`).
* **$N_{\text{detached}}$**: Số lượng component bị gỡ liên kết (Detach) thành raw frames trong Figma.
* **$N_{\text{ad-hoc}}$**: Số lượng phần tử tự chế thủ công (vd: `<div onclick="..." style="...">` tự vẽ nút bấm, thẻ bo góc tùy tiện mà không qua component).

---

## 2. NGƯỠNG PHÁN QUYẾT & HÀNH ĐỘNG
* **$\ge 95.0\%$**: **ĐẠT CHUẨN (PASS)**. Sản phẩm đảm bảo tính toàn vẹn của hệ thống thiết kế.
* **$< 95.0\%$**: **TỰ ĐỘNG BÁC BỎ (REWORK_REQUIRED)**.
  * Thư ký và Auditor tự động từ chối xuất xưởng, phát vé `TASK-xxx-REWORK.md`.
  * **Ngoại lệ duy nhất**: Bắt buộc phải có khối văn bản giải trình kỹ thuật cụ thể:
    ```markdown
    [COMPONENT_EXCEPTION_JUSTIFICATION]: <Lý do kỹ thuật / Kiến trúc đặc thù>
    ```
    *Ví dụ hợp lệ*: *"Sử dụng Canvas WebGL độc bản để vẽ biểu đồ tương tác 3D chưa có sẵn trong Design System."*
    *Ví dụ KHÔNG hợp lệ*: *"Designer tự vẽ nút mới cho đẹp hơn nút trong DS."* (Bị reject ngay lập tức).
