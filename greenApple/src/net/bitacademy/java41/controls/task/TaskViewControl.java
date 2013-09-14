package net.bitacademy.java41.controls.task;

import java.util.List;
import java.util.Map;

import net.bitacademy.java41.controls.PageControl;
import net.bitacademy.java41.services.ProjectService;
import net.bitacademy.java41.vo.ProjectEx;
import net.bitacademy.java41.vo.ProjectMember;

public class TaskViewControl implements PageControl {
	ProjectService projectService;
	
	public TaskViewControl setTaskService(TaskService taskService) {
		this.projectService = projectService;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, String[]> parmas = (Map<String, String[]>) model.get("params");
		
		int no = Integer.parseInt(parmas.get("no")[0]);
		
		ProjectEx project = projectService.getProjectInfo(no);
		List<ProjectMember> memberList = projectService.getProjectMemberList(no);
		model.put("project", project);
		model.put("projectMemberList", memberList);
		
		return "/project/ProjectView.jsp";
	}
	
}