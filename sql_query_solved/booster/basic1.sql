SELECT *
FROM STOCK
WHERE STK_NM LIKE '동양%' 
    AND SEC_NM NOT LIKE '%금속%'
ORDER BY EX_CD DESC, STK_NM;