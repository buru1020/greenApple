
<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Green Apple</title>
<link rel="icon" type="image/png" href="${rootPath}/res/logo_sim.png">

<link rel="stylesheet" type="text/css" href="${rootPath}/css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="${rootPath}/css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="${rootPath}/css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="${rootPath}/css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="${rootPath}/css/nav.css"
	media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="${rootPath}/css/ie6.css" media="screen" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="${rootPath}/css/ie.css" media="screen" /><![endif]-->
<!-- BEGIN: load jquery -->
<script src="${rootPath}/js/jquery-1.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${rootPath}/js/jquery-ui/jquery.ui.core.min.js"></script>
<script src="${rootPath}/js/jquery-ui/jquery.ui.widget.min.js"
	type="text/javascript"></script>
<script src="${rootPath}/js/jquery-ui/jquery.ui.accordion.min.js"
	type="text/javascript"></script>
<script src="${rootPath}/js/jquery-ui/jquery.effects.core.min.js"
	type="text/javascript"></script>
<script src="${rootPath}/js/jquery-ui/jquery.effects.slide.min.js"
	type="text/javascript"></script>
<!-- END: load jquery -->
<!-- BEGIN: load jqplot -->
<link rel="stylesheet" type="text/css"
	href="${rootPath}/css/jquery.jqplot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="${rootPath}/js/jqPlot/excanvas.min.js"></script><![endif]-->
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/jquery.jqplot.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${rootPath}/js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
<!-- END: load jqplot -->
<script src="${rootPath}/js/setup.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setupDashboardChart('chart1');
		setupLeftMenu();
		setSidebarHeight();

	});
</script>


<!-- 추가  CSS-->
<link rel="stylesheet" type="text/css" href="${rootPath}/css/header.css"
	media="screen" />
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

				<div class="block ">

					<div class="dataTables_wrapper" id="example_wrapper">
						<div id="example_length" class="dataTables_length">

							<!-- Section Start -->
							<section class=main_content_section>
								<div>

									<h2>작업 정보</h2>

									작업명: ${task.title}<br> 프로젝트명: ${project.title}<br>
									내용: <br> ${task.content} <br> 시작일: ${task.startDate}<br>
									종료일: ${task.endDate}<br> 상태:
									<c:choose>
										<c:when test="${task.status == 0}">등록</c:when>
										<c:when test="${task.status == 1}">진행</c:when>
										<c:when test="${task.status == 2}">완료</c:when>
										<c:when test="${task.status == 3}">지연</c:when>
									</c:choose>
									<br> UI프로토타입:<br>
									<c:if test="${task.uiProtoUrl != null}">
										<img src="${rootPath}/res/ui/${task.uiProtoUrl}">
									</c:if>
									<p>
										<a href="list.do?projectNo=${task.projectNo}">[작업목록]</a> <a
											href="updateForm.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[변경]</a>
										<a
											href="delete.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[삭제]</a>
									</p>
								</div>
							</section>
							<!-- Section End -->

						</div>
						<div class="paginate_disabled_previous" title="Previous" id="example_previous"></div>
						<div class="paginate_enabled_next" title="Next" id="example_next"></div>
					</div>

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
<link rel="stylesheet" href="${rootPath}/css/signup_1.css" type="text/css" />
<link rel="stylesheet" href="${rootPath}/css/signup_2.css" type="text/css" />

</head>


<body class="production workflow-layout">


<jsp:include page="/Header.jsp"></jsp:include>



<!-- Container Start -->
<div id="container">

<jsp:include page="/Sidebar.jsp"></jsp:include>

	
	
	<!-- Section Start -->
	<section class=main_content_section>
		<div>
				<div id="submenu">

</div>
			<h2>작업 정보</h2>
						
			작업명: ${task.title}<br>
			프로젝트명: ${project.title}<br>
			내용: <br>
			${task.content}	<br>
			시작일: ${task.startDate}<br>
			종료일: ${task.endDate}<br>
			상태: <c:choose>
					<c:when test="${task.status == 0}">등록</c:when>
					<c:when test="${task.status == 1}">진행</c:when>
					<c:when test="${task.status == 2}">완료</c:when>
					<c:when test="${task.status == 3}">지연</c:when>
				</c:choose><br>
			UI프로토타입:<br>
			<c:if test="${task.uiProtoUrl != null}">
				<img src="${rootPath}/res/ui/${task.uiProtoUrl}">
			</c:if>
			<p><a href="list.do?projectNo=${task.projectNo}">[작업목록]</a>
			<a href="updateForm.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[변경]</a>
			<a href="delete.do?projectNo=${task.projectNo}&taskNo=${task.taskNo}">[삭제]</a>
			</p>
		</div>
	</section>
	<!-- Section End -->
	
	
</div>
<!-- Container End -->

<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>


 --%>
