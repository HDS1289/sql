-- group function
-- function�� �Ķ���ͷ� row���� �׷���� ����.
-- �� group �ȿ��� row�� ������ n�� ��� �ִ�.
select avg(salary), max(salary), min(salary), sum(salary)
from employees;

-- ���� ���� �� �Ի��ϰ� �ֱ� �Ի����� ��ȸ�� �� �ִ�.
select min(hire_date), max(hire_date)
from employees;

-- �ְ���ް� ���������� ����
select max(salary) - min(salary) "Difference"
from employees;

-- group �ȿ� ���Ե� row�� ������ �ľ��Ѵ�.

-- 70�� �μ����� �� ������ ��ȸ�Ϸ���?
select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

-- �Ŵ����� �� ���ϱ�..??
-- ��Ȯ�� �� ������??
select count(manager_id)
from employees;

-- �Ŵ��� ID�� ������ ����� ��ȸ
select employee_id, last_name, job_id, manager_id
from employees
where manager_id is null;

-- commission_pct
-- ��������� ��� Ŀ�̼���
select avg(commission_pct)
from employees;

-- ���� ��ü�� ��� Ŀ�̼���??
select avg(nvl(commission_pct, 0))
from employees;

-- �ߺ��Ǵ� ���� �����Ѵ�.
select avg(all salary)
from employees;

select avg(distinct salary)
from employees;

-- �μ��� ���� ���� ��
select count(department_id)
from employees;

-- �μ��� ��ġ���� ���� ���� ��ȸ
select employee_id, last_name, department_id
from employees
where department_id is null;

-- ȸ���� �μ� ����??
-- ����� ��ġ�� �μ� ����??
select count(distinct department_id)
from employees;

-- �Ŵ��� ���� ��ȸ�϶�.
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
-- select ������ group by ����� group function�� ���� �������� �Ѵ�.
--select department_id, job_id, count(employee_id)
--from employees
--group by department_id
--order by department_id;

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

-- ������ ������� ��ȸ
select job_id, count(employee_id)
from employees
group by job_id;

-- group ��󳻱�
select department_id, max(salary)
from employees
group by department_id
having department_id > 50
order by department_id;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

-- having ������ alias�� �� �� ����.
--select department_id, max(salary) "Max Salary"
--from employees
--group by department_id
--having "Max Salary" > 10000;

-- having ==> group�� ��󳽴�
-- where ==> row�� ��󳽴�
select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

-- where ������ group function�� �� �� ����.
-- group function�� having ������ ���ǹ����� �� �� �ִ�.
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

-- �Ŵ���ID, �Ŵ����� ���� ���� �� �ּ� ������ ��ȸ
-- �ּ� ������ 6000�޷��� �ʰ�
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

-- group function�� ��ø??
select max(avg(salary))
from employees
group by department_id;

-- �� �� �̻� ��ø�� ������� �ʴ´�.
--select sum(max(avg(salary)))
--from employees
--group by department_id;

select department_id, round(avg(salary))
from employees
group by department_id;

-- error ==> group function���� ���� error
-- select ���� group by expression�� �ƴ� ���� ��� �־ error�߻�
--select department_id, round(avg(salary))
--from employees;

select round(avg(salary))
from employees;

-- 2001, 2002, 2003 ������ �Ի��� �� ��ȸ
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

-- ������, �μ��� �������� ��ȸ
-- �μ� ��ȣ�� 20, 50, 80��
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