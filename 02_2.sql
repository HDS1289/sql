select employee_id, last_name, department_id
from employees
where department_id = 90; -- 부서번호가 90번인 사원들을 조회한다.

-- 176번 사원의 사번, 이름, 부서번호를 조회하려면??
select employee_id, last_name, department_id
from employees
where employee_id = 176;

-- 상수 비교값이 character type이다.
select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';

select employee_id, last_name, hire_date
from employees
where hire_date = '08/02/06';

select employee_id, last_name, hire_date
from employees
where hire_date = '2008.02.06';

select employee_id, last_name, hire_date
from employees
where hire_date = '08-02-06';

select employee_id, last_name, hire_date
from employees
where hire_date = '08.02.06';

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06'; -- YYYY/MM/DD형식

select last_name, salary
from employees
where salary <= 3000;

-- 월급이 $12,000 이상 버는 사원들의 이름과 월급을 조회하려면??
select last_name, salary
from employees
where salary >= 12000;