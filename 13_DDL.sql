-- DDL (Date Definition Language)
-- 데이터 정의어, 데이터 베이스를 정의하는 언어
-- 테이블을 생성, 수정, 삭제 하는등의 데이터 전체의 골격을 결정하는 역할

-- create : 데이터베이스, 테이블 등을 생성
-- alter : 테이블을 수정
-- drop : 데이터베이스, 테이블을 삭제
-- truncate : 테이블을 초기화

-- CREATE
-- 테이블,데이터베이스를 생성하는 구문
-- if not exists : 존재하지 않으면 생성
-- -> 기존에 존재하는 테이블이 있더라도 에러가 발생하지 않는다.

create table if not exists tb1
(
    pk   int primary key,
    fk   int,
    col1 varchar(255) default 'mysql',
    check (col1 in ('Y', 'N'))
);
-- 테이블의 구조 확인
describe tb1;

insert into tb1
values (1, 10, 'Y');

select *
from tb1;
-- auto increment
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게)
create table if not exists tb2
(
    pk   int auto_increment primary key,
    fk   int,
    col1 varchar(255) default 'mysql',
    check (col1 in ('Y', 'N'))
);
describe tb2;

insert into tb2
values (null, 10, 'Y');

select *
from tb2;

-- ALTER
-- 테이블에 추가/변경/수정/삭제 를 할 수 있다.

describe tb2;
-- 열 추가
alter table tb2
    add col2 int not null;
-- 칼럼삭제
alter table tb2
    drop column col2;
-- 컬럼명 및 형식 변경
alter table tb2
    change column fk change_fk int not null;
-- 열 제약 조건 추가, 삭제
# alter table tb2
# drop primary key;
-- 테이블에 primary key 는 반드시 1개 이상 존재해야함
-- modify 는 컬럼의 정의를 바꾸는것
alter table tb2
    modify pk int;

alter table tb2
    add primary key (pk);

select *
from tb2;

-- 기존 데이터가 있는경우. not null 옵션의 컬럼이 생기면
-- 기본값으로 들어가게됨
-- [22001][1292] Data truncation: Incorrect date value: '0000-00-00' for column 'col3' at row 1
alter table tb2
    add col3 date not null;
# add col4 tinyint not null;

-- mysql 자체에서 전역적인 유효성 검사 모드를 사용한다.
select @@global.sql_mode;

set global sql_mode = '';

-- DROP
-- 테이블을 삭제하기 위한 구문
-- if exists 를 적용하면 존재하지 않는 테이블이라도 에러 발생하지않음

create table if not exists tb3
(
    pk   int auto_increment primary key,
    fk   int,
    col1 varchar(255) default 'mysql',
    check (col1 in ('Y', 'N'))
);
-- 테이블 여러개 삭제
drop table if exists tb1,tb2,tb3,tb4,tb5,tb6,tb7;

-- TRUNCATE
-- 삭제할때 사용된다.
-- delete -> 데이터를 삭제할떄 행마다 하나씩 지운다.
-- truncate -> 테이블 drop, 테이블 생성 진행
-- auto_increment 컬럼이 있는 경우 시작값도 0으로 초기화한다.
create table if not exists tb6
(
    pk   int auto_increment primary key,
    fk   int,
    col1 varchar(255) default 'mysql',
    check (col1 in ('Y', 'N'))
);

insert into tb6 values (null,10,'Y');
insert into tb6 values (null,10,'Y');
insert into tb6 values (null,10,'Y');
insert into tb6 values (null,10,'Y');
insert into tb6 values (null,10,'Y');

select * from tb6;

truncate tb6;