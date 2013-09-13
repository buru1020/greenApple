package net.bitacademy.java41.listeners;

import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

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

public class ContextLoaderListener implements ServletContextListener {
	ServletContext ctx;
	Hashtable<String, Object> objTable = new Hashtable<String, Object>();
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ctx = event.getServletContext();
		ctx.setAttribute("rootPath", ctx.getContextPath());
		
		try {
			prepareObjects(ctx.getRealPath("/WEB-INF/context.properties"));
			prepareDependency();
			saveToContext();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void saveToContext() {
		Enumeration<String> keyList = objTable.keys();
		String key = null;
		while (keyList.hasMoreElements()) {
			key = keyList.nextElement();
			ctx.setAttribute(key, objTable.get(key));
		}
	}

	private void prepareDependency() throws Exception {
		Collection<Object> objectList = objTable.values();
		for( Object obj : objectList ) {
			if (obj.getClass() != java.lang.String.class) {
				injectDependency(obj);
			}
		}
	}

	private void injectDependency(Object obj) throws Exception {
		System.out.println(obj.getClass().getName() + "-----------");
		Method[] methodList = obj.getClass().getMethods();
		for( Method m : methodList ) {
			callSetter(obj, m);
		}
	}
	
	@SuppressWarnings("rawtypes")
	private void callSetter(Object instance, Method method) throws Exception {
		Class paramClass = null;
		Object paramObject = null;
		if (method.getName().startsWith("set")) {
			paramClass = method.getParameterTypes()[0];
			if (paramClass == java.lang.String.class) {
				String propertyName = extractPropertyName(method.getName());
				method.invoke(instance, objTable.get(propertyName));
			} else {
				paramObject = findInstanceByClass(paramClass);
				method.invoke(instance, paramObject);
			}
			System.out.println("......" + method.getName());
		}
	}

	private String extractPropertyName(String methodName) {
		return methodName.substring(3, 4).toLowerCase()	// set뒤 첫알바벳 소문자로 변경
				+ methodName.substring(4);	// set를 잘라냄
	}

	@SuppressWarnings("rawtypes")
	private Object findInstanceByClass(Class paramClass) {
		Collection<Object> instanceList = objTable.values();
		for( Object obj : instanceList ) {
			if (obj.getClass() == paramClass) {
				return obj;
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	private void prepareObjects(String filePath) throws Exception {
		Properties props = new Properties();
		props.load( new FileReader(filePath));
		
		Enumeration enums = props.keys();
		String key = null;
		String value = null;
		Class clazz = null;
		
		while (enums.hasMoreElements()) {
			key = (String) enums.nextElement();
			value = ((String) props.get(key)).trim();
			if (value.charAt(0) == '"') {
				objTable.put(key, value.substring(1, value.length()-1));
			} else {
				clazz =  Class.forName(value);
				objTable.put(key, clazz.newInstance());
			}
		}
	}
	
	// 웹 어플리케이션이 종료 될 때 호출됨.
		@Override
		public void contextDestroyed(ServletContextEvent arg0) {
			// TODO Auto-generated method stub
			
		}

}
