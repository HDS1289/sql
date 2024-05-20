-- subquery

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');
    
-- return되는 row는 하나여야 한다.
-- 좌 우에 값이 하나여야 한다는 연산자가 들어가 있기 때문이다.
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');

-- IT부서에서 일하는 사원들의 부서번호, 이름, 직업을 조회
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'IT');
                        
-- Abel과 같은 부서에서 일하는 동료들의 이름과 입사일을 조회
-- 이름으로 오름차순 정렬
select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and last_name != 'Abel'
order by last_name;

-- subquery에서 n개의 row가 나오는 경우
-- error
--select last_name, salary
--from employees
--where salary > (select salary
--                from employees
--                where last_name = 'King');

-- group function return값은 하나 ==> subquery로 쓸 수 있다.
select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);


-- subquery에서 return되는 row의 갯수는 하나여야 한다.      
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);
                        
-- 회사 평균 월급 이상으로 버는 사원들의 사번, 이름, 월급을 조회
-- 월급은 내림차순 정렬
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by salary desc;

select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
                
-- 이름에 u가 포함된 사원이 있는 부서에서 일하는 사원들의 사번, 이름을 조회
select employee_id, last_name
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%');
                        
-- 1700번 지역에 위치한 부서에서 일하는 직원들의 이름, 직업, 부서번호를 조회
select last_name, job_id, department_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700);
                        
-- all, any
select employee_id, last_name
from employees
where salary =any (select min(salary)
                    from employees
                    group by department_id);
                    
select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <all (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

-- 60번 부서의 일부 사원보다 월급이 많은 사원들의 이름을 조회
select last_name
from employees
where salary >any (select salary
                    from employees
                    where department_id = 60);
                    
-- 회사 평균 월급보다, 그리고 모든 프로그래머보다 월급을 더 많이 받는
-- 사원들의 이름, 직업, 월급을 조회
select last_name, job_id, salary
from employees
where salary > (select avg(salary)
                from employees)
and salary >all (select salary
                from employees
                where job_id = 'IT_PROG');
                
-- subquery에서 return 되는 row가 없는 경우
-- main query의 결과가 null인 이유??
-- 조건에서는 true가 나오는 row가 없기 때문이다.
select last_name
from employees
where salary = (select salary
                from employees
                where employee_id = 1);

-- true 값이 나오는 게 없다   
select last_name
from employees
where salary in (select salary
                from employees
                where job_id = 'IT');
                
select last_name, first_name, department_id, job_id
from employees
where employee_id in (select manager_id
                        from employees)
order by last_name;

select last_name, first_name, department_id, job_id, employee_id
from employees
where last_name = 'King';

select last_name
from employees
where manager_id = 156;

select last_name, first_name, department_id, job_id
from employees
where employee_id not in (select manager_id
                            from employees
                            where manager_id is not null)
order by last_name;

select last_name
from employees
where employee_id <>all (select manager_id
                            from employees
                            where manager_id is not null)
order by last_name;

select count(*)
from departments;

-- 사원들이 배치된 부서의 수
select count(*)
from departments d
where exists (select *
                from employees e
                where e.department_id = d.department_id);

-- 부서원들이 없는 부서의 수       
select count(*)
from departments d
where not exists (select *
                    from employees e
                    where e.department_id = d.department_id);
                    
-- 직업을 바꾼 적이 있는 사원들의 사번, 이름, 직업을 조회
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history h
                where e.employee_id = h.employee_id)
order by employee_id;

select *
from job_history
order by employee_id;