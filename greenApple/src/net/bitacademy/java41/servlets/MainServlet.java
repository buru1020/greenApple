package net.bitacademy.java41.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpServer;

import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.ProjectEx;

@WebServlet("/main")
@SuppressWarnings("serial")
public class MainServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		myService(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		myService(request, response);
	}

	public void myService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		try {
			HttpSession session = request.getSession();
			Member member = (Member) session.getAttribute("member");
			if ( member != null) {
				List<ProjectEx> list = projectDao.getProjectList(member.getEmail());
				session.setAttribute("projectList", list);
				RequestDispatcher rd = request.getRequestDispatcher("/MainForm.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("/auth/login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}

}
