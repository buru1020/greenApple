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
                 <h2>
                    프로젝트 목록</h2>
                <div class="block ">
                                  
                    <div class="dataTables_wrapper" id="example_wrapper">
                    <div id="example_length" class="dataTables_length">
                    
          
                   
                    
                    </div>
                    <div class="dataTables_filter" id="example_filter"></div>
                    <table class="data display datatable" id="example">
					<thead>
						<tr><th class="sorting_asc" rowspan="1" colspan="1" style="width: 253px;">프로젝트 명</th>
						<th class="sorting" rowspan="1" colspan="1" style="width: 313px;">시작일</th>
						<th class="sorting" rowspan="1" colspan="1" style="width: 294px;">종료일</th>
						<th class="sorting" rowspan="1" colspan="1" style="width: 212px;">PL</th>
						<th class="sorting" rowspan="1" colspan="1" style="width: 153px;">등급</th>
						</tr>
					</thead>
					
				<tbody>
<c:forEach var="project" items="${totalProjectList}">
					<tr>
						<td style="text-align: left;"><a href="${rootPath}/project/view.do?no=${project.no}">${project.title}</a></td>
						<td>${project.startDate}</td>
						<td>${project.endDate}</td>
						<td><c:choose>
							<c:when test="${project.plName != ''}">${project.plName}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose></td>
						<td><c:if test="${project.plEmail == sessionScope.member.email}">★</c:if></td>
					</tr>
</c:forEach>					
				</tbody></table><div class="dataTables_info" id="example_info">
          
                    <c:if test="${!(member.level == 1)}">
			<p><a href="${rootPath}/project/addForm.do">[신규 프로젝트 등록]</a></p>
			</c:if> 

</div><div class="dataTables_paginate paging_two_button" id="example_paginate">
<div class="paginate_disabled_previous" title="Previous" id="example_previous">
</div><div class="paginate_enabled_next" title="Next" id="example_next"></div>
</div></div>
                    
                    
                    
                </div>
            </div>
        </div>


	<!-- Container End -->
    
 

    
<!-- Tail -->
<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>


