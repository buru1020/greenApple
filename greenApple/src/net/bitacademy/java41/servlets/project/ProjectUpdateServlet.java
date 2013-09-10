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

@WebServlet("/project/update")
@SuppressWarnings("serial")
public class ProjectUpdateServlet extends HttpServlet {
	@Override
	protected void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			ProjectEx project = projectDao.getProjectDetail(no);
			request.setAttribute("project", project);
			RequestDispatcher rd = request.getRequestDispatcher("/project/ProjectUpdateForm.jsp");
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
		ProjectDao projectDao = (ProjectDao) this.getServletContext().getAttribute("projectDao");
		
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Date startDate = Date.valueOf( request.getParameter("startDate") );
			Date endDate = Date.valueOf( request.getParameter("endDate") );
			String tag = request.getParameter("tag");

			ProjectEx project = projectDao.getProjectDetail(no);
			
			project.setTitle(!"".equals(title) ? title : project.getTitle());
			project.setContent(!"".equals(content) ? content : project.getContent());
			project.setStartDate(!"".equals(startDate) ? startDate : project.getStartDate());
			project.setEndDate(!"".equals(endDate) ? endDate : project.getEndDate());
			project.setTag(!"".equals(tag) ? tag : project.getTag());
			
			String returnUrl = request.getServletContext().getContextPath() + "/main";
			String status = "";
			if (projectDao.update(project) > 0) {
				returnUrl = request.getServletContext().getContextPath() + "/project/view?no=" + project.getNo();
				status = "UPDATE_SUCCESS";
			} else {
				returnUrl = request.getServletContext().getContextPath() + "/project/update?no=" + project.getNo();
				status = "UPDATE_FAIL";
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











