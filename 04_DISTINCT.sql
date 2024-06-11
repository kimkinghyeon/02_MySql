-- DISTINCT
-- 중복된 값을 제거하는데 사용된다.
-- 중복을 제거해서 칼럼에 있는 칼럽값의 종류를 파악할 수 있다.

select category_code
from tbl_menu
order by category_code;

-- distinct select 뒤에 작성한다.

select distinct category_code
from tbl_menu
order by category_code;
-- 중복 제거

-- null 값을 포함하고 있는 칼럼에 DISTINCT 사용
select ref_category_code
from tbl_category;
-- null 값도 중복 제거
select distinct ref_category_code
from tbl_category;

-- 다중열 DISTINCT 사용
-- 다중열의 값들이 모두 동일하면 중복된것으로 판별
select
    category_code,
    orderable_status
from
    tbl_menu;

select distinct
    category_code,
    orderable_status
from
    tbl_menu;