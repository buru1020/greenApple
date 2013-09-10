package net.bitacademy.java41.servlets.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpServer;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.vo.Member;


@WebServlet("/member/signUp")
@SuppressWarnings("serial")
public class SignUpServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/member/SignUpForm.jsp");
		rd.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password1");
		String tel = request.getParameter("tel");
		System.out.println("emqil :: " + email + "\nname :: " + name +"\npassword :: " + password + "\ntel :: " + tel);
		
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		
		try {
			Member member = new Member()
											.setEmail(request.getParameter("email"))
											.setName(request.getParameter("name"))
											.setPassword(request.getParameter("password1"))
											.setTel(request.getParameter("tel"));
			int count = memberDao.addMember(member);
			HttpSession session = request.getSession();
			
			if (count > 0) {
				session.setAttribute("member", member);
				RequestDispatcher rd = request.getRequestDispatcher("/member/SignUpSuccess.jsp");
				rd.forward(request, response);
			} else {
				session.invalidate();
				RequestDispatcher rd = request.getRequestDispatcher("/member/SignUpFail.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/member/SignUpFail.jsp");
			rd.forward(request, response);
		}
		
	}
	


}
