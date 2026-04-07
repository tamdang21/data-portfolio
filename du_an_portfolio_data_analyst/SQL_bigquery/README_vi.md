# Dự án  - Case study phân tích người dùng bằng SQL (BigQuery)


## 1) Mục tiêu dự án
Xây dựng một case study phân tích dữ liệu người dùng/app bằng BigQuery nhằm:
- đo lường số người dùng hằng ngày và tổng lượt truy cập
- phân tích theo nền tảng và quốc gia
- tính retention rate
- chuẩn hóa lại định nghĩa `access`
- phát hiện dấu hiệu lạm dụng trial / hành vi bất thường
- phân khúc khách hàng bằng mô hình RFM

---

## 2) Dữ liệu sử dụng
dự án dùng 3 bảng chính:
- `events`
- `user_info`
- `geography`


## 3) Cấu trúc thư mục
- `sql/01_kpi_co_ban.sql`: KPI cơ bản theo ngày, platform, quốc gia
- `sql/02_retention_rate.sql`: tính retention theo day 0
- `sql/03_phat_hien_lam_dung_trial.sql`: logic phát hiện hành vi đáng nghi
- `sql/04_tinh_lai_access_theo_quy_tac_6h.sql`: chuẩn hóa lại access theo session 6 giờ
- `sql/05_phan_khuc_khach_hang_rfm.sql`: phân nhóm khách hàng theo RFM
- `assets/dashboard_minh_hoa.png`: ảnh dashboard mẫu
- `INSIGHT_TOM_TAT_vi.md`: bản tóm tắt insight và cách kể câu chuyện dự án

---

## 4) Công cụ sử dụng
- BigQuery / Standard SQL
- Looker Studio (hoặc Data Studio) để dựng dashboard
- Google Sheets / Excel (nếu cần kiểm tra nhanh output)

---



