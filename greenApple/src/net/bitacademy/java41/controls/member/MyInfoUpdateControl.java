package net.bitacademy.java41.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.vo.Member;

public class MyInfoUpdateControl implements PageControl {
	MemberService memberService;
	
	public MyInfoUpdateControl setMemberService(MemberService memberService) {
		this.memberService = memberService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		if (params.get("password") != null) {
			return update(model);
		} else {
			return form();
		}
	}
	
	protected String form() {
		return "/member/myInfoUpdate.jsp";
	}

	protected String update(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		String email = params.get("email")[0];
		String name = params.get("name")[0];
		String password = params.get("password")[0];
		String tel = params.get("tel")[0];
		String blog = params.get("blog")[0];
//		String detailAddress = params.get("detailAddress")[0];
		String tag = params.get("tag")[0];
		int level = Integer.parseInt( params.get("level")[0] );

		Member member = new Member()
						.setEmail(email)
						.setName(name)
						.setPassword(password)
						.setTel(tel)
						.setBlog(blog)
//						.setDetailAddress(detailAddress)
						.setTag(tag)
						.setLevel(level);
		
		
		int count = memberService.myInfoChange(member);
		HttpSession session = (HttpSession) model.get("session");

		if (count > 0) {
			session.setAttribute("member", member);
			return "/member/myInfoUpdateSuccess.jsp";
		} else {
			return "/member/myInfoUpdateFail.jsp";
		}
	}



}
