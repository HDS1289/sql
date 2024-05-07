select *
from departments;

desc departments;

select *
from employees;

desc employees;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

select last_name, salary
from employees;

select last_name, salary + 300
from employees;

-- 사원의 월급과 연봉을 조회하려 한다??
select salary, salary * 12
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees;

select last_name, job_id, (salary * 12 * commission_pct)
from employees;

select last_name name, commission_pct comm
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

-- 사원들의 사번, 이름, 직업, 입사일(startdate로 설정)을 조회하려면??
select employee_id, last_name, job_id, hire_date startdate
from employees;

-- 사원들의 사번, 이름, 직업, 입사일을 조회하려 한다. (자신이 설정한 별도의 칼럼명으로 조회하려면??)
-- 그런데 사번은 Emp #으로, 이름은 Name으로, 직업은 Job으로, 입사일은 Hire Date로 설정한 상태로 조회하려면??
select employee_id "Emp #", last_name "Name", job_id "Job", hire_date "Hire Date"
from employees;

-- 각 칼럼마다 붙이기 연산자를 수행함으로써 칼럼을 병합하려고 한다.
select last_name || job_id -- field가 하나뿐인 레코드로 병합된다.
from employees;

select last_name || ' is ' || job_id employee -- 붙이기 연산자로 병합한 칼럼에다 칼럼명을 따로 설정할 수 있다.
from employees;

select salary, salary * 12 + (salary * 12 * commission_pct)
from employees;

select last_name || null -- null data는 붙이기 연산자에서는 empty string으로 변환된다.
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || ': ' || hire_date "Hire Date"
from employees;

select last_name || (salary * 12)
from employees;

-- 사원들을 '이름, 직업' 형식으로 Emp and Title칼럼을 별도로 설정해서 조회하려면??
select last_name || ', ' || job_id "Emp and Title"
from employees;