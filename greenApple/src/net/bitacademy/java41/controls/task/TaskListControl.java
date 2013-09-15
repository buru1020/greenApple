package net.bitacademy.java41.controls.task;

import java.util.List;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.TaskService;
import net.bitacademy.java41.vo.Task;

public class TaskListControl implements PageControl {
	TaskService taskService;
	
	public TaskListControl setTaskService(TaskService taskService) {
		this.taskService = taskService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> params = (Map<String, String[]>) model.get("params");
		
	
		int no = Integer.parseInt(params.get("projectNo")[0]);
		
		List<Task> taskList = taskService.getTaskList(no);
		model.put("taskList", taskList);
		
		return "/task/taskList.jsp";
	}
		
}
