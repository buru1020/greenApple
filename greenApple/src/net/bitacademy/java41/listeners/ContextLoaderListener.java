package net.bitacademy.java41.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.bitacademy.java41.controls.MainControl;
import net.bitacademy.java41.controls.auth.LoginControl;
import net.bitacademy.java41.controls.auth.LoginFormControl;
import net.bitacademy.java41.controls.auth.LogoutControl;
import net.bitacademy.java41.controls.member.MemberAddControl;
import net.bitacademy.java41.controls.member.MemberDeleteControl;
import net.bitacademy.java41.controls.member.MemberListControl;
import net.bitacademy.java41.controls.member.MemberUpdateControl;
import net.bitacademy.java41.controls.member.MemberViewControl;
import net.bitacademy.java41.controls.member.MyInfoUpdateControl;
import net.bitacademy.java41.controls.member.PasswordChangeControl;
import net.bitacademy.java41.controls.member.SignupControl;
import net.bitacademy.java41.controls.member.SignupFormControl;
import net.bitacademy.java41.controls.project.ProjectAddControl;
import net.bitacademy.java41.controls.project.ProjectAddFormControl;
import net.bitacademy.java41.controls.project.ProjectDeleteControl;
import net.bitacademy.java41.controls.project.ProjectListControl;
import net.bitacademy.java41.controls.project.ProjectUpdateControl;
import net.bitacademy.java41.controls.project.ProjectViewControl;
import net.bitacademy.java41.dao.MemberDao;
import net.bitacademy.java41.dao.ProjectDao;
import net.bitacademy.java41.services.AuthService;
import net.bitacademy.java41.services.MemberService;
import net.bitacademy.java41.services.ProjectService;
import net.bitacademy.java41.util.DBConnectionPool;

/* ServletContextListener
 * - 서블릿 컨테이너가 웹 어플리케이션을 시작하거나 종료할 때 알리기 위한 규칙.
 */
public class ContextLoaderListener implements ServletContextListener {

	// 웹 어플리케이션이 시작 될 때 호출됨.
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext ctx = event.getServletContext();
		
		// 웹 어플리케이션이 시작될 때 서블릿들이 사용할 객체를 준비한다.
		DBConnectionPool conPool = new DBConnectionPool(
				ctx.getInitParameter("dburl"), 
				ctx.getInitParameter("user"), 
				ctx.getInitParameter("password"),
				ctx.getInitParameter("driverClass") );
		MemberDao memberDao = new MemberDao(conPool) ;
		ProjectDao projectDao = new ProjectDao(conPool) ;
		
		AuthService authService  = new AuthService()
														.setMemberDao(memberDao);
		MemberService memberService  = new MemberService()
														.setMemberDao(memberDao)
														.setProjectDao(projectDao);
		ProjectService projectService  = new ProjectService()
														.setProjectDao(projectDao)
														.setMemberDao(memberDao);
		
		// 서블릿들이 사용할 객체를 어디에 보관할까? ServletContext
		// - 웹 어플리케이션이 실행되는 동안 계속 유지할 수 있기 때문에
		ctx.setAttribute("memberDao", memberDao);
		ctx.setAttribute("projectDao", projectDao);
		ctx.setAttribute("rootPath", ctx.getContextPath());
		ctx.setAttribute("authService", authService);
		ctx.setAttribute("memberService", memberService);
		ctx.setAttribute("projectService", projectService);
		
		ctx.setAttribute("/auth/loginForm.do", new LoginFormControl());
		ctx.setAttribute("/auth/login.do", 
				new LoginControl().setAuthService(authService));
		ctx.setAttribute("/auth/logout.do", new LogoutControl());
		ctx.setAttribute("/main.do", new MainControl());
		ctx.setAttribute("/member/signupForm.do", new SignupFormControl());
		ctx.setAttribute("/member/signup.do", 
				new SignupControl().setMemberService(memberService));
		ctx.setAttribute("/member/add.do", 
				new MemberAddControl().setMemberService(memberService));
		ctx.setAttribute("/member/list.do", 
				new MemberListControl().setMemberService(memberService));
		ctx.setAttribute("/member/view.do", 
				new MemberViewControl().setMemberService(memberService));
		ctx.setAttribute("/member/delete.do", 
				new MemberDeleteControl().setMemberService(memberService));
		ctx.setAttribute("/member/update.do", 
				new MemberUpdateControl().setMemberService(memberService));
		ctx.setAttribute("/member/myInfoUpdate.do", 
				new MyInfoUpdateControl().setMemberService(memberService));
		ctx.setAttribute("/member/passwordChange.do", 
				new PasswordChangeControl().setMemberService(memberService));
		ctx.setAttribute("/project/addForm.do", new ProjectAddFormControl());
		ctx.setAttribute("/project/add.do", 
				new ProjectAddControl().setProjectService(projectService));
		ctx.setAttribute("/project/list.do", 
				new ProjectListControl().setProjectService(projectService));
		ctx.setAttribute("/project/view.do", 
				new ProjectViewControl().setProjectService(projectService));
		ctx.setAttribute("/project/delete.do", 
				new ProjectDeleteControl().setProjectService(projectService));
		ctx.setAttribute("/project/update.do", 
				new ProjectUpdateControl().setProjectService(projectService));
		
		
		
	}
	
	// 웹 어플리케이션이 종료 될 때 호출됨.
		@Override
		public void contextDestroyed(ServletContextEvent arg0) {
			// TODO Auto-generated method stub
			
		}

}
