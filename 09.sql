-- DML, DDL
-- table 생성

drop table emp;
drop table dept;

create table emp(
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4)
);

create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4)
);

insert into dept(department_id, department_name, manager_id, location_id)
values(300, 'Public Relations', 100, 1700);

insert into dept(department_id, department_name)
values(310, 'Purchasing');

select * from dept;

commit;

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis', 'Pop',
        'Pop@gmail.com', '010-123-1234', sysdate,
        'AC_ACCOUNT', 6000, null,
        205, 110);
        
insert into emp
values(310, 'Jark', 'Klein',
        'Klein@gmail.com', '010-378-1278', to_date('2024/05/19', 'YYYY/MM/DD'),
        'IT_PROG', 8000, null,
        120, 190);
        
insert into emp
values(320, 'Terry', 'Benard',
        'Benard@gmail.com', '010-245-3567', '2025/12/12',
        'AD_PRES', 5000, .2,
        100, 30);

commit;

drop table sa_reps;

create table sa_reps(
rep_id number(6),
rep_name varchar2(25),
salary number(6),
commission_pct number(2, 2)
);

insert all
    into sa_reps values(1, '최한석', 20000, .1)
    into sa_reps values(2, '한아름', 30000, .12)
select * from dual;

declare
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(rep_id, rep_name, salary, commission_pct)
        values(base + i, 'n' || (base + i), base + i, i * 0.01);
    end loop;
end;
/

select *
from sa_reps
where rep_id > 400;

commit;

select employee_id, salary, job_id
from emp
where employee_id = 300;

-- update ==> where절
update emp
set job_id = 'IT_PROG',
    salary = 30000
where employee_id = 300;

update emp
set salary = null
where employee_id = 310;

update emp
set salary = null
where employee_id = 300;

select salary
from emp
where employee_id in (300, 310);

rollback;

update emp
set job_id = (select job_id
            from employees
            where employee_id = 205),
    salary = (select salary
            from employees
            where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp;

rollback;

update emp
set (job_id, salary) = (
            select job_id, salary
            from employees
            where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp;

commit;

-- delete dept

delete dept
where department_id = 310;

select *
from dept;

rollback;

delete dept
where department_id = (select department_id
                    from departments
                    where department_name = 'Purchasing');
                    
                    
rollback;

delete emp
where department_id = (select department_id
                        from departments
                        where department_name = 'Purchasing');

select * from emp;

rollback;

commit;