-- 학생 테이블 생성
-- create table student(
-- 	id bigint,
--  student_name varchar(5),
--    student_mobile varchar(20),
--    student_major varchar(30)
-- );

-- 학생테이블 전체 데이터 조회
-- select * from student;
-- 본인 옆사람들의 정보를 테이블에 저장해 봅시다
-- insert into student(id,student_name,student_mobile,student_major)
-- 	values(1,'불카민','010-1111-1111','중고차수출');
    
-- table 삭제
-- drop table student;

-- 부서에 대한 table
create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

-- 직원정보에 대한 table
create table emp (
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate DATE,
    sal int,
    comm int,
    deptno int
);

-- 보너스 table
create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);

-- 급여 table
create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블 전체 조회
select * from emp;
-- emp 테이블의 empno , ename 컬럼만 조회
select empno,ename from emp;
-- emp 테이블의 job 컬럼만 조회
select job from emp;
-- └job에 있는 직급 중복값 제외
select distinct job from emp;
-- 사원 이름 조회(오름차순)
select ename from emp order by ename asc;
-- 사원 이름 조회(내림차순)
select ename from emp order by ename desc;
-- 전체 오름차순 (ename을 기준으로)
select * from emp order by ename asc;

-- 급여(sal)기준으로 오름차순 내림차순 정렬
select * from emp order by sal asc;
select * from emp order by sal desc;
-- 입사일(hiredate)기준으로 오름차순 내림차순 정렬
select * from emp order by hiredate asc;
select * from emp order by hiredate desc;

-- 1차기준 : 급여, 급여가 같다면 이름순으로 오름차순 정렬
select * from emp order by sal asc, ename asc;

-- where 절: 조건을 적용할 때
-- 직급이 salesman인 사원만 조회
select * from emp where job='salesman';

-- 직급이 manager인 사원만 조회
select * from emp where job='manager';
-- 부서번호 (deptno)가 10인 사원만 조회
select * from emp where deptno=10;
-- 이름이 james라는 사원의 정보 조회
select * from emp where ename='james';
-- 사번(empno)이 7654인 사원의 정보 조회
select * from emp where empno=7654;

-- 직급(job)이 manager이고 부서번호(deptno)가 20인 사원 조회
select * from emp where job='manager'and deptno=20;
-- 직급(job)이 salesman 이거나 부서번호(deptno)가 10인 사원 조회
select * from emp where job='salesman'or deptno=10;

-- & (엠퍼샌드), * (아스테리스크), ' (싱글쿼터), " (더블쿼터), ` (백틱)

-- 급여가 3000 이상인 사원 조회
select * from emp where sal >= 3000;

-- 급여가 3000 이상인 사원 조회 결과를 내림차순 정렬
select * from emp where sal >= 3000 order by sal desc;

-- 직급이 salesman이 아닌 사원 조회
select *from emp where job != 'salesman';
select * from emp where not job = 'salesman';

-- 급여가 2000이상 3000이하인 사원 조회
select * from emp where 2000 <= sal <= 3000; -- x
select * from emp where sal >= 2000 and sal <= 3000; -- o
select * from emp where sal between 2000 and 3000; -- o
-- 급여가 2000이상 3000이하인 사원 빼고 조회
select * from emp where sal not between 2000 and 3000; -- o

-- like 연산자
select * from emp where ename like 'm%';
select * from emp where ename like '%m';
select * from emp where ename like '%m%';
select * from emp where ename like '_m%';
select * from emp where ename like '__m%';

-- 81년 4월 1일 이후 입사한 사원 조회
select * from emp where hiredate > '1981-04-01';
-- 확실하게 하는 방법
select * from emp where hiredate > str_to_date('1981-04-01','%Y-%m-%d');
-- 81년 4월 1일 이전 입사한 사원 조회
select * from emp where hiredate < '1981-04-01';
-- 확실하게 하는 방법
select * from emp where hiredate < str_to_date('1981-04-01','%Y-%m-%d');


-- 테이블 구조 확인
desc emp;
-- 디스크라이브의 desc

-- 집계함수
-- sum() , avg() , max() , min() , count()

-- 사원의 급여 총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;
-- salesman 급여 총합
select sum(sal) from emp where job='salesman';
-- manager 급여 총합
select sum(sal) from emp where job='manager';

-- 전체 사원의 평균 급여 조회
select avg(sal) from emp;
-- 소수점 2개만 표시하기(소수점 버림)
select truncate(avg(sal),2) from emp;
-- round() (소수점 반올림)
select round(12.345,2) from dual; -- 12.35
select round(12.345,1) from dual; -- 12.3
select round(12.345,0) from dual; -- 12
select round(avg(sal),2) from emp;

-- 가장 높은 급여 값 조회
 select max(sal) from emp;

-- 가장 적은 급여 값 조회
select min(sal) from emp;

-- 전체 사원수 조회
select count(*) from emp;
-- 부서번호가 20인 사원수 조회
select count(*) from emp where deptno=20;

-- 그룹화(동일한 데이터끼리 묶는 것 , grouping)
-- 주의할점 : 조회결과는 그룹핑한 컬럼이름 또는 집계함수 등을 사용함
-- 직급으로 그룹핑
select * from emp group by job; -- X 
-- * 사용불가
-- 직급별 평균 급여
select job , round(avg(sal),2) from emp group by job;
-- 부서별 평균 급여
select deptno, round(avg(sal),2) from emp group by deptno;

-- 직급별 사원수 조회
select job , count(*) from emp group by job;
-- 직급별 평균 급여 , 사원수 조회
select job , round(avg(sal),2) , count(*)  from emp group by job;
-- 위의 결과에서 직급값을 오름차순으로 정렬
select job , round(avg(sal),2) , count(*)  from emp group by job order by job asc;
-- 위의 결과에서 평균 급여를 소수점 첫째자리 까지 조회
select job , round(avg(sal),1) , count(*)  from emp group by job order by job asc;
-- 위의 결과에서 job은 직급으로, 급여 평균값은 평균 급여로 , 사원수 조회값은 사원수로 표현하여 조회
select job as '직급' , round(avg(sal),1) as '급여평균값' , count(*) as '사원수'  from emp group by job order by job asc;

-- 더블 select
select * from emp where sal = (select max(sal) from emp);

-- 부서별 그룹핑
select deptno from emp group by deptno;
select deptno,avg(sal) from emp group by deptno;
-- 부서별 그룹핑하고 그 안에서 직급별로 그룹핑
select deptno , job , avg(sal) from emp group by deptno, job;
select deptno , job , avg(sal) from emp group by job , deptno;
-- job을 기준으로 오름차순 정렬
select deptno , job , avg(sal) from emp group by job , deptno order by job asc;
-- deptno을 기준으로 오름차순 정렬
select deptno , job , avg(sal) from emp group by job , deptno order by deptno asc;

-- having : 그룹핑한 결과에서 조건 적용 = 그룹핑 했을때만 사용 가능
-- 부서 , 직급별로 묶고 그 결과에서 평균급여가 2000 이상인 결과만 조회
select deptno , job , avg(sal) from emp 
					group by job , deptno 
						having avg(sal) >= 2000	
							order by job asc;
                
-- 급여가 3000이하인 사원을 대상으로 위의 그룹핑 수행
select deptno , job , avg(sal) from emp
					where sal <= 3000
						group by job , deptno 
							having avg(sal) >= 2000	
								order by avg(sal) asc;

-- date 타입을 문자로 표현하기: date_format()
-- 해당 date의 값만 보는 방법
select date_format(hiredate,'%Y') from emp;


-- 20230329 - day 3

select * from emp;
-- 연습문제
-- 1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
select deptno as '부서번호' , round(avg(sal),1) as '평균급여' 
				, max(sal) as '최고급여' , min(sal) as '최저급여' 
							, count(deptno) as '사원수' from emp 
													group by deptno
														order by deptno asc;

-- 2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
select job , count(empno) from emp group by job having count(empno) >= 3;

-- 3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
select date_format(hiredate , '%Y') as '입사년도' , count(empno) as '사원수' from emp 
		group by date_format(hiredate , '%Y');

-- 3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
select date_format(hiredate , '%Y') as '입사년도' , deptno , count(empno) as '사원수' from emp 
		group by date_format(hiredate , '%Y') , deptno;

select * from emp;
select * from dept;

-- 외부조인
select * from emp , dept;

-- 조인(내부조인)
select * from emp , dept where emp.deptno = dept.deptno;
-- 조인을 하는데 조건으로 emp.deptno 와 dept.deptno가 같은것끼리 출력

-- 컬럼 약어 설정하기
select *from emp e, dept d where e.deptno = d.deptno;
-- 각 컬럼의 앞글자로 약어를 설정  이후 약어를 사용하여 deptno가 동일하면 출력

-- deptno을 추가하지 않음
select empno , ename , dname , loc from  emp e , dept d where e.deptno = d.deptno;
-- 에러가 발생하지 않음
-- deptno을 추가함
select empno , ename , deptno , dname , loc from emp e , dept d where e.deptno = d.deptno;
-- 에러가 발생함
select e.empno , e.ename , e.deptno , d.dname , d.loc from emp e , dept d where e.deptno = d.deptno;
-- (deptno는 두개의 테이블에 공통적으로 가지고 있기 때문에 어떤 컬럼의 정보를 가지고 올지 약어를 붙여 명확하게 해주어야한다)

-- 조인 후 emp 테이블만 조회
select e.*from emp e, dept d where e.deptno = d.deptno;

-- emp , dept를 조인하여 empno , ename , deptno , dname , loc 조회
-- (단, 급여가 2500 이상인 사원만 조회하고 , 조회결과는 사원이름 기준으로 오름차순 정렬)
select e.empno , e.ename , e.deptno , d.dname , d.loc 
		from emp e, dept d 
				where e.deptno = d.deptno and e.sal >= 2500
						order by e.ename asc;

-- 최저급여를 받는 사람이 누구인지?
select * from emp order by sal asc;
-- 1.최저급여 값이 얼마인지 조회
select min(sal) from emp;
-- 2.최저급여 값을 받는 사람(최저급여 값과 sal 값이 일치하는)이 누구인지 조회
select * from emp where sal=800;
-- 서브 쿼리 적용
select * from emp where sal=(select min(sal) from emp);

-- 최고 급여를 받는 사원 정보 조회
select * from emp where sal = (select max(sal) from emp);
-- allen 보다 높은 급여를 받는 사원 조회
select * from emp where sal > (select sal from emp where ename = 'allen');


-- 연습문제 
-- 1. clark 보다 늦게 입사한 사원 조회 
select * from emp where hiredate > (select hiredate from emp where ename = 'clark');
-- 2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);
-- 3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
select * from emp e , dept d 
			where e.deptno = 20 and d.deptno = 20 
				and sal > (select avg(sal) from emp);

create table member1(
	id bigint,
    member_email varchar(20),
    member_password varchar(10)
);

insert into member1(id,member_email , member_password) 
		values(1,'member1@email.com' , '1111');

-- 모든 컬럼에 데이터를 저장한다면 컬럼이름 생략 가능
insert into member1 values(1,'member1@email.com' , '1111');
-- 컬럼 이름을 생략하고 모든 컬럼에 데이터를 저장한다면?
insert into member1 values(1,'member1@email.com'); -- X 오류 발생
-- 특정 컬럼에만 값을 넣고 싶은 경우
insert into member1(id , member_email) values(3,'member2@email.com');
-- 테이블 만들 때 지정한 크기보다 큰 값을 저장할 때
insert into member1 values(2,'member3@email.com','22222222222'); -- X에러 코드 발생
-- NULL로 저장도 가능하다
insert into member1 values(1,'member1@email.com',null);

select * from member1;

-- id 컬럼에 not null 제약조건 적용
create table member2(
	id bigint not null,
    member_email varchar(20),
    member_password varchar(10)
);
desc member2;
insert into member2(id , member_email) values(null,'member2@email.com');
-- error 1048

select * from member2;

-- not null & unique 사용
create table member3(
	id bigint not null unique,
    member_email varchar(20),
    member_password varchar(10)
);
desc member3;
select * from member3;

insert into member3(id , member_email) values(1,'member2@email.com');
-- error 1062 발생
insert into member3(id , member_email) values(3,'member2@email.com');
-- id가 다르므로 error X

create table member4(
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null unique
);
desc member4;
select * from member4;

insert into member4(id , member_email , member_password) values(1,'member2@email.com', '1111');
-- id , email , password에 다 not null , unique를 걸었기에 값이 있어야하고 중복도 안됀다

create table member5(
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);
desc member5;
select * from member5;

insert into member5(id , member_email , member_password)
		values(1,'member1@email.com','1111');

-- primary key 사용
create table member6(
	id bigint primary key,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);
desc member6;
select * from member6;

insert into member6(id , member_email , member_password)values(2,'member2@email.com','1112');

create table member7(
	id bigint,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now(),
    constraint pk_member7 primary key(id)
);
desc member7;
select * from member7;

-- 제약조건 확인
select * from information_schema.table_constraints;

-- 20230330 - day 4

-- 삭제 : 그냥 삭제
drop table board1; 
-- 안전 삭제 : 있으면 지우고 없으면 말고
drop table if exists board1; 
-- 이걸 쓰는 이유는 오류가 있으면 코드실행이 그자리에서 멈춘다
-- 하지만 if exists를 쓰면 멈추지 않고 경고문을 띄우고 계속 실행한다

-- 게시판 테이블
drop table if exists board1; 
create table board1(
id bigint, -- 글번호
board_writer varchar(20) not null, -- 작성자
board_contents varchar(500), -- 내용
constraint pk_board1 primary key(id)
);
desc board1;
select * from board1;

-- 댓글 테이블 : 댓글은 조제하는 게시글에만 작성 가능하며,
-- 게시글의 글번호(id)를 참조하는 관계로 정의
drop table if exists comment1;
create table comment1(
	id bigint , -- 댓글 번호
	comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글 내용
	board1_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
    -- 댓글테이블(comment1)의 pk 지정
	constraint pk_comment1 primary key(id),
    -- 참조관계 지정을 위해 comment1 테이블의 board1_id 컬럼을
    -- board1 테이블의 id 컬럼을 참조하는 관계로 지정
	constraint fk_comment1 foreign key(board1_id) references board1(id)
);

-- 1번게시글
insert into board1(id,board_writer , board_contents)
	values(1,'writer1' , 'contents1');
-- 2번게시글
insert into board1(id,board_writer , board_contents)
	values(2,'writer2' , 'contents2');
-- 3번게시글
insert into board1(id,board_writer , board_contents)
	values(3,'writer3' , 'contents3');
-- 4번게시글
insert into board1(id,board_writer , board_contents)
	values(4,'writer4' , 'contents4');
select * from board1;
-- 댓글 데이터 저장
-- 1번 게시글에 대한 1번 댓글
insert into comment1(id, comment_writer , comment_contents,board1_id)
	values (1,'c writer1' , 'c contents1',1);
-- 1번 게시글에 대한 2번 댓글
insert into comment1(id, comment_writer , comment_contents,board1_id)
	values (2,'c writer2' , 'c contents1',1);
-- 2번 게시글에 대한 댓글
insert into comment1(id, comment_writer , comment_contents,board1_id)
	values (3,'c writer3' , 'c contents1',2);
-- 5번 게시글에 대한 댓글
insert into comment1(id, comment_writer , comment_contents,board1_id)
	values (4,'c writer3' , 'c contents1',5);
    
-- 부모 데이터 삭제
-- 1,2번게시글에는 댓글이 있고 , 3,4번 게시글에는 댓글이 없음
-- 3번 게시글 삭제
delete from board1 where id =3;
-- 삭제를 할때는 꼭 해당 테이블의 고유한 pk를 가지고 삭제를 한다
-- 2번 게시글 삭제
delete from board1 where id =2; 
-- comment board1_id가 board1에 있는 id컬럼을 참조하고 있기 때문에 삭제 불가
-- 2번 게시글에 작성된 댓글 삭제 (댓글번호 3) 후 2번 게시글 삭제
delete from comment1 where id =3;
delete from board1 where id =2;


-- 게시판 테이블
drop table if exists board2; 
create table board2(
id bigint, -- 글번호
board_writer varchar(20) not null, -- 작성자
board_contents varchar(500), -- 내용
constraint pk_board2 primary key(id)
);
desc board2;
select * from board2;

-- 댓글 테이블
drop table if exists comment2;
create table comment2(
	id bigint , -- 댓글 번호
	comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글 내용
	board2_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
	constraint pk_comment2 primary key(id),
	constraint fk_comment2 foreign key(board2_id) references board2(id) on delete cascade
);
desc comment2;
select *from comment2;

-- 게시글 4개 작성
insert into board2(id , board_writer , board_contents)
	values(1,'writer1' , 'contents1');
insert into board2(id , board_writer , board_contents)
	values(2,'writer2' ,' contents2');
insert into board2(id , board_writer , board_contents)
	values(3,'writer3' , 'contents3');
insert into board2(id , board_writer , board_contents)
	values(4,'writer4' , 'contents4');
select * from board2;
-- 1,2번 게시글에 댓글 작성
insert into comment2( id , comment_writer , comment_contents , board2_id)
	values(1,'c writer1' , 'c comment1' , 1);
insert into comment2( id , comment_writer , comment_contents , board2_id)
	values(2,'c writer1' , 'c comment1' , 2);
select * from comment2;
-- 3번게시글 삭제
delete from board2 where id = 3;
-- 2번 게시글 삭제
delete from board2 where id = 2;


-- 게시판 테이블
drop table if exists board3; 
create table board3(
id bigint, -- 글번호
board_writer varchar(20) not null, -- 작성자
board_contents varchar(500), -- 내용
constraint pk_board3 primary key(id)
);
desc board3;
select * from board3;

-- 댓글 테이블
drop table if exists comment3;
create table comment3(
	id bigint , -- 댓글 번호
	comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글 내용
	board3_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
	constraint pk_comment3 primary key(id),
	constraint fk_comment3 foreign key(board3_id) references board3(id) on delete set null
);
desc comment3;
select *from comment3;


select * from board3;
insert into board3(id , board_writer , board_contents)
	values(1,'writer1' , 'contents1');
insert into board3(id , board_writer , board_contents)
	values(2,'writer2' ,' contents2');
insert into board3(id , board_writer , board_contents)
	values(3,'writer3' , 'contents3');
insert into board3(id , board_writer , board_contents)
	values(4,'writer4' , 'contents4');


select *from comment3;
insert into comment3( id , comment_writer , comment_contents , board3_id)
	values(1,'c writer1' , 'c comment1' , 1);
insert into comment3( id , comment_writer , comment_contents , board3_id)
	values(2,'c writer1' , 'c comment1' , 2);
insert into comment3( id , comment_writer , comment_contents , board3_id)
	values(3,'c writer1' , 'c comment1' , 1);

-- 3번게시글 삭제
delete from board3 where id = 3;
-- 2번 게시글 삭제
delete from board3 where id = 2;

-- 수정 쿼리
-- 1번 게시글 내용을 안녕하세요로 수정
select * from board3;
update board3 set board_contents = '안녕하세요' where id = 1;
-- 4번 게시글 작성자를 작성자4, 내용을 곧 점심시간으로 수정
update board3 set board_writer = '작성자' , board_contents = '곧 점심시간' where id = 4;
-- 컬럼의 2가지 이상 정보를 수정할때는 , 로 연결해준다

-- id 컬럼에 자동 번호 적용하기
drop table if exists board4; 
create table board4(
	id bigint auto_increment, -- 글번호
	board_writer varchar(20) not null, -- 작성자
	board_contents varchar(500), -- 내용
	constraint pk_board4 primary key(id)
);
desc board4;
select * from board4;

insert into board4( board_writer , board_contents)
	values('writer1' , 'contents1');
insert into board4( board_writer , board_contents)
	values('writer2' , 'contents2');

use db_dbclass;
drop table if exists book;
create table book(
id bigint auto_increment,
b_bookname varchar(20),
b_publisher varchar(20),
b_price bigint,
constraint pk_book primary key(id)
);
desc book;
select *from book;

insert into book(b_bookname , b_publisher , b_price)
			values('축구의 역사' , '굿스포츠' ,7000);
insert into book(b_bookname , b_publisher , b_price)
			values('축구스카우팅 리포트' , '나무수' ,13000);
insert into book(b_bookname , b_publisher , b_price)
			values('축구의 이해' , '대한미디어' ,22000);
insert into book(b_bookname , b_publisher , b_price)
			values('배구 바이블' , '대한미디어' ,35000);
insert into book(b_bookname , b_publisher , b_price)
			values('피겨 교본' , '굿스포츠' ,8000);
insert into book(b_bookname , b_publisher , b_price)
			values('피칭 단계별기술' , '굿스포츠' ,6000);
insert into book(b_bookname , b_publisher , b_price)
			values('야구의 추억' , '이상미디어' ,20000);
insert into book(b_bookname , b_publisher , b_price)
			values('야구를 부탁해' , '이상미디어' ,13000);
insert into book(b_bookname , b_publisher , b_price)
			values('올림픽 이야기' , '삼성당' ,7500);
insert into book(b_bookname , b_publisher , b_price)
			values('olympic champions' , 'pearson' ,13000);

drop table if exists customer;
create table customer(
id bigint auto_increment,
c_name varchar(20),
c_address varchar(20),
c_phone varchar(20),
-- book_id bigint,
constraint pk_customer primary key(id)
-- constraint fk_customer foreign key(book_id) references book(id)
);
desc customer;
select *from customer;

insert into customer(c_name , c_address , c_phone)
		values('손흥민','영국 런던','000-5000-0001');
insert into customer(c_name , c_address , c_phone)
		values('김연아','대한민국 서울','000-6000-0001');
insert into customer(c_name , c_address , c_phone)
		values('김연경','중국 상하이','000-7000-0001');
insert into customer(c_name , c_address , c_phone)
		values('류현진','캐나다 토론토','000-8000-0001');
insert into customer(c_name , c_address)
		values('이강인','스페인 마요르카');

drop table if exists orders;
create table orders(
id bigint auto_increment,
customer_id bigint,
book_id bigint,
o_saleprice bigint,
o_orderdate date,
constraint pk_orders primary key(id),
constraint fk_orders1 foreign key(book_id) references book(id),
constraint fk_orders2 foreign key(customer_id) references customer(id)
);
desc orders;
select * from orders;
insert into orders(customer_id , book_id , o_saleprice , o_orderdate)
		values(1,1,6000,'2021-07-01');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(1,3,21000,'2021-07-03');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(2,5,8000,'2021-07-03');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(3,6,6000,'2021-07-04');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(4,7,20000,'2021-07-05');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(1,2,12000,'2021-07-07');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(4,8,13000,'2021-07-07');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(3,10,12000,'2021-07-08');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(2,10,7000,'2021-07-09');
insert into orders(customer_id , book_id ,o_saleprice , o_orderdate)
		values(3,8,13000,'2021-07-10');
        
        
-- 1. 모든 도서의 가격과 도서명 조회 
select b_bookname , b_price from book;
-- 2. 모든 출판사 이름 조회 
select b_publisher from book;
-- 2.1 중복값을 제외한 출판사 이름 조회 
select b_publisher from book group by b_publisher;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회 
select *from book where b_price < 20000;
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price >= 10000 and b_price <= 20000;
select * from book where b_price between 10000 and 20000;
-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회 
select * from book where b_publisher = '굿스포츠' or b_publisher = '대한미디어';
select * from book where b_publisher in ('굿스포츠' , '대한미디어');
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc , b_bookname asc;
select * from book order by b_price , b_bookname asc;


-- 20230331 day5
select * from orders;
-- 12. 주문 도서의 총 판매액 조회
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where id = 1; -- X
select sum(o_saleprice) from orders where customer_id = 1; -- O
-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 
select avg(o_saleprice) as '평균판매가',max(o_saleprice) as '최고판매가', min(o_saleprice) as '최저판매가' from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회
select customer_id , count(book_id) , sum(o_saleprice) from orders group by customer_id;
-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 
select customer_id , count(id) from orders where o_saleprice >= 8000
		group by customer_id having count(id) >= 2;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select customer_id , sum(o_saleprice) from orders where customer_id = 2 group by customer_id; -- X
select sum(o_saleprice) from orders where customer_id = 2; -- O
-- 18. 김연아 고객이 구매한 도서의 수
select count(book_id) from orders where customer_id = 2;
-- 19. 서점에 있는 도서의 총 권수
select count(id) from book;
-- 20. 출판사의 총 수 
select count(distinct b_publisher) from book;
-- distinct 절 : 중복결과 제외
-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select * from orders where o_orderdate  >= '2021-07-04' and o_orderdate <= '2021-07-07';
select * from orders where o_orderdate between str_to_date('2021-07-04' , '%Y-%m-%d')
										and str_to_date('2021-07-07' , '%Y-%m-%d');
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select * from orders where !(o_orderdate >= '2021-07-04' and o_orderdate <= '2021-07-07');
select * from orders where o_orderdate not between str_to_date('2021-07-04' , '%Y-%m-%d')
										and str_to_date('2021-07-07' , '%Y-%m-%d');


-- 23. 고객, 주문 테이블 조인하여 고객번호 순으로 정렬
select * from customer c , orders o 
		where o.customer_id = c.id 
			order by c.id asc;

select * from customer c 
		inner join orders o 
			on c.id = o.customer_id;
                        
-- 24. 고객이름(CUSTOMER), 고객이 주문한 도서 가격(ORDERS) 조회 
select c.c_name,o.o_saleprice from customer c , orders o 
		where o.customer_id = c.id;
-- 25. 고객별(GROUP)로 주문한 도서의 총 판매액(SUM)과 고객이름을 조회하고 조회 결과를 가나다 순으로 정렬 
select c.c_name , sum(o.o_saleprice) 
	from customer c , orders o 
		where o.customer_id = c.id 
			group by c.c_name
				order by c.c_name asc;
                
-- 26. 고객명과 고객이 주문한 도서명을 조회(3테이블 조인)
select c.c_name , b.b_bookname 
	from customer c , orders o , book b 
		where o.customer_id = c.id 
			and o.book_id = b.id;
-- 27. 2만원(SALEPRICE) 이상 도서를 주문한 고객의 이름과 도서명을 조회 
select c.c_name , b.b_bookname 
	from customer c , orders o , book b 
		where o.customer_id = c.id 
			and o.book_id = b.id 
				and b.b_price >=20000;
-- 28. 손흥민 고객의 총 구매액과 고객명을 함께 조회
select c.c_name , sum(o.o_saleprice) from customer c , orders o , book b 
		where o.customer_id = c.id 
				and c.c_name = '손흥민';
-- 29. 손흥민 고객의 총 구매수량과 고객명을 함께 조회
select c.c_name , count(customer_id) from customer c , orders o 
		where o.customer_id = c.id 
				and c.c_name = '손흥민';
-- 30. 가장 비싼 도서의 이름을 조회 
select b_bookname from book 
		where b_price=(select max(b_price) from book);
-- 31. 책을 구매한 이력이 있는 고객의 이름을 조회
select c_name from customer c , orders o 
		where c.id = o.customer_id
			group by c_name;
            
select customer_id from orders where id in (1,2,3,4);
select c_name from customer 
	where id in(select customer_id from orders);
-- 32. 도서의 가격(PRICE)과 판매가격(SALEPRICE)의 차이가 가장 많이 나는 주문 조회 
select * from book b , orders o  
		where o.o_saleprice = (select max(b_price-o_saleprice) from orders) 
			and o.book_id = b.id;
            
select * from book b , orders o where b.id=o.book_id
			and b.b_price - o.o_saleprice =
				(select max(b.b_price - o.o_saleprice) from book b, orders o
					where b.id = o.book_id);
-- 33. 고객별 평균 구매 금액이 도서의 판매 평균 금액 보다 높은 고객의 이름 조회
select c.c_name from orders o , customer c 
		where o.customer_id = c.id 
			group by c.c_name 
				having avg(o_saleprice) >= (select avg(o_saleprice) from orders);
-- 34. 고객번호가 5인 고객의 주소를 대한민국 인천으로 변경
update customer set c_address = '대한민국 인천' where id = 5;
-- 35. 김씨 성을 가진 고객이 주문한 총 판매액 조회                            
select sum(o_saleprice) from orders where customer_id 
		in(select id from customer where c_name like '김%');

select c.c_name , sum(o_saleprice) from orders o , customer c 
				where o.customer_id = c.id 
					group by c.id 
						having c_name like '김%' 
							and (select sum(o_saleprice) from orders);


-- 테이블 구조 변경 (alter)
create table student(
	id bigint,
    s_name varchar(20),
    s_mobile int
);
desc student;
-- 기존 컬럼에 제약조건 추가
alter table student add constraint primary key(id);
-- 기존 컬럼 타입 변경
alter table student modify s_mobile varchar(30);
-- 새로운 컬럼 추가
alter table student add s_major varchar(30);
-- 컬럼 이름 변경
alter table student change s_mobile s_phone varchar(30);
-- 컬럼 삭제
alter table student drop s_major;

drop table if exists board_table;
create table board_table(
	id bigint auto_increment primary key,
	board_title varchar(50) not null,
	board_writer varchar(20) not null,
	board_contents varchar(500),
	board_hits int,
	board_created_time datetime default now(),
	board_update_time datetime on update now(),
	-- 업데이트가 발생 했을 때 , 현재시간을 기록해라
	board_file_attached int default 0, 
	-- 파일 첨부 여부 (없으면 0 , 있으면 1)
	member_id bigint,
	category_id bigint,
	constraint fk_member_table foreign key(member_id) 
				references member_table(id)on delete cascade,
	constraint fk_category_table foreign key(category_id) 
				references category_table(id)on delete set null
);

drop table if exists board_file_table;
create table board_file_table(
	id bigint auto_increment primary key,
	original_file_name varchar(100),
    -- 사용자가 업로드한 파일의 이름
	stored_file_name varchar(100),
    -- 관리용 파일 이름(파일이름 생성 로직은 backend에서)
	board_id bigint,
	constraint fk_board_table foreign key(board_id) 
				references board_table(id)on delete cascade
);
-- 실제 파일을 db에 저장하지는 않음
-- 대신 파일의 이름은 db에 저장한다

drop table if exists category_table;
create table category_table(
	id bigint auto_increment,
	category_name varchar(20) not null unique,
	constraint pk_create_table primary key(id)
);

drop table if exists comment_table;
create table comment_table(
	id bigint auto_increment primary key,
	comment_writer varchar(20)not null,
	comment_contents varchar(200)not null,
	comment_created_time datetime default now(),
	board_id bigint,
	member_id bigint,
	constraint fk_comment_board_talbe foreign key(board_id) 
				references board_table(id) on delete cascade,
	constraint fk_comment_member_tabe foreign key(member_id) 
				references member_table(id)on delete cascade
);

drop table if exists member_table;
create table member_table(
	id bigint auto_increment,
	member_email varchar(50) not null unique,
	member_name varchar(20) not null unique,
	member_password varchar(20) not null,
	constraint pk_member_table primary key(id)
);

drop table if exists good_table;
create table good_table(
	id bigint auto_increment primary key,
	comment_id bigint,
	member_id bigint,
	constraint fk_good_comment foreign key(comment_id) 
				references comment_table(id),
	constraint fk_good_member foreign key(member_id) 
				references member_table(id)on delete cascade
);


-- 1. 회원가입
insert into member_table(member_email , member_name , member_password) 
		values('member_email0','member_name0','member_password0');
-- 2. 이메일 중복체크 
-- 기존 가입되어 있지 않은 이메일로 가입하려고 한다면
select member_email from member_table where member_email = 'member_email7'; -- 멤버 컬럼에 없음
-- 기존 가입된 이메일로 가입하려고 한다면
select member_email from member_table where member_email = 'member_email0'; -- 멤버 컬럼에 있음
-- 3. 로그인
select * from member_table 
		where member_email = 'member_email0' 
			and member_password = 'member_password0';
-- 4. 전체 회원 목록 조회 
select * from member_table;
-- 5. 특정 회원만 조회
select * from member_table where member_email = 'member_email3';
-- 6. 회원정보 수정화면 요청 
select * from member_table where member_email = 'member_email3'; -- 특정 회원의 정보를 가져오고
-- 7. 회원정보 수정 처리(비밀번호 변경)
update member_table set member_password = '9999' where di = 5; -- 업데이트
-- 8. 회원 삭제 또는 탈퇴 
delete from member_table where id = 5;

-- 게시글 카테고리 
select * from category_table;
select * from board_table;
select * from member_table;
select * from board_file_table;
-- 게시판 카테고리는 자유게시판, 공지사항, 가입인사 세가지가 있음.
insert into category_table ( category_name )
		value ('free_table');
insert into category_table ( category_name )
		value ('g_table');
insert into category_table ( category_name )
		value ('hello_table');
-- 게시판 기능 
-- 1. 게시글 작성(파일첨부 x) 3개 이상 
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('달달한초코칩' , '오뚜기' , '제곧내' , 5 , 1);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('쓴맛카카오' , '타우린' , '제곧내' , 7 , 1);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('세상에맙소사' , '핫식스' , '제곧내' , 1 , 1);
-- 1번 회원이 자유게시판 글 2개, 공지사항 글 1개 작성 
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('내맘에안들면벤' , '핫식스' , '제곧내' , 1 , 3);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('내가바로' , '핫식스' , '제곧내' , 1 , 1);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('킹왕짱' , '핫식스' , '제곧내' , 1 , 1);
-- 2번 회원이 자유게시판 글 3개 작성
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('얍' , '오뚜기' , '제곧내' , 5 , 1);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('엽' , '오뚜기' , '제곧내' , 5 , 1);
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('욥' , '오뚜기' , '제곧내' , 5 , 1);
-- 3번 회원이 가입인사 글 1개 작성 
insert into board_table(board_title , board_writer , board_contents , member_id , category_id)
		values('안녕하세요' , '타우린' , '제곧내' , 7 , 2);
-- 1.1. 게시글 작성(파일첨부 o)
insert into board_file_table 
	( original_file_name , stored_file_name , board_id)
		values('흠냐륑' , '77744477흠냐륑' , 1);
insert into board_table
	(board_title , board_writer , board_contents , member_id , category_id , board_file_attached)
		values('흠냐륑' , '핫식스' , '제곧내' , 1 , 3 , 1);
-- 2번 회원이 파일있는 자유게시판 글 2개 작성
insert into board_file_table ( original_file_name , stored_file_name , board_id)
		values('륑냐흠' , '45747444릥냐흠' , 7);
insert into board_table
	(board_title , board_writer , board_contents , member_id , category_id , board_file_attached)
		values('륑냐흠' , '타우린' , '제곧내' , 7 , 1 , 5);
insert into board_file_table ( original_file_name , stored_file_name , board_id)
		values('얍엽욥' , '45747444얍' , 7);
insert into board_table
	(board_title , board_writer , board_contents , member_id , category_id , board_file_attached)
		values('얍엽욥' , '타우린' , '제곧내' , 7 , 1 , 5);
-- 2.1 전체글 목록 조회
select *from board_table;
-- 2.2 자유게시판 목록 조회 
select * from board_table where category_id = 1;
-- 2.3 공지사항 목록 조회 
select * from board_table where category_id = 3;
-- 2.4 목록 조회시 카테고리 이름도 함께 나오게 조회
select b.* , c.category_name
		from board_table b , category_table c
			where b.category_id = c.id order by b.id asc;



-- 3. 2번 게시글 조회 (조회수 처리 필요함)
update board_table set board_hits = board_hits+1 where id=2;
-- 단 , 이렇게 쿼리 업데이트로 조회수를 올리면 수정 시간을 now로 했기 때문에
-- 조회수가 올라갈 때 마다 수정 시간이 바뀐다

select * from board_table where id = 2;
-- 3.1. 파일 첨부된 게시글 조회 (게시글 내용과 파일을 함께)
update board_table set baord_hits = board_hits +1 where id=19;

select b.*,f.original_file_name 
	from board_table b ,board_file_table f 
		where f.board_id = b.id and b.id = 19;
-- 4. 1번 회원이 자유게시판에 첫번째로 작성한 게시글의 제목, 내용 수정
update board_table set board_title = '맙소사 세상에' where id = 9;
update board_table set board_contents = '곧제내' where id = 9;
-- 한번에 가능하다
update board_table set 
		board_title = '맘소사 세상에' , board_contents = '곧내제' 
			where id = 9;
-- 5. 2번 회원이 자유게시판에 첫번째로 작성한 게시글 삭제 
select * from board_table where member_id = 5;
delete from board_table where id = 14;
-- 7. 페이징 처리(한 페이지당 글 3개씩)
select * from board_table order by id desc;
-- 7.1. 첫번째 페이지
select * from board_table order by id desc limit 0,3;
-- 7.2. 두번째 페이지 
select * from board_table order by id desc limit 3,3;
-- 7.3. 세번째 페이지 
select * from board_table order by id desc limit 6,3;
-- 정렬기준은 조회수 , 한페이지당 글 5개씩 볼 때 1페이지
select * from board_table order by board_hits desc limit 0,5;
-- 8. 검색(글제목 기준)
select * from board_table where board_title = '흠냐륑';
-- 8.1 검색결과를 오래된 순으로 조회 
select * from board_table where board_contents like '%제%' order by board_created_time asc;
-- 8.2 검색결과를 조회수 내림차순으로 조회 
select * from board_table where board_writer like '%타%' order by board_hits desc;
-- 8.3 검색결과 페이징 처리 
select * from board_table 
	where board_title like '%안녕%' 
		order by board_created_time 
			desc limit 0,2;

-- 댓글 기능 
-- 1. 댓글 작성 
-- 1.1. 1번 회원이 1번 게시글에 댓글 작성 
insert into comment_table(comment_writer , comment_contents , member_id , board_id)
		values ('잠자는 숲속의 하마' , '개노잼' , 1 , 2);
-- 1.2. 2번 회원이 1번 게시글에 댓글 작성 
insert into comment_table(comment_writer , comment_contents , member_id , board_id)
		values('랩퍼송대관' , 'ㅇㅈㅇㅈ' , 5 , 2);
-- 2. 댓글 조회
select * from comment_table where board_id = 2;
select * from board_table where id = 2 ;
select * from board_table b , comment_table c where b.id=c.board_id;
-- 3. 댓글 좋아요 
-- 3.1. 1번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭
-- 좋아요 하기 전 체크
select id from good_table where comment_id=2 and member_id =1;
-- 좋아요 한적이 없다면 좋아요
insert into good_table(comment_id , member_id)
		values(2 , 1);
-- 좋아요 한적이 있다면 좋아요 취소
delete from good_table where id =1;
-- 3.2. 3번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭
insert into good_table(comment_id , member_id)
		values(1 , 7);
-- 4. 댓글 조회시 좋아요 갯수도 함께 조회
select c.* , count(g.comment_id) as '좋아요' from comment_table c ,good_table g 
		where c.id = g.comment_id 
			group by id ;

drop table if exists TBL_VOTE_202005;
create table TBL_VOTE_202005(
V_JUMIN char(13) NOT NULL primary key,
V_NAME varchar(20),
M_NO char(1),
V_TIME char(4),
V_AREA CHAR(20),
V_COMFIRM CHAR(1)
);

select * from TBL_VOTE_202005;
insert into TBL_VOTE_202005(V_JUMIN , V_NAME , M_NO , V_TIME , V_AREA , V_COMFIRM)
		values('99010110001' , '김유권' , '1' , '0930' , '제1투표장' , 'N');
insert into TBL_VOTE_202005(V_JUMIN , V_NAME , M_NO , V_TIME , V_AREA , V_COMFIRM)
		values('89010120002' , '이유권' , '2' , '0930' , '제1투표장' , 'N');
insert into tbl_vote_202005 values ('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('00010130024', '오유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('02010140024', '최유권', '3', '1330', '제2투표장', 'Y');

drop table if exists TBL_MEMBER_202005;
create table TBL_MEMBER_202005(
M_NO char(1) NOT NULL PRIMARY KEY,
M_NAME VARCHAR(20),
P_CODE CHAR(2),
P_SCHOOL CHAR(1),
M_JUMIN CHAR(13),
M_CITY VARCHAR(20)
);

SELECT * FROM TBL_MEMBER_202005;
INSERT INTO TBL_MEMBER_202005 (M_NO , M_NAME , P_CODE , P_SCHOOL , M_JUMIN , M_CITY)
		values('1' , '김후보' , 'P1' , '1' , '6603011999991' , '수선화동');
INSERT INTO TBL_MEMBER_202005 (M_NO , M_NAME , P_CODE , P_SCHOOL , M_JUMIN , M_CITY)
		values('2' , '이후보' , 'P2' , '3' , '5503011999992' , '민들래동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');


DROP TABLE IF exists TBL_PARTY_202005;
CREATE TABLE TBL_PARTY_202005(
P_CODE CHAR(2) NOT NULL PRIMARY KEY,
P_NAME VARCHAR(20),
P_INDATE DATE,
P_READER VARCHAR(20),
P_TEL1 CHAR(3),
P_TEL2 CHAR(4),
P_TEL3 CHAR(4)
);

SELECT * FROM TBL_PARTY_202005;
INSERT INTO TBL_PARTY_202005(P_CODE , P_NAME , P_INDATE , P_READER , P_TEL1 , P_TEL2, P_TEL3)
		values('P1' , 'A정당' , '2010-01-01' , '위대표' , '02' , '1111' , '0001');
INSERT INTO TBL_PARTY_202005(P_CODE , P_NAME , P_INDATE , P_READER , P_TEL1 , P_TEL2, P_TEL3)
		values('P2' , 'B정당' , '2010-02-01' , '명대표' , '02' , '1111' , '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

SELECT * FROM TBL_MEMBER_202005;
-- 1. 후보자정보 조회
-- 1.1 후보자 , 정당 테이블 조인
SELECT M.*,P.P_NAME,P.P_TEL1,P.P_TEL2,P.P_TEL3
		FROM TBL_MEMBER_202005 M , TBL_PARTY_202005 P 
			WHERE M.P_CODE = P.P_CODE;
-- 1.2 필요한 정보만 조회(컬럼이름 한글로)
SELECT M.M_NO AS '후보번호', M.M_NAME AS '성명',P.P_NAME as '소속정당'
		,M.P_SCHOOL AS '학력', M.M_JUMIN AS '주민번호'  
			,M.M_CITY AS'지역구',P.P_TEL1,P.P_TEL2 ,P.P_TEL3
				FROM TBL_MEMBER_202005 M , TBL_PARTY_202005 P 
					WHERE M.P_CODE = P.P_CODE;
-- 1.3학력 표현
-- 1:고졸 , 2:학사 , 3:석사 , 4:박사
SELECT P_SCHOOL FROM TBL_MEMBER_202005;
SELECT P_SCHOOL,
	CASE
		WHEN P_SCHOOL ='1' THEN '고졸'
		WHEN P_SCHOOL ='2' THEN '학사'
        WHEN P_SCHOOL ='3' THEN '석사'
        WHEN P_SCHOOL ='4' THEN '박사'
        ELSE '없음'
	END AS '학력'
    FROM TBL_MEMBER_202005;
-- 1.4 주민번호(총13자리)
SELECT M_JUMIN FROM TBL_MEMBER_202005;
-- LEFT , RIGHT 사용
SELECT CONCAT(LEFT(M_JUMIN , 6),'-',RIGHT(M_JUMIN ,7))AS '주민번호' 	
		FROM TBL_MEMBER_202005;
-- 앞 6자리 (SUBSTR 사용)
SELECT substr(M_JUMIN, 1, 6) FROM TBL_MEMBER_202005;
-- 뒤 6자리 (SUBSTR 사용)
SELECT substr(M_JUMIN,7,7) FROM TBL_MEMBER_202005;

SELECT CONCAT(SUBSTR(M_JUMIN,1,6),'-',SUBSTR(M_JUMIN,7,7))AS '주민번호' 
		FROM TBL_MEMBER_202005;
        
-- 1.5 대표전화
SELECT CONCAT(P_TEL1 ,'-', P_TEL2 ,'-', P_TEL3)AS'대표전화' 
		FROM TBL_PARTY_202005;

-- 1.6 완성
-- 1.6 완성
SELECT M.M_NO AS '후보번호', M.M_NAME AS '성명',P.P_NAME as '소속정당'
		,CASE
		WHEN P_SCHOOL ='1' THEN '고졸'
		WHEN P_SCHOOL ='2' THEN '학사'
        WHEN P_SCHOOL ='3' THEN '석사'
        WHEN P_SCHOOL ='4' THEN '박사'
        ELSE '없음'
	END AS '학력',CONCAT(LEFT(M_JUMIN , 6),'-',RIGHT(M_JUMIN ,7))AS '주민번호'  
			,M.M_CITY AS'지역구',CONCAT(P_TEL1 ,'-', P_TEL2 ,'-', P_TEL3)AS'대표전화'
				FROM TBL_MEMBER_202005 M , TBL_PARTY_202005 P 
					WHERE M.P_CODE = P.P_CODE;
                    
-- 후보자 등수 조회
-- 단, 유권자 확인 항목의 데이터가 'N'인 데이터는 제외한다
select * from TBL_VOTE_202005;
SELECT * FROM TBL_MEMBER_202005;
SELECT M_NO , COUNT(M_NO) FROM TBL_VOTE_202005 
	WHERE V_COMFIRM='Y' 
		group by M_NO 
			ORDER BY COUNT(M_NO) DESC;

SELECT M.M_NO AS '후보번호' , M.M_NAME AS '성명' , COUNT(V.M_NO) AS '총투표건수' 
	FROM TBL_MEMBER_202005 M , TBL_VOTE_202005 V 
		WHERE M.M_NO = V.M_NO AND V_COMFIRM = 'Y' group by M.M_NO 
			ORDER BY count(V.M_NO) DESC;
                    
SELECT CONCAT('19',LEFT(V_JUMIN , 2)) FROM TBL_VOTE_202005;
       
SELECT * FROM TBL_VOTE_202005;

create VIEW VOTE_RESULT AS
SELECT V_NAME AS '성명',CASE 
	WHEN SUBSTR(V_JUMIN,7,1) IN ('1','2') THEN CONCAT('19',LEFT(V_JUMIN,2),'년',SUBSTR(V_JUMIN,3,2),'월',SUBSTR(V_JUMIN,5,2),'일')
	WHEN SUBSTR(V_JUMIN,7,1) IN ('3','4') THEN CONCAT('20',LEFT(V_JUMIN,2),'년',SUBSTR(V_JUMIN,3,2),'월',SUBSTR(V_JUMIN,5,2),'일')
    ELSE '없음'
END AS '생년월일',concat(cast(date_format(sysdate(), '%Y') as unsigned) - concat(case 
	when substr(v_jumin, 7, 1) in('1', '2') then '19'
	when substr(v_jumin, 7, 1) in('3', '4') then '20'
end,
	substr(v_jumin, 1, 2)),
'세') as '나이',CASE
	WHEN SUBSTR(V_JUMIN,7,1) IN ('1','3') THEN '남'
	WHEN SUBSTR(V_JUMIN,7,1) IN ('2','4') THEN '여'
	ELSE '없음'
END AS '성별',M_NO AS '후보번호' , CONCAT(LEFT(V_TIME,2),':',RIGHT(V_TIME,2)) AS '투표시간',CASE
	WHEN V_COMFIRM = 'Y' THEN '확인'
	WHEN V_COMFIRM = 'N' THEN '미확인'
	ELSE '없음'
END AS '유권자확인'
FROM TBL_VOTE_202005;
SELECT * FROM VOTE_RESULT;

drop table if exists member_table2;

create table member_table2(
id varchar (10) unique primary key,
member_password varchar(20) not null,
member_name varchar (5) not null,
member_birth date not null,
member_gender varchar (3) not null,
member_phone varchar (20) not null
);

drop table if exists board_table2;

create table board_table2(
bno bigint auto_increment primary key,
board_writer varchar (10),
board_title varchar (50) not null,
board_contents varchar (500) not null,
board_hits int,
constraint fk_baord_table2 foreign key(board_writer)
	references member_table2(id)
);

insert into member_table2 
	values('id1','1111','홍길동','960101','남','010-1111-1111');
insert into member_table2 
	values('id2','2222','심청이','000101','여','010-2222-2222');
                 
select * from member_table2;

insert into board_table2(board_writer , board_title , board_contents) 
	values('id1','안녕하세요','신기하네요');
insert into board_table2(board_writer , board_title , board_contents) 
	values('id2','반갑습니다','소통해요!');
                    
select * from board_table2;
                    
update board_table2 set board_hits = +1 where bno=1;
select * from board_table2 where bno = 1;
                    
select * from board_table2 order by board_writer asc;

select * from board_table2 order by board_hits desc;
                    
update board_table2 set board_title = '홍길동입니다' where bno = 1;

delete from board_table2 where bno = 2;
                    
select * from board_table2;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
    