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
-- ���̺� ������� ����

select last_name
from employees
where last_name = 'Higgins';

-- lower() api ���
select last_name
from employees
where lower(last_name) = 'higgins';
-- lower(last_name)�� ���ϰ��� 'higgins'������ Ȯ���Ѵ�.

-- concat() api
select concat('Hello', 'World')
from dual;

-- substr() api
-- ���� ������ token�� �ɰ��� ��.
select substr('HelloWorld', 2, 5)
from dual;
-- �ε��� �� ��°���� �����Ͽ� 5���� ���ڸ��� ����϶�
-- sql�� �ε����� 1������ �����Ѵ�.

select substr('Hello', -1, 1)
from dual;
-- �� ���� ���� �ε����� -1�� ����Ѵ�.
-- �� ���� ������ �ε��� ��ġ���� �� ���� ���ڸ� ����϶�.

select length('Hello')
from dual;

-- �ش� ���ڰ� ó������ ��ġ�ϴ� index���� �ִ� ���ڵ带 ����.
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

-- �߰� �κ��� �ٷ��� �ʴ´�.
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

-- �����, ����, 15.5%�λ�� ����(New Salary), �λ��(Increase)�� ��ȸ
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

-- �ټ� �Ⱓ ��ȸ
select last_name, sysdate - hire_date
from employees
where department_id = 90;

-- 90�� �μ������� �̸�, �ټӳ�� ��ȸ
select last_name, trunc((sysdate - hire_date) / 365) "Years Worked"
from employees
where department_id = 90;

-- ���� ���̸� ���ϱ�
-- months_between(����1, ����2)
select months_between('2022/12/31', '2021/12/31')
from dual;

select add_months(sysdate, 1)
from dual;

select add_months('2022/06/14', 1)
from dual;

-- ���� �� �ݿ��� ���...
select next_day('2022/07/14', 5)
from dual;

select next_day(sysdate, 1)
from dual;

select next_day(sysdate, 5)
from dual;

-- next_day(��������, ����(1-7))
-- �������ڷκ��� ������ ���� ������ �ش� ��¥�� return �Ѵ�.

select next_day(sysdate, 'Thu')
from dual;

-- �ſ� ����
select last_day(sysdate)
from dual;

-- 20�� �̻� ������ ������� �����, ù �������� ��ȸ (�Ի� ���� ù ������)
-- ������ �ſ� ������ �޿� ���޵ȴ�.

select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 20 * 12;


-- ������� �����, ����, ���ޱ׷����� ��ȸ
-- ���� �׷����� * �ϳ��� 1000�޷��� ǥ��.
select last_name, rpad(' ', salary / 1000 + 1, '*') "Salary"
from employees
order by salary desc;

select substr('010-1234-5678', 1, 4) || lpad('*', length('010-1234-5678') - 9, '*') || substr('010-1234-5678', -5, 5)
from dual;