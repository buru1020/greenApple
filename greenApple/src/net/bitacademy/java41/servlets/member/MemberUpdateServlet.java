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
			String oldPassword = request.getParameter("password");
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			
			
//			if (newPassword.equals(newPassword2)) {
//				if (memberDao.changePassword(email, oldPassword, newPassword) > 0) {
//					request.setAttribute("status", "SUCCESS");
//				} else {
//					request.setAttribute("status", "OLD_PASSWORD_ERROR");
//				}
//			} else {
//				request.setAttribute("status", "NEW_PASSWORD_ERROR");
//			}
//			
//			RequestDispatcher rd = request.getRequestDispatcher("/member/passwordChangeResult.jsp");
//			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}











