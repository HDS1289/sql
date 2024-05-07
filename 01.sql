select *
from employees;

desc employees;

select last_name, salary
from employees;

select last_name, salary + 300
from employees;

select salary, salary * 12
from employees;

select last_name, salary, 12 * salary + 100   --곱셈이 먼저 실현된다. 우선순위를 바꾸려면 ()를 써야 한다.
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct
from employees;

select salary, salary * 12 + (salary * 12 * commission_pct) --무결성이 깨졌다. 왜????? ==> 봉급을 받지 않는 것으로 나온다.
from employees;

select last_name name, commission_pct comm
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

--사원들의 사번, 이름, 직업, 입사일(startdate)을 조회하려면???
select employee_id, last_name, job_id, hire_date startdate --from절에 있는 column name만을 입력해야 한다.
from employees;

-- 사원들의 사번(Emp #), 이름 (Name), 직업 (Job), 입사일 (Hire Date)을 조회하려면??
select employee_id "Emp #", last_name "Name", job_id "Job", hire_date "Hire Date" -- expression을 이용하여 나만의 칼럼을 만들 수 있다.
from employees;

select last_name || job_id -- field가 하나뿐인 레코드이다.
from employees;

select last_name || ' is ' || job_id
from employees;

select last_name || ' is ' || job_id employee
from employees;


-- expression 중 한 부분에 null이 있으면 전체가 null이다. 붙이기 연산자가 아닌 다른 연산자에 해당된다.
select salary, salary * 12 + (salary * 12 * commission_pct)
from employees;

select last_name || null -- empty string으로 변환된다.
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || hire_date
from employees;

select last_name || (salary * 12)
from employees;

-- 사원들의 '이름, 직업'(Emp and Title)을 조회하려면??
select last_name || ', ' || job_id "Emp and Title"
from employees;