use choose;
#teacher
insert into teacher value('001','张老师',11000000000);
insert into teacher value('002','李老师',12000000000);
insert into teacher value('003','王老师',13000000000);
#classes
insert into classes(class_no,class_name,department_name)values(null,'2012自动化1班','机电工程');
insert into classes(class_no,class_name,department_name)values(null,'2012自动化2班','机电工程');
insert into classes(class_no,class_name,department_name)values(null,'2012自动化3班','机电工程');
#course
insert into course values(null,'java语言设计',default,'暂无','已审核','001');
insert into course values(null,'MySQL数据库',150,'暂无','已审核','002');
insert into course values(null,'c语言程序设计',230,'暂无','已审核','003');
##select * from course;
#student
insert into student values('2012001','张三','15000000000',1);
insert into student values('2012002','李四','16000000000',1);
insert into student values('2012003','王五','17000000000',3);
insert into student values('2012004','马六','18000000000',2);
insert into student values('2012005','田七','19000000000',2);
#choose
insert into choose values(null,2012001,2,40,'2012-8-11 10:33');
insert into choose values(null,2012001,1,50,'2012-8-11 17:33');
insert into choose values(null,2012002,3,60,'2012-8-12 0:33');
insert into choose values(null,2012002,2,70,'2012-8-12 7:33');
insert into choose values(null,2012003,1,80,'2012-8-12 14:33');
insert into choose values(null,2012004,2,90,'2012-8-12 21:33');
insert into choose values(null,2012005,3,null,'2012-8-13 4:33');
insert into choose values(null,2012005,1,null,'2012-8-13 11:33');
#choose2
insert into choose2 values(null,2012001,2,40,'2012-8-11 10:33');
insert into choose2 values(null,2012001,1,50,'2012-8-11 17:33');
insert into choose2 values(null,2012002,3,60,'2012-8-12 0:33');
insert into choose2 values(null,2012002,2,70,'2012-8-12 7:33');
insert into choose2 values(null,2012003,1,80,'2012-8-12 14:33');
insert into choose2 values(null,2012004,2,90,'2012-8-12 21:33');
insert into choose2 values(null,2012005,3,null,'2012-8-13 4:33');
insert into choose2 values(null,2012005,1,null,'2012-8-13 11:33');
#finished at 190924