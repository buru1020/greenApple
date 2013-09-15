package net.bitacademy.java41.controls.task;

import java.util.Map;


import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.Task;

public class TaskViewControl implements PageControl {
	TaskService taskService;
	
	public TaskViewControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		

		int projectNo = Integer.parseInt(params.get("projectNo")[0]);
		int taskNo = Integer.parseInt(params.get("taskNo")[0]);
		
		Task task = taskService.getTask(projectNo, taskNo);
		model.put("task", task);
		
		return "/task/taskView.jsp";
	}
	
}