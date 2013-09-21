<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Green Apple</title>
    <link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">
    
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="${rootPath}/css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="${rootPath}/css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="${rootPath}/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rootPath}/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/jquery.jqplot.min.js"></script>
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <!-- END: load jqplot -->
    <script src="${rootPath}/js/setup.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            setupDashboardChart('chart1');
            setupLeftMenu();
			setSidebarHeight();


        });
    </script>
    
    
    <!-- 추가  CSS-->
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/header.css" media="screen" />
    <!-- //추가 CSs-->
</head>
<body>
    <div class="container_12">
<!-- Header -->
<jsp:include page="/Header.jsp"></jsp:include>
        
<!-- Sidebar -->

<jsp:include page="/Sidebar.jsp"></jsp:include>


<!-- Content -->
   
   
   
	<!-- Container Start -->



	<div class="grid_10">
            <div class="box round first grid">
             
			 <h2>작업 목록</h2>
			
                <div class="block ">
      
 
		           <p>${project.title}</p>
			<table style="text-align: center;">
				<tr>
					<th style="width: 10em;">작업명</th>
					<th style="width: 10em;">시작일</th>
					<th style="width: 10em;">종료일</th>
					<th style="width: 3em;">상태</th>
				</tr>
				
<c:forEach var="task" items="${taskList}">
				<tr>
					<td><a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">${task.title}</a></td>
					<td>${task.startDate}</td>
					<td>${task.endDate}</td>
					<td><c:choose>
						<c:when test="${task.status == 0}">등록</c:when>
						<c:when test="${task.status == 1}">진행</c:when>
						<c:when test="${task.status == 2}">완료</c:when>
						<c:when test="${task.status == 3}">지연</c:when>
					</c:choose></td>
				</tr>
</c:forEach>
			</table>
  
 			<p><a href="${rootPath}/task/addForm.do?projectNo=${project.no}">[새 작업]</a></p>
                </div>
            </div>
        </div>
	
	<!-- Container End -->
    
    
    
<!-- Tail -->
<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>


<%--


<!-- Section Start -->
	<section class=main_content_section>
		<div>
				<div id="submenu">

</div>
			<h2>작업 목록</h2>
			<p>${project.title}</p>
			<table style="text-align: center;">
				<tr>
					<th style="width: 10em;">작업명</th>
					<th style="width: 10em;">시작일</th>
					<th style="width: 10em;">종료일</th>
					<th style="width: 3em;">상태</th>
				</tr>
				
<c:forEach var="task" items="${taskList}">
				<tr>
					<td><a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">${task.title}</a></td>
					<td>${task.startDate}</td>
					<td>${task.endDate}</td>
					<td><c:choose>
						<c:when test="${task.status == 0}">등록</c:when>
						<c:when test="${task.status == 1}">진행</c:when>
						<c:when test="${task.status == 2}">완료</c:when>
						<c:when test="${task.status == 3}">지연</c:when>
					</c:choose></td>
				</tr>
</c:forEach>
			</table>
			<p><a href="${rootPath}/task/addForm.do?projectNo=${project.no}">[새 작업]</a></p>
		</div>
	</section>
	<!-- Section End -->

 --%>
 