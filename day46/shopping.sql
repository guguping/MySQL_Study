use db_system;

drop table if exists member_tbl_02;
create table member_tbl_02(
custno bigint auto_increment primary key,
custName varchar(20),
phone varchar(13),
address varchar(60),
joinDate varchar(10),
grade varchar(1),
city varchar(2)
);

insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("김행복","010-1111-2222","서울 동대문구 휘경1동","20151202","A","01");
insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("이축복","010-1111-3333","서울 동대문구 휘경2동","20151206","B","01");
insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("장믿음","010-1111-4444","울릉도 울릉읍 독도1리","20151001","B","30");
insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("최사랑","010-1111-5555","울릉도 울릉읍 독도2리","20151113","A","30");
insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("진평화","010-1111-6666","제주도 제주시 외나무골","20151225","B","60");
insert into member_tbl_02 (custName,phone,address,joinDate,grade,city)
	value("차공단","010-1111-7777","제주도 제주시 감나무골","20151211","C","60");
select * from member_tbl_02;
select custno,custName,phone,address,concat(substr(joinDate,1,4),'-',substr(joinDate,5,2),'-',substr(joinDate,7,2)),grade,city from member_tbl_02;


drop table if exists money_tbl_02;
create table money_tbl_02(
custno bigint not null,
salenol bigint auto_increment primary key,
pcost int,
amount int,
price int,
pcode varchar(4),
sdate varchar(10),
constraint fk_money_tbl_02 foreign key(custno) references member_tbl_02(custno)
);

insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(1,500,5,2500,"A001","20160101");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(1,1000,4,4000,"A002","20160101");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(1,500,3,1500,"A008","20160101");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(2,2000,1,2000,"A004","20160102");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(2,500,1,500,"A001","20160103");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(3,1500,2,3000,"A003","20160103");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(4,500,2,1000,"A001","20160104");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(4,300,1,300,"A005","20160104");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(4,600,1,600,"A006","20160104");
insert into money_tbl_02 (custno,pcost,amount,price,pcode,sdate)
	value(4,3000,1,3000,"A007","20160106");    
    
select * from money_tbl_02;