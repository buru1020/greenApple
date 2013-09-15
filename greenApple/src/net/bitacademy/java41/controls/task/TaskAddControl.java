package net.bitacademy.java41.controls.task;

import java.sql.Date;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.ProjectEx;
import net.bitacademy.java41.vo.Task;

public class TaskAddControl implements PageControl {
	TaskService taskService;
	
	public TaskAddControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		if (params.get("title") != null) {
			return update(model);
		} else {
			return form(model);
		}
	}
	
	private String form(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		int projectNo = Integer.parseInt(params.get("projectNo")[0]);
		
		model.put("projectNo", projectNo);
		
		return "/task/taskAddForm.jsp";
	}
	
	private String update(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		int projectNo = Integer.parseInt(params.get("projectNo")[0]);
		String title = params.get("title")[0];
		String content = params.get("content")[0];
		String uiProtoUrl = params.get("uiProtoUrl")[0];
		Date startDate = Date.valueOf( params.get("startDate")[0] );
		Date endDate = Date.valueOf( params.get("endDate")[0] );
		int status = Integer.parseInt( params.get("status")[0] );

		Task task = new Task()
								.setProjectNo(projectNo)
								.setTitle(title)
								.setUiProtoUrl(uiProtoUrl)
								.setContent(content)
								.setStartDate(startDate)
								.setEndDate(endDate)
								.setStatus(status);
		
		taskService.taskAdd(task);
			
		return "redirect:../task/list.do?projectNo=" + projectNo;
	}
	
}