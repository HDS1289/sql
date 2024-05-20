select employee_id, last_name, department_id
from employees
where department_id = 90;

-- 176���� ��� �Ż������� �˾Ƴ��� �Ѵ�??
select employee_id, last_name, department_id
from employees
where employee_id = 176;

-- ��� �񱳰��� character type�� ���
select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';

-- ��¥ Ÿ���� �����ʹ�??
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
where hire_date = '2008/02/06'; -- YYYY/MM/DD�������� ������ �Ŀ� ���� ��ɾ �Էµ� ���̴�.

-- ������ $3,000 �̸��� �������� ��ȸ�Ѵ�.
select last_name, salary
from employees
where salary <= 3000;

-- ������ $12,000 �̻��� �������� ��ȸ�Ѵ�??
select last_name, salary
from employees
where salary >= 12000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';

-- SQL ���� ������ between ~ and ~
select last_name, salary
from employees
where salary between 2500 and 3500;
-- 2500�̻� 3500����

select last_name
from employees
where last_name between 'King' and 'Smith';

-- 'King'����� first name, last name, ����, ���� ��ȸ
select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

-- in ������(~~~�� ���Ѵ�, ~~�̰ų� ~~�̴�.)
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

-- like������, wild card % and _
select last_name
from employees
where last_name like 'S%';
-- ù ���ڴ� S���� �ϰ� �� ��° ���ں��ʹ� �ƹ� ���ڳ� �͵� �ȴ�.

-- 2005�⵵�� �Ի��� ������� �����, �Ի����� ��ȸ
select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like '%r';
-- �� ������ ���ڴ� r�̾�� �Ѵ�.

-- �̸��� -s-�� ���Ե� ����� ��ȸ
select last_name
from employees
where last_name like '%s%';

-- _�� character 1���� ���Ѵ�.
select last_name
from employees
where last_name like 'K___';

-- �̸��� �� ��° ���ڰ� o�� ����� ��ȸ
select last_name
from employees
where last_name like '_o%';
-- ù ��° ���ڴ� ��� �ٿ��� �Ѵ�.

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

-- �� ��ȸ�� �� ����?? ==> null��??
-- where ���� ���ǹ��̴�. true���� ������ ���ڵ尡 ���� ������ �� ���̺��� ��ȯ�� ���̴�.
select employee_id, last_name, manager_id
from employees
where manager_id = null;

select salary, job_id
from employees
where salary >= 5000 and job_id like '%IT%';

select salary, job_id
from employees
where salary >= 5000 or job_id like '%IT%';

-- ������ 5000�޷� �̻� 12000�޷� �����̸� 20���̳� 50�� �μ����� ���ϴ� ����� �����, ����, �μ���ȣ ��ȸ
select last_name, salary, department_id
from employees
where salary between 5000 and 12000 and department_id in (20, 50);

-- �̸��� a�� e�� ���Ե� ����� ��ȸ
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';

-- not ������
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

-- ������ �����̴�. �׸��� ������ 2000�޷�, 3500�޷��� �ƴϴ�.
-- �� ���ǿ� �ش��ϴ� ������� �̸�, ����, ������ ��ȸ
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