package net.bitacademy.java41.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.vo.Member;


public class SignupControl implements PageControl {
	MemberService memberService;

	public SignupControl setMemberService(MemberService memberService) {
		this.memberService = memberService;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		String email = params.get("email")[0];
		String name = params.get("name")[0];
		String password = params.get("password")[0];
		String tel = params.get("tel")[0];

		Member member = new Member()
										.setEmail(email)
										.setName(name)
										.setPassword(password)
										.setTel(tel);
		int count = memberService.signUp(member);
		HttpSession session = (HttpSession) model.get("session");
		if (count > 0) {
			session.setAttribute("member", member);
			return "/member/SignupSuccess.jsp";
		} else {
			session.invalidate();
			return "/member/SignupFail.jsp";
		}
		
	}


}
