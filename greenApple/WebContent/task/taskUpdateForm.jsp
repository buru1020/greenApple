<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
              <h1>작업변경</h1>
                <div class="block ">
                    <form action="update.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="projectNo" value="${task.projectNo}">
					<input type="hidden" name="taskNo" value="${task.taskNo}">
					
                   
                    <table class="form">
                        <tbody>
                        <tr>
                            <td class="col1"><label>프로젝트 명 </label></td>
                            <td class="col2"><input type="text" name="title" value="${project.title}"><br></td>
                        </tr>
                        <tr>
                            <td class="col1"><label> 작업명 </label></td>
                            <td class="col2"><input type="text" name="title" value="${task.title}"><br></td>
                        </tr>
                        <tr>
                            <td class="col1"><label>UI프로토타입</label></td>
                            <td class="col2"><input type="file" name="uiProto" ><br></td>
                        </tr>
                        <tr>
                            <td><label>내용</label></td>
                            <td><textarea name="content" rows="4" cols="50">${task.content}</textarea><br></td>
                        </tr>
                        <tr>
                            <td><label>시작일</label></td>
                            <td> <input type="text" name="startDate" value="${task.startDate}" placeholder="예)2013-4-5">
                            <br></td>
                        </tr>
                        <tr>
                            <td><label>종료일</label></td>
                            <td> <input type="text" name="endDate" value="${task.endDate}" placeholder="예)2013-6-5">
                            <br></td>
                        </tr>
                         <tr>
                            <td><label>상태</label></td>
                            <td> <select name="status">
						<option value="0" <c:if test="${task.status == 0}">selected</c:if>>등록</option>
						<option value="1" <c:if test="${task.status == 1}">selected</c:if>>진행</option>
						<option value="2" <c:if test="${task.status == 2}">selected</c:if>>완료</option>
						<option value="3" <c:if test="${task.status == 3}">selected</c:if>>지연</option>
					</select>
                            <br></td>
                        </tr>
                    </tbody></table>
                <input type="submit" value="등록">
				<a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">취소</a><br>
			</form>
			<p>
				<a href="list.do?projectNo=${task.projectNo}">[목록]</a>
			</p>
                </div>
            </div>
        </div>
	


	<!-- Container End -->
    
    
    
<!-- Tail -->
<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>










<%--

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title>Green Apple</title>
<link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">
<link rel="stylesheet" href="${rootPath}/css/base.css">
<link rel="stylesheet" href="${rootPath}/css/signup_1.css"
	type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Apple</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
	<jsp:include page="/Header.jsp"></jsp:include>


	<!-- Container Start -->
	<div id="container">

		<jsp:include page="/Sidebar.jsp"></jsp:include>


		<!-- Section Start -->
		<section class=main_content_section>
			<h1>작업변경</h1>
			<form action="update.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="projectNo" value="${task.projectNo}">
				<input type="hidden" name="taskNo" value="${task.taskNo}">
				프로젝트명: ${project.title}<br> 
				작업명: <input type="text" name="title" value="${task.title}"><br>
				UI프로토타입: <input type="file" name="uiProto" ><br>
				내용:<br>
				<textarea name="content" rows="4" cols="50">${task.content}</textarea><br> 
				시작일: <input type="text" name="startDate" value="${task.startDate}" placeholder="예)2013-4-5"><br> 
				종료일: <input type="text" name="endDate" value="${task.endDate}" placeholder="예)2013-6-5"><br> 
				상태: <select name="status">
						<option value="0" <c:if test="${task.status == 0}">selected</c:if>>등록</option>
						<option value="1" <c:if test="${task.status == 1}">selected</c:if>>진행</option>
						<option value="2" <c:if test="${task.status == 2}">selected</c:if>>완료</option>
						<option value="3" <c:if test="${task.status == 3}">selected</c:if>>지연</option>
					</select><br>
				<input type="submit" value="등록">
				<a href="view.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">취소</a><br>
			</form>
			<p>
				<a href="list.do?projectNo=${task.projectNo}">[목록]</a>
			</p>
		</section>
		<!-- Section End -->



	</div>
	<!-- Container End -->


	<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>

 --%>