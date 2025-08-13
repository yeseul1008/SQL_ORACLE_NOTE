-- STUDENT, ENROL, SUBJECT 
-- 1. 성이 '김'씨인 학생들의 학번, 이름, 학과를 출력하시오.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '김%'; 

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE SUBSTR(STU_NAME,1,1) = '김';

-- 2. 15학번 학생들의 학번, 이름, 학과를 출력하시오.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NO LIKE '2015____';

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE SUBSTR(STU_NO,3,2) = 15;

-- 3. 컴퓨터정보 학과 학생들의 시험 평균 점수를 구하시오.
SELECT * FROM ENROL;
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;

SELECT AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON s.stu_no = e.stu_no
WHERE STU_DEPT = '컴퓨터정보';

-- 4. 컴퓨터개론 수업을 듣는 학생의 학번, 이름, 학과, 시험점수를 구하시오.
SELECT S.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON s.stu_no = e.stu_NO
INNER JOIN SUBJECT SJ ON E.SUB_NO = SJ.SUB_no
WHERE SUB_NAME = '컴퓨터개론';

-- 5. 학생들의 전체 평균 키보다 큰 키를 가진 학생들의 학번, 이름, 키를 출력하시오.
SELECT AVG(STU_HEIGHT)
FROM STUDENT;

SELECT STU_NO, STU_NAME, stu_height
FROM STUDENT S
WHERE stu_height > (
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT);

-- 6. 본인 학과의 평균 키보다 큰 학생들의 이름, 학과, 키, 학과 평균키 값 출력
SELECT STU_DEPT, AVG(stu_height)
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_NAME, S.STU_DEPT, STU_HEIGHT, 학과평균
FROM STUDENT S
INNER JOIN (
    SELECT STU_DEPT, AVG(stu_height) 학과평균
    FROM STUDENT
    GROUP BY STU_DEPT
)T ON S.STU_DEPT = T.STU_DEPT AND S.STU_HEIGHT > T.학과평균; -- 조인을 할 조건 다 주기 (마지막에 WHERE로 조건을 줘도 됨)

-- EMP, SALGRADE, DEPT
-- 1. 급여 등급이 3이상인 사원의 사번, 이름, 급여등급을 출력하시오.
SELECT * FROM EMP;
SELECT * FROM salgrade;
SELECT * FROM DEPT;

SELECT EMPNO, ENAME, GRADE
FROM EMP E
INNER JOIN salgrade S ON E.SAL BETWEEN S.LOSAL AND s.hisal
WHERE GRADE >=3;

-- 2. 사번, 이름, 팀장(MGR)의 이름을 출력하시오.
SELECT E1.EMPNO, E1.ENAME, E2.ENAME
FROM EMP E1
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- 3. 부서별 가장 높은 급여를 받는 사원의 사번, 이름, 급여, 부서명을 출력하시오.
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY deptno;

SELECT EMPNO, ENAME, SAL, E.DEPTNO
FROM EMP E
INNER JOIN(
    SELECT DEPTNO, MAX(SAL) MAXDEPT
    FROM EMP
    GROUP BY deptno
) T ON E.deptno = T.DEPTNO AND E.SAL = T.maxdept;

-- 4. 입사년도가 1981년도인 사원들의 급여 총합을 구하시오.
SELECT SUM(SAL)
FROM EMP
WHERE hiredate LIKE '%81%';

SELECT SUM(SAL)
FROM EMP
WHERE TO_CHAR(hiredate,'YYYY') = 81;

-- STU, PROFESSOR, DEPARTMENT
-- 1. 남자이면서(주민번호 7번째자리 1) 공과대학에 속한 학생의 수를 구하시오.
SELECT * FROM STU;
SELECT * FROM professor;
SELECT * FROM department;
-- 다른방법(선생님)꺼도 보기
SELECT COUNT(*)
FROM STU S
INNER JOIN (
    SELECT D2.DEPTNO 공과
FROM department D1
INNER JOIN department D2 ON D1.DEPTNO = D2.PART
WHERE D1.PART = '10'
) T ON s.deptno1 = T.공과
WHERE SUBSTR(JUMIN,7,1) = 1;

SELECT D2.DEPTNO
FROM department D1
INNER JOIN department D2 ON D1.DEPTNO = D2.PART
WHERE D1.PART = '10';

-- 2. 학생들의 아이디의 마지막 세글자를 '*' 로 채우시오
SELECT ID, SUBSTR(ID,1,LENGTH(ID)-3) || '***'
FROM STU;

-- 3. 보너스+급여가 400 이하인 교수들의 이름, 아이디, 학과명을 출력하시오.
SELECT NAME, ID, DNAME
FROM professor P
INNER JOIN department D ON p.deptno = d.deptno
WHERE PAY+NVL(BONUS, 0) <= 400;

-- 4. 담당 학생이 2명이상인 교수의 이름, 아이디, 담당학생 수를 출력하시오.

SELECT P.NAME, P.ID,COUNT(*)
FROM STU S
INNER JOIN professor P ON S.PROFNO = p.profno
GROUP BY P.NAME, P.ID
HAVING COUNT(*)>=2;
 
-- 5. 가장 높은 급여를 받는 교수의 학과에 해당하는 학생 수 출력 선생님 방법 비교해보기
SELECT *
FROM PROFESSOR
WHERE PAY = (
    SELECT MAX(PAY)
    FROM PROFESSOR);


SELECT COUNT(S.NAME)
FROM PROFESSOR P
INNER JOIN STU S ON P.DEPTNO = S.DEPTNO1
WHERE PAY = (
    SELECT MAX(PAY)
    FROM PROFESSOR);

