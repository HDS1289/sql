-- subquery

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');
    
-- return�Ǵ� row�� �ϳ����� �Ѵ�.
-- �� �쿡 ���� �ϳ����� �Ѵٴ� �����ڰ� �� �ֱ� �����̴�.
select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');

-- IT�μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ��ȸ
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'IT');
                        
-- Abel�� ���� �μ����� ���ϴ� ������� �̸��� �Ի����� ��ȸ
-- �̸����� �������� ����
select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and last_name != 'Abel'
order by last_name;

-- subquery���� n���� row�� ������ ���
-- error
--select last_name, salary
--from employees
--where salary > (select salary
--                from employees
--                where last_name = 'King');

-- group function return���� �ϳ� ==> subquery�� �� �� �ִ�.
select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);


-- subquery���� return�Ǵ� row�� ������ �ϳ����� �Ѵ�.      
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);
                        
-- ȸ�� ��� ���� �̻����� ���� ������� ���, �̸�, ������ ��ȸ
-- ������ �������� ����
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
                
-- �̸��� u�� ���Ե� ����� �ִ� �μ����� ���ϴ� ������� ���, �̸��� ��ȸ
select employee_id, last_name
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%');
                        
-- 1700�� ������ ��ġ�� �μ����� ���ϴ� �������� �̸�, ����, �μ���ȣ�� ��ȸ
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

-- 60�� �μ��� �Ϻ� ������� ������ ���� ������� �̸��� ��ȸ
select last_name
from employees
where salary >any (select salary
                    from employees
                    where department_id = 60);
                    
-- ȸ�� ��� ���޺���, �׸��� ��� ���α׷��Ӻ��� ������ �� ���� �޴�
-- ������� �̸�, ����, ������ ��ȸ
select last_name, job_id, salary
from employees
where salary > (select avg(salary)
                from employees)
and salary >all (select salary
                from employees
                where job_id = 'IT_PROG');
                
-- subquery���� return �Ǵ� row�� ���� ���
-- main query�� ����� null�� ����??
-- ���ǿ����� true�� ������ row�� ���� �����̴�.
select last_name
from employees
where salary = (select salary
                from employees
                where employee_id = 1);

-- true ���� ������ �� ����   
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

-- ������� ��ġ�� �μ��� ��
select count(*)
from departments d
where exists (select *
                from employees e
                where e.department_id = d.department_id);

-- �μ������� ���� �μ��� ��       
select count(*)
from departments d
where not exists (select *
                    from employees e
                    where e.department_id = d.department_id);
                    
-- ������ �ٲ� ���� �ִ� ������� ���, �̸�, ������ ��ȸ
select employee_id, last_name, job_id
from employees e
where exists (select *
                from job_history h
                where e.employee_id = h.employee_id)
order by employee_id;

select *
from job_history
order by employee_id;