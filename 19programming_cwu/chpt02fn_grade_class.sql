#chpt02fn_grade_class
#time:190924
#
#定义函数，使用case语句：
#根据学号和课程号判断某个学生的成绩等级
#规则：>=90 优，89-75 良，74-60 中，<60 差，null 暂无
#调用自定义的函数，验证结果。
#-------------------------#
#--
delimiter $$
create function fn_grade_class(stu_no char(11),crs_no int(11)) returns char(6)
no sql
begin
declare cls char(6);
declare g int;
select score into g from choose where student_no = stu_no and course_no = crs_no;
case
when g >= 90 then set cls = "优";
when g >= 75 then set cls = "良";
when g >= 60 then set cls = "中";
when g < 60 then set cls="差";
else set cls = "暂无";
end case;
return cls;
end;
$$
#调试调用
#select student_no, course_no,score,fn_grade(score) grade_class from choose;
#
select score,fn_grade('2012001',1) class from choose where student_no = '2012001' and course_no = 1;
