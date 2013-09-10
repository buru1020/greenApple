package net.bitacademy.java41.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Member;

public class MemberDao {
	DBConnectionPool conPool;

	public MemberDao(DBConnectionPool conPool) {
		this.conPool = conPool;
	}
	
	
	public Member getMember(String email, String password) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
					" select EMAIL, MNAME, PWD, TEL, BLOG, REG_DATE, UPDATE_DATE, ANO, DET_ADDR, TAG, LEVEL"
					+ " from SPMS_MEMBS"
					+ " where EMAIL=?"
					+ "		and PWD=?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Member member = new Member()
											.setEmail(rs.getString("EMAIL"))
											.setName(rs.getString("MNAME"))
											.setTel(rs.getString("TEL"))
											.setLevel(rs.getInt("LEVEL"));
				return member;
				
			} else {
				return null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
	
	public Member getMember(String email) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
					" select EMAIL, MNAME, PWD, TEL, BLOG, REG_DATE, UPDATE_DATE, ANO, DET_ADDR, TAG, LEVEL"
					+ " from SPMS_MEMBS"
					+ " where EMAIL=?");
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Member member = new Member()
											.setEmail(rs.getString("EMAIL"))
											.setName(rs.getString("MNAME"))
											.setTel(rs.getString("TEL"))
											.setLevel(rs.getInt("LEVEL"));
				return member;
				
			} else {
				return null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public int addMember(Member member) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			String sql = 
					"insert into SPMS_MEMBS( EMAIL, MNAME, PWD, TEL, BLOG, REG_DATE, UPDATE_DATE, ANO, DET_ADDR, TAG, LEVEL )"
							+ " values(?, ?, ?, ?, ?, now(), now(), NULL, NULL, NULL)";
			System.out.println("[addMember] SQL ::\n" + sql);
			stmt = con.prepareStatement(sql);
			stmt.setString(1, member.getEmail());
			stmt.setString(2, member.getName());
			stmt.setString(3, member.getPassword());
			stmt.setString(4, member.getTel());
			stmt.setString(5, member.getBlog());
//			stmt.setInt(6, member.getAddressNo());
//			stmt.setString(7, member.getDetailAddress());
//			stmt.setString(8, member.getTag());
//			stmt.setInt(9, member.getLevel());
			return stmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public List<Map> getPrjtMbrList(int no) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			String sql = 
					"select a.PNO, a.LEVEL, a.EMAIL, b.MNAME, b.TEL, b.BLOG, b.ANO, b.DET_ADDR, b.TAG, b.LEVEL"
					+" from SPMS_PRJMEMB a"
					+" , SPMS_MEMBS b"
					+" where a.EMAIL = b.EMAIL"
					+" and a.PNO = ?"
					+" order by a.LEVEL, b.MNAME";
			System.out.println("[getPrjtMerList] SQL: \n" + sql);
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			List<Map> list = new ArrayList<Map>();
			while (rs.next()) {
				Map map = new HashMap();
				Member projectMember = new Member()
											.setEmail(rs.getString("EMAIL"))
											.setName(rs.getString("MNAME"))
											.setTel(rs.getString("TEL"))
											.setBlog(rs.getString("BLOG"))
											.setAddressNo(rs.getInt("ANO"))
											.setDetailAddress(rs.getString("DET_ADDR"))
											.setTag(rs.getString("TAG"))
											.setLevel(rs.getInt("LEVEL"));
				map.put("no", rs.getInt("PNO"));
				map.put("level", rs.getInt("LEVEL"));
				map.put("projectMember", projectMember);
				list.add(map);
			}
			return list;
		} catch (Exception e) {
			throw e;
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public List<Member> getMemberList() throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			String sql = 
					"select EMAIL, MNAME, TEL, BLOG, ANO, DET_ADDR, TAG, LEVEL"
					+" from SPMS_MEMBS"
					+" order by MNAME";
			System.out.println("[getPrjtMerList] SQL: \n" + sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			List<Member> list = new ArrayList<Member>();
			while (rs.next()) {
				list.add( new Member()
									.setEmail(rs.getString("EMAIL"))
									.setName(rs.getString("MNAME"))
									.setTel(rs.getString("TEL"))
									.setBlog(rs.getString("BLOG"))
									.setAddressNo(rs.getInt("ANO"))
									.setDetailAddress(rs.getString("DET_ADDR"))
									.setTag(rs.getString("TAG"))
									.setLevel(rs.getInt("LEVEL"))
								);
			}
			return list;
		} catch (Exception e) {
			throw e;
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
	
	/*
	public List<Member> list() throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> list = new ArrayList<Member>();

		try {
			con = conPool.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(
					"select MNAME,PHONE,EMAIL from MEMBERS order by MNAME");
			
			Member m = null;
			while(rs.next()) {
				m = new Member();
				m.setName(rs.getString("MNAME"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				list.add(m);
			}
			
			return list;
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public int add(Member member) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				"insert into MEMBERS(MNAME,PHONE,EMAIL,BLOG,AGE,REG_DATE)"
				+ " values(?,?,?,?,?,now())");
			stmt.setString(1, member.getName());
			stmt.setString(2, member.getPhone());
			stmt.setString(3, member.getEmail());
			stmt.setString(4, member.getBlog());
			stmt.setInt(5, member.getAge());
			return stmt.executeUpdate();
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public Member get(String email) throws Exception {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(
					"select MNAME,PHONE,EMAIL,BLOG,AGE,REG_DATE"
					+ " from MEMBERS"
					+ " where EMAIL='" + email + "'");
			
			if (rs.next()) {
				Member member = new Member();
				member.setName(rs.getString("MNAME"));
				member.setPhone(rs.getString("PHONE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setBlog(rs.getString("BLOG"));
				member.setAge(rs.getInt("AGE"));
				member.setRegDate(rs.getDate("REG_DATE"));
				return member;
				
			} else {
				return null;
			}
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {stmt.close();} catch (Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public int change(Member member) throws Exception {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.prepareStatement(
				"update MEMBERS set"
				+ " MNAME=?,PHONE=?,BLOG=?,AGE=?,REG_DATE=now()"
				+ " where EMAIL=?");
			stmt.setString(1, member.getName());
			stmt.setString(2, member.getPhone());
			stmt.setString(3, member.getBlog());
			stmt.setInt(4, member.getAge());
			stmt.setString(5, member.getEmail());
			return stmt.executeUpdate();

		} catch (Exception e) {
			throw e;
		
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}

	public int remove(String email) throws Exception {
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = conPool.getConnection();
			stmt = con.createStatement();
			
			return stmt.executeUpdate(
				"delete from MEMBERS"
				+ " where EMAIL='" + email + "'");
			
		} catch (Exception e) {
			throw e;
			
		} finally {
			try {stmt.close();} catch(Exception e) {}
			if (con != null) {
				conPool.returnConnection(con);
			}
		}
	}
	*/
	
}




