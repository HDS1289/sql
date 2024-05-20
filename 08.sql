-- set

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

-- ���� ������ ���� ���� �ִ� ������� ���, �̸�, ������ ��ȸ
select employee_id, last_name, job_id
from employees e
where exists (select job_id
                from job_history h
                where e.employee_id = h.employee_id
                and e.job_id = h.job_id);
                
select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id
                    from job_history h
                    where e.employee_id = h.employee_id);
                    
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

--select location_id, department_name
--from departments
--union
--select location_id, state_province
--from locations;

select location_id, department_name, null state
from departments
union
select location_id, null, state_province
from locations;

--select employee_id, job_id, salary
--from employees
--union
--select employee_id, job_id
--from job_history;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history;