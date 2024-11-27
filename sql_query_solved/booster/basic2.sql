SELECT STK_NM AS '종목명', STK_CD AS '종목코드', EX_CD AS '거래소코드', SEC_NM AS '섹터명'
FROM STOCK
WHERE STK_NM IN ('NAVER', '넷마블', '넥슨지티', '카카오')
ORDER BY EX_CD, STK_NM;