# 📜 QUY CHẾ THỊ TRƯỜNG, BƯỚC GIÁ HKEX & PHÂN QUYỀN VẬN HÀNH

## 1. BẢNG BƯỚC GIÁ SÀN HKEX (RULE 503 SPREAD TABLE)

Cổ phiếu trên Sở giao dịch Hồng Kông (HKEX) bắt buộc tuân theo bảng bước giá cố định:

| Dải Thị Giá Cổ Phiếu (HKD) | Bước Giá Tối Thiểu (Minimum Spread) | Ví Dụ Giá Hợp Lệ | Lỗi Thường Vẽ Sai |
| :--- | :---: | :--- | :--- |
| **0.010 đến 0.250** | **0.001** | `0.123`, `0.245` | `0.1235` (4 số lẻ) |
| **0.250 đến 0.500** | **0.005** | `0.255`, `0.300` | `0.252` (không chia hết cho 0.005) |
| **0.500 đến 10.00** | **0.010** | `1.25`, `5.80`, `9.99` | `1.255` (có 3 số lẻ) |
| **10.00 đến 20.00** | **0.020** | `10.02`, `15.50` | `10.05` (đuôi lẻ không chia hết cho 0.02) |
| **20.00 đến 100.00** | **0.050** | `20.05`, `45.50` | `20.02` (đuôi không phải .00 hoặc .05) |
| **100.00 đến 200.00** | **0.100** | `100.10`, `150.50` | `100.05` (đuôi không tròn hào .10) |
| **200.00 đến 500.00** *(Tencent)* | **0.200** | `385.20`, `385.40` | `385.25`, `385.15` (không chia hết cho 0.20) |
| **500.00 đến 1,000.00** | **0.500** | `500.50`, `750.00` | `500.20` (không chia hết cho 0.50) |

---

## 2. BẢNG LÔ CHUẨN (BOARD LOT) CÁC MÃ TRỌNG ĐIỂM
* **Tencent Holdings (00700)**: Lô chuẩn là **100 cp**. Form đặt lệnh chuẩn: `100, 200, 500, 1000`. Cấm `150 cp`.
* **HSBC Holdings (00005)**: Lô chuẩn là **400 cp**. Cấm `100 cp`, `250 cp`.
* **BYD Company (01211)**: Lô chuẩn là **500 cp**.
* **AIA Group (01299)**: Lô chuẩn là **200 cp**.

---

## 3. QUY TẮC PHÂN QUYỀN 4 MẮT (MAKER-CHECKER RULE)
* Mọi hành động can thiệp tài khoản rủi ro cao (Duyệt hạn mức Margin lớn, Khóa tài khoản, Cưỡng chế Force-sell) bắt buộc có 2 chủ thể độc lập:
  * **Maker**: Người khởi tạo đề xuất.
  * **Checker**: Người có thẩm quyền phê duyệt đề xuất.
* Giao diện Admin bắt buộc vô hiệu hóa nút Approve đối với chính người đã tạo yêu cầu.
