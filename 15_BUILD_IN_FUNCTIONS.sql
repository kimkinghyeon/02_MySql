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
select elt(2, '사과', '딸기', '바나나')       as elt,
       field('딸기', '사과', '바나나', '딸기')  as fielde,
       find_in_set('바나나', '사과,딸기,바나나') as find_in_set,
       instr('사과딸기바나나', '딸기')          as instr,
       locate('딸기', '사과딸기바나나')         as locate;

-- 숫자형

-- FORMAT(숫자, 소숫점 자릿수)
-- FORMAT : 1000 단위마다 콤마(,) 표시해주며 , 소수점 아래 자릿수(반올림)까지 표현한다.
select format(1123423513523523.45678, 3);

-- BIN(숫자) : 2진수
-- OCT(숫자) : 8진수
-- HEX(숫자) : 16진수
select bin(65), oct(65), hex(65);

-- INSERT(기준문자열, 위치 , 길이 , 삽일할 문자열)
-- INSERT : 기준 문자열의 위치부터 길이만큼 지우고 문자열을 끼워넣는다.
select insert('내 이름은 메구밍', 7, 3, '메구밍');

-- LEFT(문자열, 길이) : 왼쪽에서 문자열의 길이만큼 반환
-- RIGHT(문자열, 길이) : 오른쪽에서 문자열의 길이만큼 반환
select left('hello world!', 3),
       right('hello world!', 3);

-- UPPER() : 소문자를 대문자로 바꿈
-- LOWER() : 대문자를 소문자로 바꿈
select lower('Hello World'), upper('Hello World');

-- LPAD(문자열, 길이 , 채용 문자열) : 문자열을 길이만큼 왼쪽으로 늘린후에, 빈곳을 채울 문자열로 채운다.
-- RPAD(문자열, 길이 , 채용 문자열) : 문자열을 길이만큼 오른쪽으로 늘린후에, 빈곳을 채울 문자열로 채운다.
select lpad('왼쪽', 6, '@'), rpad('오른쪽', 6, '@');

-- LTRIM(문자열) : 왼쪽 공백 제거
-- RTRIM(문자열) : 오른쪽 공백 제거
-- TRIM(문자열) : 양쪽 공백을 제거
-- TRIM(BOTH(양쪽), LEADING(왼쪽), TRAILING(오른쪽)) 해당 방향에 지정한 문자열을 제거 할 수 있다.
select ltrim('   왼쪽'), rtrim('오른쪽   '), trim('   양쪽   '), trim(both '@' from '@@@@mysql@@@@');

-- REPEAT(문자열, 횟수) : 문자열을 횟수만큼 반복
select repeat('집에가고싶다.', 100);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열) : 문자열에서 문자열을 찾아 바꿈
select replace('마이SQL', '마이', 'MY');

-- REVERSE(문자열) : 문자열의 순서를 거꾸로 뒤집음
select reverse('stressed');
-- d

-- SPACE(길이) : 길이만큼의 공백을 반환
select concat('제 이름은', space(5), '이고 나이는', space(3), '세 입니다');

-- SUBSTRING(문자열, 시작위치, 길이) : 시작 위치부터 길이만큼의 문자를 반환( 길이를 생략하면 시작부터 끝까지 반환)
select substring('안녕하세요. 반갑습니다.', 7, 2),
       substring('안녕하세요. 반갑습니다.', 7);

-- SUBSTRING_INDEX(문자열, 구분자, 횟수) : 구분자가 왼쪽부터 횟수 번째 나오면 그 이후의 오른쪽은 버린다.
-- 횟수가 음수일 경우, 오른쪽 부터 세고 왼쪽을 버린다.
select substring_index('hong.test@gmail.com', '.', 2);
select substring_index('hong.test@gmail.com', '.', -2);

-- 수학 관련 함수
-- ABS(숫자) : 절대값 반환
select abs(-123);

-- CEILING(숫자),FLOOR(숫자),ROUND(숫자)
-- CEILING : 울림값 반환
-- FLOOR : 내림값 반환
-- ROUND : 반올림값 반환
select ceiling(1234.56), floor(1234.56), round(1234.56);

-- MOD(숫자1 , 숫자2) (숫자1 % 숫자2),숫자1 MOD 숫자2
-- 숫자 1 을 숫자 2로 나눈 나머지추출
select mod(75, 10), 75 % 10, 75 mod 10;

-- POW(숫자1,숫자2) : 거듭제곱값 반환
-- SQRT(숫자) : 제곡근 추출
select pow(2, 4),
       sqrt(16);

-- RAND() : 0 이상 1미난의 실수를 반환
--  'm <= 임의의 정수 < n' 구하고 싶을때
-- FLOOR((RAND() * (N-M) + M) 을 사용한다.
-- 1부터 10 까지 난수
select rand(),
       floor(rand() * (11 - 1) + 1);

-- SIGN(숫자)
-- 양수면 1, 0이면 0 , 음수면 -1을 반환
select sign(10.1),sign(0),sign(-10,1);

-- TRUNCATE(숫자,정수)
-- 소숫점을 기준으로 정수 위치까지 구하고 나머지는 버림
select truncate(12345.12345, 2);
-- 음수면 정수 위치까지 구하고 나머지는 버림
select truncate(12345.12345, -2);

-- 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이) : 날짜를 기준으로 차이를 더함
-- SUBDATE(날짜, 차이) : 날짜를 기준으로 차이를 뺌
select adddate('2024-06-13',interval 30 day),adddate('2024-06-13',interval 6 month);
select subdate('2024-06-13',interval 30 day),subdate('2024-06-13',interval 6 month);

-- ADDTIME(날짜/시간, 시간) : 날짜/시간을 기준으로 시간을 더함
-- SUBTIME(날짜/시간, 시간 : 날짜/시간을 기준으로 시간을 뺌
select addtime('2024/06/13','1:0:1'),subtime('2024,06,13 12:00:00','1:0:1');

-- 현재 연-월-일 , 시간-분-초 반화해주는 함수들
-- CURDATE : 2024-06-13
-- CURTIME : 12:03:27
-- NOW() : 2024-06-13 12:03:27
-- SYSDATE() : 2024-06-13 12:03:27
select curdate(),curtime(),now(),sysdate();

-- YEAR()
-- MONTH()
-- DAY()
-- MINUTE()
-- SECOND()
-- MICROSECOND()
-- 날짜 또는 시간에서 연,월,일,시,초,밀리초, 를 추출
select year(curdate());
select hour(curtime());

-- DATE() : 연,월,초
-- TIME() : 시,분,초
Select date(now()),time(now());

-- LAST_DAY(날짜) : 해당 날짜의 달에서 마지막 날짜를 구한다.
select last_day('20240201');

-- MAKETIME(시,분,초) : 시:분:초 TIME 형시을 만든다.
-- MAKEDATE(연도,정수) : 해당 연도의 정수만큼 지난 날짜를 구함

select maketime(17,03,02);
select makedate(2024,200);

-- QUARTER(날짜)
-- 해당 날짜의 분기를 구한다.
select quarter(now());

-- TIME_TO_SEC(시간)
-- 시간을 초단위로 구해준다.
select  time_to_sec('1:1:1');