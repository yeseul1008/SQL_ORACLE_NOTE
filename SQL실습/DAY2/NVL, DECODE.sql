-- 오라클에서 조건 처리

SELECT * FROM professor;

SELECT NAME, PAY, BONUS, PAY+bonus
FROM professor; -- 보너스가 널값인 사람은 PAY+bonus가 NULL이 나와버리는 문제

-- NVL 함수
SELECT NAME, BONUS, NVL(BONUS, 0) -- 보너스가 NULL인 애들을 0으로 바꿔줌
FROM professor;

SELECT NAME, PAY, BONUS, PAY+NVL(BONUS, 0)
FROM professor; -- 이런식으로 사용하면 문제없이 NULL이 아닌 값 출력됨

-- 페이+보너스의 합이 300이상인 사람 구하기
SELECT *
FROM professor
WHERE PAY+NVL(BONUS, 0) >= 300;

--NVL2 함수
SELECT BONUS, NVL2(BONUS, 1000, 0) -- NULL이 아니면 1000으로, NULL이면 0으로 대체
FROM professor;

-------------------------

SELECT *
FROM STU;
----------
---DECODE--- 자바의 조건문 IF
-- DECODE(컬럼명, '조건값', '조건값이 컬럼값이랑 동일할 때 출력할 값', '조건 만족 안할떄 출력할 값')

SELECT NAME, SUBSTR (JUMIN, 7,1) as 성별
FROM STU;

SELECT NAME, SUBSTR (JUMIN, 7,1) as 성별, DECODE('성별','1','남성','여성')
FROM STU;

SELECT NAME, DECODE(SUBSTR (JUMIN, 7,1),1,'남성','여성') AS 성별
FROM STU;

SELECT ENAME, DECODE(JOB, 'MANAGER', '매니저!', '그외')FROM EMP;


-- IF - ELSE IF - ELSE
SELECT ENAME, DECODE(JOB, 'MANAGER', '매니저!','SALESMAN','세일즈맨!', '그외')FROM EMP;

-- 주민번호 7번째가 1,3,이면 '남자', 2,4면 '여자
SELECT NAME, DECODE(SUBSTR (JUMIN, 7,1),1,'남성',3,'남성',2,'여성',4,'여성') AS 성별
FROM STU;