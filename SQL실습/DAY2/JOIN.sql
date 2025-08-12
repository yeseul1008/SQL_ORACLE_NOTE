-- 조인 => 2개 이상의 테이블을 연결해서 데이터를 도출하는 방법
-- 관계형 데이터베이스의 핵심문법
SELECT * FROM STUDENT; -- 학생정보
SELECT * FROM ENROL; -- 성적정보 FK(참조 키)=> ENROL 테이블의 STU_NO가 STUDENT 테이블의 PK값인 STU_NO를 참조

SELECT * FROM SUBJECT; -- 과목정보 FK(참조 키)=> ENROL 테이블의 SUB_NO가 STUDENT 테이블의 PK값인 SUB_NO를 참조

SELECT S.STU_NO, STU_NAME, STU_DEPT
FROM STUDENT S 
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO; -- 학번 같은사람끼리 조인 

--FROM STUDENT S 각각 정의해주기
--INNER JOIN ENROL E 각각 정의해주기
-- ON 뒤에 어떤거를 어디에 조인할지 

SELECT S.*, ENR_GRADE
FROM STUDENT S 
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

-- 학번, 이름, 학과, 평균점수 출력
SELECT S.STU_NO, STU_NAME, STU_DEPT, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME, STU_DEPT; -- 학번, 이름, 학과가 다 동일한것 끼리 묶어주기 

SELECT * FROM professor;
SELECT * FROM department;
-- 교수번호, 교수 이름, 학과명 출력

SELECT PROFNO, NAME, DNAME
FROM professor P
INNER JOIN department D ON p.deptno = d.DEPTNO; -- 이 두개가 같은것기리 조인해주기!

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 사번, 이름, 직급(JOB), 부서명(DNAME)출력
SELECT EMPNO, ENAME, JOB, DNAME
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;


--------
-- 학번, 이름, 학과, 시험점수 출력
-- + 과목명
SELECT * FROM STUDENT; -- 학생정보
SELECT * FROM ENROL; -- 성적정보
SELECT * FROM SUBJECT; -- 과목정보

SELECT S.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

SELECT S.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE, SUB_NAME
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON e.sub_no = SUb.sub_no;

--
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP E
INNER JOIN salgrade S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- SELF JOIN (자가조인)
-- MGR값으로 사수 이름 알아내기
SELECT * FROM EMP;

SELECT E1.ENAME, E2.ENAME
FROM EMP E1
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO; -- 기준이 되는 E1의 MGR에 E2의 EMPNO넣기
--WHERE E1.ENAME = 'ALLEN';

SELECT * FROM DEPARTMENT;

-- 공과대학에 속하는 학과만 출력

SELECT *
FROM DEPARTMENT D1
INNER JOIN DEPARTMENT D2 ON D1.deptno = d2.PART-- 공과대학에 속한 학부 알아내기
WHERE D1.DNAME = '공과대학';

SELECT D3.DNAME
FROM DEPARTMENT D1
INNER JOIN DEPARTMENT D2 ON D1.deptno = d2.PART -- 공과대학에 속한 학부 알아내기
INNER JOIN DEPARTMENT D3 ON d2.deptno = D3.PART -- 컴퓨터정보학부, 메카트로닉스학부에 속학 학과 알아내기
WHERE D1.DNAME = '공과대학';

