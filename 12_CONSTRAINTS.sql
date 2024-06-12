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
    user_no   int          not null,
    user_id   varchar(255) not null,
    user_pwd  varchar(255) not null,
    user_name varchar(255) not null,
    gender    varchar(3),
    phone     varchar(255) not null,
    email     varchar(255)
);

insert into user_notnull
    (user_no, user_id, user_pwd, user_name, gender, phone, email)
values (1, 'user01', 'pass01', '홍길도', '남', '010-1234-5678', 'hong123@gmail.com'),
       (2, 'user02', 'pass02', '유관순', '여', '010-2222-2222', 'yu222@gmail.com');

-- UNIQUE
-- 중복값을 허용하지 않는 제약조건

drop table if exists user_unique;

create table if not exists user_unique
(
    user_no   int          not null unique,
    user_id   varchar(255) not null,
    user_pwd  varchar(255) not null,
    user_name varchar(255) not null,
    gender    varchar(3),
    phone     varchar(255) not null,
    email     varchar(255)
);
-- 같은 내용을 두번 insert 했을때,
-- user_no 의 unique 키가 중복되게 되면서
-- [23000][1062] Duplicate entry '1' for key 'user_unique.user_no' 발생
insert into user_unique
    (user_no, user_id, user_pwd, user_name, gender, phone, email)
values (1, 'user01', 'pass01', '홍길도', '남', '010-1234-5678', 'hong123@gmail.com'),
       (2, 'user02', 'pass02', '유관순', '여', '010-2222-2222', 'yu222@gmail.com');

-- PRIMARY KEY
-- 테이블에서 한행의 정보를 찾기위해 사용할 컬럼을 의미
-- NOT NULL + UNIQUE 제약조건을 의미
-- 한 테이블당 한개만 설정할 수 있다.
-- 한개의 컬럼에 설정할 수 도 있고, 여러 개의 컬럼을 묶어서 설정 할 수도 있다.(복합키)

drop table if exists user_primarykey;

create table if not exists user_primarykey
(
    user_no   int          not null,
    user_id   varchar(255) not null,
    user_pwd  varchar(255) not null,
    user_name varchar(255) not null,
    gender    varchar(3),
    phone     varchar(255) not null,
    email     varchar(255),
    primary key (user_no)
);

insert into user_primarykey
    (user_no, user_id, user_pwd, user_name, gender, phone, email)
values (1, 'user01', 'pass01', '홍길도', '남', '010-1234-5678', 'hong123@gmail.com'),
       (2, 'user02', 'pass02', '유관순', '여', '010-2222-2222', 'yu222@gmail.com');

-- 중복값 체크 =  primary key 는 NOT NULL + UNIQUE 제약조건을 의미
# insert into user_primarykey
# (user_no,user_id,user_pwd,user_name,gender,phone,email)
# values(1,'user01','pass01','홍길도','남','010-1234-5678','hong123@gmail.com');

-- FOREIGN KEY
-- 참조된 다른 테이블에서 제공하는 값만 사용 할 수 있다.
-- 참조 무결성을 위배하지 않기 위해 사용
-- FOREIGN KEY 제약조건에 의해 테이블 간의 관게(RELATIONSHIP) 형성됨.
-- 제공되는 값(참조하는 테이블의 값) 이외에는 NULL 사용가능

/*
참조 무결성
-> 기본키와 외래키 간의 관계가 항상 유지되도록 보장하는 것을 의미
*/

create table if not exists user_grade
(
    grade_code int          not null unique,
    grade_name varchar(255) not null
) engine = INNODB;

insert into user_grade
values (10, '스텐다드'),
       (20, 'EOD'),
       (30, '언허드');

select *
from user_grade;

create table if not exists user_foreignkey1
(
    user_no    int primary key,
    user_id    varchar(255) not null,
    user_pwd   varchar(255) not null,
    user_name  varchar(255) not null,
    gender     varchar(3),
    phone      varchar(255) not null,
    email      varchar(255),
    grade_code int,
    foreign key (grade_code)
        references user_grade (grade_code)
);
insert into user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)

values (1, 'user01', 'pass01', '홍길도', '남', '010-1234-5678', 'hong123@gmail.com', 10),
       (2, 'user02', 'pass02', '유관순', '여', '010-2222-2222', 'yu222@gmail.com', 20);

-- 오래키 제약 조건
-- 참조 컬럼에 없는 값 적음
--
-- [42S02][1146] Table 'user_db.user_foreignkey1' doesn't exist
# update user_foreignkey1
# set grade_code = 5
# where user_no = 5;

-- CHECK
-- check 제약 조건을 위반시 허용하지 않음

create table if not exists user_check
(
    user_no   int auto_increment primary key,
    user_name varchar(255) not null,
    gender    varchar(255) check (gender in ('남', '여')),
    age       int check (age >= 19) -- 조건
);

insert into user_check
values (null, '홍길동', '남', 25),
       (null, '이순신', '남', 35),
       (null, '김선우', '남', 20);

-- gender check 제약 조건 확인
# insert into user_check
# values (null, '안중근', '남자', 27);
-- [HY000][3819] Check constraint 'user_check_chk_1' is violated.
-- check ('남','여') 만 값을 받을 수 있게 했기 때문에 에러
-- age check 제약 확인
insert into user_check
values (null, '길동', '남', 17);

-- DEFAULT
-- 컬럼에 null 대신 기본 값 적용
-- 컬럼 타입이 DATE 일 시 , current_date 만 가능
-- DATETIME -> current_time, current_timestamp,now() 모두 사용가능

create table if not exists tbl_country
(
    country_code int auto_increment primary key ,
    country_name varchar(255) default 'koren',
    population varchar(255) default '0man',
    add_day date default (current_date),
    add_time datetime default (current_time)
);
insert into tbl_country
values (null,default,default,default,default);

select * from tbl_country;



