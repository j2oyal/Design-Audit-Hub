# 📐 CÔNG THỨC TOÁN HỌC TÀI CHÍNH & ĐỐI SOÁT SỐ HỌC (FINANCIAL MATH)

## 1. CÔNG THỨC TÍNH TOÁN GIÁ TRỊ LỆNH KHỚP
| Chỉ Số | Công Thức Chuẩn | Lỗi Designer Hay Vẽ Sai |
| :--- | :--- | :--- |
| **Giá Trị Lệnh (Gross Value)** | $\text{Gross} = \text{Price} \times \text{Quantity}$ | Nhân sai số 0, nhầm dấu chấm phẩy (`1.500` vs `1,500`). |
| **Tổng Tiền Mua (Net Buy)** | $\text{Net Buy} = \text{Gross} + \text{Phí Môi Giới} + \text{Thuế/Phí Sàn}$ | Trừ phí thay vì cộng vào tiền người mua phải trả. |
| **Tiền Thực Nhận Bán (Net Sell)** | $\text{Net Sell} = \text{Gross} - \text{Phí Môi Giới} - \text{Thuế/Phí Sàn}$ | Cộng phí vào tiền người bán được nhận về. |
| **Giá Hòa Vốn (Break-even Price)** | $\text{Break-even} = \text{Giá Vốn} + \frac{\text{Tổng Phí 2 Chiều}}{\text{Khối Lượng}}$ | Giá hòa vốn lệnh Mua bắt buộc phải lớn hơn Giá Vốn. |

---

## 2. TOÁN HỌC LÃI / LỖ (P&L INTEGRITY)
1. **Lãi / Lỗ Tuyệt Đối (Unrealized P&L)**:
   $$\text{P&L} = (\text{Market Price} - \text{Cost Price}) \times \text{Quantity}$$
   * *Lỗi cấm kỵ*: $\text{Market Price} > \text{Cost Price}$ nhưng hiển thị số âm `-` hoặc màu Đỏ.
2. **Tỷ Suất Sinh Lời (% P&L)**:
   $$\% \text{ P&L} = \frac{\text{Market Price} - \text{Cost Price}}{\text{Cost Price}} \times 100\%$$
   * Giá vốn $\$10$, thị giá $\$15 \implies +50\%$, không thể hiển thị $+15\%$ hay $+5\%$.

---

## 3. KỶ LUẬT ZERO FLOATING-POINT ERRORS
* Nghiêm cấm dùng toán tử dấu phẩy động JavaScript (`0.1 + 0.2 = 0.30000000000000004`).
* Bắt buộc làm tròn số thập phân theo quy tắc sàn tài chính:
  * HKEX: Tiền tệ làm tròn đến **`0.01 HKD`** (Stamp Duty làm tròn lên $1\text{ HKD}$ gần nhất).
