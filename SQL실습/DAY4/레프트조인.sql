-- OUTER JOIN
-- LEFT, RIGHT | LEFT만 알면 대부분 됨
SELECT *
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = e.stu_no; -- 왼쪽 STUDENT은 그대로, 오른쪽을 넣을때 짝이 없는게 있으면 그냥 NULL로 두기

-- 각 학생들의 시험을 본 개수 출력
-- 이름, 개수 출력, 단 시험을 하나도 보지 않았다면 개수는 0으로 출력
SELECT S.STU_NO, STU_NAME, COUNT(ENR_GRADE)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = e.stu_no
GROUP BY S.STU_NO, STU_NAME;

---

-- 각 직원의 부하직원 수 구하기, 단 없으면 0으로 출력
-- 출력 컬럼: 사번, 이름, 부하직원 수


-- 중요!! 이해하기
SELECT EMPNO, ENAME, NVL(CNT,0)
FROM EMP E
LEFT JOIN (
    SELECT MGR, COUNT(*) CNT
    FROM EMP
    GROUP BY MGR
) T ON E.EMPNO = T.MGR
ORDER BY CNT DESC;

--
--학번, 학생이름, 담당교수이름 출력
--단, 담당교수가 없으면 담당교수이름을 '담당교수없음으로 출력'
SELECT *
FROM STU;
SELECT *
FROM PROFESSOR;


SELECT NAME, PROFNO
FROM PROFESSOR;

SELECT S.STUNO, S.NAME, NVL(P.NAME,'담당교수 없음')
FROM STU S
LEFT JOIN PROFESSOR P ON s.profno = p.profno;


-- STUDENT
-- 1. 학생들의 시험 평균점수 출력
-- 단, 시험을 보지않은 학생들은 '성적없음' 출력

SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT S.STU_NO,S.STU_NAME, NVL(TO_CHAR(AVG(ENR_GRADE)), '성적없음') -- 서로 다른타입이면 출력이 안됨. 그러므로 평균을 TOCHAR로 바꿔서 둘다 문자로
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, S.STU_NAME