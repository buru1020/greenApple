package net.bitacademy.java41.servlets.project;

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

@WebServlet("/project/view")
@SuppressWarnings("serial")
public class ProjectViewServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		MemberDao memberDao = (MemberDao) this.getServletContext().getAttribute("memberDao");
		try {
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();
			ProjectEx project = projectDao.getProjectDetail( Integer.parseInt(request.getParameter("no")) );
			List<Map> memberList = memberDao.getPrjtMbrList( Integer.parseInt(request.getParameter("no")) );
			session.setAttribute("project", project);
			session.setAttribute("memberList", memberList);
			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectView.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}