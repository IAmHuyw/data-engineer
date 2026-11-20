# Data Engineer Learning & Portfolio Repository (INDA Curriculum)

Kho lưu trữ toàn bộ lộ trình học tập, mã nguồn bài giảng, bài tập thực hành và 5 dự án thực chiến theo khung chương trình **Data Engineer (7 Học phần - 24 Tuần)**.

- **Lộ trình chi tiết 24 tuần:** [ROADMAP.md](./ROADMAP.md)
- **Database thực hành Ngân hàng (SQLite):** [datasets/inda_banking.db](./datasets/inda_banking.db)

---

## Cấu Trúc Thư Mục (Folder Structure)

```text
dataengineer/
├── README.md                          # Tổng quan kho lưu trữ & hướng dẫn chạy code
├── ROADMAP.md                         # Lộ trình học chi tiết 24 tuần (7 Học phần)
├── datasets/                          # Dữ liệu mẫu & Database thực hành dùng chung
│   └── inda_banking.db                # Database SQLite 6 bảng nghiệp vụ Ngân hàng
├── 01-sql-for-beginner/               # Học phần 1: SQL Cơ bản & Truy vấn nâng cao (8 bài)
│   ├── README.md                      # Đề cương & sơ đồ 6 bảng Ngân hàng
│   ├── schemas/                       # Script DDL khởi tạo bảng & dữ liệu mẫu
│   ├── lessons/                       # Code ví dụ theo từng bài học
│   └── exercises/                     # Bài tập tự luyện theo từng bài học
├── 02-python-for-beginner/            # Học phần 2: Lập trình Python, NumPy, Pandas (11 bài)
├── 03-advanced-sql-plsql/             # Học phần 3: Advanced SQL & Oracle PL/SQL (8 bài)
├── 04-data-warehouse-etl/             # Học phần 4: Xây dựng Data Warehouse & ETL (4 giai đoạn)
├── 05-data-modeling/                  # Học phần 5: Thiết kế Data Model Doanh nghiệp (7 bài)
├── 06-big-data-spark-airflow/         # Học phần 6: Big Data với Hadoop, Spark, Hive, Airflow (8 bài)
├── 07-aws-for-data-engineer/          # Học phần 7: Cloud Data Engineering trên AWS (8 bài)
└── projects/                          # 5 Dự án thực chiến (Portfolio Projects đưa vào CV)
```

---

## Hướng Dẫn Chạy Nhanh (Quick Start)

### 1. Chạy thử truy vấn SQL trên Terminal
```bash
cd /Users/huy/Documents/Dev/dataengineer
sqlite3 -header -column datasets/inda_banking.db < 01-sql-for-beginner/lessons/01_bai1_2_select_where_orderby.sql
```

### 2. Khởi tạo lại Database Ngân hàng về trạng thái ban đầu
```bash
sqlite3 datasets/inda_banking.db < 01-sql-for-beginner/schemas/01_init_banking_db.sql
```
