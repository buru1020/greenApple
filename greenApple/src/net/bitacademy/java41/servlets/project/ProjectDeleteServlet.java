package net.bitacademy.java41.servlets.project;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.vo.Member;
import net.bitacademy.java41.vo.ProjectEx;

@WebServlet("/project/delete")
@SuppressWarnings("serial")
public class ProjectDeleteServlet extends HttpServlet {
	@Override
	protected void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			
			String returnUrl = request.getServletContext().getContextPath() + "/project/list";
			String status = "";
			if (projectDao.delete(no) > 0) {
				status = "DELETE_SUCCESS";
			} else {
				status = "DELETE_FAIL";
			}
			
			request.setAttribute("returnUrl", returnUrl);
			request.setAttribute("status", status);
			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectResult.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = 
					request.getRequestDispatcher("/Error.jsp");
			rd.forward(request, response);
		}
	}
	
}











