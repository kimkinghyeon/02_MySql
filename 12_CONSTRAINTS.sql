create database user_db;
show databases;
grant all privileges on user_db.* to 'ohgiraffers'@'%';
show grants for 'ohgiraffers'@'%';
use user_db;

-- CONSTRAINTS
-- 제약조건, 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 데이터 무결성을 보장하는데 도움이 된다.

-- NOT NULL
-- NULL 값을 허용하지 않는 조건

create table if not exists user_notnull
(
    user_no int not null,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255)
);

insert into user_notnull
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values(1,'user01','pass01','홍길도','남','010-1234-5678','hong123@gmail.com'),
(2,'user02','pass02','유관순','여','010-2222-2222','yu222@gmail.com');

-- UNIQUE
-- 중복값을 허용하지 않는 제약조건

drop table if exists  user_unique;

create table if not exists user_unique
(
    user_no int not null unique ,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255)
);
-- 같은 내용을 두번 insert 했을때,
-- user_no 의 unique 키가 중복되게 되면서
-- [23000][1062] Duplicate entry '1' for key 'user_unique.user_no' 발생
insert into user_unique
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values(1,'user01','pass01','홍길도','남','010-1234-5678','hong123@gmail.com'),
      (2,'user02','pass02','유관순','여','010-2222-2222','yu222@gmail.com');

-- PRIMARY KEY
-- 테이블에서 한행의 정보를 찾기위해 사용할 컬럼을 의미
-- NOT NULL + UNIQUE 제약조건을 의미
-- 한 테이블당 한개만 설정할 수 있다.
-- 한개의 컬럼에 설정할 수 도 있고, 여러 개의 컬럼을 묶어서 설정 할 수도 있다.(복합키)

drop table if exists  user_primarykey;

create table if not exists user_primarykey
(
    user_no int not null ,
    user_id varchar(255) not null,
    user_pwd varchar(255) not null,
    user_name varchar(255) not null,
    gender varchar(3),
    phone varchar(255) not null,
    email varchar(255),
    primary key (user_no)
);

insert into user_primarykey
(user_no,user_id,user_pwd,user_name,gender,phone,email)
values(1,'user01','pass01','홍길도','남','010-1234-5678','hong123@gmail.com'),
      (2,'user02','pass02','유관순','여','010-2222-2222','yu222@gmail.com');
