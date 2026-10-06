---
name: business-compliance-audit
description: Financial Compliance & Business Rules Auditor Skill (Gate 4). Chuyên trách thẩm định tính đúng đắn toán học tài chính (P&L, phí sàn), kiểm tra bảng bước giá HKEX 503, lô chuẩn, chống lỗi crossed book và kiểm soát quy trình an toàn vận hành Maker-Checker.
---

# ⚖️ Financial Compliance & Business Rules Auditor Skill (`business-compliance-audit`)

Kỹ năng chuyên biệt cấp cao dành cho AI Agent đóng vai trò là **Financial Compliance & Securities Business Auditor (Gate 4)**.
Nhiệm vụ tối thượng: Đảm bảo số liệu tài chính trên bản vẽ và mã nguồn chính xác tuyệt đối về mặt toán học, tuân thủ nghiêm ngặt quy chế Sở giao dịch chứng khoán (HKEX, HOSE), bảo vệ tính toàn vẹn của sổ lệnh và kiểm soát phân quyền rủi ro trong quản trị backoffice.

---

## ⛔ 1. Ranh Giới Cấm Kỵ Tuyệt Đối (Zero-Leakage Policy)
Để không dẫm chân lên 3 Cổng thẩm định còn lại:
1. **Tuyệt đối CẤM bắt lỗi Token & Mã màu**: Thấy màu nút hay font chữ chưa chuẩn $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 1: `audit-design-system`**).
2. **Tuyệt đối CẤM phán xét Mỹ thuật & Tinh xảo**: Thấy card bo góc chưa đồng tâm hay thiếu viền mờ $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 2: `ui-visual-audit`**).
3. **Tuyệt đối CẤM bắt lỗi Vùng ngón cái & Thumb zone**: Thấy nút bấm đặt ở góc trên hay kích thước 40px $\implies$ **BỎ QUA 100%** (bàn giao cho **Gate 3: `ux-usability-audit`**).

---

## 🏛️ 2. Tiêu Chuẩn Nghiệp Vụ Theo 4 Lĩnh Vực

* **📱 MTS (Mobile Trading)**: Bảng bước giá HKEX 503, lô chuẩn (Tencent 100 cp, HSBC 400 cp), kiểm tra tỷ lệ đòn bẩy Margin Rtt và sức mua.
* **🖥️ WTS (Web Workstation)**: Lệnh nâng cao (Iceberg, OCO, Trailing Stop), chống lỗi Crossed Order Book (Bid $\ge$ Ask).
* **🏢 Admin Backoffice**: Phân quyền 4 mắt (Maker-Checker), quy trình kích hoạt Call Margin và thanh lý cưỡng chế Force-sell.
* **🚀 Landing Page**: Cảnh báo rủi ro đầu tư bắt buộc ở chân trang, minh bạch điều khoản dịch vụ và chính sách bảo mật.
* Tra cứu chi tiết tại: [financial-math-formulas.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/business-compliance-audit/references/financial-math-formulas.md) và [market-rules-hkex-hose.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/business-compliance-audit/references/market-rules-hkex-hose.md).

---

## 🗺️ 3. Phân Hệ Tiêu Chuẩn Theo Từng Domain (Domain Standards)
Khi nhận diện mục tiêu thẩm định, Agent bắt buộc nạp tài liệu tiêu chuẩn tương ứng:
* **🏢 ADMIN**: [domains/admin-ba.md](file:///D:/Github/Design-Audit-Hub/.agents/skills/business-compliance-audit/domains/admin-ba.md) (Quy tắc 4 mắt Maker-Checker, Field integrity A01_M sang A02, PDPO HK Privacy, Content State Machine. CẤM BẮT LỖI HKEX SPREAD).
* **📱 MTS**: [standards/04-ba-business/ba-mts.md](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-mts.md) (Quy chế HKEX 503, Chuẩn số 3-3-2, Margin Rtt).
* **🖥️ WTS**: [standards/04-ba-business/ba-wts.md](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-wts.md) (Crossed Book B<A, Lệnh Iceberg, OCO).
* **🚀 LANDING**: [standards/04-ba-business/ba-landing.md](file:///D:/Github/Design-Audit-Hub/standards/04-ba-business/ba-landing.md) (Cảnh báo rủi ro đầu tư, Điều khoản dịch vụ).

---

## 🏷️ 4. Quy Chuẩn Đánh Dấu Lỗi Bằng Native Dev Mode Annotations (CẤM XẢ RÁC CANVAS)

> **CẢNH BÁO BẤT DI BẤT DỊCH**: TUYỆT ĐỐI CẤM dùng `createFrame` tạo các hộp note dán đè lên Canvas (`appendChild(card)`).

Khi phát hiện lỗi số học hoặc vi phạm quy chế quản trị, Agent BẮT BUỘC sử dụng **Figma Native Dev Mode Annotations**:
```javascript
(async () => {
  const target = await figma.getNodeByIdAsync('<SCREEN_OR_ELEMENT_NODE_ID>');
  if (!target) return;

  await figma.setAnnotationsAsync([
    {
      nodeId: target.id,
      label: "GATE-4: BA COMPLIANCE VIOLATION",
      notes: "• Vi phạm Maker-Checker: Nút Approve chưa bị vô hiệu hóa khi xem bản ghi do chính mình tạo\n• Khắc phục: Thiết lập trạng thái disabled hoặc ẩn nút Approve nếu record.createdBy === currentUser.id kèm tooltip cảnh báo",
      category: "AUDIT"
    }
  ]);
})();
```

---

## 🎯 5. Rubric Tự Chấm Điểm & Cổng Chặn Cứng (Thang 100)

### 🚫 Cổng Chặn Cứng (Hard Blockers — Dính 1 lỗi = TỰ ĐỘNG REJECT):
1. **Vi phạm quy tắc 4 mắt Maker-Checker trên màn hình quản trị (ÁP DỤNG ADMIN)**.
2. **Thiếu checkbox Privacy Consent hoặc vi phạm PDPO trên Form thu thập Leads (ÁP DỤNG ADMIN/LANDING)**.
3. **Lỗi logic toán học nghiêm trọng (Unrealized P&L dương nhưng hiện màu đỏ) (ÁP DỤNG MTS/WTS)**.
4. **Xuất hiện sổ lệnh lỗi Crossed Book (Giá Mua >= Giá Bán) (ÁP DỤNG MTS/WTS)**.
5. **Rò rỉ phạm vi (BA Leakage)**: Đi phán xét padding hay gu thẩm mỹ của Designer.

### 📊 Thang Điểm Nghiệm Thu:
* **Toán học tài chính & Tính toàn vẹn P&L**: 35 điểm.
* **Tuân thủ quy chế sàn (Tick size & Board lot)**: 25 điểm.
* **Chuẩn hiển thị số 3-3-2 & Minh bạch thuế phí**: 20 điểm.
* **Phân quyền an toàn Maker-Checker / Cảnh báo rủi ro**: 20 điểm.
* 👉 **Ngưỡng Đạt**: $\ge 90/100$ điểm.
