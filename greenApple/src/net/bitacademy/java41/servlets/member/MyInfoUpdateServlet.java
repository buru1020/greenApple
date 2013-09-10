package net.bitacademy.java41.servlets.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.vo.Member;

@WebServlet("/member/myInfoUpdate")
@SuppressWarnings("serial")
public class MyInfoUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request
				.getRequestDispatcher("/member/myInfoUpdate.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = (MemberDao) this.getServletContext()
				.getAttribute("memberDao");

		try {
			request.setCharacterEncoding("UTF-8");

			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String blog = request.getParameter("blog");
			String detailAddress = request.getParameter("detailAddress");
			String tag = request.getParameter("tag");
			int level = Integer.parseInt(request.getParameter("level"));
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			Member member = new Member()
					.setEmail(request.getParameter("email"))
					.setName(request.getParameter("name"))
					.setPassword(request.getParameter("password"))
					.setTel(request.getParameter("tel"))
					.setBlog(request.getParameter("blog"))
					.setDetailAddress(request.getParameter("detailAddress"))
					.setTag(request.getParameter("tag"))
					.setLevel(Integer.parseInt(request.getParameter("level")));
			
			
			int count = memberDao.myInfoChange(
					name, tel, blog, detailAddress, tag, level, email, password);
			HttpSession session = request.getSession();

			if (count > 0) {
				session.setAttribute("member", member);
				RequestDispatcher rd = request
						.getRequestDispatcher("/member/myInfoUpdateSuccess.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher("/member/myInfoUpdateFail.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}
