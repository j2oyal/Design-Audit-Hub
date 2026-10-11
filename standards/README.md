# Ma trận tiêu chuẩn thẩm định thiết kế (Quad-Gates Standards Matrix)

Đây là bản đồ điều hướng trung tâm của toàn bộ hệ thống tiêu chuẩn tại Design-Audit-Hub.
Mô hình tổ chức theo ma trận 4x4: 4 cổng thẩm định độc lập với 4 dòng sản phẩm chuyên biệt (và 1 tầng chung Tầng 0 làm nền móng).

---

## Bản đồ ma trận 4x4 thẩm định

| Cổng thẩm định | Tầng 0: Nền tảng dùng chung | MTS (Mobile Trading) | WTS (Web Workstation) | Admin (Backoffice) | Landing Page (CRO) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Gate 1: DS-Audit** (Design System & Tokens) | [`universal-ds-standards.md`](01-design-system/universal-ds-standards.md)<br>Component Reuse >= 95%, token 3 tầng, cấm raw hex | [`ds-mts.md`](01-design-system/ds-mts.md)<br>OrderPad sheet, Virtual Keypad, Steppers | [`ds-wts.md`](01-design-system/ds-wts.md)<br>Split workspace, OrderBook ladder L2 | [`ds-admin.md`](01-design-system/ds-admin.md)<br>Data grid, Filter bar, Destructive dialog | [`ds-landing.md`](01-design-system/ds-landing.md)<br>Capsule tokens.json, Hero section |
| **Gate 2: UI-Audit** (Mỹ thuật & Anti-AI-Slop) | [`universal-ui-standards.md`](02-ui-craft/universal-ui-standards.md)<br>Toán học Modular scale, Gestalt, bo góc đồng tâm | [`ui-mts-standards.md`](02-ui-craft/ui-mts-standards.md)<br>Vùng chạm 44px, Dual-coding P&L +/- | [`ui-wts-standards.md`](02-ui-craft/ui-wts-standards.md)<br>Mật độ siêu cao, Dark mode chống mỏi mắt | [`ui-admin-standards.md`](02-ui-craft/ui-admin-standards.md)<br>3 mức density 28/36/48px, căn lề số 100% | [`ui-landing-standards.md`](02-ui-craft/ui-landing-standards.md)<br>Khoảng thở 120px-160px, Glow và Glassmorphism |
| **Gate 3: UX-Audit** (Công thái học & Luồng) | [`universal-ux-standards.md`](03-ux-usability/universal-ux-standards.md)<br>Fitts, Hick, Jakob laws, Non-disabled CTA, Poka-Yoke | [`ux-mts.md`](03-ux-usability/ux-mts.md)<br>Thumb zone y >= 527px, Slide-to-confirm | [`ux-wts.md`](03-ux-usability/ux-wts.md)<br>Keyboard-first 90%+, Layout persistence | [`ux-admin.md`](03-ux-usability/ux-admin.md)<br>Bulk actions, giữ trạng thái bộ lọc | [`ux-landing.md`](03-ux-usability/ux-landing.md)<br>Attention ratio 1:1, giảm ma sát form |
| **Gate 4: BA-Audit** (Nghiệp vụ & Pháp lý) | [`universal-ba-standards.md`](04-ba-business/universal-ba-standards.md)<br>Zero floating-point math, minh bạch thuế phí | [`ba-mts.md`](04-ba-business/ba-mts.md)<br>Quy chế HKEX 503, Chuẩn số 3-3-2 | [`ba-wts.md`](04-ba-business/ba-wts.md)<br>Iceberg, OCO, chống Crossed book | [`ba-admin.md`](04-ba-business/ba-admin.md)<br>Maker-Checker, quy trình Force-sell | [`ba-landing.md`](04-ba-business/ba-landing.md)<br>Cảnh báo rủi ro đầu tư, chính sách bảo mật |

---

## Cơ chế nạp tiêu chuẩn khi thực thi (Herdr Quad-Panes)
- Cửa sổ 1 (`ds-audit`): Nạp `standards/01-design-system/universal-ds-standards.md` và file domain tương ứng.
- Cửa sổ 2 (`ui-audit`): Nạp `standards/02-ui-craft/universal-ui-standards.md` và file domain tương ứng.
- Cửa sổ 3 (`ux-audit`): Nạp `standards/03-ux-usability/universal-ux-standards.md` và file domain tương ứng.
- Cửa sổ 4 (`ba-audit`): Nạp `standards/04-ba-business/universal-ba-standards.md` và file domain tương ứng.
