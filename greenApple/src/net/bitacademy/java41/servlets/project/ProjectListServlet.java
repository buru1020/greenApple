package net.bitacademy.java41.servlets.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.Project;
import net.bitacademy.java41.vo.ProjectEx;

@WebServlet("/project/list")
@SuppressWarnings("serial")
public class ProjectListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		ProjectDao projectDao = (ProjectDao) this.getServletContext()
				.getAttribute("projectDao");
		try {
			List<ProjectEx> list = projectDao.getProjectList();
			HttpSession session = request.getSession();
			session.setAttribute("allProjectList", list);
			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectList.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
}