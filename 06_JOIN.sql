-- JOIN
-- 여러개의 분산된 표를 조합해서 하나의 표로 만드는 기능
-- 관계형 데이터베이스 에서 가장 중요한 파트이다.

-- 두개 이상 테이블을 관련있는 컬럼을 통해 결합하는데 사용된다.
-- 두개이상 테이블은 반드시 연관있는 컬럼이 존재해야하며, 이를 통해
-- JOIN 된 테이블의 컬럼을 모두 확인할 수 있다.

/*
ALIAS
-SQL 의 컬럼 또는 테이블에 별칭을 딸 수 있다
*/

select a.menu_code  as 'code',
       a.menu_name  as name,
       a.menu_price as 'price'
from tbl_menu a
order by price;

/*
INNER JOIN
- 두 테이블의 교집합을 반환하는 SQL JOIN 유형
- INNER JOIN 에서 INNER 키워드는 생략 가능하다.
- 컬럼명이 같거나, 다를 경우 ON 으로 서로 연관 있는
- 칼럼에 대한 조건을 작성하여 JOIN 한다.
*/

select tbl_menu.menu_name,
       tbl_category.category_name
from tbl_menu
         inner join tbl_category on tbl_menu.category_code = tbl_category.category_code;

select a.menu_name,
       b.category_name
from tbl_menu a
         inner join tbl_category b
                    on a.category_code = b.category_code
order by b.category_name;

-- INNER JOIN 은 교집합을 반환하기 때문에
-- JOIN 순서를 바꾸어도 영향이 없다.

select a.menu_name,
       b.category_name,
       a.category_code ACode,
       b.category_code BCode
from tbl_category b
         inner join tbl_menu a
                    on a.category_code = b.category_code
order by b.category_name;

-- USING
-- 컬럼명이 같은 경우 USING 으로 서로 연관이 있는 컬럼에
-- 대한 조건을 작성하여 JOIN 할 수 있다.

select a.menu_name,
       b.category_name
from tbl_menu a
         inner join tbl_category b using (category_code)
order by b.category_name;

/*
LEFT JOIN
- 첫번째(왼쪽) 테이블을 모두 조회하고, 왼쪽과 일치하는 오른쪽 테이블을
- JOIN 해준다.
*/

select
    a.menu_name,
    b.category_name
from
    tbl_menu a
left join tbl_category b on a.category_code = b.category_code;

/*
RIGHT JOIN
- 두번째(오른쪽) 테이블을 모두 조회하고
- 오른쪽과 일치하는 왼쪽 테이블에 JOIN 한다.
*/

select
    a.menu_name,
    b.category_name
from
    tbl_menu a
right join tbl_category b on a.category_code = b.category_code;

/*
CROSS JOIN
- 두테이블의 모든 가능한 조합을 반환하는 JOIN
(모든 경우의 수를 다 구함)
- 카트테시안 곱
*/

select
    a.menu_name,
    b.category_name
from tbl_menu a
cross join tbl_category b;

/*
SELF JOIN
- 같은 테이블 내에서 행과 행사이의 관계를 찾기 위해 사용되는 JOIN
*/

select
    a.category_name 카테고리,
    b.category_name 대분류
from tbl_category a
join tbl_category b on a.ref_category_code = b.category_code;


