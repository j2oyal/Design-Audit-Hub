# 👁️ MA TRẬN CÂN BẰNG QUANG HỌC & TOÁN HỌC THỊ GIÁC (OPTICAL MATRIX)

## 1. THANG TỶ LỆ CẤP SỐ NHÂN (MODULAR SCALE LOOKUP TABLE)

Mọi cỡ chữ trên màn hình bắt buộc phải thuộc vào 1 trong 2 thang đo:

| Cấp Bậc Typography | Hệ Số $n$ | Fintech / Data-Dense ($r = 1.200$, Base 14px) | Web / Editorial / Landing ($r = 1.250$, Base 16px) | Ứng Dụng Thực Tế |
| :--- | :---: | :---: | :---: | :--- |
| **Micro Caption** | $-2$ | **10px** | **10px** | Số thứ tự, mã ISIN, nhãn phụ |
| **Caption / Meta** | $-1$ | **12px** | **12px - 13px** | Chú thích biểu đồ, timestamp |
| **Body Regular** | $0$ | **14px** *(Base)* | **16px** *(Base)* | Văn bản nội dung, số liệu bảng |
| **Subhead / Card Title** | $+1$ | **16px - 17px** | **20px** | Tiêu đề khối, tên nhóm widget |
| **Section Heading** | $+2$ | **20px** | **25px** | Tiêu đề phân đoạn trang |
| **Page Title** | $+3$ | **24px** | **31px - 32px** | Tên màn hình chính, H1 tiêu đề |
| **Hero Title** | $+4$ | **29px** | **39px - 40px** | Tiêu đề Hero trang Landing |
| **Mega Display** | $+5$ | **35px** | **48px - 50px** | Số liệu thống kê ấn tượng, Big stat |

---

## 2. TOÁN HỌC BO GÓC ĐỒNG TÂM (CONCENTRIC RADIUS FORMULA)

$$R_{\text{outer}} = R_{\text{inner}} + \text{Padding}$$

| Bán Kính Nút/Card Con ($R_{\text{inner}}$) | Đệm Giữa 2 Khối ($\text{Padding}$) | Bán Kính Khung Mẹ Bắt Buộc ($R_{\text{outer}}$) | Lỗi Thường Mắc Nếu Không Áp Dụng |
| :---: | :---: | :---: | :--- |
| **4px** | **8px** | **12px** | Đặt $R_{\text{cha}} = 4\text{px} \implies$ Khung ngoài nhìn như hình vuông |
| **8px** | **12px** | **20px** | Đặt $R_{\text{cha}} = 8\text{px} \implies$ Góc ngoài bị nhọn quang học |
| **8px** | **16px** | **24px** | Đặt $R_{\text{cha}} = 16\text{px} \implies$ Khoảng đệm bị ép góc |
| **12px** | **16px** | **28px** *(MASHK Card)* | Góc ngoài bo đồng đều và êm dịu hoàn hảo |

---

## 3. CÂN BẰNG DIỆN TÍCH QUANG HỌC HÌNH HỌC (OPTICAL COMPENSATION)
* Một hình tròn có đường kính $24\text{px}$ có diện tích $S = \pi \times 12^2 \approx 452\text{px}^2$.
* Một hình vuông có cạnh $24\text{px}$ có diện tích $S = 24^2 = 576\text{px}^2$.
* 👉 **Quy luật**: Mắt người cảm thấy hình tròn bé hơn hình vuông khoảng **$20\%$**.
* **Ứng dụng**: Icon hình tròn (Avatar, Status dot) phải tăng kích thước thêm **$1\text{px} - 2\text{px}$** hoặc lùi padding vào để tạo cảm giác cân bằng thị giác với các khối vuông xung quanh.
