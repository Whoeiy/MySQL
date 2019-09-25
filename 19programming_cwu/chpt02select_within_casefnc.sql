#chpt02select_within_casefnc
#time:190924
#
#在select语句中使用case函数
#根据学号和课程号输出所有学生的选课情况及成绩等级
#规则：>=90 优，89-75 良，74-60 中，<60 差，null 暂无
#-------------------------#
#--
select student_no, choose.course_no, course_name,
case
when score >= 90 then "优"
when score >= 75 then "良"
when score >= 60 then "中"
when score < 60 then "差"
else "暂无"
end as class
from choose, course
where choose.course_no = course.course_no;