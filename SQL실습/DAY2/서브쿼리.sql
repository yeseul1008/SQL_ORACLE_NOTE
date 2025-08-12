SELECT *
FROM professor
WHERE BONUS IS NULL; -- BONUS가 NULL값인거 출력

SELECT *
FROM professor
WHERE BONUS IS NOT NULL; -- BONUS가 NULL값 아닌거 출력


-- 서브쿼리(쿼리 안에 또다른 쿼리)
SELECT MAX(STU_HEIGHT)
FROM STUDENT; -- MAX값을 가지는 이름만 출력할 수 없음 그래서 서브쿼리를 사용하여 이를 보완

SELECT *
FROM STUDENT
WHERE STU_HEIGHT = 188; -- 이러면 이름만 따로 출력 못함 그래서 서브쿼리를 사용하여 이를 보완

SELECT *
FROM STUDENT
WHERE STU_HEIGHT = ( -- 키가 180인 조건문 됨
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT -- 이 두 줄의 결과는 188
    );

-- 학생들의 전체 평균 키보다 큰 키를 가진 학생 출력
SELECT *
FROM STUDENT
WHERE STU_HEIGHT > (
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT
);

