-- group function
-- function의 파라미터로 row들이 그룹지어서 들어간다.
-- 그 group 안에는 row의 갯수가 n개 들어 있다.
select avg(salary), max(salary), min(salary), sum(salary)
from employees;

-- 가장 오래 전 입사일과 최근 입사일을 조회할 수 있다.
select min(hire_date), max(hire_date)
from employees;

-- 최고월급과 최저월급의 차액
select max(salary) - min(salary) "Difference"
from employees;

-- group 안에 포함된 row의 갯수를 파악한다.

-- 70번 부서원이 몇 명인지 조회하려면?
select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

-- 매니저는 몇 명일까..??
-- 정확히 몇 명인지??
select count(manager_id)
from employees;

-- 매니저 ID가 누락된 사원을 조회
select employee_id, last_name, job_id, manager_id
from employees
where manager_id is null;

-- commission_pct
-- 영업사원의 평균 커미션율
select avg(commission_pct)
from employees;

-- 조직 전체의 평균 커미션율??
select avg(nvl(commission_pct, 0))
from employees;

-- 중복되는 값을 포함한다.
select avg(all salary)
from employees;

select avg(distinct salary)
from employees;

-- 부서에 속한 직원 수
select count(department_id)
from employees;

-- 부서에 배치되지 못한 직원 조회
select employee_id, last_name, department_id
from employees
where department_id is null;

-- 회사의 부서 갯수??
-- 사원이 배치된 부서 갯수??
select count(distinct department_id)
from employees;

-- 매니저 수를 조회하라.
select count(distinct manager_id)
from employees;

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id, job_id
order by department_id;

-- error ==> group function
-- select 절에는 group by 제목과 group function이 들어가는 구조여야 한다.
--select department_id, job_id, count(employee_id)
--from employees
--group by department_id
--order by department_id;

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

-- 직업별 사원수를 조회
select job_id, count(employee_id)
from employees
group by job_id;

-- group 골라내기
select department_id, max(salary)
from employees
group by department_id
having department_id > 50
order by department_id;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

-- having 절에는 alias를 쓸 수 없다.
--select department_id, max(salary) "Max Salary"
--from employees
--group by department_id
--having "Max Salary" > 10000;

-- having ==> group을 골라낸다
-- where ==> row를 골라낸다
select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

-- where 절에는 group function을 쓸 수 없다.
-- group function은 having 절에만 조건문으로 쓸 수 있다.
select department_id, max(salary)
from employees
where max(salary) > 50
group by department_id;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;

-- 매니저ID, 매니저별 관리 직원 중 최소 월급을 조회
-- 최소 월급은 6000달러를 초과
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

-- group function의 중첩??
select max(avg(salary))
from employees
group by department_id;

-- 세 번 이상 중첩은 허용하지 않는다.
--select sum(max(avg(salary)))
--from employees
--group by department_id;

select department_id, round(avg(salary))
from employees
group by department_id;

-- error ==> group function으로 인한 error
-- select 절에 group by expression이 아닌 것이 들어 있어서 error발생
--select department_id, round(avg(salary))
--from employees;

select round(avg(salary))
from employees;

-- 2001, 2002, 2003 연도별 입사자 수 조회
select to_char(hire_date, 'YYYY') "Hired Year", count(employee_id)
from employees
group by to_char(hire_date, 'YYYY')
having to_char(hire_date, 'YYYY') in ('2001', '2002', '2003')
order by "Hired Year";

select sum(decode(to_char(hire_date, 'YYYY'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'YYYY'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'YYYY'), '2003', 1, 0)) "2003"
from employees;

select sum(case when to_char(hire_date) like '2001%' then 1 else null end) "2001",
    sum(case when to_char(hire_date) like '2002%' then 1 else null end) "2002",
    sum(case when to_char(hire_date) like '2003%' then 1 else null end) "2003"
from employees;

-- 직업별, 부서별 월급합을 조회
-- 부서 번호는 20, 50, 80번
select job_id, sum(decode(department_id, 20, salary)) "Dept No.20",
            sum(decode(department_id, 50, salary)) "Dept No.50",
            sum(decode(department_id, 80, salary)) "Dept No.80"
from employees
group by job_id;

select job_id, sum(case department_id when 20 then salary else null end) "Dept No.20",
            sum(case department_id when 50 then salary else null end) "Dept No.50",
            sum(case department_id when 80 then salary else null end) "Dept No.80"
from employees
group by job_id;