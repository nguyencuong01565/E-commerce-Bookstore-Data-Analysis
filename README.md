# E-commerce-Bookstore-Data-Analysis

Vietnam E-commerce Book Sales Analysis
Analyzed 1,700+ book sales records from a Vietnamese e-commerce platform to identify revenue drivers, customer preferences, and opportunities for sales optimization.

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

3.Key Findings
- Identified the top three publishers contributing the highest revenue and the best-performing book titles within each publisher portfolio.
- Determined the five highest-selling book categories, revealing current market demand trends.
- Found evidence of inefficient marketing spend allocation, with higher discount rates not consistently translating into stronger sales performance.
- Identified customer rating and review volume as the two factors most strongly associated with book sales performance.

**4. Recommendations**
- Prioritize inventory expansion within the five best-selling categories and strengthen partnerships with high-performing publishers. Estimated revenue uplift: 10–15% within the next six months.
- Implement customer engagement campaigns aimed at increasing book ratings and review volume, targeting an average rating **above 4.5** and **at least 200 customer reviews** per book's title.
- Optimize discount strategies **within the 15–45% range**. For titles already exceeding 45% discount levels, focus on improving customer perception and engagement rather than increasing discounts further.
- Improve packaging and delivery handling procedures to reduce product damage during shipping, thereby minimizing low-rating feedback associated with delivery quality.





