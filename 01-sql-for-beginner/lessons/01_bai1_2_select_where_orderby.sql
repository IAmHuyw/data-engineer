-- ============================================================================
-- HỌC PHẦN 1 - BÀI 1 & BÀI 2: LÝ THUYẾT & VÍ DỤ MẪU
-- Nội dung: SELECT, WHERE, ORDER BY, DISTINCT, ALIAS
-- Chạy thử:
-- sqlite3 -header -column ../../datasets/inda_banking.db < 01_bai1_2_select_where_orderby.sql
-- ============================================================================

-- 1. Truy vấn đơn giản + Đặt tên cột hiển thị (ALIAS với AS)
SELECT
    customer_id  AS ma_khach_hang,
    full_name    AS ten_khach_hang,
    city         AS thanh_pho,
    segment      AS phan_khuc,
    credit_score AS diem_tin_dung
FROM CUSTOMERS;

-- 2. Loại bỏ dữ liệu trùng lặp (DISTINCT)
SELECT DISTINCT
    city,
    segment
FROM CUSTOMERS
ORDER BY city ASC;

-- 3. Lọc dữ liệu nâng cao với WHERE (AND, OR, IN, BETWEEN)
SELECT
    customer_id,
    full_name,
    city,
    segment,
    credit_score
FROM CUSTOMERS
WHERE segment IN ('VIP', 'SME')
  AND city IN ('Hà Nội', 'TP.HCM')
  AND credit_score >= 700
ORDER BY credit_score DESC;

-- 4. Tìm kiếm theo mẫu chuỗi (LIKE) và kiểm tra giá trị rỗng (IS NOT NULL)
SELECT
    customer_id,
    full_name,
    birth_date,
    segment
FROM CUSTOMERS
WHERE birth_date IS NOT NULL
  AND full_name LIKE 'Nguyễn%';
