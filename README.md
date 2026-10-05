# 🛡️ DESIGN-AUDIT-HUB (TÒA ÁN THẨM ĐỊNH THIẾT KẾ ĐỘC LẬP)

## 🎯 Sứ Mệnh & Vai Trò
**Design-Audit-Hub** là cơ quan giám sát và thẩm định chất lượng giao diện (Design System, UI/UX, Business Compliance) độc lập cho toàn bộ hệ sinh thái. 

Nơi đây đóng vai trò như một **Tòa án Kỹ thuật**, đảm bảo sản phẩm trước khi xuất xưởng hoặc trình lên Thư ký riêng & Chủ nhân phải đáp ứng 100% các tiêu chuẩn khắt khe, bài trừ hoàn toàn **AI-Slop** và bảo vệ tỷ lệ tái sử dụng Design System.

---

## 🏛️ KIẾN TRÚC MA TRẬN 2 TRỤC (TWO-AXIS MATRIX)

```text
                           ┌────────────────────────────────────────────────────────┐
                           │      CORE KERNEL (TẦNG LÕI KIỂM ĐỊNH TOÀN DIỆN)        │
                           │  - Diệt trừ AI-Slop & Rập khuôn                        │
                           │  - Độ sạch Design Tokens (Cấm tiệt hardcode màu)       │
                           │  - Đo tỷ lệ tái sử dụng Component (> 95% Threshold)    │
                           │  - Micro-Typography & WCAG Contrast (Vercel Standard)  │
                           └───────────────────────────┬────────────────────────────┘
                                                       │
                     ┌──────────────────┬──────────────┴─────┬──────────────────┐
                     ▼                  ▼                    ▼                  ▼
             ┌──────────────┐   ┌──────────────┐     ┌──────────────┐   ┌──────────────┐
             │ PROFILE: MTS │   │ PROFILE: WTS │     │ PROFILE: ADM │   │ PROFILE: LND │
             │(Mobile Trade)│   │ (Web Trade)  │     │ (Backoffice) │   │ (Landingpage)│
             └──────────────┘   └──────────────┘     └──────────────┘   └──────────────┘
```

---

## ⚖️ LUẬT BẤT BIẾN: TỶ LỆ DÙNG COMPONENT > 95%
1. **Chỉ số Bắt buộc**: Tỷ lệ Master Components kế thừa từ Design System phải đạt **$\ge 95\%$**.
2. **Quy tắc Trừng phạt (Auto-Reject)**: Nếu tỷ lệ $< 95\%$, hệ thống tự động đánh rớt (**REWORK_REQUIRED**).
3. **Điều khoản Ngoại lệ (Exception Clause)**: Dự án chỉ được chấp thuận nếu có văn bản giải trình kỹ thuật cụ thể:
   `[COMPONENT_EXCEPTION_JUSTIFICATION]: <Lý do kiến trúc / Nghiệp vụ đặc thù>`

---

## 🚀 HƯỚNG DẪN SỬ DỤNG LỆNH KIỂM ĐỊNH (CLI RUNNER)

Chạy lệnh thẩm định thông qua PowerShell:

```powershell
# 1. Thẩm định tự động nhận diện Profile
.\audit.ps1 -Target "D:\Github\Admin-Design"

# 2. Chỉ định Profile rõ ràng và xuất báo cáo markdown
.\audit.ps1 -Target "D:\Github\MAPS-Design" -Profile MTS -ReportOutput "reports\REPORT-MTS.md"

# 3. Kiểm định Landing Page Capsule
.\audit.ps1 -Target "D:\Github\landingpage-builder\projects\my-capsule" -Profile Landingpage
```
