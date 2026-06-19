# E-commerce-Bookstore-Data-Analysis

Phân tích hơn 1.700 dòng dữ liệu từ 1 trang thương mại điện thử chuyên về bán sách.

Bộ dữ liệu sử dụng Python (pandas, numpy) để làm sạch, chuẩn hoá dữ liệu trước khi phân tích. Sử dụng matplotlib, scikit-learn để vẽ sơ đồ, khảo sát bộ dữ liệu trước khi đưa vào PowerBI để trực quan hoá bằng Dashboard

## 1.Giới thiệu dataset

- Chủ đề: E-commerce (Book product)
- Độ lớn: 1.700+ dòng dữ liệu 
- Nội dung: Dataset mô tả tổng số lượng sách bán được, rating, view, discount ... và các thông số đi kèm của các đầu sách của sàn TMDT Tada. Dataset cũng ghi nhận các lượt comment, rating người dùng dành cho dịch vụ vận chuyển sách của sàn TMDT. Vậy nên với dataset này, có thể chia làm 3 nội dung chính:
 + Báo cáo tổng quan về các chỉ số KPI 
 + Báo cáo chi tiết số liệu 3 phòng ban: marketing, sale, service
 + Recommend dành cho mỗi phòng ban dựa trên số liệu

<img width="1265" height="621" alt="Screenshot 2026-06-16 at 15 56 18" src="https://github.com/user-attachments/assets/59d4038a-108d-4ef1-b08a-31c43d25d312" />
  
## 2.Tech stack

- Excel: EDA sơ bộ dữ liệu, hiểu rõ các trường thông tin và nội dung dataset
- Python: làm sạch, chuẩn hoá dữ liệu theo mô hình Medallion (Bronze, Silver, Gold) và sử dụng thuật toán để tìm kiếm đặc trưng của sản phẩm sách tiềm năng nhất
- PowerBI: Trực quan hoá dữ liệu theo nhu cầu từng phòng ban

## 3.Problem
### 3.1 Define problems
Với dataset E-commerce Book Sales, có 2 tầng vấn đề cần nhận diện:
-Tầng quản trị (CEO): Không nắm rõ các chỉ số KPI
-Tầng thực thi (Manager, Lead): 
 + Sale: Không nắm rõ chi tiết các sản phẩm nào là trọng tâm để có kế hoạch kinh doanh cụ thể.
 + Marketing: Không rõ chiến lược discount có khả thi không ?
 + Service: Không nắm rõ phản hồi từ khách hàng về dịch vụ vận chuyển của sàn TMDT
   <img width="1447" height="861" alt="57b39425-c7f9-4a89-ae29-63971fdde14d" src="https://github.com/user-attachments/assets/fa5d5a44-9e1c-46f3-b94e-9e31f2a7dc41" />


### 3.2 Câu hỏi insight
Từ các vấn đề đã được nêu, dataset sẽ tập trung vào 3 câu hỏi insight
-Đâu là yếu tố chính quyết định 1 đầu sách được top sale ?
-Đâu là mức chi phí discount tối ưu cho kênh marketing ?
-Người mua hàng đang nói gì về dịch vụ vận chuyển của sàn ?

<img width="1176" height="402" alt="Screenshot 2026-06-17 at 20 40 35" src="https://github.com/user-attachments/assets/23224825-c11a-4705-bbbe-f1f9d9583cc7" />

## 4.Work flow
### 4.1 Cleaning
-Sử dụng Python để tách dataset làm 2 phần: Bronze - Silver - Gold. 

-Dataset bronze: giữ nguyên gốc dataset 

-Dataset silver: Chuẩn hoá chính tả, fill null, loại bỏ duplicate

-Dataset gold: Thêm các trường thông tin phụ như: discount percentage, revenue ...

### 4.2 EDA 
-Sử dụng Excel, Python để khám phá dữ liệu ở mức cơ bản, hiểu các thông số và thuộc tính của từng cột

-Sử dụng Scikit-learn Python để xác định các yếu tố quyết định 1 đầu sách có bán chạy hay không

-Sử dụng SQL phân tích và kiểm tra các chỉ số về sale, discount, top nhà xuất bản, top sách bán chạy ....

### 4.3 Visualization
-Sử dụng PowerBI để visualize dữ liệu theo các câu hỏi insight đã đề cập


## 5.Kết quả đạt được & Recommendation
### 5.1 Sale
Dựa vào hệ số feature importance của model Regression, có 3 yếu tố ảnh hưởng mạnh nhất đến Revenue là: Review, Rating và Discount. Điều này đồng nghĩa với nếu tăng được lượng review của sách, tăng số lượng rating tốt (4-5 điểm) cùng với chính sách discount hợp lý thì hoàn toàn có thể push sale được.
<ảnh>

### Hành động recommend
-Gửi thông báo khuyến khích khách hàng review + rating sách sau khi mua hàng từ 10-15 ngày. Mỗi review/rating sẽ được 01 voucher giảm giá 5-10% cho lần mua hàng kế tiếp.

-Tri ân top review: Tri ân 1 phần quà trị giá 500.000đ cho top 1 reviewer mỗi tháng

-Tạo banner giới thiệu các loại sách được top review/rating. Banner có thể thay đổi nội dung sau mỗi 3 ngày.
<ảnh>

### Category tiềm năng
-Top 5 category dưới đây vừa có doanh thu thuộc top, vừa có số lượng bán thuộc top sàn TMDT. Đây chính là top category tiềm năng cho các nhà bán hàng trên TMDT có thể nhập theo các đầu sách trên để tăng doanh thu
<ảnh>
-Thêm vào đó, tệp sách có giá bìa từ 100-250.000đ là tập sách có số lượng bán tốt nhất
<ảnh>
### Hành động recommend
-Với sale team, hãy cố gắng nhập các đầu sách tương ứng với 5 category đang bán chạy nhất và giá bìa sách trong khoảng từ 100-250.000đ để tối ưu chi phí cũng như khả năng gia tăng doanh thu

### 5.2 Marketing
Số liệu đã chỉ ra rằng đối với danh mục discount, mức tối ưu cho discount chỉ nằm trong khoảng từ 15-45%. Khi vượt quá 45%, doanh thu ghi nhận không có sự tăng trưởng vượt. Điều này phù hợp với mô hình feature importance: Discount chỉ là 1 trong 3 yếu tố thúc đẩy doanh số và số lượng bán của sách.
<ảnh>

### Hành động recommend
Với các đầu sách có discount > 45%, thay vì tiếp tục tăng discount, hãy chuyển sang chiến lược gia tăng review và rating ( tối thiểu 4.5 rating và > 200 review ). Thay vì sử dụng ngân sách cho discount, hãy khuyến khích người mua rating, review sách bằng các loại voucher giảm giá, freeship ...
<ảnh>

### 5.3 Delivery service
-Với dịch vụ vận chuyển, team vận chuyển đang đối mặt với 3 vấn đề: 
 +Sách bị móp méo, cong vênh khi giao
 +Thiếu hàng hoặc giao nhầm hàng
 +Giao hàng chậm hơn 1-3 ngày so với dự kiến

### Hành động recommend
Vì đây là sàn TMDT và dịch vụ vận chuyển được thực hiện bởi các công ty chuyên về vận chuyển, vì vậy hãy feedback lại các vấn đề về dịch vụ đối với các nhà cung cấp để họ tự điều chỉnh. Hãy theo dõi thêm 1-3 tháng nữa, nếu vấn đề tiếp tục phát sinh, có thể cân nhắc chuyển qua các nhà cung cấp dịch vụ vận chuyển khác.



