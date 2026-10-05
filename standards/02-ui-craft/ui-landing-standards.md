# 🚀 TIÊU CHUẨN THIẾT KẾ TRANG ĐÍCH CHUYỂN ĐỔI CAO (CRO LANDING PAGE)
## HIGH-CONVERSION LANDING PAGE UI/UX SPECIFICATIONS (LEVEL 1)

> **Tài liệu chuẩn hóa chuyên sâu**: Thiết kế trang đích quảng bá sản phẩm, định hình thương hiệu và tối ưu hóa tỷ lệ chuyển đổi (CRO).  
> **Tham chiếu chuẩn mực**: Vercel Micro-Design, Anthropic Anti-AI-Slop, 2026 CRO Research (Radical Clarity & 5-Second Rule).

---

## 🏛️ TRIẾT LÝ: ĐỘC BẢN THỊ GIÁC & TỶ LỆ CHÚ Ý 1:1 (RADICAL CLARITY)
Landing Page có sứ mệnh thuyết phục khách hàng trong **5 giây đầu tiên**. Một trang đích xuất sắc phải có **Attention Ratio = 1:1** (1 mục tiêu duy nhất, 1 hành động chuyển đổi duy nhất, triệt tiêu mọi liên kết điều hướng ngoài lề làm phân tâm).

```text
                     4 TRỤ CỘT THẨM MỸ LANDING PAGE CRO
                                     │
     ┌──────────────────┬────────────┴───────┬──────────────────┐
     ▼                  ▼                    ▼                  ▼
1. QUY TẮC 5 GIÂY    2. CẤU TRÚC 7 NẾP GẤP   3. KHOẢNG THỞ NGHỆ  4. VI MÔ VERCEL
  & HERO PROMINENCE    TÂM LÝ CHUYỂN ĐỔI      THUẬT (BREATHING)   & ĐỘC BẢN THỊ GIÁC
```

---

## ⏱️ 1. QUY TẮC 5 GIÂY & VÙNG NỔI BẬT ĐẦU TRANG (ABOVE-THE-FOLD)

Vùng $600\text{px}$ đầu tiên trên màn hình quyết định việc khách hàng ở lại hay rời đi:
1. **Tiêu Đề Trọng Tâm Kết Quả (Outcome-Focused Headline)**:
   * Tập trung vào lợi ích tối thượng của khách hàng, sử dụng `text-wrap: balance` để ngắt dòng đối xứng.
2. **Nút Kêu Gọi Hành Động Độc Tôn (Primary CTA Dominance)**:
   * Phải là phần tử nổi bật nhất trên trang (nhìn thấy ngay khi nheo mắt). Nổi bật gấp ít nhất **$3\text{ lần}$** so với nút phụ về màu sắc, độ tương phản hoặc hiệu ứng phát sáng biên (Glow shadow).
3. **Bằng Chứng Xã Hội Ngay Khi Chưa Cuộn (Above-the-fold Social Proof)**:
   * Đặt logo đối tác uy tín, điểm đánh giá 5 sao hoặc số lượng người dùng đang hoạt động ngay dưới nút CTA.

---

## 🔄 2. CẤU TRÚC 7 NẾP GẤP CHUYỂN ĐỔI (THE 7-FOLD CRO FUNNEL)

Bố cục trang phải dẫn dắt tâm lý người xem theo nhịp điệu logic:
1. **Nếp gấp 1 (Hero Hook)**: Móc câu thị giác, tuyên ngôn giá trị cốt lõi và nút CTA chính.
2. **Nếp gấp 2 (Social Proof 1)**: Dải logo các đối tác uy tín hoặc số liệu thống kê chứng minh năng lực.
3. **Nếp gấp 3 (Nỗi Đau & Giải Pháp - Problem/Solution)**: Đối chiếu tình trạng bế tắc cũ vs Trải nghiệm đột phá mới.
4. **Nếp gấp 4 (Interactive Showcase)**: Khung trình diễn sản phẩm trực quan, chiều sâu phân lớp kính mờ (Dark Glassmorphism).
5. **Nếp gấp 5 (Testimonials / Social Proof 2)**: Trích dẫn cảm nghĩ thực tế của khách hàng tiêu biểu kèm avatar và chức danh.
6. **Nếp gấp 6 (Câu Hỏi Thường Gặp - FAQ)**: Đập tan mọi mối hoài nghi cuối cùng trước khi quyết định chi tiền.
7. **Nếp gấp 7 (Final CTA Hook)**: Nút kêu gọi hành động chốt hạ, cam kết không rủi ro (vd: "Không cần thẻ tín dụng", "Dùng thử miễn phí 14 ngày").

---

## 🌌 3. KHOẢNG THỞ NGHỆ THUẬT (GENEROUS SECTION BREATHING ROOM)

* Khoảng cách giữa các Section trên Landing Page phải rộng rãi từ **`96px - 160px`** (trên Desktop) và **`64px - 96px`** (trên Mobile) để dẫn dắt nhịp đọc thoải mái, không dồn cục thông tin.
* Sử dụng bố cục **1 Cột trọng tâm (Single-Column Stack)** để dẫn hướng mắt cuộn dọc tự nhiên, giảm tải nhận thức.

---

## 🎨 4. NGHỆ THUẬT VI MÔ VERCEL & CHỐNG AI-SLOP

1. **Hiệu Ứng Bề Mặt & Ánh Sáng Phân Lớp (Depth & Glow)**:
   * Tận dụng viền phát sáng biên (`box-shadow: 0 0 25px -5px var(--accent-glow)`).
   * Kính mờ phủ lớp chống chói (`backdrop-blur-md bg-white/[0.03] border border-white/10`).
2. **Chi Tiết Vi Mô Hoàn Hảo**:
   * Tiêu đề ngắt dòng cân đối (`text-wrap: balance`).
   * Các số liệu thống kê dùng `font-variant-numeric: tabular-nums`.
   * Khoảng cách giữa số và đơn vị dùng `&nbsp;` (vd: `99.9%&nbsp;Uptime`).
3. **Tính Độc Bản Tuyệt Đối**:
   * Mỗi trang đích sở hữu riêng một bảng mã màu từ `tokens.json`, tuyệt đối không dùng rập khuôn màu kem đất sét của AI-slop.
