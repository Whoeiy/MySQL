package my.yy.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import my.yy.utils.DBUtils;

public class ChooseDAO {
	/**
	 * 查询学生选课数量
	 * @param sno
	 * @return int
	 */
	
	public int getChooseNum(String sno)
	{
		Connection conn = null;
		CallableStatement cstmt = null;
		
		int num = 0;
		try {
			conn = DBUtils.getConnection();
			cstmt = conn.prepareCall("call proc_getChooseNum(?,?)");
			cstmt.setString(1, sno);	//提供输入参数
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);	//注册输出参数
			cstmt.executeQuery();
			num = cstmt.getInt(2);	//获取存储过程的返回值
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			DBUtils.closeAll(conn, cstmt);
		}
		return num;
	}
}
