-- DDL
drop table hire_dates;

-- �⺻���� ���Ƿ� ���Ϸ��� default�� ���� ����Ѵ�.
create table hire_dates(
emp_id number(8),
hire_date date default sysdate
);

select tname
from tab;

select tname
from tab
where tname not like 'BIN%';

insert into hire_dates
values(1, to_date('2024/05/20'));

insert into hire_dates
values(2, null);

insert into hire_dates(emp_id)
values(3);

select *
from hire_dates;

-- Data Control Language(database�� ��Ʈ��)
-- system or sys user
-- connect to system user
create user you identified by you;

-- ���� �ο�
-- role �ο�
grant connect, resource to you;