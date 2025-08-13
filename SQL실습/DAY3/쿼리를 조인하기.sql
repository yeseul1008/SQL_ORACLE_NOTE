-- STUDENT 
-- 각 학과의 가장 키가 큰 사람을 구해라 - 학번, 이름, 키
SELECT * FROM STUDENT;

SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM student
GROUP BY STU_DEPT;

-- 쿼리 실행 결과를 조인하기 조인 뒤에 테이블 넣었던 위치에 쿼리를 넣기
SELECT STU_NO, STU_NAME, T.max_height
FROM STUDENT S
INNER JOIN (
    SELECT STU_DEPT, MAX(STU_HEIGHT) MAX_HEIGHT
    FROM student
    GROUP BY STU_DEPT
) T ON S.STU_DEPT = T. STU_DEPT AND S.STU_HEIGHT = T.max_height;

---------------

-- 각 직급별 가장 많은 급여를 받는 교수의 이름, 급여 출력 (PROFRSSOR)
SELECT * FROM professor;

SELECT POSITION, MAX(PAY)
FROM PROFESSOR
GROUP BY POSITION;

SELECT *
FROM professor P
INNER JOIN (
    SELECT POSITION, MAX(PAY)
    FROM PROFESSOR
    GROUP BY POSITION
) T ON P.POSITION = T.POSITION;

SELECT *
FROM professor P
INNER JOIN (
    SELECT POSITION, MAX(PAY) MAX_PAY
    FROM PROFESSOR
    GROUP BY POSITION
) T ON P.POSITION = T.POSITION AND P.PAY = T.MAX_PAY; -- 
    

-- 본인 부서의 평균 급여보다 높은 급여를 받는 사원의 사번, 이름, 급여 출력 EMP
SELECT * FROM EMP;

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL, AVG_SAL
FROM EMP E
INNER JOIN (
    SELECT DEPTNO, AVG(SAL) AVG_SAL 
    FROM EMP
    GROUP BY DEPTNO
)T ON E.deptno = T.deptno AND E.SAL > T.AVG_SAL;
