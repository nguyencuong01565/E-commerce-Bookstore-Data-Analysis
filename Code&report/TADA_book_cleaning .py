import pandas as pd
import seaborn as sb
import numpy as np

#File csv đã được lọc
TADA_book = pd.read_csv("book_prepared_dataset.csv")
print(TADA_book.head(10))
print(TADA_book.info())
print(TADA_book.isnull().sum())
print(TADA_book.shape)

#File csv chưa được lọc
TADA_book2 = pd.read_csv("book_data.csv")



#Loại bỏ duplicate, giá trị null, cột dư thừa
TADA_book = TADA_book.drop_duplicates()
TADA_book = TADA_book.drop("cover_link", axis=1)
TADA_book = TADA_book.drop("pages", axis=1)
TADA_book = TADA_book.drop("discount", axis=1)
TADA_book = TADA_book.dropna()

#Kiểm tra giá trị từng cột.
TADA_book["category"].value_counts()
TADA_book["manufacturer"].value_counts()
TADA_book["original_price"].unique()

#Chuẩn hoá dữ liệu văn bản
TADA_book["category"] = TADA_book["category"].str.strip().str.title()
TADA_book["manufacturer"] = TADA_book["manufacturer"].str.strip().str.title()
TADA_book["authors"] = TADA_book["authors"].str.strip().str.title()

#Mapping giá từ Usd ở Dataframe TADA_book = giá vnd của Dataframe TADA_book2
TADA_book["original_price"] = TADA_book["product_id"].map(
    TADA_book2.drop_duplicates("product_id").set_index("product_id")["original_price"]
)
TADA_book["current_price"] = TADA_book["product_id"].map(
    TADA_book2.drop_duplicates("product_id").set_index("product_id")["current_price"]
)

TADA_book["current_price"].unique()
TADA_book["original_price"].unique()

#Thêm các cột thông tin mới
TADA_book["discount_percentage"] = 0.0
mask = TADA_book["original_price"] > 0
TADA_book.loc[mask, "discount_percentage"] = round(((TADA_book["original_price"] - TADA_book["current_price"])/TADA_book["original_price"])*100, 2)

TADA_book["Revenue"] = TADA_book["current_price"] * TADA_book["quantity"]

#Xuất file excel để kiểm tra
with pd.ExcelWriter("Book_clean_dataset.xlsx", engine="xlsxwriter") as writer:
    TADA_book.to_excel(writer, sheet_name="data_book", index=False)

#Xuất file csv 
TADA_book.to_csv("Book_clean_dataset.csv", index=False)







