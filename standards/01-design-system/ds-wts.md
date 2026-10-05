# 🖥️ TIÊU CHUẨN DESIGN SYSTEM DÀNH CHO WTS (WEB WORKSTATION)
## WEB TRADING WORKSTATION COMPONENT SPECIFICATIONS (LEVEL 1)

> **Cổng thẩm định**: GATE 1 (DS-Audit)  
> **Dự án áp dụng**: Web Trading Workstations & Desktop Trading Terminals.

---

## 🧩 1. DANH MỤC MASTER COMPONENTS BẮT BUỘC DÙNG
1. **`WTS-Split-Workspace`**: Component phân khung kéo thả (CSS Split Grid), lưu trữ trạng thái layout vào `localStorage`.
2. **`WTS-OrderBook-Ladder`**: Component sổ lệnh Level 2 hiển thị 10 bước giá Bid/Ask kèm thanh độ sâu khối lượng nền (Depth volume bars).
3. **`WTS-HighDensity-Table`**: Bảng dữ liệu giao dịch mật độ cao, tích hợp tính năng ghim cột (`Sticky Col`), đổi cỡ chữ nhanh và căn lề số học.
4. **`WTS-Hotkey-Badge`**: Nhãn chỉ dẫn phím tắt gắn trên góc các nút bấm (`[F1]`, `[F2]`, `[Esc]`, `[Space]`).
5. **`WTS-Status-Bar`**: Dòng trạng thái ở đáy màn hình hiển thị ping latency (ms), kết nối WebSocket, và thời gian thị trường Sở (Market Clock).

---

## 🎨 2. QUY CHUẨN TOKEN RIÊNG CHO WTS
* `table-row-compact`: `--wts-row-height: 28px`.
* `border-panel-hairline`: `--wts-border-hairline: 1px solid rgba(255, 255, 255, 0.08)`.
* `depth-bid-bg`: `--wts-depth-bid-color: rgba(16, 185, 129, 0.15)`.
* `depth-ask-bg`: `--wts-depth-ask-color: rgba(239, 68, 68, 0.15)`.
