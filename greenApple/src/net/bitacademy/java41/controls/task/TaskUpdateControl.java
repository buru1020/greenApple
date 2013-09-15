package net.bitacademy.java41.controls.task;

import java.sql.Date;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.ProjectEx;
import net.bitacademy.java41.vo.Task;

public class TaskUpdateControl implements PageControl {
	TaskService taskService;
	
	public TaskUpdateControl setTaskService(TaskService taskService) {
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
		int taskNo = Integer.parseInt(params.get("taskNo")[0]);
		
		Task task = taskService.getTask(projectNo, taskNo);
		model.put("task", task);
		
		return "/task/taskUpdateForm.jsp";
	}
	
	private String update(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
		int projectNo = Integer.parseInt(params.get("projectNo")[0]);
		int taskNo = Integer.parseInt(params.get("taskNo")[0]);
		String title = params.get("title")[0];
		String content = params.get("content")[0];
		Date startDate = Date.valueOf( params.get("startDate")[0] );
		Date endDate = Date.valueOf( params.get("endDate")[0] );
		int status = Integer.parseInt( params.get("status")[0] );

		Task task = taskService.getTask(projectNo, taskNo);
		task.setTitle(!"".equals(title) ? title : task.getTitle());
		task.setContent(!"".equals(content) ? content : task.getContent());
		task.setStartDate(!"".equals(startDate) ? startDate : task.getStartDate());
		task.setEndDate(!"".equals(endDate) ? endDate : task.getEndDate());
		task.setStatus(!"".equals(status) ? status : task.getStatus());
		
		HttpServletRequest request = (HttpServletRequest) model.get("request");
		String returnUrl = request.getServletContext().getContextPath() + "/main.do";
		String resutlStatus = "";
		if (taskService.taskUpdate(task) > 0) {
			returnUrl = request.getServletContext().getContextPath() + "/task/view.do?projectNo=" + projectNo + "&taskNo=" + taskNo;
			resutlStatus = "UPDATE_SUCCESS";
		} else {
			returnUrl = request.getServletContext().getContextPath() + "/task/update.do?projectNo=" + projectNo + "&taskNo=" + taskNo;
			resutlStatus = "UPDATE_FAIL";
		}
		
		model.put("returnUrl", returnUrl);
		model.put("resultStatus", resutlStatus);
		return "/task/taskResult.jsp";
	}
	
}