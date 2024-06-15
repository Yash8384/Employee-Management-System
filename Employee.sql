
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
SELECT * FROM employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
JOIN employee e ON d.department_id = e.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_id, d.department_name;
SELECT e.first_name, e.last_name, d.department_name, s.salary
FROM employee e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY s.salary DESC
LIMIT 5;
