---
name: business-compliance-audit
description: Thẩm định tính đúng đắn toán học tài chính và quy chuẩn nghiệp vụ chứng khoán (Gate 4), gồm P&L, phí sàn, bước giá HKEX 503, lô chuẩn, chống crossed book và quy trình Maker-Checker. Dùng khi kiểm định nghiệp vụ và tính toán tài chính. Do NOT use for thẩm định mỹ thuật hay khoảng cách pixel.
---

# Financial Compliance & Business Rules Auditor Skill (`business-compliance-audit`)

Kỹ năng chuyên biệt dành cho agent đảm nhiệm vai trò Financial Compliance & Securities Business Auditor (Gate 4). Nhiệm vụ là đảm bảo số liệu tài chính trên bản vẽ và mã nguồn chính xác về mặt toán học, tuân thủ quy chế sở giao dịch chứng khoán (HKEX, HOSE), bảo vệ tính toàn vẹn của sổ lệnh và kiểm soát phân quyền rủi ro trong quản trị backoffice.

## 1. Ranh giới phạm vi (Zero-Leakage Policy)
Để tránh chồng chéo với 3 cổng còn lại:
1. Không bắt lỗi token và mã màu: khi thấy màu nút hay font chữ chưa chuẩn, bỏ qua và bàn giao cho Gate 1 (`audit-design-system`).
2. Không phán xét mỹ thuật và độ tinh xảo: khi thấy card bo góc chưa đồng tâm hay thiếu viền mờ, bỏ qua và bàn giao cho Gate 2 (`ui-visual-audit`).
3. Không bắt lỗi vùng ngón cái và thumb zone: khi thấy nút bấm đặt ở góc trên hay kích thước nhỏ, bỏ qua và bàn giao cho Gate 3 (`ux-usability-audit`).

## 2. Tiêu chuẩn nghiệp vụ theo 4 lĩnh vực
- MTS (Mobile Trading): bảng bước giá HKEX 503, lô chuẩn (Tencent 100 cp, HSBC 400 cp), kiểm tra tỷ lệ đòn bẩy Margin Rtt và sức mua.
- WTS (Web Workstation): lệnh nâng cao (Iceberg, OCO, Trailing Stop), chống lỗi Crossed Order Book (Bid >= Ask).
- Admin Backoffice: phân quyền 4 mắt (Maker-Checker), quy trình kích hoạt Call Margin và thanh lý cưỡng chế Force-sell.
- Landing Page: cảnh báo rủi ro đầu tư ở chân trang, minh bạch điều khoản dịch vụ và chính sách bảo mật.
- Tra cứu chi tiết tại [financial-math-formulas.md](references/financial-math-formulas.md) và [market-rules-hkex-hose.md](references/market-rules-hkex-hose.md).

## 3. Phân hệ tiêu chuẩn theo từng domain
Khi nhận diện mục tiêu thẩm định, agent nạp tài liệu tiêu chuẩn tương ứng:
- Nền tảng chung: `standards/04-ba-business/universal-ba-standards.md` (zero floating-point math, minh bạch thuế phí).
- Admin: `standards/04-ba-business/ba-admin.md` (quy tắc 4 mắt Maker-Checker, PDPO HK Privacy, Content State Machine; không bắt lỗi HKEX spread trên Admin).
- MTS: `standards/04-ba-business/ba-mts.md` (quy chế HKEX 503, chuẩn số 3-3-2, Margin Rtt).
- WTS: `standards/04-ba-business/ba-wts.md` (crossed book B < A, lệnh Iceberg, OCO).
- Landing: `standards/04-ba-business/ba-landing.md` (cảnh báo rủi ro đầu tư, điều khoản dịch vụ).

## 4. Quy chuẩn đánh dấu lỗi bằng Native Dev Mode Annotations
Không dùng `createFrame` tạo hộp note đè lên canvas. Khi phát hiện lỗi số học hoặc vi phạm quy chế quản trị, agent sử dụng Figma Native Dev Mode Annotations:
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

## 5. Rubric chấm điểm và điều kiện chặn
### Điều kiện chặn (trượt ngay nếu vi phạm):
1. Vi phạm quy tắc 4 mắt Maker-Checker trên màn hình quản trị (áp dụng cho Admin).
2. Thiếu checkbox Privacy Consent hoặc vi phạm PDPO trên form thu thập leads (áp dụng cho Admin và Landing).
3. Lỗi logic toán học nghiêm trọng (Unrealized P&L dương nhưng hiện màu đỏ) (áp dụng cho MTS và WTS).
4. Xuất hiện sổ lệnh lỗi Crossed Book (giá mua >= giá bán) (áp dụng cho MTS và WTS).
5. Rò rỉ phạm vi: phán xét padding hay gu thẩm mỹ của designer.

### Thang điểm nghiệm thu (thang 100):
- Toán học tài chính và tính toàn vẹn P&L: 35 điểm.
- Tuân thủ quy chế sàn (tick size và board lot): 25 điểm.
- Chuẩn hiển thị số 3-3-2 và minh bạch thuế phí: 20 điểm.
- Phân quyền an toàn Maker-Checker / cảnh báo rủi ro: 20 điểm.
- Ngưỡng đạt: >= 90/100 điểm.
