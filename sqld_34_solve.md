1. 도메인의 특징으로 알맞지 않은 것은? <br>
   3) 엔터티 내에서 속성에 대한 Check 조건을 지정한다. - 값의 범위를 지정하기에 맞는 보기 <br>
   4) 테이블의 속성 간 FK 제약 조건을 지정한다. - 이건 테이블 스키마 정의이기에 답은 4번<br>

2. AK : alternative key(보조식별자, 대체키) - 주식별자로 선정되지 못한 후보키
   
3. 주식별자를 도출하기 위한 기준
   - 해당 업무에서 자주 이용되는 속성을 주식별자로 지정한다.
   - 명칭, 내역 등과 같이 이름으로 기술되는 것들은 가능하면 주식별자로 지정하지 않는다.
     - 변경 가능성이 있으니까
 - 복합으로 주식별자로 구성할 경우 너무 많은 속성이 포함되지 않도록 한다.
 - 지정된 주식별자의 값은 변경되지 않도록 하는 것이 원칙이다.
   - 못 바꾼다는 게 아니라 원칙, 기준(이 점 유의할 것)

4. 컬럼에 대한 반정규화 기법
   - 반정규화 기법 : 의도적으로 정규화된 DATA 구조를 변경하는 것
     - 정규화가 지나치면 JOIN 연산이 과도하게 많아져 성능이 저하되기 때문에
    - 중복컬럼 추가 - 조인감소 위해
    - 파생컬럼 추가 - 조회 성능 우수하게 하기 위해 미리 계산된 컬럼 갖도록 한다.
    - 이력테이블에 기능 컬럼 추가 - 최신값 처리하는 이력의 특성을 고려하여 기능성 컬럼을 추가한다.
    
5.  속성의 특징으로 가장 올바른 것은?
    - 엔터티를 설명하고 인스턴스의 구성요소가 된다.
    - 속성의 특성에 따른 분류에는 기본 속성, 설계 속성, 파생 속성이 있다.
    - 석성의 엔터티 구성 방식에 따른 분류에는 PK 속성, FK 속성, 일반 속성이 있다.
  
6.  TRUNCATE TABLE 명령어의 특징으로 가장 적절한 것은?
    - DDL
    - TABLE 모든 행을 삭제한다. 
    - TABLE 구조는 유지된다. 데이터만 전부 초기화
    - 조건 지정이 불가하다. 그렇기에 DELETE보다 빠르다.
  
7.  ORDER BY 2 : SELECT 문에서 두 번째 출력 컬럼을 기준으로 정렬하라는 의미
    - SELECT * FROM A ORDER BY 2; -> ERROR : SELECT 조건에 두 번째 컬럼이 명시되어 있지 않음. - DB의 상황에 따라서  DBMS가 컬럼 순서 정렬하는 게 다를 수 있는데 그에 따라서 순서가 명확하게 명시되지 않은 점.
    - SELECT N1 FROM (SELECT * FROM A) ORDER BY 2; COMPLETE 
  
8.  PROCEDURE, TRIGGER에 대한 설명
    - TRIGGER는 COMMIT, ROLLBACK 명령어를 사용할 수 없다.
      - TRIGGER는 트랜잭션 과정 중에 일어나는 이벤트다. 특정 이벤트에 의해 유발되는 이벤트인데 TRIGGER가 COMMIT이나 ROLLBACK이 가능하다면 트랜잭션의 원자성에 어긋나기 때문에 COMMIT, ROLLBACK 명령어는 사용할 수 없다.
    - PROCEDURE는 COMMIT, ROLLBACK 명령어를 사용할 수 있다. 
      - PROCEDURE는 사용자가 호출했을 때 실행되며 특정 이벤트에 종속되지 않는다. PROCEDURE 자체가 하나의 이벤트이기 때문에 ROLLBACK이나 COMMIT 명령어를 사용할 수 있다. 
    - PROCEDURE, TRIGGER는 모두 CREATE 명령어로 생성한다. 
    - PROCEDURE는 EXECUTE 명령어로 수행되지만 TRIGGER는 아니다. 위 내용에 의거하여 생각해볼 것.
  
9. CONNECT BY PRIOR에 대해서
    - ORACLE DB에서 계층적 쿼리를 작성할 때 사용한다. 
    - CONNECT BY : 부모와 자식 간의 관계 설정
    - PRIOR 부모컬럼 : 자식컬럼
    - CONNECT BY 조건은 PRIOR 조건과 결이 맞아야 한다. 
    - ROOT에서부터 시작했는데 밑에서 올라오는 PRIOR 조건을 같게 두면 NULL이 나올테니까
    - 계층적 쿼리 구조일 때 START WITH가 가장 먼저 시작된다.  

10. 집계 함수에서 NULL이 있으면 무시하고 계산한다.
    - sum(1, NULL, 2, 1) = 4
    - NULL 값을 0으로 간주하고 계산하려면 COALESCE 함수 사용
      - COALESCE(A, 0) : A가 NULL이면 0으로 간주 
    - AVG로 계산할 때 COALESCE를 사용한 게 아니면 아예 도메인 취급 자체를 하지 않는다. 
      - AVG(1,2,3,NULL) -> 1+2+3 / 3 = 2    
  
11. NULL 값을 다루는 함수
    - COALESCE(A, 0) :  A가 NULL이면 0으로 간주
    - NULLIF(표현식1, 표현식2) : 표현식1=표현식2 -> NULL, 다르면 표현식1 반환
    - NVL(표현식, 표현식이 NULL일 때 반환할 값)
      - NVL('HELLO', 'DEFAULT') -> 'HELLO'
      - NVL(NULL, 'DEFAULT') -> 'DEFAULT'
    - NVL2(표현식, 표현식 NULL 아닐 때 반환 값, 표현식 NULL일 때 반환 값)
      - NVL2(NULL ,1, 2) -> 2
      - NVL2('A', 1, 2) -> 1
12. 그룹함수
    - ROLLUP : 계층적으로 그룹화 
    - CUBE : 가능한 모든 그룹의 조합에 대한 그룹화 진행
    - GROUPING SETS : 사용자가 지정한 그룹에 대해서만 그룹화 진행

13. ROLLBACK
    - AUTO COMMIT이 FALSE라면
      - DML, DDL 모두 ROLLBACK이 가능하다.
      - 하지만, ORACLE은 DDL 명령어에 대하여 묵시적 COMMIT이 되기 때문에 DDL은 여전히 ROLLBACK 할 수 없다. 
        - 추가적으로 DDL 명령어 전에 수행한 DCL 트랜잭션들도 DDL에 대하여 묵시적 COMMIT이 될 때 같이 COMMIT 되기 때문에 ROLLBACK 할 수 없다.
    - AUTO COMMIT이 TRUE라면 트랜잭션 끝날 때마다 COMMIT 되기 때문에 ROLLBACK은 의미가 없다. 
14. INSERT 관련
    - 컬럼에 대해서 명시하지 않았을 때는 모든 컬럼에 대한 값을 작성해야 한다.
      - INSERT INTO 주문 VALUES (2, SYSDATE, 'TEST2', NULL)
      - INSERT INTO 주문(C1, C2, C3) VALUES (2, SYSTDATE, 'TEST2')

15. WHERE 조건 연산 순서
    - 조건1 OR 조건2 AND 조건3 -> AND 계산 후에 OR 항상 유의할 것!
    - 조건1 OR (조건2 AND 조건3)