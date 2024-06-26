create table if not exists classtable
(
    student_no   int auto_increment primary key,
    student_name varchar(255) not null,
    gender       varchar(5)   not null
        check (gender in ('남', '여')),
    github_id    varchar(255) not null unique,
    email        varchar(255) not null unique,
    mbti         varchar(10),
    subject_no   int,
    foreign key (subject_no)
        references favorite_subject (subject_no)
);

insert into classtable
values (null, '박태근', '남', 'Ohgiraffers-bear', 'bear.ohgiraffers@gmail.com', null, 5),
       (null, '지동현', '남', 'Bring2it2on', 'yjkl0516@gmail.com', null, 1),
       (null, '김강현', '남', 'kimkinghyeon', 'modan8199@gmail.com', null, 2),
       (null, '이득규', '남', 'MANTISKYU', 'asdaron44@gmail.com', null, 3),
       (null, '홍주연', '여', 'juyeon99', 'juyeon0806@gmail.com', 'ISTT', 2),
       (null, '양혜연', '남', 'yanghyeyeon', 'yhy4058@gmail.com', null, 5),
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
       (null, '강연진', '여', 'kangyeonjin', '''yeonjin917n.n@gmail.com', null, 3);

drop table if exists classtable;
drop table if exists favorite_subject;

create table if not exists favorite_subject
(
    subject_no int auto_increment primary key,
    subject_name varchar(255) not null unique
);

insert into favorite_subject
(subject_no, subject_name)
values (1, 'JDBC'),
       (2, 'JAVA'),
       (3, 'MYSQL'),
       (4, 'MYBATIS'),
       (5, 'SPRING');

select * from classtable;

select
    subject_no,
    student_name
from
    classtable
order by
    student_no asc
limit 5;

select
    a.student_name,
    b.subject_name
from classtable a
join favorite_subject b on a.subject_no = b.subject_no
order by
    a.student_no;

select
    subject_no,
    student_name
from
    classtable
order by
    student_no;
