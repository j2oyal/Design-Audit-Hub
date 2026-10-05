# 📱 TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO MTS (MOBILE TRADING)
## MOBILE TRADING SYSTEM COMPONENT SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: MTS Mobile Apps (MASHK Mobile Trading).

---

## 🧩 1. DANH MỤC MASTER COMPONENTS BẮT BUỘC DÙNG
Giao diện MTS bắt buộc phải kế thừa $100\%$ các Master Component sau từ Design System:

1. **`MTS-OrderPad-BottomSheet`**: Khung đặt lệnh trượt từ đáy màn hình lên, hỗ trợ 3 trạng thái: Collapsed (chỉ thấy nút), Half-expanded (form giá & KL), Full-expanded (kèm sổ lệnh).
2. **`MTS-Virtual-Keypad`**: Bàn phím số ảo tích hợp sẵn các phím tắt nhanh (`00`, `000`, `Del`, `Max`), chiều cao cố định $280\text{px}$.
3. **`MTS-Stepper-Control`**: Bộ tăng giảm giá/khối lượng với 2 nút `+` và `-` đạt chuẩn tối thiểu $44 \times 44\text{px}$.
4. **`MTS-Percentage-Chips`**: Bộ nút bấm chọn nhanh sức mua (`25%`, `50%`, `75%`, `100%`) kế thừa component `Chip/Selector`.
5. **`MTS-Ticker-Row`**: Component hiển thị mã chứng khoán dạng danh sách, tích hợp sẵn mini sparkline chart và badge % thay đổi.

---

## 🎨 2. QUY CHUẨN TOKEN RIÊNG CHO MTS
* `safe-area-bottom`: Bắt buộc dùng token `env(safe-area-inset-bottom)` cho iPhone có tai thỏ / Dynamic Island.
* `touch-target-min`: `--touch-target-size: 44px`.
* `thumb-zone-boundary`: `--thumb-zone-y-start: 527px`.
