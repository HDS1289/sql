-- join
-- from 절에는 table이 하나만 있었다
-- 두 개의 테이블을 융합해야 한다??

-- join ==> 필요한 데이터들이 두 개 이상의 테이블에 흩어져 있을 때 쓸 수 있다.

select department_id, department_name, location_id
from departments;

select location_id, city
from locations;

-- equi join
select department_id, department_name, location_id, city
from departments natural join locations;


select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50);

-- 'using' join
select employee_id, last_name, department_id, location_id
from departments join employees
using (department_id);

-- 누락된 1인의 사원명, 부서번호를 조회
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from departments natural join employees;

-- natural join ==> 공통되는 필드를 자동으로 찾게 한다. (모든 공통 칼럼을 찾는다.)
-- 'using' join ==> 공통되는 필드를 수동으로 설정해야 한다.

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;

-- error
-- 접두사는 where절에는 못 쓴다.
-- select l.city, d.department_name
-- from locations l join departments d
-- using (location_id)
-- where l.location_id = 1400;

select l.city, d.department_name, location_id
from locations l join departments d
using (location_id)
where location_id = 1400;

-- using 절의 칼럼에는 접두사를 붙이지 않는다.
-- select l.city, d.department_name, d.location_id
-- from locations l join departments d
-- using (location_id)
-- where location_id = 1400;

select e.last_name, d.department_name
from employees e join departments d
using (department_id)
where d.department_id = 20;

select e.last_name, d.department_name
from employees e join departments d
using (department_id)
where d.manager_id = 100;

select e.last_name, d.department_name, e.manager_id
from employees e join departments d
using (department_id)
where d.manager_id = 100;

select e.last_name, d.department_name
from employees e join departments d
using (department_id)
where last_name = 'King';

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id;

-- 3개 이상의 테이블 join
select e.employee_id, e.last_name, l.city, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- using으로 번역
select e.employee_id, l.city, d.department_name
from employees e join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
        d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

-- 조건 2개라는 관점에서 기술
select e.employee_id, e.last_name, e.department_id,
        d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id = 149;

-- 토론토에 위치한 부서에서 일하는 사원들
-- 그 사원들의 이름, 직업, 부서번호, 부서명, 도시를 조회
select e.last_name, e.job_id, d.department_id, d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
and l.city = 'Toronto';

-- non equi join (다른 연산자를 써서 join한다.)
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

-- self join
select worker.employee_id, worker.last_name, manager.last_name
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

-- self join에서는 on 절에서 접두사를 생략할 수 없다.
-- select worker.employee_id, worker.last_name, manager.last_name
-- from employees worker join employees manager
-- on manager_id = employee_id;

-- self join 은 전체에 접두사를 붙여야 한다.
-- select employee_id, last_name, last_name
-- from employees worker join employees manager
-- on worker.manager_id = manager.employee_id;

-- 같은 부서에서 일하는 사원들의 부서번호, 이름, 동료명을 조회
select worker.department_id, worker.last_name, companion.last_name
from employees worker join employees companion
on worker.department_id = companion.department_id
and worker.employee_id != companion.employee_id
order by worker.department_id;

-- Davies 보다 늦게 입사한 사원들의 이름, 입사일을 조회
select e.last_name, e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date
order by e.hire_date;

-- 매니저보다 먼저 입사한 사원들 조회
select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m
on w.manager_id = m.employee_id
and m.hire_date > w.hire_date;

-- inner join
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

-- left outer join
select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

-- right outer join
select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

-- full outer join
select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;

-- 사원들의 사원명, 사번, 매니저명, 매니저의 사번 조회
-- King 사장도 포함
select e.last_name, e.employee_id, m.last_name, m.employee_id
from employees e left outer join employees m
on e.manager_id = m.employee_id
order by 2;

-- 간소화된 문법
-- inner join
select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
and d.department_id in (20, 50);

select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

-- non equi join
select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

-- outer join
-- left outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

-- right outer join
select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

-- error
-- select e.last_name, e.department_id, d.department_name
-- from employees e, departments d
-- where e.department_id(+) = d.department_id(+);

-- self join
select worker.last_name || ' works for ' || manager.last_name || '.'
from employees worker, employees manager
where worker.manager_id = manager.employee_id;