-- 코레일
DROP SCHEMA IF EXISTS korail;

-- 코레일
CREATE SCHEMA korail;

-- 회원
CREATE TABLE korail.member (
	mem_id         VARCHAR(10) NOT NULL COMMENT '아이디', -- 아이디
	mem_pw         CHAR(41)    NULL     COMMENT '비밀번호', -- 비밀번호
	mem_name       VARCHAR(10) NULL     COMMENT '이름', -- 이름
	mem_birth      DATE        NULL     COMMENT '생년월일', -- 생년월일
	mem_phone      VARCHAR(13) NULL     COMMENT '전화번호', -- 전화번호
	mem_address    TEXT        NULL     COMMENT '주소', -- 주소
	mem_detailaddr TEXT        NULL     COMMENT '상세주소', -- 상세주소
	mem_mileage    INT         NULL     COMMENT '마일리지', -- 마일리지
	mem_join       DATETIME    NULL     DEFAULT now() COMMENT '가입일', -- 가입일
	mem_withdrawal TINYINT     NULL     DEFAULT false COMMENT '탈퇴여부' -- 탈퇴여부
)
COMMENT '회원';

-- 회원
ALTER TABLE korail.member
	ADD CONSTRAINT PK_member -- 회원 기본키
		PRIMARY KEY (
			mem_id -- 아이디
		);

-- 예매
CREATE TABLE korail.reservation (
	res_no     INT         NOT NULL COMMENT '예매번호', -- 예매번호
	mem_id     VARCHAR(10) NULL     COMMENT '아이디', -- 아이디
	res_date   DATETIME    NULL     COMMENT '예매일', -- 예매일
	res_cancel TINYINT     NULL     DEFAULT false COMMENT '예매취소여부', -- 예매취소여부
	sal_no     INT         NULL     COMMENT '결제', -- 결제
	tt_no_s    INT         NULL     COMMENT '출발역', -- 출발역
	tt_no_a    INT         NULL     COMMENT '도착역', -- 도착역
	ts_car     INT         NULL     COMMENT '호차', -- 호차
	ts_no      INT		   NULL     COMMENT '좌석번호' -- 좌석번호
)
COMMENT '예매';

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT PK_reservation -- 예매 기본키
		PRIMARY KEY (
			res_no -- 예매번호
		);

ALTER TABLE korail.reservation
	MODIFY COLUMN res_no INT NOT NULL AUTO_INCREMENT COMMENT '예매번호';

-- 관리자
CREATE TABLE korail.manager (
	man_id VARCHAR(10) NOT NULL COMMENT '관리자id', -- 관리자id
	man_pw CHAR(41)    NULL     COMMENT '관리자pw' -- 관리자pw
)
COMMENT '관리자';

-- 관리자
ALTER TABLE korail.manager
	ADD CONSTRAINT PK_manager -- 관리자 기본키
		PRIMARY KEY (
			man_id -- 관리자id
		);

-- 공지사항
CREATE TABLE korail.notice (
	no_no      INT          NOT NULL COMMENT '번호', -- 번호
	no_writer  VARCHAR(10)  NULL     COMMENT '작성자', -- 작성자
	no_title   VARCHAR(50)  NULL     COMMENT '제목', -- 제목
	no_content TEXT         NULL     COMMENT '내용', -- 내용
	no_readcnt INT          NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
	no_regdate DATETIME     NULL     DEFAULT now() COMMENT '등록일', -- 등록일
	no_moddate DATETIME     NULL     DEFAULT now() COMMENT '수정일', -- 수정일
	no_delete  TINYINT      NULL     DEFAULT false COMMENT '삭제여부', -- 삭제여부
	no_img     VARCHAR(150) NULL     COMMENT '공지사항사진' -- 공지사항사진
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE korail.notice
	ADD CONSTRAINT PK_notice -- 공지사항 기본키
		PRIMARY KEY (
			no_no -- 번호
		);

ALTER TABLE korail.notice
	MODIFY COLUMN no_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 관광이벤트
CREATE TABLE korail.event (
	e_no      INT          NOT NULL COMMENT '번호', -- 번호
	e_writer  VARCHAR(10)  NULL     COMMENT '작성자', -- 작성자
	e_title   VARCHAR(50)  NULL     COMMENT '제목', -- 제목
	e_content TEXT         NULL     COMMENT '내용', -- 내용
	e_readcnt INT          NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
	e_regdate DATETIME     NULL     DEFAULT now() COMMENT '등록일', -- 등록일
	e_moddate DATETIME     NULL     DEFAULT now() COMMENT '수정일', -- 수정일
	e_delete  TINYINT      NULL     DEFAULT false COMMENT '삭제여부', -- 삭제여부
	e_img     VARCHAR(150) NULL     COMMENT '이벤트사진' -- 이벤트사진
)
COMMENT '관광이벤트';

-- 관광이벤트
ALTER TABLE korail.event
	ADD CONSTRAINT PK_event -- 관광이벤트 기본키
		PRIMARY KEY (
			e_no -- 번호
		);

ALTER TABLE korail.event
	MODIFY COLUMN e_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 할인제도
CREATE TABLE korail.discount (
	dis_no   INT         NOT NULL COMMENT '분류번호', -- 분류번호
	dis_name VARCHAR(30) NULL     COMMENT '할인제도', -- 할인제도
	dis_rate INT         NULL     COMMENT '할인율' -- 할인율
)
COMMENT '할인제도';

-- 할인제도
ALTER TABLE korail.discount
	ADD CONSTRAINT PK_discount -- 할인제도 기본키
		PRIMARY KEY (
			dis_no -- 분류번호
		);

ALTER TABLE korail.discount
	MODIFY COLUMN dis_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호';

-- 할인정보
CREATE TABLE korail.mem_discount (
	md_no  INT         NOT NULL COMMENT '번호', -- 번호
	md_use TINYINT     NULL     DEFAULT false COMMENT '사용유무', -- 사용유무
	mem_id VARCHAR(10) NULL     COMMENT '아이디', -- 아이디
	dis_no INT         NULL     COMMENT '분류번호' -- 분류번호
)
COMMENT '할인정보';

-- 할인정보
ALTER TABLE korail.mem_discount
	ADD CONSTRAINT PK_mem_discount -- 할인정보 기본키
		PRIMARY KEY (
			md_no -- 번호
		);

ALTER TABLE korail.mem_discount
	MODIFY COLUMN md_no INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 결제
CREATE TABLE korail.sale (
	sal_no       INT     NOT NULL COMMENT '결제번호', -- 결제번호
	sal_price    INT     NULL     COMMENT '결제금액', -- 결제금액
	sal_discount INT     NULL     COMMENT '할인금액', -- 할인금액
	sal_classify TINYINT NULL     COMMENT '결제분류' -- 결제분류
)
COMMENT '결제';

-- 결제
ALTER TABLE korail.sale
	ADD CONSTRAINT PK_sale -- 결제 기본키
		PRIMARY KEY (
			sal_no -- 결제번호
		);

ALTER TABLE korail.sale
	MODIFY COLUMN sal_no INT NOT NULL AUTO_INCREMENT COMMENT '결제번호';

-- 열차정보
CREATE TABLE korail.train (
	t_code        VARCHAR(5)  NOT NULL COMMENT '열차번호', -- 열차번호
	t_ti_no       INT         NULL     COMMENT '열차분류', -- 열차분류
	t_star_time   DATETIME    NULL     COMMENT '출발시간', -- 출발시간
	t_arrive_time DATETIME    NULL     COMMENT '도착시간', -- 도착시간
	t_start       VARCHAR(15) NULL     COMMENT '출발역', -- 출발역
	t_arrive      VARCHAR(15) NULL     COMMENT '도착역' -- 도착역
)
COMMENT '열차정보';

-- 열차정보
ALTER TABLE korail.train
	ADD CONSTRAINT PK_train -- 열차정보 기본키
		PRIMARY KEY (
			t_code -- 열차번호
		);

-- 열차종류
CREATE TABLE korail.train_info (
	ti_no   INT         NOT NULL COMMENT '분류번호', -- 분류번호
	ti_name VARCHAR(10) NULL     COMMENT '열차종류' -- 열차종류
)
COMMENT '열차종류';

-- 열차종류
ALTER TABLE korail.train_info
	ADD CONSTRAINT PK_train_info -- 열차종류 기본키
		PRIMARY KEY (
			ti_no -- 분류번호
		);

ALTER TABLE korail.train_info
	MODIFY COLUMN ti_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호';

-- 열차좌석
CREATE TABLE korail.train_seat (
	ts_car    INT        NOT NULL COMMENT '호차', -- 호차
	ts_no     INT		 NOT NULL COMMENT '좌석번호', -- 좌석번호
	ts_choice TINYINT    NULL     DEFAULT false COMMENT '선택유무', -- 선택유무
	t_code    VARCHAR(5) NULL     COMMENT '열차번호' -- 열차번호
)
COMMENT '열차좌석';

-- 열차좌석
ALTER TABLE korail.train_seat
	ADD CONSTRAINT PK_train_seat -- 열차좌석 기본키
		PRIMARY KEY (
			ts_car, -- 호차
			ts_no   -- 좌석번호
		);

-- 도시
CREATE TABLE korail.city (
	citycode INT         NOT NULL COMMENT '도시코드번호', -- 도시코드번호
	cityname VARCHAR(15) NULL     COMMENT '도시명' -- 도시명
)
COMMENT '도시';

-- 도시
ALTER TABLE korail.city
	ADD CONSTRAINT PK_city -- 도시 기본키
		PRIMARY KEY (
			citycode -- 도시코드번호
		);

-- 도시별 기차역
CREATE TABLE korail.city_train (
	nodeid   VARCHAR(15) NOT NULL COMMENT '기차역코드', -- 기차역코드
	nodename VARCHAR(15) NULL     COMMENT '역이름', -- 역이름
	citycode INT         NULL     COMMENT '도시코드번호' -- 도시코드번호
)
COMMENT '도시별 기차역';

-- 도시별 기차역
ALTER TABLE korail.city_train
	ADD CONSTRAINT PK_city_train -- 도시별 기차역 기본키
		PRIMARY KEY (
			nodeid -- 기차역코드
		);

-- 시간표
CREATE TABLE korail.train_time (
	tt_no         INT        NOT NULL COMMENT '분류번호', -- 분류번호
	tt_start_time DATETIME   NULL     COMMENT '출발시간', -- 출발시간
	t_code        VARCHAR(5) NULL     COMMENT '열차번호', -- 열차번호
	p_no          INT        NULL     COMMENT '가격' -- 가격
)
COMMENT '시간표';

-- 시간표
ALTER TABLE korail.train_time
	ADD CONSTRAINT PK_train_time -- 시간표 기본키
		PRIMARY KEY (
			tt_no -- 분류번호
		);

ALTER TABLE korail.train_time
	MODIFY COLUMN tt_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호';

-- 구간별 가격
CREATE TABLE korail.price (
	p_no     INT         NOT NULL COMMENT '분류번호', -- 분류번호
	price    INT         NULL     COMMENT '가격', -- 가격
	nodeid_s VARCHAR(15) NULL     COMMENT '출발', -- 출발
	nodeid_a VARCHAR(15) NULL     COMMENT '도착' -- 도착
)
COMMENT '구간별 가격';

-- 구간별 가격
ALTER TABLE korail.price
	ADD CONSTRAINT PK_price -- 구간별 가격 기본키
		PRIMARY KEY (
			p_no -- 분류번호
		);

ALTER TABLE korail.price
	MODIFY COLUMN p_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호';

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT FK_member_TO_reservation -- 회원 -> 예매
		FOREIGN KEY (
			mem_id -- 아이디
		)
		REFERENCES korail.member ( -- 회원
			mem_id -- 아이디
		);

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT FK_sale_TO_reservation -- 결제 -> 예매
		FOREIGN KEY (
			sal_no -- 결제
		)
		REFERENCES korail.sale ( -- 결제
			sal_no -- 결제번호
		);

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT FK_train_time_TO_reservation2 -- 시간표 -> 예매
		FOREIGN KEY (
			tt_no_s -- 출발역
		)
		REFERENCES korail.train_time ( -- 시간표
			tt_no -- 분류번호
		);

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT FK_train_time_TO_reservation -- 시간표 -> 예매2
		FOREIGN KEY (
			tt_no_a -- 도착역
		)
		REFERENCES korail.train_time ( -- 시간표
			tt_no -- 분류번호
		);

-- 예매
ALTER TABLE korail.reservation
	ADD CONSTRAINT FK_train_seat_TO_reservation -- 열차좌석 -> 예매
		FOREIGN KEY (
			ts_car, -- 호차
			ts_no   -- 좌석번호
		)
		REFERENCES korail.train_seat ( -- 열차좌석
			ts_car, -- 호차
			ts_no   -- 좌석번호
		);

-- 공지사항
ALTER TABLE korail.notice
	ADD CONSTRAINT FK_manager_TO_notice -- 관리자 -> 공지사항
		FOREIGN KEY (
			no_writer -- 작성자
		)
		REFERENCES korail.manager ( -- 관리자
			man_id -- 관리자id
		);

-- 관광이벤트
ALTER TABLE korail.event
	ADD CONSTRAINT FK_manager_TO_event -- 관리자 -> 관광이벤트
		FOREIGN KEY (
			e_writer -- 작성자
		)
		REFERENCES korail.manager ( -- 관리자
			man_id -- 관리자id
		);

-- 할인정보
ALTER TABLE korail.mem_discount
	ADD CONSTRAINT FK_member_TO_mem_discount -- 회원 -> 할인정보
		FOREIGN KEY (
			mem_id -- 아이디
		)
		REFERENCES korail.member ( -- 회원
			mem_id -- 아이디
		);

-- 할인정보
ALTER TABLE korail.mem_discount
	ADD CONSTRAINT FK_discount_TO_mem_discount -- 할인제도 -> 할인정보
		FOREIGN KEY (
			dis_no -- 분류번호
		)
		REFERENCES korail.discount ( -- 할인제도
			dis_no -- 분류번호
		);

-- 열차정보
ALTER TABLE korail.train
	ADD CONSTRAINT FK_train_info_TO_train -- 열차종류 -> 열차정보
		FOREIGN KEY (
			t_ti_no -- 열차분류
		)
		REFERENCES korail.train_info ( -- 열차종류
			ti_no -- 분류번호
		);

-- 열차정보
ALTER TABLE korail.train
	ADD CONSTRAINT FK_city_train_TO_train -- 도시별 기차역 -> 열차정보
		FOREIGN KEY (
			t_start -- 출발역
		)
		REFERENCES korail.city_train ( -- 도시별 기차역
			nodeid -- 기차역코드
		);

-- 열차정보
ALTER TABLE korail.train
	ADD CONSTRAINT FK_city_train_TO_train2 -- 도시별 기차역 -> 열차정보2
		FOREIGN KEY (
			t_arrive -- 도착역
		)
		REFERENCES korail.city_train ( -- 도시별 기차역
			nodeid -- 기차역코드
		);

-- 열차좌석
ALTER TABLE korail.train_seat
	ADD CONSTRAINT FK_train_TO_train_seat -- 열차정보 -> 열차좌석
		FOREIGN KEY (
			t_code -- 열차번호
		)
		REFERENCES korail.train ( -- 열차정보
			t_code -- 열차번호
		);

-- 도시별 기차역
ALTER TABLE korail.city_train
	ADD CONSTRAINT FK_city_TO_city_train -- 도시 -> 도시별 기차역
		FOREIGN KEY (
			citycode -- 도시코드번호
		)
		REFERENCES korail.city ( -- 도시
			citycode -- 도시코드번호
		);

-- 시간표
ALTER TABLE korail.train_time
	ADD CONSTRAINT FK_train_TO_train_time -- 열차정보 -> 시간표
		FOREIGN KEY (
			t_code -- 열차번호
		)
		REFERENCES korail.train ( -- 열차정보
			t_code -- 열차번호
		);

-- 시간표
ALTER TABLE korail.train_time
	ADD CONSTRAINT FK_price_TO_train_time -- 구간별 가격 -> 시간표
		FOREIGN KEY (
			p_no -- 가격
		)
		REFERENCES korail.price ( -- 구간별 가격
			p_no -- 분류번호
		);

-- 구간별 가격
ALTER TABLE korail.price
	ADD CONSTRAINT FK_city_train_TO_price -- 도시별 기차역 -> 구간별 가격
		FOREIGN KEY (
			nodeid_s -- 출발
		)
		REFERENCES korail.city_train ( -- 도시별 기차역
			nodeid -- 기차역코드
		);

-- 구간별 가격
ALTER TABLE korail.price
	ADD CONSTRAINT FK_city_train_TO_price2 -- 도시별 기차역 -> 구간별 가격2
		FOREIGN KEY (
			nodeid_a -- 도착
		)
		REFERENCES korail.city_train ( -- 도시별 기차역
			nodeid -- 기차역코드
		);