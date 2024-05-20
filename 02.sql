select employee_id, last_name, department_id
from employees
where department_id = 90;

-- 176번의 사원 신상정보를 알아내려 한다??
select employee_id, last_name, department_id
from employees
where employee_id = 176;

-- 상수 비교값이 character type인 경우
select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';

-- 날짜 타입의 데이터는??
select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06';

select employee_id, last_name, hire_date
from employees
where hire_date = '08.02.06';

select employee_id, last_name, hire_date
from employees
where hire_date = '08-02-06';

select employee_id, last_name, hire_date
from employees
where hire_date = '2008/02/06'; -- YYYY/MM/DD형식으로 설정된 후에 쿼리 명령어가 입력된 것이다.

-- 월급이 $3,000 미만인 직원들을 조회한다.
select last_name, salary
from employees
where salary <= 3000;

-- 월급이 $12,000 이상인 직원들을 조회한다??
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

-- SQL 범위 연산자 between ~ and ~
select last_name, salary
from employees
where salary between 2500 and 3500;
-- 2500이상 3500이하

select last_name
from employees
where last_name between 'King' and 'Smith';

-- 'King'사원의 first name, last name, 직업, 월급 조회
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

-- in 연산자(~~~에 속한다, ~~이거나 ~~이다.)
select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or manager_id = 101 or manager_id = 201;

select employee_id, last_name
from employees
where last_name in ('Hartstein', 'Vargas');

select employee_id, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21');

-- like연산자, wild card % and _
select last_name
from employees
where last_name like 'S%';
-- 첫 글자는 S여야 하고 두 번째 글자부터는 아무 글자나 와도 된다.

-- 2005년도에 입사한 사원들의 사원명, 입사일을 조회
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like '%r';
-- 맨 마지막 글자는 r이어야 한다.

-- 이름에 -s-가 포함된 사원명 조회
select last_name
from employees
where last_name like '%s%';

-- _는 character 1개를 뜻한다.
select last_name
from employees
where last_name like 'K___';

-- 이름의 두 번째 글자가 o인 사원명 조회
select last_name
from employees
where last_name like '_o%';
-- 첫 번째 글자는 언더 바여야 한다.

select job_id
from employees;

--escape character
select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\';

select last_name, job_id
from employees
where job_id like '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

-- 왜 조회가 안 되지?? ==> null값??
-- where 절은 조건문이다. true값이 나오는 레코드가 없기 때문에 빈 테이블이 반환된 것이다.
select employee_id, last_name, manager_id
from employees
where manager_id = null;

select salary, job_id
from employees
where salary >= 5000 and job_id like '%IT%';

select salary, job_id
from employees
where salary >= 5000 or job_id like '%IT%';

-- 월급이 5000달러 이상 12000달러 이하이며 20번이나 50번 부서에서 일하는 사원의 사원명, 월급, 부서번호 조회
select last_name, salary, department_id
from employees
where salary between 5000 and 12000 and department_id in (20, 50);

-- 이름에 a와 e가 포함된 사원명 조회
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';

-- not 연산자
select last_name, salary
from employees
where salary not between 10000 and 15000;

select last_name, job_id
from employees
where manager_id is not null;

select last_name, job_id
from employees
where manager_id is null;

select last_name, job_id
from employees
where commission_pct is null;

select last_name, job_id
from employees
where commission_pct is not null;

select last_name, job_id
from employees
where job_id not like '%IT%';

select last_name, salary
from employees
where manager_id is null and salary >= 24000;

select last_name, salary
from employees
where not (manager_id is null and salary >= 24000);

-- 직업이 영업이다. 그리고 월급이 2000달러, 3500달러가 아니다.
-- 위 조건에 해당하는 사원들의 이름, 직업, 월급을 조회
select last_name, job_id, salary
from employees
where salary not in (2000, 3500) and job_id like 'SA%';

select last_name, department_id
from employees
order by department_id;

select last_name, department_id
from employees
order by department_id desc;

select last_name, department_id
from employees
order by 2;

select last_name, department_id dept_id
from employees
order by department_id;

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;