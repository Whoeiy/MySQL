#trigger_homework
#time:20191008
#--------------------------------------------#
#
# book p204
# 在选课系统的choose数据库中定义触发器, 要求:
# score字段要求在0到100之间取值
#
delimiter $$
create trigger tri_choose_score_ist  before insert on choose for each row
begin
if(new.score >= 0 && new.score <= 100) then
set new.score = new.score;
else insert into mytable values(0);
end if;
end;
$$
delimiter ;
#
# ppt01
#
# 在选课系统的choose数据库中定义触发器, 要求:
# 在choose表中添加和修改成绩，只能在0-100之间取值
#
delimiter $$
create trigger tri_choose_score_upd before update on choose for each row
begin
if(new.score >= 0 && new.score <= 100) then
set new.score = new.score;
else insert into mytable values(0);
end if;
end;
$$
delimiter ;
#
# ppt02
# 在选课系统的choose数据库中定义触发器:
# 每次学生选课/退选之后，自动生成一条日志记录
#
# 创建diary日志记录表
create table diary(
diary_no int auto_increment primary key,
student_no char(11) not null,
course_no int not null,
operation_time datetime not null,
operation_type char(4) not null,
constraint diary_student_fk foreign key(student_no) references student(student_no),
constraint diary_cousre_fk foreign key(course_no) references course(course_no)
)engine=InnoDB default charset=gbk;
# 选课生成diary记录
create trigger tri_choose_diary_c after insert on choose for each row
begin
insert into diary values(null,new.student_no,new.course_no,now(),'c');
end;
$$
# 退课生成diary记录
create trigger tri_choose_diary_d after delete on choose for each row
begin
insert into diary values(null,old.student_no,old.course_no,now(),'d');
end;
$$
#test
insert into choose values(null,2012001,3,null,now());
delete from choose where choose_no = 10;
#
# ppt03
# 在网上商城数据库中定义触发器, 要求:
# 向订单明细表中插入一条记录时，
# 订单表中相应订单的总金额自动增加该件商品的小计（=价格*购买数量）
#
#新小计
delimiter $$
create trigger tri_detail_price before insert on detail for each row
begin
set @pprice = (select prd_price from product where prd_no = new.dtl_prd);
set new.dtl_price = new.dtl_count * @pprice;
end;
$$
#总金额更新
delimiter $$
create trigger tri_order_price after insert on detail for each row
begin
set @sumprice = (select sum(dtl_price) from detail where dtl_order = new.dtl_order);
update orders set order_price = @sumprice where order_no = new.dtl_order;
end;
$$

