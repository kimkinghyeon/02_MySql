-- DML (Data Manipulation Language)
-- 데이터 조작 언어, 테이블에 값을 삽입, 수정 또는 삭제 하는 sql

-- INSERT
-- 새로운 행을 추가하는 구문
-- 테이블의 행ㅅ의 수가 증가한다.
-- null 허용 가능한 컬럼이나, auto-increment 가 있는 컬럼을 제외하고,
-- insert 하고싶은 데이터 컬럼을 저장해서 INSERT 가능

-- -- -- -- -- -- -- -- -- --
select * from tbl_menu;
-- insert into [테이블명] values ([컬럼]...)
insert into tbl_menu values (null,'바나나해장국',8500,4,'Y');
# delete from tbl_menu where menu_code;
describe tbl_menu;
insert into tbl_menu(orderable_status,menu_price,menu_name,category_code)
values('Y',5500,'파인애플탕',4);
-- -- -- -- -- -- -- -- -- --
-- 여러 컬럼을 한번에 INSERT 가능
insert into
tbl_menu
values
    (null,'참치맛아이스크림',1700,12,'Y'),
    (null,'멸치맛아이스크림',1500,11,'Y'),
    (null,'소세지맛커피',2500,8,'Y');
-- -- -- -- -- -- -- -- -- --

