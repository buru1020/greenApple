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
           
                <div class="block ">
                                  
                    <div class="dataTables_wrapper" id="example_wrapper">
                    <div id="example_length" class="dataTables_length">
                    
          
                           	<!-- Section Start -->
	<section class=main_content_section>
		<div>
				<div id="submenu">
<p>
<a href="view.do?no=${project.no}">[기본정보]</a>	|	
<a href="../task/list.do?projectNo=${project.no}">[작업들]</a>	|	
<a href="../feed/list.do?projectNo=${project.no}">[게시판]</a>
</p>
</div>
			<h2>${project.title}</h2>
			번호: ${project.no}<br>
			PL: <c:choose>
				<c:when test="${project.plName == ''}">없음</c:when>
				<c:otherwise>${project.plName}</c:otherwise>
			 </c:choose><br>
			시작일: ${project.startDate}<br>
			종료일: ${project.endDate}<br>
			내용: <br>${project.content}	
			<br>
			<p><a href="list.do">[목록]</a>
			<a href="update.do?no=${project.no}">[변경]</a>
			<a href="delete.do?no=${project.no}">[삭제]</a>
			</p>
			<br>
			<h2>프로젝트 맴버</h2>
			<table style="text-align: center;">
				<tr>
					<th style="width: 5em;">이름</th>
					<th style="width: 10em;">이메일</th>
					<th style="width: 10em;">전화</th>
					<th style="width: 10em;">블로그</th>
				</tr>
<c:forEach var="projectMember" items="${projectMemberList}">
				<tr>
					<td>${projectMember.name} <c:if test="${projectMember.projectLevel == 0}">★</c:if></td>
					<td>${projectMember.email}</td>
					<td>${projectMember.tel}</td>
					<td><c:choose>
						<c:when test="${projectMember.blog != ''}">${projectMember.blog}</c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose></td>
				</tr>
</c:forEach>
			</table>
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


