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

@WebServlet("/member/delete")
@SuppressWarnings("serial")
public class MemberDeleteServlet extends HttpServlet {
	@Override
	protected void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		
		try {
			String email = request.getParameter("email");
			
			String returnUrl = request.getServletContext().getContextPath() + "/member/list";
			String status = "";
			if (memberDao.delete(email) > 0) {
				status = "DELETE_SUCCESS";
			} else {
				status = "DELETE_FAIL";
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











