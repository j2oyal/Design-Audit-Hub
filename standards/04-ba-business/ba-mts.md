# 📱 TIÊU CHUẨN NGHIỆP VỤ DÀNH CHO MTS (MOBILE TRADING)
## RETAIL TRADING COMPLIANCE & FINANCIAL RULES (LEVEL 1)

> **Cổng thẩm định**: GATE 4 (BA-Audit)  
> **Dự án áp dụng**: Ứng dụng giao dịch chứng khoán di động.

---

## 📈 1. BẢNG BƯỚC GIÁ (TICK SIZE) & LÔ CHUẨN (BOARD LOT)
* **Quy Chế Sàn HKEX (Rule 503)**:
  * Cổ phiếu Tencent (00700): Giá từ $200 - 500\text{ HKD} \implies$ Bước giá bắt buộc là **$0.20\text{ HKD}$**; Lô chuẩn là **$100\text{ cp}$**.
  * Cổ phiếu HSBC (00005): Lô chuẩn là **$400\text{ cp}$**.
  * Bắt lỗi nếu form nhập cho phép gõ số lượng lẻ lô (vd: `150 cp`) trên sàn giao dịch lô chẵn.
* **Quy Chuẩn 3-3-2 Về Số Thập Phân**:
  * Giá: Tối thiểu 3 chữ số thập phân (`HK$ 385.200`).
  * Khối lượng: Tối thiểu 3 chữ số thập phân (`11.650M`).
  * Giá trị vốn hóa / Turnover: 2 chữ số thập phân.

---

## 💳 2. KIỂM SOÁT ĐÒN BẨY MARGIN & SỨC MUA
* Kiểm tra tỷ lệ ký quỹ $R_{\text{tt}}$ thời gian thực.
* Nếu số tiền đặt mua vượt quá Sức mua tối đa $\implies$ Chặn lệnh ngay tại form và hiển thị số tiền còn thiếu, không gửi lệnh rác lên Sở.
