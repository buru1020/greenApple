package net.bitacademy.java41.services;

import net.bitacademy.java41.annotation.Component;
import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.util.DBConnectionPool;
import net.bitacademy.java41.vo.Member;

@Component
public class AuthService {
	DBConnectionPool conPool;
	MemberDao memberDao;

	public AuthService setConPool(DBConnectionPool conPool) {
		this.conPool = conPool;
		return this;
	}
	public AuthService setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	public Member getUserInfo(String email, String password) throws Exception {
		return memberDao.getMember(email, password);
	}

}
