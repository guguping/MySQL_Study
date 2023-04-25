-- book 정보를 저장할 테이블 생성
-- DTO를 참고하여 만들어봅시다.
-- id는 auto_increament 적용
use db_springframework;

drop table book_list;
create table book_list(
id bigint auto_increment primary key,
bookName varchar(50) not null,
bookPublisher varchar(50),
bookAuthor varchar(20),
bookPrice int
);

insert into book_list(bookName , bookPublisher , bookAuthor , bookPrice) values ('나는 어떻게 행복할 수 있는가' , '미디어숲','장재형',16020);
select * from book_list;

select * from book_list where id=1;

delete from book_list where id =1;