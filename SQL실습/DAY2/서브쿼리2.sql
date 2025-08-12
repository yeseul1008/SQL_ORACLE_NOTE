-- 서브쿼리 --쿼리 안에 또다른 쿼리

SELECT MAX(PAY)
FROM PROFESSOR;

SELECT *
FROM PROFESSOR
WHERE PAY = 570; -- 너무 하드코딩


-- 서브쿼리 이용
SELECT *
FROM PROFESSOR
WHERE PAY = ( 
    SELECT MAX(PAY)
    FROM PROFESSOR
    );
    
SELECT *
FROM PROFESSOR
WHERE PAY = ( 
    SELECT MAX(PAY), MIN(PAY) -- 이건 안됨, =을 쓸 땐 하나여야함
    FROM PROFESSOR
    );
    
-- 급여 가장 많이 받는사람 + 가장 적게 받는사람
SELECT *
FROM PROFESSOR
WHERE PAY = ( 
    SELECT MAX(PAY) 
    FROM PROFESSOR
) OR PAY = (
    SELECT MIN(PAY)
    FROM PROFESSOR
    );
    
SELECT *
FROM PROFESSOR;

SELECT DEPTNO
FROM department
WHERE DNAME ='컴퓨터공학과';
    
SELECT *
FROM PROFESSOR
WHERE DEPTNO = (
    SELECT DEPTNO
    FROM department
    WHERE DNAME ='컴퓨터공학과');

SELECT *
FROM PROFESSOR
WHERE DEPTNO IN ( -- 조건문에 조건이 2개 이상이면 IN 써야함
    SELECT DEPTNO
    FROM department
    WHERE DNAME IN('컴퓨터공학과','멀티미디어공학과')
    );
    
    
-- 권장하는 방식은아님, 조인으로 대체가능
SELECT STU_NAME,(SELECT COUNT (*) FROM STUDENT)
FROM STUDENT;
