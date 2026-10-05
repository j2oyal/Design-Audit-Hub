# 🚀 TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO LANDING PAGE (CRO STUDIO)
## HIGH-CONVERSION LANDING PAGE COMPONENT SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: Landingpage-builder (Studio Engine & Project Capsules).

---

## 🏛️ 1. MÔ HÌNH CAPSULE TOKEN ISOLATION
* Mỗi trang đích là một viên nang độc lập trong `projects/<project-slug>/`.
* **Bắt buộc có file `tokens.json` riêng**: Định nghĩa bảng mã màu độc bản (Base, Surface, Border, Primary, Accent, Text) trước khi viết HTML.
* Tuyệt đối không gây ô nhiễm mã màu chéo sang các dự án khác.

---

## 🧩 2. DANH MỤC MASTER COMPONENTS TIÊU BIỂU
1. **`Landing-Hero-Section`**: Khung tiêu đề chính tích hợp Outcome Headline, Subhead, Primary CTA, và Above-the-fold Social Proof.
2. **`Landing-Social-Proof-Bar`**: Dải logo đối tác hoặc ticker số liệu chuyển động nhẹ nhàng (Marquee hoặc Grid tĩnh).
3. **`Landing-Interactive-Showcase`**: Khung viền kính mờ (Glassmorphism) chứa demo sản phẩm với hiệu ứng viền phát sáng (Glow border).
4. **`Landing-Pricing-Card`**: Thẻ bảng giá phân cấp (gói Pro/Most Popular nổi bật gấp $1.5\times$ so với gói thường).
5. **`Landing-FAQ-Accordion`**: Khung hỏi đáp co giãn mượt mà, icon `+`/`-` xoay chuyển động quang học.
