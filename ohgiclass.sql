
-- fa sub 테이블
create table  fa_sub
(
    sub_no int primary key  auto_increment,
    sub_name varchar(255) not null unique
);

-- ohgiclass 테이블
create table ohclass
(
    sut_no int primary key auto_increment,
    sut_name varchar(255) not null,
    gender varchar(5) not null check (gender in ('남','여')),
    git_id varchar(255) not null unique ,
    email varchar(255) not null unique ,
    mbti varchar(10),
    sub_no int,
    foreign key (sub_no)
references fa_sub (sub_no)
);

describe ohclass;
describe fa_sub;

insert into fa_sub (sub_name)
 values ('MYBATIS'),
        ('JAVA'),
       ('JDBC'),
       ('SPRING'),
    ('MYSQL'),
    ('REACT');

select * from fa_sub
order by sub_no;

insert into ohclass
(sut_no, sut_name, gender, git_id, email, mbti, sub_no)
values (null, '박태근', '남', 'Ohgiraffers-bear', 'bear.ohgiraffers@gmail.com', null, 5),
       (null, '지동현', '남', 'Bring2it2on', 'yjkl0516@gmail.com', null, 1),
       (null, '김강현', '남', 'kimkinghyeon', 'modan8199@gmail.com', null, 2),
       (null, '이득규', '남', 'MANTISKYU', 'asdaron44@gmail.com', null, 3),
       (null, '홍주연', '여', 'juyeon99', 'juyeon0806@gmail.com', 'ISTT', 2),
       (null, '양혜연', '여', 'yanghyeyeon', 'yhy4058@gmail.com', null, 5),
       (null, '강진영', '여', 'weed97', 'weed97,weed9935@gmail.com', null, 3),
       (null, '이규섭', '남', 'LKS9616', 'lks609591@gmail.com', null, 3),
       (null, '전유안', '여', 'euuuuuuan', 'euan.may24@gmail.com', null, 3),
       (null, '박성은', '남', 'seongeun223', 'jklun080921@gmail.com', null, 3),
       (null, '박하얀', '여', 'parkhayarn', 's0224y92@gmail.com', null, 3),
       (null, '위성민', '남', 'wdh970616', '	wdh970616@naver.com', null, 3),
       (null, '박효찬', '남', 'qwes5674', 'qwes5674@gmail.com', null, 3),
       (null, '이의정', '남', 'himisterlee', 'lejlej100418@gmail.com', null, 3),
       (null, '권은혜', '여', 'dmsgpk237', 'a01027947353@gmail.com', null, 3),
       (null, '권보현', '여', 'Kwonbohyun', 'kwon18923@gmail.com', null, 3),
       (null, '배하은', '여', 'HEun0420', 'usialeta@gmail.com', null, 5),
       (null, '강연진', '여', 'kangyeonjin', 'yeonjin917n.n@gmail.com', null, 3);

select * from ohclass;
