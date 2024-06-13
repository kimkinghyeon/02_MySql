-- 1)
select STUDENT_NO    as '학번',
       STUDENT_NAME  as '이름',
       ENTRANCE_DATE as '입학년도'
from tb_student
where DEPARTMENT_NO in (002)
order by ENTRANCE_DATE;
-- 2)
select PROFESSOR_NAME,
       PROFESSOR_SSN
from tb_professor
where PROFESSOR_no in ('P075', 'P100');
#     length(PROFESSOR_NAME) != 3;
-- 3)
SELECT PROFESSOR_NAME,
       truncate(datediff(date(now()),
                        date(concat('19',substring(cast(PROFESSOR_SSN as char(14)),1,6))))/365,0)
from
    tb_professor
where
    substring(cast(PROFESSOR_SSN as char(14)),8,1) = '1';
-- 4)
select
    substr(PROFESSOR_NAME,2)
from
    tb_professor;
-- 5)
SELECT STUDENT_NO,
    student_name
from
    tb_student
where truncate(datediff(date(now()),
                        date(concat('19',substring(cast(STUDENT_SSN as char(14)),1,6))))/365,0) <= 30
order by
    STUDENT_NAME;
-- 6)
select case dayofweek('20201225')
when '6' then '금요일'
end as dayofweek;
-- 7)
SELECT curdate('99/10/11');  -- 2099년 10월 11일
SELECT curdate('49/10/11'); -- 2049년 10월 11일
SELECT curdate('99/10/11'); -- 1999년 10월 11일
SELECT date(49,10,11);  -- 2049년 10월 11일
-- 8)
-- 9)
-- 10)
-- 11)
-- 12)
-- 13)
-- 14)