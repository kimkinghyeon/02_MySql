-- 1)
select
    department_name as '학과명',
    category as '계열'
from
    tb_department;
-- 2)
select
   department_name as '학과별',
   capacity as '정원'
from
    tb_department;
-- 3)
select
    a.department_name,
    a.department_no,
    b.student_name
from
    tb_department a
join tb_student b on a.DEPARTMENT_NO = b.DEPARTMENT_NO in (001)
where
    substring(STUDENT_SSN,8,1) in ('2','4');
-- 4)
-- A513079, A513090, A513091, A513110, A513119
select
    student_no,
    student_name
from
    tb_student
where student_no in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
-- 5)
select
    department_name,
    capacity
from
    tb_department
where capacity >= 20 and capacity <= 30
order by capacity;
-- 6)
select
    department_no,
    professor_name
from
    tb_professor
where department_no is null;
-- 7)
select
    department_no,
    STUDENT_NAME
from
    tb_student
where department_no is null;
-- 8)
select
    class_no
from
    tb_class
where
    PREATTENDING_CLASS_NO is not null;
-- 9)
select
    category
from
    tb_department
group by category;
-- 10)
select
    STUDENT_name,
    ENTRANCE_DATE,
    STUDENT_ADDRESS
from tb_student
where STUDENT_ADDRESS like '전주시%' and year(ENTRANCE_DATE) = 2019 and ABSENCE_YN = 'N';






