# 🏢 TIÊU CHUẨN NGHIỆP VỤ & PHÁP LÝ QUẢN TRỊ ADMIN (GATE 4)

> **Cổng thẩm định**: GATE 4 (BA-Audit)  
> **Áp dụng cho**: `Admin-Design` / Cổng Quản trị Vận hành, Content Management System (CMS) & Pháp lý MASHK.  
> **Tham chiếu chuẩn mực**: SFC Hong Kong Regulatory Standards, PDPO Hong Kong (Personal Data Privacy), SOX Maker-Checker Governance.  
> **Cấm Tuyệt Đối**: CẤM kiểm tra bước giá HKEX 503, lô chẵn Tencent hay khối lượng cổ phiếu trên giao diện Admin CMS!

---

## 🏛️ 1. NGUYÊN TẮC 4 MẮT (FOUR-EYES PRINCIPLE / MAKER-CHECKER)
* **Tách biệt tuyệt đối giữa Người Tạo (Maker) và Người Duyệt (Checker)**:
  - Nhân viên tạo bài viết, chiến dịch marketing hoặc form đăng ký (`currentUser.id === record.createdBy`) **TUYỆT ĐỐI BỊ VÔ HIỆU HÓA HOẶC ẨN** nút `Approve (Phê duyệt)`.
  - Trên màn hình danh sách phê duyệt `A07`: Nút `Approve` phải ở trạng thái Disabled hoặc có tooltip giải thích: *"Bạn không thể tự duyệt bản ghi do chính mình tạo"*.

---

## 🛡️ 2. BẢO TOÀN TRƯỜNG DỮ LIỆU (DATA LINEAGE & INTEGRITY)
* **Tính nhất quán giữa Modal và Editor**:
  - Toàn bộ dữ liệu nhập từ Modal tạo mới `A01_M` (Tiêu đề trang, Slug URL, Ngôn ngữ Locale, Mẫu Template) bắt buộc phải xuất hiện chính xác $1:1$ khi chuyển sang Trình soạn thảo `A02`.
  - Cấm hiện tượng rơi rụng dữ liệu (Data drop) hoặc sinh giá trị mặc định sai lệch.
* **Khóa Mẫu Toàn Cục (Template Locking)**:
  - Khung sườn toàn cục (`Header`, `Footer`, `Global Disclaimers`) phải bị khóa chỉnh sửa tại màn hình bài viết lẻ `A02`, chỉ được cấu hình tại màn hình quản trị chung `A13`.

---

## ⚖️ 3. TUÂN THỦ PHÁP LÝ & BẢO VỆ DỮ LIỆU (PDPO HONG KONG COMPLIANCE)
* **Trên màn hình Cấu hình Biểu mẫu & Thu thập Leads (`A10`)**:
  - Bắt buộc có Checkbox đồng thuận Điều khoản dịch vụ và Chính sách bảo mật (Privacy Policy Consent) **KHÔNG ĐƯỢC CHECK SẴN** (No Pre-ticked boxes).
  - Tùy chọn Opt-in cho Tiếp thị trực tiếp (Direct Marketing Opt-in) phải tách biệt độc lập.
* **Vòng đời tài liệu pháp lý (`A11`)**:
  - Bắt buộc khai báo Ngày có hiệu lực (`Effective Date`), Số hiệu phiên bản (`Version major.minor`), và Thẩm quyền pháp lý (`Jurisdiction: SFC/HKEX`).

---

## 🔄 4. MÔ HÌNH TRẠNG THÁI NỘI DUNG (CONTENT LIFECYCLE STATE MACHINE)
```text
[DRAFT: A01_M/A02] ──▶ [REVIEW: A07] ──┬──▶ [APPROVED] ──▶ [PUBLISHED: A05/A01]
                                       │
                                       └──▶ [REJECTED (kèm lý do audit trail)]
```
* **Quy tắc bất biến**:
  - Cấm chuyển thẳng từ `DRAFT` sang `PUBLISHED` mà không qua bước `REVIEW & APPROVE` tại `A07`.
  - Mọi thao tác đổi trạng thái phải lưu vết kiểm toán (Audit Trail: User ID, Timestamp, Old Status, New Status, Reason Note).
