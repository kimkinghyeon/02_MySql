-- BUILD INT FUNCTIONS

-- 문자열 관련 함수
-- ASCII(아스키코드),CHAR(숫자)
-- ASCII : 아스키 코드 값 추출
-- CHAR : 아스키 코드 문자 추출
select ascii('A'), char(65);
-- 출력값 : ascci = 65 , char 'A'

-- BIT_LENGTH(문자열),CHAR_LENGTH(문자열,LENGTH(문자열)
-- BIT_LENGTH : 할당된 비트 크기 반환
-- CHAR_LENGTH : 문자열의 길이 반환
-- LENGTH : 할당된 바이트 크기 반환
select bit_length('pie'), char_length('pie'), length('pie');
select menu_name,
       bit_length(menu_name),
       char_length(menu_name),
       length(menu_name)
from tbl_menu;
-- concat(문자열1, 문자열2, ... ) : 문자열을 이어붙임
-- concat_ws(구분자, 문자열1, 문자열2, ... ) : 문자열을 구분자랑 같이 이어붙임
select concat('호랑이', '기린', '토끼'); -- 호랑이기린토끼
select concat_ws(',', '호랑이', '기린', '토끼');
-- (',') : 호랑이,기린,토끼

-- ELT (위치 , 문자열 1 , 문자열2 , ... ) : 해당 위치의 문자열을 반환
-- FIELD (찾을 문자열 , 문자열 1 , 문자열 2 ... ) : 찾을 문자열을 반환
-- FIND_IN_SET(찾을 문자열 , 문자열 리스트) : 찾을 문자열의 위치를 반환
-- INSTR(기준 문자열, 부분 문자열) : 기준 문자열에서 부분 문자열의 시작 위치 반환
-- LOCATE(부분 문자열, 기준 문자열) : INSTR 과 순서만 반대
select elt(2, '사과', '딸기', '바나나')      as elt,
       field('딸기', '사과', '바나나', '딸기') as fielde,
       find_in_set('바나나','사과,딸기,바나나') as find_in_set,
       instr('사과딸기바나나','딸기') as instr,
    locate('딸기','사과딸기바나나') as locate ;

-- 숫자형

-- FORMAT(숫자, 소숫점 자릿수)
-- FORMAT : 1000 단위마다 콤마(,) 표시해주며 , 소수점 아래 자릿수(반올림)까지 표현한다.
select format(1123423513523523.45678,3);

-- BIN(숫자) : 2진수
-- OCT(숫자) : 8진수
-- HEX(숫자) : 16진수
select bin(65) , oct(65) , hex(65);

-- INSERT(기준문자열, 위치 , 길이 , 삽일할 문자열)
-- INSERT : 기준 문자열의 위치부터 길이만큼 지우고 문자열을 끼워넣는다.
select insert('내 이름은 메구밍',7,3,'메구밍');

-- LEFT(문자열, 길이) : 왼쪽에서 문자열의 길이만큼 반환
-- RIGHT(문자열, 길이) : 오른쪽에서 문자열의 길이만큼 반환
select
    left('hello world!',3),
    right('hello world!',3);

-- UPPER() : 소문자를 대문자로 바꿈
-- LOWER() : 대문자를 소문자로 바꿈
select lower('Hello World'),upper('Hello World');