-- ============================================================================
-- INDA DATA ENGINEER - HỌC PHẦN 1: SQL FOR BEGINNER
-- Cơ sở dữ liệu thực hành: Hệ thống Ngân hàng (Core Banking Mini)
-- Gồm 6 bảng liên kết: BRANCHES, EMPLOYEES, CUSTOMERS, ACCOUNTS, TRANSACTIONS, LOANS
-- ============================================================================

DROP TABLE IF EXISTS TRANSACTIONS;
DROP TABLE IF EXISTS LOANS;
DROP TABLE IF EXISTS ACCOUNTS;
DROP TABLE IF EXISTS CUSTOMERS;
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS BRANCHES;

-- 1. Bảng Chi nhánh ngân hàng (BRANCHES)
CREATE TABLE BRANCHES (
    branch_id        VARCHAR(10) PRIMARY KEY,
    branch_name     VARCHAR(100) NOT NULL,
    city            VARCHAR(50) NOT NULL,
    region          VARCHAR(20) NOT NULL,
    opened_date     DATE
);

-- 2. Bảng Nhân viên quản lý (EMPLOYEES)
CREATE TABLE EMPLOYEES (
    emp_id          VARCHAR(10) PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    position        VARCHAR(50) NOT NULL,
    salary          DECIMAL(15, 2) NOT NULL,
    hire_date       DATE NOT NULL,
    branch_id       VARCHAR(10) NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES BRANCHES(branch_id)
);

-- 3. Bảng Khách hàng (CUSTOMERS)
CREATE TABLE CUSTOMERS (
    customer_id     VARCHAR(10) PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    gender          VARCHAR(10),
    birth_date      DATE,
    city            VARCHAR(50),
    segment         VARCHAR(20) NOT NULL, -- Retail, VIP, Corporate, SME
    credit_score    INT,
    rm_emp_id       VARCHAR(10),          -- Nhân viên quản lý (Relationship Manager)
    created_at      DATE NOT NULL,
    FOREIGN KEY (rm_emp_id) REFERENCES EMPLOYEES(emp_id)
);

-- 4. Bảng Tài khoản ngân hàng (ACCOUNTS)
CREATE TABLE ACCOUNTS (
    account_id      VARCHAR(15) PRIMARY KEY,
    customer_id     VARCHAR(10) NOT NULL,
    branch_id       VARCHAR(10) NOT NULL,
    account_type    VARCHAR(20) NOT NULL, -- Checking, Savings, Payroll
    balance         DECIMAL(18, 2) NOT NULL DEFAULT 0,
    interest_rate   DECIMAL(5, 2) DEFAULT 0,
    status          VARCHAR(15) NOT NULL, -- Active, Dormant, Frozen
    opened_date     DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCHES(branch_id)
);

-- 5. Bảng Lịch sử Giao dịch (TRANSACTIONS)
CREATE TABLE TRANSACTIONS (
    txn_id          VARCHAR(15) PRIMARY KEY,
    account_id      VARCHAR(15) NOT NULL,
    txn_date        DATETIME NOT NULL,
    txn_type        VARCHAR(20) NOT NULL, -- Deposit, Withdrawal, Transfer, Fee
    amount          DECIMAL(18, 2) NOT NULL,
    channel         VARCHAR(20) NOT NULL, -- Mobile App, ATM, Counter, Web
    status          VARCHAR(15) NOT NULL, -- Success, Failed, Pending
    description     VARCHAR(200),
    FOREIGN KEY (account_id) REFERENCES ACCOUNTS(account_id)
);

-- 6. Bảng Khoản vay tín dụng (LOANS)
CREATE TABLE LOANS (
    loan_id         VARCHAR(15) PRIMARY KEY,
    customer_id     VARCHAR(10) NOT NULL,
    branch_id       VARCHAR(10) NOT NULL,
    loan_type       VARCHAR(30) NOT NULL, -- Mortgage, Auto, Personal, Business
    principal_amt   DECIMAL(18, 2) NOT NULL,
    interest_rate   DECIMAL(5, 2) NOT NULL,
    term_months     INT NOT NULL,
    start_date      DATE NOT NULL,
    loan_status     VARCHAR(20) NOT NULL, -- Active, Closed, Overdue, Bad Debt
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (branch_id) REFERENCES BRANCHES(branch_id)
);

-- ============================================================================
-- NẠP DỮ LIỆU MẪU (SEED DATA)
-- ============================================================================

INSERT INTO BRANCHES VALUES
('BR01', 'CN Thanh Xuân', 'Hà Nội', 'Miền Bắc', '2018-03-15'),
('BR02', 'CN Hoàn Kiếm', 'Hà Nội', 'Miền Bắc', '2015-01-10'),
('BR03', 'CN Quận 1', 'TP.HCM', 'Miền Nam', '2016-06-20'),
('BR04', 'CN Tân Bình', 'TP.HCM', 'Miền Nam', '2019-09-01'),
('BR05', 'CN Hải Châu', 'Đà Nẵng', 'Miền Trung', '2020-02-14');

INSERT INTO EMPLOYEES VALUES
('EMP01', 'Nguyễn Văn An', 'Trưởng phòng KHCN', 35000000, '2018-04-01', 'BR01'),
('EMP02', 'Trần Thị Bình', 'Chuyên viên QHKH VIP', 25000000, '2019-07-15', 'BR01'),
('EMP03', 'Lê Hoàng Cường', 'Chuyên viên QHKH Doanh nghiệp', 28000000, '2017-02-10', 'BR02'),
('EMP04', 'Phạm Minh Dung', 'Chuyên viên QHKH VIP', 26000000, '2018-11-20', 'BR03'),
('EMP05', 'Hoàng Đức Em', 'Chuyên viên QHKH Cá nhân', 18000000, '2021-03-05', 'BR03'),
('EMP06', 'Vũ Thị Phương', 'Chuyên viên Tín dụng', 22000000, '2020-08-12', 'BR04'),
('EMP07', 'Đặng Quốc Gia', 'Trưởng chi nhánh', 45000000, '2020-02-01', 'BR05');

INSERT INTO CUSTOMERS VALUES
('KH001', 'Nguyễn Minh Tuấn', 'Nam', '1988-05-12', 'Hà Nội', 'VIP', 780, 'EMP02', '2019-08-01'),
('KH002', 'Trần Thu Hà', 'Nữ', '1995-10-23', 'Hà Nội', 'Retail', 690, 'EMP01', '2020-03-15'),
('KH003', 'Công ty TNHH Sao Việt', NULL, NULL, 'Hà Nội', 'Corporate', 820, 'EMP03', '2018-06-10'),
('KH004', 'Lê Quang Hải', 'Nam', '1992-01-30', 'TP.HCM', 'VIP', 750, 'EMP04', '2019-12-05'),
('KH005', 'Phạm Hương Giang', 'Nữ', '1998-07-19', 'TP.HCM', 'Retail', 620, 'EMP05', '2021-05-20'),
('KH006', 'Đỗ Hoàng Nam', 'Nam', '1985-11-04', 'TP.HCM', 'SME', 710, 'EMP06', '2020-10-11'),
('KH007', 'Võ Thị Tuyết', 'Nữ', '1990-04-25', 'Đà Nẵng', 'Retail', 540, 'EMP07', '2022-01-18'),
('KH008', 'Bùi Anh Đức', 'Nam', '1982-09-14', 'Hà Nội', 'VIP', 810, 'EMP02', '2018-09-09'),
('KH009', 'Ngô Thanh Vân', 'Nữ', '1993-12-01', 'TP.HCM', 'SME', 680, 'EMP04', '2021-08-22'),
('KH010', 'Đinh Trọng Nhân', 'Nam', '2000-02-28', 'Đà Nẵng', 'Retail', 590, 'EMP07', '2023-04-10');

INSERT INTO ACCOUNTS VALUES
('ACC1001', 'KH001', 'BR01', 'Checking', 150000000, 0.50, 'Active', '2019-08-01'),
('ACC1002', 'KH001', 'BR01', 'Savings', 1200000000, 6.20, 'Active', '2020-01-15'),
('ACC1003', 'KH002', 'BR01', 'Checking', 25000000, 0.50, 'Active', '2020-03-15'),
('ACC1004', 'KH003', 'BR02', 'Checking', 3500000000, 0.80, 'Active', '2018-06-10'),
('ACC1005', 'KH004', 'BR03', 'Checking', 85000000, 0.50, 'Active', '2019-12-05'),
('ACC1006', 'KH004', 'BR03', 'Savings', 800000000, 6.00, 'Active', '2021-02-10'),
('ACC1007', 'KH005', 'BR03', 'Payroll', 12000000, 0.50, 'Active', '2021-05-20'),
('ACC1008', 'KH006', 'BR04', 'Checking', 420000000, 0.50, 'Active', '2020-10-11'),
('ACC1009', 'KH007', 'BR05', 'Checking', 3500000, 0.50, 'Frozen', '2022-01-18'),
('ACC1010', 'KH008', 'BR01', 'Savings', 2500000000, 6.50, 'Active', '2018-09-09'),
('ACC1011', 'KH009', 'BR03', 'Checking', 190000000, 0.50, 'Active', '2021-08-22'),
('ACC1012', 'KH010', 'BR05', 'Payroll', 500000, 0.50, 'Dormant', '2023-04-10');

INSERT INTO TRANSACTIONS VALUES
('TXN0001', 'ACC1001', '2026-10-01 09:15:00', 'Deposit', 50000000, 'Counter', 'Success', 'Nộp tiền mặt tại quầy'),
('TXN0002', 'ACC1001', '2026-10-05 14:20:00', 'Transfer', 15000000, 'Mobile App', 'Success', 'Chuyển khoản thanh toán'),
('TXN0003', 'ACC1002', '2026-10-10 10:00:00', 'Deposit', 200000000, 'Mobile App', 'Success', 'Gửi tiết kiệm online'),
('TXN0004', 'ACC1003', '2026-10-12 18:45:00', 'Withdrawal', 5000000, 'ATM', 'Success', 'Rút tiền ATM'),
('TXN0005', 'ACC1004', '2026-10-15 11:30:00', 'Transfer', 850000000, 'Web', 'Success', 'Thanh toán hợp đồng nhà cung cấp'),
('TXN0006', 'ACC1005', '2026-10-18 20:10:00', 'Transfer', 25000000, 'Mobile App', 'Success', 'Chuyển tiền liên ngân hàng'),
('TXN0007', 'ACC1007', '2026-10-20 08:05:00', 'Deposit', 18000000, 'Web', 'Success', 'Nhận lương tháng 10'),
('TXN0008', 'ACC1007', '2026-10-21 12:15:00', 'Withdrawal', 2000000, 'ATM', 'Failed', 'Lỗi kết nối ATM'),
('TXN0009', 'ACC1008', '2026-10-25 15:40:00', 'Transfer', 120000000, 'Mobile App', 'Success', 'Thanh toán lô hàng'),
('TXN0010', 'ACC1009', '2026-10-28 09:00:00', 'Withdrawal', 10000000, 'Counter', 'Failed', 'Tài khoản đang bị phong tỏa'),
('TXN0011', 'ACC1010', '2026-11-01 10:30:00', 'Deposit', 500000000, 'Counter', 'Success', 'Nộp tiền tiết kiệm VIP'),
('TXN0012', 'ACC1011', '2026-11-05 16:00:00', 'Fee', 55000, 'Mobile App', 'Success', 'Phí quản lý tài khoản');

INSERT INTO LOANS VALUES
('LN001', 'KH001', 'BR01', 'Mortgage', 3000000000, 8.50, 180, '2021-06-01', 'Active'),
('LN002', 'KH002', 'BR01', 'Personal', 100000000, 12.00, 24, '2023-01-15', 'Closed'),
('LN003', 'KH003', 'BR02', 'Business', 10000000000, 7.80, 60, '2022-03-10', 'Active'),
('LN004', 'KH004', 'BR03', 'Auto', 900000000, 9.20, 48, '2023-05-20', 'Active'),
('LN005', 'KH006', 'BR04', 'Business', 1500000000, 9.50, 36, '2022-11-01', 'Overdue'),
('LN006', 'KH007', 'BR05', 'Personal', 80000000, 14.50, 12, '2022-04-01', 'Bad Debt'),
('LN007', 'KH009', 'BR03', 'Business', 600000000, 9.00, 24, '2023-09-01', 'Active');
