-- CAST FUNCTIONS

-- 명시적 형변환
-- CAST ([표현방식] as 데이터 형식[(길이)])
-- CONVERT ([표현형식] , [데이터형식) [(길이)])
-- 데이터 형식으로 가능한 것
-- BINARY , CHAR , DATE , DATETIME , DECIMAL , JSON , SIGNED INTEGER (부호있음)
-- TIME , UNSIGNED INTEGER (부호없음)

-- tbl_menu 전체 가격 평균
select avg(menu_price)
from tbl_menu;


select cast(avg(menu_price) as signed integer) as '평균 메뉴 가격'
from tbl_menu;

select convert(avg(menu_price), signed integer) as '평균 메뉴 가격'
from tbl_menu;

-- date 형 cast
select cast('2024$06$13' as date);
select cast('2024/6/13' as date);
select cast('2024%6%13' as date);
select cast('2024@6@13' as date);

-- 카테고리별 메뉴 가격 합계 구하기
-- 0000원
select concat(cast(menu_price as char(5)), '원')
from tbl_menu;

select category_code, concat(cast(sum(menu_price) as char(5)), '원')
from tbl_menu
group by category_code;

-- 암시적 형변환
select '1' + '2'; -- 12가 아니라 정수형으로 연산되어 3이 출력됨
select concat(menu_price, '원') -- menu_price 가 자동을 문자로 변환됨
from tbl_menu;                  -- '3500 원'

select 3 > 'may'; -- 문자가 0 으로 변환됨 (출력값 1(true))
select 3 > '7may'; -- 문자에서 첫번째로 나온 숫자는 정수로 변환됨
select 3 > 'm7ay'; -- 숫자가 첫번째가 아니면 문자로 인식
select '2024-6-13'; -- 날짜형으로 바뀔 수 있는 문자 -> date 형으로 변환