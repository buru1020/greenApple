package net.bitacademy.java41.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Task;

public class TaskDao {

DBConnectionPool conPool;
	
	public TaskDao() {}
	
	public TaskDao(DBConnectionPool conPool) {
		this.conPool = conPool;
	}
	
	public TaskDao setDBConnectionPool(DBConnectionPool conPool) {
		this.conPool = conPool;
		return this;
	}
	
	public Task getTask(int no) throws Exception {

		System.out.println(no);
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			con = conPool.getConnection();
			
			String sql =
					("select TNO,PNO,TITLE,UIPROTOURL,"
						+ "CONTENT,START_DATE,END_DATE,STATUS"
							+ " from SPMS_TASKS" 
							+ " where PNO=?");
			
			System.out.println("[listPorject(email)] SQL :: \n" + sql);
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			Task task = null;
			while(rs.next()) {
				task =  new Task()
						.setTno(rs.getInt("TNO"))
						.setProjectNo(rs.getInt("PNO"))
						.setTitle(rs.getString("TITLE"))
						.setUiProtocol(rs.getString("UIPROTOURL"))
						.setContent(rs.getString("CONTENT"))
						.setStartDate(rs.getDate("START_DATE"))
						.setEndDate(rs.getDate("END_DATE"))
						.setStatus(rs.getInt("STATUS"));
			}
			
			return task;
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				stmt.close();
			} catch (Exception e) {
			}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	
	
}
