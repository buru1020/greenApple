package net.bitacademy.java41.servlets.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.vo.Member;

@WebServlet("/member/update")
@SuppressWarnings("serial")
public class MemberUpdateServlet extends HttpServlet {
	@Override
	protected void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		
		try {
			String email = request.getParameter("email");
			Member memberInfo = memberDao.getMember(email);
			request.setAttribute("memberInfo", memberInfo);
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberUpdateForm.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
	
	@Override
	protected void doPost( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String blog = request.getParameter("blog");
			String tag = request.getParameter("tag");
			Member memberInfo = memberDao.getMember(email);
			
			String returnUrl = request.getServletContext().getContextPath() + "/main";
			String status = "";
			memberInfo.setPassword(!"".equals(password) ? password : memberInfo.getPassword());
			memberInfo.setName(!"".equals(name) ? name : memberInfo.getName());
			memberInfo.setTel(!"".equals(tel) ? tel : memberInfo.getTel());
			memberInfo.setBlog(!"".equals(blog) ? blog : memberInfo.getBlog());
			memberInfo.setTag(!"".equals(tag) ? tag : memberInfo.getTag());
			
			if (memberDao.update(memberInfo) > 0) {
				returnUrl = request.getServletContext().getContextPath() + "/member/view?email=" + memberInfo.getEmail();
				status = "UPDATE_SUCCESS";
			} else {
				returnUrl = request.getServletContext().getContextPath() + "/member/update?email=" + memberInfo.getEmail();
				status = "UPDATE_FAIL";
			}
			request.setAttribute("returnUrl", returnUrl);
			request.setAttribute("status", status);
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberResult.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}











