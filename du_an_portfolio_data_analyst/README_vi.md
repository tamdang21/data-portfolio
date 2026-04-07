# Portfolio dự án Data Analyst (bản tiếng Việt)

Mình đã tổng hợp các file bạn gửi thành một bộ portfolio có thể dùng ngay.

## Cấu trúc thư mục
- `notebooks/01_du_an_kinh_te_tai_chinh.ipynb`
- `notebooks/02_du_an_thi_truong_ung_dung.ipynb`
- `notebooks/03_du_an_hieu_qua_tai_chinh_phim.ipynb`
- `notebooks/04_case_study_sql_bigquery.ipynb`
- `html/` : bản HTML đã export sẵn để mở nhanh
- `data/` : dữ liệu gốc đi kèm

## Dự án nào đã hoàn chỉnh?
### 1) Phân tích kinh tế vĩ mô và thị trường tài chính
- Có code
- Có biểu đồ
- Có output
- Dùng được cho portfolio ngay

### 2) Phân tích thị trường ứng dụng di động
- Có code
- Có làm sạch dữ liệu
- Có so sánh Android vs iOS
- Có đề xuất nhóm app tiềm năng
- Dùng được cho portfolio ngay

### 3) Phân tích hiệu quả tài chính phim
- Có code
- Có output
- Có biểu đồ
- Dùng được như mini-project định lượng
- Để mạnh hơn nữa nên bổ sung metadata phim (title, genre, release_date)

### 4) SQL BigQuery case study
- Đã tổng hợp thành notebook tài liệu hóa
- Có truy vấn SQL
- Chưa có output thực tế vì thiếu bảng nguồn
- Vẫn dùng được trong portfolio để chứng minh tư duy SQL

## Những dữ liệu còn thiếu
### Để tái tạo đầy đủ tất cả bài DataCamp trong ảnh
Hiện còn thiếu các bảng sau:
- `inflation`
- `unemployment`
- `recession`
- `jpm`
- `wells`
- `bac`
- `dji`
- `ten_yr`

### Để chạy được case study BigQuery
Cần có raw tables hoặc file xuất dữ liệu cho:
- `events`
- `user_info`
- `geography`

### File chưa có trong thư mục hiện tại
- `Mission350Solutions (1)` chưa được upload nên mình chưa thể đối chiếu chính xác.
- Mình đã dựng lại một project DataQuest hoàn chỉnh từ `AppleStore.csv` và `googleplaystore.csv` để bạn vẫn có một dự án mạnh dùng ngay.

## Gợi ý dùng cho CV
Bạn có thể chọn 2-3 dự án mạnh nhất để đưa vào CV:
1. Phân tích thị trường ứng dụng di động
2. Phân tích kinh tế vĩ mô và thị trường tài chính
3. SQL BigQuery case study

## Cách mở file
- Nếu muốn xem nhanh: mở file trong thư mục `html/`
- Nếu muốn chỉnh sửa / học tiếp: mở file `.ipynb` trong Jupyter Notebook hoặc VS Code