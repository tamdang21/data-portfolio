# Insight tóm tắt - Case study SQL BigQuery

## 1) Câu chuyện dự án
Dự án tập trung vào việc theo dõi hành vi người dùng và chất lượng tăng trưởng của ứng dụng.
Không chỉ dừng ở thống kê mô tả, phần phân tích còn đi sâu vào:
- retention
- quy tắc đếm access/session
- dấu hiệu lạm dụng trial
- phân nhóm giá trị khách hàng

## 2) Những điểm mạnh nên nhấn trong portfolio

### a. Không chỉ viết query đơn lẻ
Bạn đã xây dựng được các nhóm phân tích có logic nghiệp vụ rõ ràng:
- KPI vận hành
- retention
- fraud / suspicious behavior
- RFM segmentation

### b. Có tư duy business rule
Ví dụ: thay đổi định nghĩa `access` theo quy tắc 6 giờ.
Đây là điểm rất tốt vì cho thấy bạn không chỉ đếm dữ liệu thô, mà còn biết điều chỉnh metric để phản ánh hành vi thật.

### c. Có dùng kỹ thuật SQL nâng cao
Nên nhấn mạnh các kỹ thuật:
- `CTE`
- `JOIN`
- `WINDOW FUNCTIONS`
- `LAG()`
- `FIRST_VALUE()`
- `NTILE()`
- `DATE_DIFF()` / `TIMESTAMP_DIFF()`



> Đây là một case study SQL mình làm để mô phỏng quy trình phân tích hành vi người dùng trên BigQuery. Mình xây dựng truy vấn để đo KPI hằng ngày, tính retention, chuẩn hóa quy tắc tính access theo session 6 giờ, phát hiện hành vi đáng nghi và phân khúc khách hàng bằng RFM. Dự án thể hiện khả năng viết SQL, hiểu nghiệp vụ và chuyển yêu cầu phân tích thành logic dữ liệu rõ ràng.


