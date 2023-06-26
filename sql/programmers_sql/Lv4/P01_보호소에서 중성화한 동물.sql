# https://school.programmers.co.kr/learn/courses/30/lessons/59045

# 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다.
# 보호소에 들어올 당시에는 중성화되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 아이디 순으로 조회하는 SQL 문을 작성해주세요.
# 중성화를 거치지 않은 동물은 성별 및 중성화 여부에 Intact, 중성화를 거친 동물은 Spayed 또는 Neutered라고 표시되어있습니다.
SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME FROM ANIMAL_INS I JOIN ANIMAL_OUTS O ON I.ANIMAL_ID=O.ANIMAL_ID
    WHERE I.SEX_UPON_INTAKE LIKE '%Intact%' AND (O.SEX_UPON_OUTCOME LIKE '%Spayed%' OR O.SEX_UPON_OUTCOME LIKE '%Neutered%')
    ORDER BY I.ANIMAL_ID ASC

SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME FROM ANIMAL_INS I JOIN ANIMAL_OUTS O ON I.ANIMAL_ID=O.ANIMAL_ID
    WHERE I.SEX_UPON_INTAKE LIKE '%Intact%' AND O.SEX_UPON_OUTCOME REGEXP ('Spayed|Neutered')
    ORDER BY I.ANIMAL_ID ASC

SELECT ANIMAL_ID, ANIMAL_TYPE, NAME FROM ANIMAL_INS
    WHERE ANIMAL_ID IN (SELECT ANIMAL_ID FROM ANIMAL_OUTS WHERE SEX_UPON_OUTCOME REGEXP ('Spayed|Neutered'))
      AND SEX_UPON_INTAKE LIKE '%Intact%'
    ORDER BY ANIMAL_ID ASC

SELECT ANIMAL_ID, ANIMAL_TYPE, NAME FROM ANIMAL_INS
    WHERE SEX_UPON_INTAKE LIKE '%Intact%'
      AND ANIMAL_ID IN (SELECT ANIMAL_ID FROM ANIMAL_OUTS WHERE SEX_UPON_OUTCOME REGEXP ('Spayed|Neutered'))
    ORDER BY ANIMAL_ID ASC
