create user user_dbclass@localhost identified by '1234';
create database db_dbclass;
grant all privileges on db_dbclass.* to user_dbclass@localhost;
