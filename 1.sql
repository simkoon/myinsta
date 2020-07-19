create database insta;

show databases;
DROP DATABASE insta;

use insta;

create  table tb_myContent(
	mc_idx bigint auto_increment primary key,
	mc_userid varchar(20) not null,
	mc_content text,
	mc_regdate datetime default now(),
	mc_filepath VARCHAR(200),
	mc_fileoriginame VARCHAR(200),
	mc_taggedid VARCHAR(50)
)

select * from tb_member
select * from tb_myContent

select m_userid,m_username from tb_member LIKE 'apple1' order by m_idx

select * from tb_member where m_userid= '%apple1%'

tb_mycontent

mc_filepath VARCHAR(200),

SELECT mc_idx, mc_useridx, mc_content, mc_regdate, mc_imageurl, mc_taggedid FROM tb_myContent WHERE mc_useridx=8


CREATE DATABASE insta;
show databases

USE insta;

CREATE TABLE tb_member(
   m_idx bigint AUTO_INCREMENT PRIMARY KEY,
   m_userid VARCHAR(20) UNIQUE NOT NULL,
   m_password VARCHAR(100) NOT NULL,
   m_username VARCHAR(20) NOT NULL,
   m_email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE tb_follower(
   fr_idx bigint AUTO_INCREMENT PRIMARY KEY,
   fr_useridx bigint NOT null,
   fr_followerid VARCHAR(20) UNIQUE NOT null,
   fr_regdate datetime default now(),
   FOREIGN KEY (fr_useridx) REFERENCES tb_member(m_idx) 
)

CREATE TABLE tb_following(
   fi_idx bigint AUTO_INCREMENT PRIMARY KEY,
   fi_useridx bigint NOT null,
   fi_followingid VARCHAR(20) UNIQUE NOT null,
   fi_regdate datetime default now(),
   FOREIGN KEY (fi_useridx) REFERENCES tb_member(m_idx) 
)
DROP TABLE tb_blockid

CREATE TABLE tb_hiddenid(
   hi_idx bigint AUTO_INCREMENT PRIMARY KEY,
   hi_useridx bigint NOT null,
   hi_followingid VARCHAR(20) UNIQUE NOT null,
   FOREIGN KEY (hi_useridx) REFERENCES tb_follower(fr_idx) 
)

CREATE TABLE tb_blockid(
   bl_idx bigint AUTO_INCREMENT PRIMARY KEY,
   bl_useridx bigint NOT null,
   bl_followingid VARCHAR(20) UNIQUE NOT null,
   FOREIGN KEY (bl_useridx) REFERENCES tb_member(m_idx)
)
DROP TABLE tc_taggedcontent

create table tb_mycontent(
   mc_idx bigint auto_increment primary key,
   mc_useridx bigint not null,
   mc_content text,
   mc_taggedid varchar(20),
   mc_taggedname varchar(20),
   mc_regdate datetime default now(),
   mc_location varchar(130),
   mc_imageurl varchar(130),
   FOREIGN KEY (mc_useridx) REFERENCES tb_member(m_idx)
)

create  table tb_taggedid(
   ti_idx bigint auto_increment primary key,
   ti_taggedid varchar(20),
   ti_useridx bigint NOT null,
   FOREIGN KEY (ti_useridx) REFERENCES tb_member(m_idx)
)

create  table tb_taggedname(
   tn_idx bigint auto_increment primary key,
   tn_mcidx bigint, 
   tn_tagname varchar(20) not null,
   FOREIGN KEY (tc_mcidx) REFERENCES tb_mycontent(mc_idx)
)


