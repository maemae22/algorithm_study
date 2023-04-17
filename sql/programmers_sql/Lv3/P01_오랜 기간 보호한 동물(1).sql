# https://school.programmers.co.kr/learn/courses/30/lessons/59044

# 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
# 이때 결과는 보호 시작일 순으로 조회해야 합니다.
SELECT I.NAME, I.DATETIME FROM ANIMAL_INS I LEFT JOIN ANIMAL_OUTS O ON I.ANIMAL_ID=O.ANIMAL_ID
    WHERE O.DATETIME IS NULL ORDER BY I.DATETIME LIMIT 3

SELECT NAME, DATETIME FROM ANIMAL_INS I WHERE NOT EXISTS (SELECT * FROM ANIMAL_OUTS O WHERE I.ANIMAL_ID=O.ANIMAL_ID)
    ORDER BY DATETIME LIMIT 3

SELECT NAME, DATETIME FROM ANIMAL_INS WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID FROM ANIMAL_OUTS)
    ORDER BY DATETIME LIMIT 3
