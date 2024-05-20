-- view, sequence, index, synonym
-- view
-- hr
drop view empvu80;

create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80;

create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
    
desc empvu80

-- 50번 부서원들의 사번, 이름, 부서번호로 만든 DEPT50 view를 만들어라
-- view구조는 EMPNO, EMPLOYEE, DEPTNO이다.

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50;
    
desc dept50

select * from dept50;
---

-- where 절의 조건을 check한다.
create or replace view dept50(empnno, employee, depyno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;
    
    
drop table teams;
drop view team50;

create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select * 
    from teams
    where team_id = 50;
    
select * from team50;

select count(*) from teams;

insert into team50
values(300, 'Marketing');

select count(*) from teams;

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;

insert into team50 values(50, 'IT Support');
select count(*) from teams;

insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
    
insert into empvu10 values(501, 'abel', 'Sales');
select * from empvu10;
---

-- sequence
create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id = 4;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20
    nocache
    nocycle;
    
select x_xid_seq.nextval from dual;

-- DEPT 테이블의 DEPARTMENT_ID 칼럼의 field value로 사용할 sequence
-- sequence는 400이상 1000이하로 생성, 증가값은 10.

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000;
    

-- 위 sequence를 이용하여 dept table에 Education부서를 insert하면??

insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

select * from dept;

commit;
---

-- index
drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name, rowid
from employees;

select last_name
from employees
where last_name = 'Baer';

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADOAAG';

select index_name, index_type, table_owner, table_name
from user_indexes;

-- DEPT table의 DEPARTMENT_NAME에 대한 index를 만들면??
drop index dept_deptname_idx;

create index dept_deptname_idx
on dept(department_name);
---

-- synonym
drop synonym team;

create synonym team
for departments;

select * from team;

-- EMPLOYEES 테이블에 EMPS SYNONYM을 만들면??
drop synonym emps;

create synonym emps
for employees;

select * from emps;
