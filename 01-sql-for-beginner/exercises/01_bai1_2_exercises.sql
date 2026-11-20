-- ============================================================================
-- HỌC PHẦN 1 - BÀI 1 & BÀI 2: BÀI TẬP THỰC HÀNH
-- Database: ../../datasets/inda_banking.db
-- Chạy kiểm tra kết quả:
-- sqlite3 -header -column ../../datasets/inda_banking.db < 01_bai1_2_exercises.sql
-- ============================================================================

-- [Bài tập 1]: Lấy danh sách tất cả các tài khoản (account_id, customer_id, account_type, balance)
-- từ bảng ACCOUNTS đang hoạt động (status = 'Active') và có số dư (balance) >= 100,000,000 VNĐ.
-- Sắp xếp theo số dư giảm dần (ORDER BY balance DESC).
-- Viết code của bạn dưới đây:



-- [Bài tập 2]: Hiển thị danh sách các kênh giao dịch (channel) duy nhất (không trùng lặp)
-- từ bảng TRANSACTIONS.
-- Viết code của bạn dưới đây:



-- [Bài tập 3]: Truy vấn các giao dịch (txn_id, account_id, txn_date, txn_type, amount, status)
-- từ bảng TRANSACTIONS bị thất bại (status = 'Failed') HOẶC có số tiền giao dịch > 100,000,000 VNĐ.
-- Viết code của bạn dưới đây:



-- [Bài tập 4]: Lấy danh sách các khoản vay (loan_id, customer_id, loan_type, principal_amt, loan_status)
-- từ bảng LOANS có số tiền gốc (principal_amt) nằm trong khoảng từ 500,000,000 đến 5,000,000,000 (dùng BETWEEN),
-- đổi tên cột hiển thị bằng ALIAS (AS) sang tiếng Việt.
-- Viết code của bạn dưới đây:



-- [Bài tập 5]: Tìm danh sách nhân viên (emp_id, full_name, position, salary, branch_id)
-- từ bảng EMPLOYEES có chức vụ bắt đầu bằng 'Chuyên viên QHKH' (dùng LIKE) và mức lương > 20,000,000,
-- sắp xếp theo lương từ cao xuống thấp.
-- Viết code của bạn dưới đây:

