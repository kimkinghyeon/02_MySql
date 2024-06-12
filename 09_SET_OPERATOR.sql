-- SET OPERATOR
-- 두개 이상의 SELECT 문의 결과 집합을 결합하는데 사용된다.
-- SET 연산자를 통해 결합하는 결과 집합의 컬럼이 동일해야한다.

-- UNION
-- 두개 이상의 SELECT 결과문을 결합하여 중복된 레코드를 제거한후 반환

-- 카테고리 코드가 10인 데이터 조회
-- -- -- -- -- -- -- -- -- --
select *
from tbl_menu
where category_code = 10

union
-- -- -- -- -- -- -- -- -- --
-- 메뉴 가격이 9000원 보다 작은 경우
select *
from tbl_menu
where menu_price < 9000;
-- UNION ALL
-- 두개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를
-- 제거하지 않고 모두 반환
-- -- -- -- -- -- -- -- -- --
select *
from tbl_menu
where category_code = 10
union all
select *
from tbl_menu
where menu_price < 9000
order by menu_code;
-- -- -- -- -- -- -- -- -- --
-- INTERSECT
-- 두 SELECT 문의 결과 중 공통되는 레코드만 반환
-- MYSQL 은 INTERSECT 를 제공하지 않지만
-- INNER JOIN 또는 IN 연산자를 활용해 구현가능
-- INNER JOIN 활용
-- -- -- -- -- -- -- -- -- --
select a.*
from tbl_menu a
         inner join(select *
                    from tbl_menu
                    where menu_price < 9000) b on (a.menu_code = b.menu_code)
where a.category_code = 10;
-- -- -- -- -- -- -- -- -- --
-- IN 활용
select *
from tbl_menu a
where category_code = 10
  and menu_code in (select menu_code
                    from tbl_menu
                    where menu_price < 9000);
-- -- -- -- -- -- -- -- -- --
-- MINUS
-- 첫번째 SELECT 문의 결과에서 두번째 SELECT 문의 결과가 포함하는 레코드를
-- 제외해서 반환
-- MYSQL 은 MINUS 를 제공하지 않지만 LEFT JOIN 을 활용해서 구현 가능
-- -- -- -- -- -- -- -- -- --
select
    a.*
from
    tbl_menu a
left join(
    select
        *
    from
        tbl_menu
    where
        menu_price < 9000
    ) b on (a.menu_code = b.menu_code)
where
    a.category_code = 10 and
    b.menu_code;
-- -- -- -- -- -- -- -- -- --