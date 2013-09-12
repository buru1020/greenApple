package net.bitacademy.java41.controls.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.vo.Member;

public class MemberUpdateControl implements PageControl {
	MemberService memberService;
	
	public MemberUpdateControl setMemberService(MemberService memberService) {
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
			return form(model);
		}
	}
	
	private String form(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		String email = params.get("email")[0];
		model.put("memberInfo", memberService.getMemberInfo(email));
		
		return "/member/MemberUpdateForm.jsp";
	}
	
	private String update(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		String email = params.get("email")[0];
		String password = params.get("password")[0];
		String name = params.get("name")[0];
		String tel = params.get("tel")[0];
		String blog = params.get("blog")[0];
		String tag = params.get("tag")[0];
		
		Member memberInfo = memberService.getMemberInfo(email);
		memberInfo.setPassword(!"".equals(password) ? password : memberInfo.getPassword());
		memberInfo.setName(!"".equals(name) ? name : memberInfo.getName());
		memberInfo.setTel(!"".equals(tel) ? tel : memberInfo.getTel());
		memberInfo.setBlog(!"".equals(blog) ? blog : memberInfo.getBlog());
		memberInfo.setTag(!"".equals(tag) ? tag : memberInfo.getTag());
		
		HttpServletRequest request = (HttpServletRequest) model.get("request");
		String returnUrl = request.getServletContext().getContextPath() + "/main";
		String status = "";
		if (memberService.updateMemberInfo(memberInfo) > 0) {
			returnUrl = request.getServletContext().getContextPath() + "/member/view.do?email=" + memberInfo.getEmail();
			status = "UPDATE_SUCCESS";
		} else {
			returnUrl = request.getServletContext().getContextPath() + "/member/update.do?email=" + memberInfo.getEmail();
			status = "UPDATE_FAIL";
		}
		model.put("returnUrl", returnUrl);
		model.put("status", status);
		return "/member/MemberResult.jsp";
	}

	
}











