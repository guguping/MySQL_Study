create user user_dbclass@localhost identified by '1234';
create database db_dbclass;
grant all privileges on db_dbclass.* to user_dbclass@localhost;

create user user_springframework@localhost identified by '1234';
create database db_springframework;
grant all privileges on db_springframework.* to user_springframework@localhost;

create user user_system@localhost identified by '1234';
create database db_system;
grant all privileges on db_system.* to user_system@localhost;

use mysql;
select user from user;

drop user user2@localhost;