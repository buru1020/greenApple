package net.bitacademy.java41.services;

import java.util.List;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.ProjectEx;

public class MemberService {
	MemberDao memberDao;
	ProjectDao projectDao;

	public MemberService setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	public MemberService setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
		return this;
	}

	public int signUp(Member member) throws Exception {
		return memberDao.addMember(member);
	}

	public void addMember(Member member) throws Exception {
		memberDao.add(member);
	}

	public List<Member> getTotalMemberList() throws Exception {
		return memberDao.getMemberList();
	}

	public Member getMemberInfo(String email) throws Exception {
		return memberDao.getMember(email);
	}

	public List<ProjectEx> getUserProjectList(String email) throws Exception {
		return projectDao.getUserProjectList(email);
	}
	
	public int deleteMember(String email) throws Exception {
		return memberDao.delete(email);
	}
	
	public int isChangePassword(String email, String oldPassword
			, String newPassword) throws Exception {
		return memberDao.changePassword(email, oldPassword, newPassword);
	}
	
	public int updateMemberInfo(Member member) throws Exception {
		return memberDao.update(member);
	}
	
	public int myInfoChange(Member member) throws Exception {
		return memberDao.myInfoChange(member);
	}


}
