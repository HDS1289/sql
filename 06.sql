-- join
-- from ������ table�� �ϳ��� �־���
-- �� ���� ���̺��� �����ؾ� �Ѵ�??

-- join ==> �ʿ��� �����͵��� �� �� �̻��� ���̺� ����� ���� �� �� �� �ִ�.

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

-- ������ 1���� �����, �μ���ȣ�� ��ȸ
select last_name, department_id
from employees
where department_id is null;

select employee_id, last_name, department_id, location_id
from departments natural join employees;

-- natural join ==> ����Ǵ� �ʵ带 �ڵ����� ã�� �Ѵ�. (��� ���� Į���� ã�´�.)
-- 'using' join ==> ����Ǵ� �ʵ带 �������� �����ؾ� �Ѵ�.

select locations.city, departments.department_name
from locations join departments
using (location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;

-- error
-- ���λ�� where������ �� ����.
-- select l.city, d.department_name
-- from locations l join departments d
-- using (location_id)
-- where l.location_id = 1400;

select l.city, d.department_name, location_id
from locations l join departments d
using (location_id)
where location_id = 1400;

-- using ���� Į������ ���λ縦 ������ �ʴ´�.
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

-- 3�� �̻��� ���̺� join
select e.employee_id, e.last_name, l.city, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- using���� ����
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

-- ���� 2����� �������� ���
select e.employee_id, e.last_name, e.department_id,
        d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id = 149;

-- ����信 ��ġ�� �μ����� ���ϴ� �����
-- �� ������� �̸�, ����, �μ���ȣ, �μ���, ���ø� ��ȸ
select e.last_name, e.job_id, d.department_id, d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
and l.city = 'Toronto';

-- non equi join (�ٸ� �����ڸ� �Ἥ join�Ѵ�.)
select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

-- self join
select worker.employee_id, worker.last_name, manager.last_name
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

-- self join������ on ������ ���λ縦 ������ �� ����.
-- select worker.employee_id, worker.last_name, manager.last_name
-- from employees worker join employees manager
-- on manager_id = employee_id;

-- self join �� ��ü�� ���λ縦 �ٿ��� �Ѵ�.
-- select employee_id, last_name, last_name
-- from employees worker join employees manager
-- on worker.manager_id = manager.employee_id;

-- ���� �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������� ��ȸ
select worker.department_id, worker.last_name, companion.last_name
from employees worker join employees companion
on worker.department_id = companion.department_id
and worker.employee_id != companion.employee_id
order by worker.department_id;

-- Davies ���� �ʰ� �Ի��� ������� �̸�, �Ի����� ��ȸ
select e.last_name, e.hire_date
from employees e join employees d
on d.last_name = 'Davies'
and e.hire_date > d.hire_date
order by e.hire_date;

-- �Ŵ������� ���� �Ի��� ����� ��ȸ
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

-- ������� �����, ���, �Ŵ�����, �Ŵ����� ��� ��ȸ
-- King ���嵵 ����
select e.last_name, e.employee_id, m.last_name, m.employee_id
from employees e left outer join employees m
on e.manager_id = m.employee_id
order by 2;

-- ����ȭ�� ����
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