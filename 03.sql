-- dummy table
desc dual;

-- lower(), upper(), initcap() api
select lower('SQL course')
from dual;

select upper('sql course')
from dual;

select initcap('sql course')
from dual;

select last_name
from employees
where last_name = 'higgins';
-- 테이블 결과값이 없음

select last_name
from employees
where last_name = 'Higgins';

-- lower() api 사용
select last_name
from employees
where lower(last_name) = 'higgins';
-- lower(last_name)의 리턴값이 'higgins'인지를 확인한다.

-- concat() api
select concat('Hello', 'World')
from dual;

-- substr() api
-- 일정 구간의 token을 쪼개는 것.
select substr('HelloWorld', 2, 5)
from dual;
-- 인덱스 두 번째부터 시작하여 5개의 글자만을 출력하라
-- sql은 인덱스가 1번부터 시작한다.

select substr('Hello', -1, 1)
from dual;
-- 맨 끝의 글자 인덱스는 -1로 계산한다.
-- 맨 끝의 글자의 인덱스 위치에서 한 개의 글자만 출력하라.

select length('Hello')
from dual;

-- 해당 글자가 처음으로 위치하는 index값이 있는 레코드를 리턴.
select instr('Hello', 'l')
from dual;

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees;

select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL')
from dual;

select trim('H' from 'Hello')
from dual;

-- 중간 부분은 다루지 않는다.
select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

select '|' || ' Hello ' || '|'
from dual;

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG%';

select initcap(last_name), length(last_name)
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%';

select round(45.926, 2)
from dual;

select round(45.926, 0), round(45.926)
from dual;

select trunc(45.926, 2)
from dual;

select trunc(45.926, 0), trunc(45.926)
from dual;

-- 사원명, 월급, 15.5%인상된 월급(New Salary), 인상액(Increase)을 조회
select last_name, salary, 
    round(salary * 0.155) + salary "New Salary", round(salary * 0.155) "Increase"
from employees;

select sysdate
from dual;

select sysdate - 1
from dual;

select sysdate + 1
from dual;

select sysdate - sysdate
from dual;

-- 근속 기간 조회
select last_name, sysdate - hire_date
from employees
where department_id = 90;

-- 90번 부서원들의 이름, 근속년수 조회
select last_name, trunc((sysdate - hire_date) / 365) "Years Worked"
from employees
where department_id = 90;

-- 월의 차이를 구하기
-- months_between(일자1, 일자2)
select months_between('2022/12/31', '2021/12/31')
from dual;

select add_months(sysdate, 1)
from dual;

select add_months('2022/06/14', 1)
from dual;

-- 다음 주 금요일 등등...
select next_day('2022/07/14', 5)
from dual;

select next_day(sysdate, 1)
from dual;

select next_day(sysdate, 5)
from dual;

-- next_day(기준일자, 요일(1-7))
-- 기준일자로부터 다음에 오는 요일의 해당 날짜를 return 한다.

select next_day(sysdate, 'Thu')
from dual;

-- 매월 말일
select last_day(sysdate)
from dual;

-- 20년 이상 재직한 사원들의 사원명, 첫 월급일을 조회 (입사 후의 첫 월급일)
-- 월급은 매월 마지막 달에 지급된다.

select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 20 * 12;


-- 사원들의 사원명, 월급, 월급그래프를 조회
-- 월급 그래프는 * 하나당 1000달러로 표시.
select last_name, rpad(' ', salary / 1000 + 1, '*') "Salary"
from employees
order by salary desc;

select substr('010-1234-5678', 1, 4) || lpad('*', length('010-1234-5678') - 9, '*') || substr('010-1234-5678', -5, 5)
from dual;