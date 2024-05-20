select hire_date
from employees
where hire_date = '2003/06/17';

select last_name, salary
from employees
where salary = '7000';

select hire_date || ' '
from employees;

select salary || ' '
from employees;

select to_char(hire_date)
from employees;

-- number <==> character <==> date

select to_char(sysdate, 'YYYY.MM.DD')
from dual;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'Year, Month, Ddsp, Dy(day)')
from dual;

-- �ش� ���Ͽ� �����Ǵ� ��ȣ�� return�Ѵ�.
select to_char(sysdate, 'd')
from dual;

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

-- �� ������� �Ի����� �����Ϻ��� �Ͽ��� ������ ������������ �����϶�.
select last_name, hire_date, to_char(hire_date, 'day') day, to_char(hire_date, 'd')
from employees
order by to_char(hire_date - 1, 'd');

select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(sysdate, 'year month ddsp day(dy) hh24:mi:ss am')
from dual;

-- �����, �Ի���, �λ������� ��ȸ
-- �λ������� �Ի� ���� 3������ ���� �� ù ��° �����Ϸ� �Ѵ�
-- YYYY.MM.DD�������� ǥ���϶�
select last_name, to_char(hire_date, 'YYYY.MM.DD') "Hire Date",
    to_char(next_day(add_months(hire_date, 3), 'Monday'), 'YYYY.MM.DD') "Review Date"
from employees;

-- fill mode
select last_name, to_char(hire_date, 'DD Month YY')
from employees;

select last_name, to_char(hire_date, 'fmDD Month YY')
from employees;

-- to_char(number, format model)
select to_char(salary)
from employees;

select last_name, to_char(salary, '$99,999.99') salary,
    to_char(salary, '$00,000.00') salary
from employees
where last_name = 'Ernst';

select to_char(12.12, '9999.999')
from dual;

-- 0���� format�� ������ ��쿡 �� �ڸ��� 0���� ä������ �ȴ�.
select to_char(12.12, '0000.000')
from dual;

select '|' || to_char(12.12, '9999.999') || '|',
    '|' || to_char(12.12, '0000.000') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.999') || '|',
    '|' || to_char(12.12, 'fm0000.000') || '|'
from dual;

select to_char(1237)
from dual;

select to_char(1237, '9,999')
from dual;

select to_char(1237, 'L9,999')
from dual;

select last_name || ' earns ' || to_char(salary, 'fm$99,999') || 
    ' monthly but wants ' || to_char(salary * 3, 'fm$99,999') || '.' "Earns"
from employees;

-- to date() function
select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'Mon dd, yyyy');

select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'Mon  dd, yyyy');

-- format exact
-- ���°� �� ������ �����̶�� �Ǵ��ϱ⸦ �ٶ���.
select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'fxMon  dd, yyyy');

select to_number('1234')
from dual;

select to_number('1,234', '9,999')
from dual;

select to_number('1,234.45', '9,999.99')
from dual;

select to_char(null), to_number(null), to_date(null)
from dual;

select nvl(null, 0)
from dual;

select job_id, nvl(commission_pct, 0)
from employees;

select last_name, job_id,
    (salary * 12) + (salary * nvl(commission_pct, 0) * 12) "Annual Salary"
from employees;

-- ������� �����, commission rate�� ��ȸ
-- null ���� No commission���� ���
-- single function�� �ϳ��� Į���� return�Ѵ�.
-- nvl function�� return ���� �ϳ��� Į���� �����Ѵ�.
select last_name, nvl(to_char(commission_pct, 'fm0.00'), 'No commission') "Commission Rate"
from employees;

-- nvl2 function
select last_name, nvl2(commission_pct, 'SAL+COMM', 'SAL') "INCOME"
from employees;

select last_name, nvl2(commission_pct, 'SAL+COMM', 0) "INCOME"
from employees;

select last_name, nvl2(commission_pct, 'SAL+COMM', '0') "INCOME"
from employees;

select last_name, 
    nvl2(commission_pct, (salary * 12 + salary * commission_pct * 12), salary * 12) "Annual Salary"
from employees;

-- nullif() function
-- null ���� �ƴϸ� ù ��° �Ķ���͸� return�Ѵ�.
select first_name, last_name,
    nullif(length(first_name), length(last_name))
from employees;

select to_char(null), to_date(null), to_number(null)
from dual;

-- coalesce() function
select last_name, job_id,
    coalesce(to_char(commission_pct, 'fm0.00'), to_char(manager_id, 'fm999'), 'None')
from employees;

-- decode() function
select last_name, salary,
    decode(trunc(salary / 2000),
        0, 0.00,
        1, 0.10,
        2, 0.20,
        3, 0.30,
        4, 0.42,
        5, 0.42,
        6, 0.44,
            0.45) "Tax Rate" 
from employees
where department_id = 80;

select decode(salary, 'a', 1)
from employees;

select decode(hire_date, 'a', 1)
from employees;

-- decode�� �⺻���� null
select decode(salary, 'a', 1, 0)
from employees;

select decode(salary, 1, 1)
from employees;

-- error ==> �ڵ� �� ��ȯ�� �ȵ�.
select decode(hire_date, 1, 1)
from employees;

select decode(job_id, 1, 1)
from employees;

-- ������� ������ ����� ���϶�
-- �⺻ ����� null
-- IT_PROG A, AD_PRES B, ST_MAN C, ST_CLERK D
select last_name, job_id,
    decode(job_id, 
        'IT_PROG', 'A',
        'AD_PRES', 'B',
        'ST_MAN', 'C',
        'ST_CLERK', 'D') "Grade"
from employees;

select last_name, job_id, salary,
    decode(job_id, 'IT_PROG', 1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP', 1.20 * salary,
                    salary) "Revised Salary"
from employees;

select last_name, job_id , salary, 
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'ST_CLERK' then 1.15 * salary
                when 'SA_REP' then 1.20 * salary
                else salary
                end "Revised Salary"
from employees;

select (case job_id when '1' then 1
    when '2' then 2
    end) grade
from employees;

-- case�� ���ذ��� when�� �񱳰��� datatype�� ���ƾ� �Ѵ�.
select (case job_id when 1 then '1'
    when 2 then '2'
    end) grade
from employees;

select (case salary when 1 then 1
    when 2 then 2
    else 0 end) grade
from employees;

select (case salary when 1 then '1'
    when 2 then '2'
    else '0' end) grade
from employees;

-- equal ������ �ܿ� �ٸ� �����ڸ� �� ���� ����
select last_name, salary,
    case when salary < 5000 then 'LOW'
         when salary < 10000 then 'MEDIUM'
         when salary < 20000 then 'HIGH'
    else 'GOOD'
    end "Grade"
from employees;

-- �����, �Ի��� �Ի������ �����Ϻ��� ������������ ��ȸ
select last_name, hire_date, to_char(hire_date, 'fmDay') "Day"
from employees
order by case "Day"
    when 'Monday' then 1
    when 'Tuesday' then 2
    when 'Wednesday' then 3
    when 'Thursday' then 4
    when 'Friday' then 5
    when 'Saturday' then 6
    else 7
    end;
    
-- �� ����鿡�� ���� �������� ��ǰ���� �����ַ��� �Ѵ�.
-- '2005/12/31' ���� �Ի��� ������ �׷��� ���� �����鿡 ���Ͽ� ������ �η��� �Ѵ�.
select last_name, hire_date,
    case when hire_date < '2005/12/31' then '$1000'
        else '$100' end "Prize"
from employees
order by "Prize", hire_date desc;