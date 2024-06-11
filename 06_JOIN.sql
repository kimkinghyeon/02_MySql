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

select
    a.menu_code as 'code',
    a.menu_name as name,
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

select
    tbl_menu.menu_name,
    tbl_category.category_name
from
    tbl_menu
inner join tbl_category;
