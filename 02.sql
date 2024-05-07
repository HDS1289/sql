select employee_id, last_name, department_id
from employees
where department_id = 90; -- 할당이 아닌 equal이다.

-- 176번 사원의 사번, 이름, 부서번호를 조회하려면??
select employee_id, last_name, department_id
from employees
where employee_id = 176;

-- 상수 비교값이 character type이면??
select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';


-- 연월일을 표기하는 형식이 문제?? ==> 오라클이 알아들어야..
-- 날짜 형식을 어떻게 보내야 하는지??
select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select last_name, salary
from employees
where salary <= 3000;

-- 월급이 $12,000 이상 버는 사원들의 이름과 월급을 조회하려면??
select last_name, salary
from employees
where salary >= 12000;