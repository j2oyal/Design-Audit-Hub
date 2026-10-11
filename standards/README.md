# Ma tran tieu chuan tham dinh thiet ke (Quad-Gates Standards Matrix)

Day la ban do dieu huong trung tam cua toan bo he thong tieu chuan tai Design-Audit-Hub.
Mo hinh to chuc theo ma tran 4x4: 4 cong tham dinh doc lap voi 4 dong san pham chuyen biet (va 1 tang chung Level 0 lam nen mong).

---

## Ban do ma tran 4x4 tham dinh

| Cong tham dinh | Tang 0: Nen tang dung chung | MTS (Mobile Trading) | WTS (Web Workstation) | Admin (Backoffice) | Landing Page (CRO) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Gate 1: DS-Audit** (Design System & Tokens) | [`universal-ds-standards.md`](01-design-system/universal-ds-standards.md)<br>Component Reuse >= 95%, token 3 tang, cam raw hex | [`ds-mts.md`](01-design-system/ds-mts.md)<br>OrderPad sheet, Virtual Keypad, Steppers | [`ds-wts.md`](01-design-system/ds-wts.md)<br>Split workspace, OrderBook ladder L2 | [`ds-admin.md`](01-design-system/ds-admin.md)<br>Data grid, Filter bar, Destructive dialog | [`ds-landing.md`](01-design-system/ds-landing.md)<br>Capsule tokens.json, Hero section |
| **Gate 2: UI-Audit** (My thuat & Anti-AI-Slop) | [`universal-ui-standards.md`](02-ui-craft/universal-ui-standards.md)<br>Toan hoc Modular scale, Gestalt, bo goc dong tam | [`ui-mts-standards.md`](02-ui-craft/ui-mts-standards.md)<br>Vung cham 44px, Dual-coding P&L +/- | [`ui-wts-standards.md`](02-ui-craft/ui-wts-standards.md)<br>Mat do sieu cao, Dark mode chong moi mat | [`ui-admin-standards.md`](02-ui-craft/ui-admin-standards.md)<br>3 muc density 28/36/48px, can le so 100% | [`ui-landing-standards.md`](02-ui-craft/ui-landing-standards.md)<br>Khoang tho 120px-160px, Glow va Glassmorphism |
| **Gate 3: UX-Audit** (Cong thai hoc & Luong) | [`universal-ux-standards.md`](03-ux-usability/universal-ux-standards.md)<br>Fitts, Hick, Jakob laws, Non-disabled CTA, Poka-Yoke | [`ux-mts.md`](03-ux-usability/ux-mts.md)<br>Thumb zone y >= 527px, Slide-to-confirm | [`ux-wts.md`](03-ux-usability/ux-wts.md)<br>Keyboard-first 90%+, Layout persistence | [`ux-admin.md`](03-ux-usability/ux-admin.md)<br>Bulk actions, giu trang thai bo loc | [`ux-landing.md`](03-ux-usability/ux-landing.md)<br>Attention ratio 1:1, giam ma sat form |
| **Gate 4: BA-Audit** (Nghiep vu & Phap ly) | [`universal-ba-standards.md`](04-ba-business/universal-ba-standards.md)<br>Zero floating-point math, minh bach thue phi | [`ba-mts.md`](04-ba-business/ba-mts.md)<br>Quy che HKEX 503, Chuan so 3-3-2 | [`ba-wts.md`](04-ba-business/ba-wts.md)<br>Iceberg, OCO, chong Crossed book | [`ba-admin.md`](04-ba-business/ba-admin.md)<br>Maker-Checker, quy trinh Force-sell | [`ba-landing.md`](04-ba-business/ba-landing.md)<br>Canh bao rui ro dau tu, chinh sach bao mat |

---

## Co che nap tieu chuan khi thuc thi (Herdr Quad-Panes)
- Cua so 1 (`ds-audit`): Nap `standards/01-design-system/universal-ds-standards.md` va file domain tuong ung.
- Cua so 2 (`ui-audit`): Nap `standards/02-ui-craft/universal-ui-standards.md` va file domain tuong ung.
- Cua so 3 (`ux-audit`): Nap `standards/03-ux-usability/universal-ux-standards.md` va file domain tuong ung.
- Cua so 4 (`ba-audit`): Nap `standards/04-ba-business/universal-ba-standards.md` va file domain tuong ung.
