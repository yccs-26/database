-- DATE_OF_BIRTH에서 생일이 3월 AND GENDER = 'W'
-- TLNO = NULL 이면 제외
-- SELECT : MEMBER_ID, MEMBER_NAME, GENDER, DATE_OF_BIRTH
-- DATE_OF_BIRTH 데이트 포맷 '%Y-%m-%d'로 할 것
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE 
WHERE DATE_FORMAT(DATE_OF_BIRTH, '%m')='03' AND GENDER='W' 
    AND TLNO IS NOT NULL;