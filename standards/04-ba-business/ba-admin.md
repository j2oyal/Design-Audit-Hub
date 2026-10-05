# 🏢 TIÊU CHUẨN NGHIỆP VỤ DÀNH CHO ADMIN (BACKOFFICE OPERATIONS)
## MIDDLE-OFFICE REGULATORY & RISK COMPLIANCE (LEVEL 1)

> **Cổng thẩm định**: GATE 4 (BA-Audit)  
> **Dự án áp dụng**: Cổng Quản trị Vận hành & Giám sát Rủi ro.

---

## 🛡️ 1. PHÂN QUYỀN RỦI RO & MAKER-CHECKER
* **Quy Tắc 4 Mắt (Four-Eyes Principle)**:
  * Một nhân viên tạo yêu cầu rút tiền lớn hoặc duyệt nới hạn mức Margin (Maker) tuyệt đối không có quyền tự bấm nút Duyệt (Checker).
  * Giao diện phải tự động vô hiệu hóa nút duyệt đối với chính tài khoản đã tạo yêu cầu.

---

## 🚨 2. QUY TRÌNH THANH LÝ CƯỠNG CHẾ (FORCE-SELL PROTOCOL)
* Tỷ lệ duy trì ký quỹ chạm ngưỡng Call Margin $\implies$ Tự động gửi thông báo cảnh báo qua SMS/App.
* Tỷ lệ chạm ngưỡng Force-sell $\implies$ Kích hoạt giao diện xử lý cưỡng chế theo thứ tự ưu tiên thanh khoản cao nhất, bảo toàn vốn tối đa cho nhà đầu tư theo luật Ủy ban Chứng khoán.
