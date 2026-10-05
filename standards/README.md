# 🏛️ MA TRẬN TIÊU CHUẨN THẨM ĐỊNH THIẾT KẾ (QUAD-GATES STANDARDS MATRIX)

Đây là bản đồ điều hướng trung tâm của toàn bộ hệ thống tiêu chuẩn tại **Design-Audit-Hub**.  
Mô hình tổ chức theo **Ma trận 4x4**: 4 Cổng Thẩm Định độc lập $\times$ 4 Dòng Sản Phẩm chuyên biệt (với 1 Tầng Chung Level 0 làm nền móng).

---

## 🗺️ BẢN ĐỒ MA TRẬN 4x4 THẨM ĐỊNH

| Cổng Thẩm Định | Tầng 0: Nền Tảng Dùng Chung | 📱 MTS (Mobile Trading) | 🖥️ WTS (Web Workstation) | 🏢 Admin (Backoffice) | 🚀 Landing Page (CRO) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **GATE 1: DS-Audit** *(Design System & Tokens)* | [`universal-ds-standards.md`](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/universal-ds-standards.md)<br>• Component Reuse $\ge 95\%$<br>• Token 3 tầng, cấm raw hex | [`ds-mts.md`](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-mts.md)<br>OrderPad sheet, Virtual Keypad, Steppers | [`ds-wts.md`](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-wts.md)<br>Split workspace, OrderBook ladder L2 | [`ds-admin.md`](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-admin.md)<br>Data grid, Filter bar, Destructive dialog | [`ds-landing.md`](file:///D:/Github/Design-Audit-Hub/standards/01-design-system/ds-landing.md)<br>Capsule tokens.json, Hero section |
| **GATE 2: UI-Audit** *(Mỹ Thuật & Anti-AI-Slop)* | [`universal-ui-standards.md`](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/universal-ui-standards.md)<br>• Toán học Modular scale<br>• Gestalt, Bo góc đồng tâm | [`ui-mts.md`](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-mts.md)<br>Vùng chạm 44px, Dual-coding P&L +/- | [`ui-wts.md`](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-wts.md)<br>Mật độ siêu cao, Dark mode chống mỏi mắt | [`ui-admin.md`](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-admin.md)<br>3 mức density 28/36/48px, Căn lề số 100% | [`ui-landing.md`](file:///D:/Github/Design-Audit-Hub/standards/02-ui-craft/ui-landing.md)<br>Khoảng thở 120-160px, Glow & Glassmorphism |
| **GATE 3: UX-Audit** *(Công Thái Học & Luồng)* | [`universal-ux-standards.md`](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/universal-ux-standards.md)<br>• Fitts, Hick, Jakob laws<br>• Non-disabled CTA, Poka-Yoke | [`ux-mts.md`](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-mts.md)<br>Thumb zone $y \ge 527\text{px}$, Slide-to-confirm | [`ux-wts.md`](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-wts.md)<br>Keyboard-first 90%+, Layout persistence | [`ux-admin.md`](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-admin.md)<br>Bulk actions, Giữ trạng thái bộ lọc | [`ux-landing.md`](file:///D:/Github/Design-Audit-Hub/standards/03-ux-usability/ux-landing.md)<br>Attention ratio 1:1, Giảm ma sát form |
| **GATE 4: BA-Audit** *(Nghiệp Vụ & Pháp Lý)* | [`universal-ba-standards.md`](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/universal-ba-standards.md)<br>• Zero floating-point math<br>• Minh bạch thuế phí | [`ba-mts.md`](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-mts.md)<br>Quy chế HKEX 503, Chuẩn số 3-3-2 | [`ba-wts.md`](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-wts.md)<br>Iceberg, OCO, Chống Crossed book | [`ba-admin.md`](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-admin.md)<br>Maker-Checker, Quy trình Force-sell | [`ba-landing.md`](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-landing.md)<br>Cảnh báo rủi ro đầu tư, Chính sách bảo mật |

---

## 🔄 CƠ CHẾ NẠP TIÊU CHUẨN KHI THỰC THI (HERDR QUAD-PANES)
* **Cửa sổ 1 (`ds-audit`)**: Nạp `standards/01-design-system/universal-ds-standards.md` + file domain tương ứng.
* **Cửa sổ 2 (`ui-audit`)**: Nạp `standards/02-ui-craft/universal-ui-standards.md` + file domain tương ứng.
* **Cửa sổ 3 (`ux-audit`)**: Nạp `standards/03-ux-usability/universal-ux-standards.md` + file domain tương ứng.
* **Cửa sổ 4 (`ba-audit`)**: Nạp `standards/04-ba-business/universal-ba-standards.md` + file domain tương ứng.
