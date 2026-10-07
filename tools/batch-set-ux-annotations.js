const annotationsMap = [
  {
    nodeId: "25493:76949",
    name: "A00 – Analytics Dashboard",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (60/100 - WARNING)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **State Persistence**: Cần sync khoảng ngày lọc (\`01 Sep 2026 → 29 Sep 2026\`) lên URL query params để chia sẻ view quản trị và tránh mất bộ lọc khi F5.
- **Empty State**: Thiếu thiết kế Zero-data khi khoảng ngày được chọn chưa có dữ liệu traffic.
- **Skeleton Loading**: Các widget KPI và Chart cần khung Skeleton xám nhấp nháy trong lúc query dữ liệu nặng.`
  },
  {
    nodeId: "25493:60176",
    name: "A01 – Corporate Web Pages (Page List)",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (35/100 - FAIL [CRITICAL])
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Checkbox bị ẩn**: Checkbox ở Header và Row đang ở trạng thái \`hidden="true"\`, người dùng không thể chọn dòng để thao tác.
- 🚨 **Bulk Operations**: Thiếu hoàn toàn component **Floating Bulk Action Bar** để *Xuất bản / Gỡ / Xóa / Gán nhãn hàng loạt*.
- 🚨 **Destructive Safety**: Nút \`Delete\` nằm trần dạng text link đỏ trong bảng, thiếu **Destructive Confirmation Modal 2 bước + Nhập lý do (Audit Trail)**.
- **Empty State**: Thiếu giao diện khi kết quả tìm kiếm/lọc trả về 0 kết quả.`
  },
  {
    nodeId: "25493:83896",
    name: "A01 – Corporate Web Pages_ Create Modal",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (90/100 - PASS)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- ✅ **Emergency Exit**: ĐẠT - Hỗ trợ đủ 3 lối thoát an toàn (Close \`[×]\`, nút Cancel, Scrim backdrop).
- ✅ **Non-disabled CTA**: Nút \`Create & Open Editor\` luôn active, có helper text cụ thể cho từng trường.
- ✅ **Poka-Yoke Slug**: Có preview đường dẫn trực tiếp và kiểm tra tính duy nhất theo Region/Language.
- 💡 **Khuyến nghị**: Bổ sung popup cảnh báo *"Unsaved Changes"* nếu người dùng bấm ra ngoài Scrim khi đã nhập dữ liệu dở.`
  },
  {
    nodeId: "25502:39392",
    name: "A02 – Pages / Page Editor",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (65/100 - WARNING)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- ✅ **Navigation**: Có Breadcrumb định vị rõ ràng (\`Dashboard / Corporate Web Pages / Home Page / Edit\`).
- 🚨 **Poka-Yoke [CRITICAL]**: Cần Dialog cảnh báo mất dữ liệu (Unsaved Changes Guard) khi admin click Breadcrumb hoặc chuyển menu mà chưa bấm lưu.
- **Auto-save Feedback**: Cần hiển thị rõ trạng thái lưu nháp thời gian thực (*"Draft auto-saved 2m ago"*).`
  },
  {
    nodeId: "25493:94162",
    name: "A03 – Campaigns",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (35/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Destructive Safety**: Nút \`Delete\` nằm trần dạng text link trong bảng (\`Sustainable Investing\`). Bắt buộc có Modal 2 bước + Nhập lý do xóa.
- 🚨 **Bulk Operations**: Thiếu Checkbox khả dụng và Floating Bulk Action Bar cho các chiến dịch.
- **Empty State**: Thiếu thiết kế khi chưa có chiến dịch nào được khởi tạo.`
  },
  {
    nodeId: "25493:98800",
    name: "A04 – Banners & Popups",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (35/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Destructive Safety**: Thao tác xóa banner ảnh hưởng trực tiếp đến người dùng bên ngoài, cần Modal xác nhận an toàn kèm cảnh báo phạm vi.
- 🚨 **Bulk Operations**: Thiếu Floating Action Bar để Bật/Tắt (Toggle Active) hàng loạt banner.`
  },
  {
    nodeId: "25504:47809",
    name: "A05 – Media Library / Publishing",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (40/100 - FAIL [CRITICAL])
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Destructive Safety [CRITICAL]**: Có tác vụ \`DELETE / RESTORE\` và \`Unpublish At\`, bắt buộc phải có Modal xác nhận kèm trường nhập lý do để lưu vết kiểm toán (Audit Trail).
- 🚨 **Bulk Management**: Thiếu Floating Action Bar để chọn nhiều file di chuyển thư mục hoặc xóa hàng loạt.
- **Upload UX**: Bổ sung khu vực kéo thả (Drag & Drop zone) kèm progress bar hiển thị dung lượng.`
  },
  {
    nodeId: "25504:49986",
    name: "A06 – SEO & Analytics / Localization",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (60/100 - WARNING)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **Cognitive Load**: Form cấu hình dài nhiều trường, cần chia accordion hoặc tab giảm tải nhận thức (Hick's Law).
- **Character Count**: Cần hiển thị đếm số ký tự thời gian thực cho Meta Title (<= 60) và Meta Description (<= 160).`
  },
  {
    nodeId: "25504:51594",
    name: "A07 – Workflow / Approval",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (30/100 - FAIL [CRITICAL])
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Từ chối âm thầm [CRITICAL]**: Nút \`Reject\` nằm trực tiếp cạnh \`Approve\`. **BẮT BUỘC phải mở Modal yêu cầu nhập lý do từ chối (Rejection Reason)**, tuyệt đối không được từ chối âm thầm.
- 🚨 **Bulk Approval**: Cần Floating Action Bar để cấp quản lý duyệt/từ chối nhanh nhiều đầu mục mà không phải bấm từng dòng.
- **Audit Trail**: Cần hiển thị Timeline lịch sử xét duyệt rõ ràng trên drawer chi tiết.`
  },
  {
    nodeId: "25504:53465",
    name: "A08 – Roles & Permissions",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (35/100 - FAIL [CRITICAL])
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **High-Impact Friction [CRITICAL]**: Nút \`Save Permissions\` và hành động thu hồi quyền quản trị bắt buộc có Modal tóm tắt phân quyền thay đổi trước khi ghi đè.
- 🚨 **Unsaved Guard**: Cảnh báo khi người dùng rời tab phân quyền mà chưa bấm lưu ma trận quyền.
- **Bulk Assignment**: Hỗ trợ gán vai trò hàng loạt cho danh sách người dùng.`
  },
  {
    nodeId: "25504:57810",
    name: "A09 – Structured Content",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (40/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **Destructive Safety**: Xóa dữ liệu có cấu trúc cần modal xác nhận tránh hỏng dữ liệu liên kết.
- **Bulk Actions**: Thiếu Floating Action Bar cho các bản ghi nội dung được chọn.`
  },
  {
    nodeId: "25493:79195",
    name: "A10 – Forms & Leads",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (35/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **Destructive Safety**: Thao tác đóng form hoặc xóa lead khách hàng cần hộp thoại xác nhận có giải thích.
- **Bulk Export / Reassign**: Bảng danh sách lead cần thanh Floating Bar cho phép Xuất Excel hàng loạt hoặc Chuyển giao tư vấn viên hàng loạt.`
  },
  {
    nodeId: "25504:63264",
    name: "A11 – Legal & Compliance",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (40/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **Destructive Action**: Thu hồi văn bản pháp lý đang áp dụng cần lưu vết kiểm toán và lý do bắt buộc.
- **Version Switcher**: Cần cảnh báo Poka-Yoke khi người dùng thao tác chỉnh sửa trên phiên bản văn bản cũ (Archived version).`
  },
  {
    nodeId: "25504:67455",
    name: "A12 – Search & Discovery",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (40/100 - FAIL)
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- **Destructive Safety**: Xóa quy tắc tìm kiếm / từ đồng nghĩa cần modal xác nhận an toàn.
- **Empty State**: Thiết kế màn hình kết quả tìm kiếm không có dữ liệu (Empty State) kèm gợi ý từ khóa.`
  },
  {
    nodeId: "25506:71009",
    name: "A13 – Common Components & Links",
    markdown: `### 🧠 GATE 3: UX & USABILITY AUDIT (40/100 - FAIL [CRITICAL])
- **Ticket**: \`TASK-20261007-093124-UX-AUDIT\`
- 🚨 **Global Impact Warning [CRITICAL]**: Chỉnh sửa link toàn cục ảnh hưởng đến toàn bộ website, cần Modal cảnh báo phạm vi ảnh hưởng (Impact Scope Dialog) liệt kê số lượng trang sẽ bị thay đổi.
- **Bulk Operations**: Thiếu Floating Action Bar cho thao tác kích hoạt/ngưng sử dụng hàng loạt component.`
  }
];

module.exports = { annotationsMap };
