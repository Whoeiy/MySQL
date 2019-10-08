#create tables
#products
create table product(
prd_no varchar(32) not null primary key,
prd_name varchar(32) not null,
prd_price decimal(32,8) not null,
prd_descriptionn text,
prd_time datetime not null
)engine=InnoDB default charset=gbk;
#
#order
create table orders(
order_no varchar(32) not null primary key,
order_time datetime not null,
order_price decimal(32,8) not null
)engine=InnoDB default charset=gbk;
#
#details
create table detail(
dtl_no int auto_increment not null,
dtl_order varchar(32) not null,
dtl_prd varchar(32) not null,
dtl_count int,
dtl_price decimal(32,8),
constraint detail_pk primary key(dtl_no,dtl_order),
constraint detail_order_fk foreign key(dtl_order) references orders(order_no),
constraint detail_product_fk foreign key(dtl_prd) references product(prd_no)
)engine=InnoDB default charset=gbk;
#
#insert test values
#
insert into product values('20190001','手机',8000,null,now());
insert into product values('20190002','本子',15,null,now());
insert into product values('20190003','乌龙茶',4,null,now());
#
insert into orders values('20191001',now(),0);
#
insert into detail values(null,'20191001','20190002',5,0);
insert into detail values(null,'20191001','20190003',2,0);