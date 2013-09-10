package net.bitacademy.java41.servlets.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.Project;
import net.bitacademy.java41.vo.ProjectEx;

@WebServlet("/member/view")
@SuppressWarnings("serial")
public class MemberViewServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		try {
			String email = request.getParameter("email");
			Member memberInfo = memberDao.getMember(email);
			List<ProjectEx> projectList = projectDao.getProjectList( memberInfo.getEmail() );
			request.setAttribute("memberInfo", memberInfo);
			request.setAttribute("projectList", projectList);
			RequestDispatcher rd = request.getRequestDispatcher("/member/MemberView.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}