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
                <h2>프로젝트 변경</h2>
                <div class="block ">
                    <form action="update.do" method="post">
                    <table class="form">
                        <tbody>
                        <tr>
                        <td class="col1"><label>번호</label></td>
                        <td class="col2"><input type="text" name="no" value="${project.no}" readonly="readonly"><br></td>
                        </tr>
                        <tr>
                            <td class="col1"><label>프로젝트 명 </label></td>
                            <td class="col2"><input type="text" name="title" value="${project.title}"><br></td>
                        </tr>
                        <tr>
                            <td><label>내용</label></td>
                            <td><textarea name="content" rows="4" cols="50">${project.content}</textarea><br></td>
                        </tr>
                        <tr>
                            <td><label>시작일</label></td>
                            <td> <input type="text" id="date-picker" class="hasDatepicker" name="startDate" value="${project.startDate}" placeholder="예)2013-4-5">
                            <br></td>
                        </tr>
                        <tr>
                            <td><label>종료일</label></td>
                            <td> <input type="text" id="date-picker" class="hasDatepicker" name="endDate" value="${project.endDate}" placeholder="예)2013-4-5">
                            <br></td>
                        </tr>
                         <tr>
                            <td><label>태그</label></td>
                            <td> <input type="text" name="tag" value="${project.tag}" placeholder="예)태그1 태그2 태그3 (공백으로 구분)">
                            <br></td>
                        </tr>
                   
                     
                    </tbody></table>
                    
                    <input type="submit" value="등록">
				<a href="${rootPath}/project/view.do?no=${project.no}">[취소]</a><a href="list.do">[목록]</a><br>
				
                    </form>
            
                </div>
            </div>
        </div>
	


	<!-- Container End -->
    
    
    
<!-- Tail -->
<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>



<%-- 	<!-- Container Start -->
	<div id="container">

		<jsp:include page="/Sidebar.jsp"></jsp:include>


		<!-- Section Start -->
		<section class=main_content_section>
			<h1>신규 프로젝트 변경</h1>
			<form action="update.do" method="post">
				번호: <input type="text" name="no" value="${project.no}" readonly="readonly"><br>
				프로젝트명: <input type="text" name="title" value="${project.title}"><br> 
				내용:<br>
				<textarea name="content" rows="4" cols="50">${project.content}</textarea><br> 
				시작일: <input type="text" name="startDate" value="${project.startDate}" placeholder="예)2013-4-5"><br> 
				종료일: <input type="text" name="endDate" value="${project.endDate}" placeholder="예)2013-6-5"><br> 
				태그: <input type="text" name="tag" value="${project.tag}" placeholder="예)태그1 태그2 태그3 (공백으로 구분)"><br>
				<input type="submit" value="등록">
				<a href="${rootPath}/project/view.do?no=${project.no}">취소</a><br>
			</form>
			<p>
				<a href="list.do">[목록]</a>
			</p>
		</section>
		<!-- Section End -->



	</div>
	<!-- Container End -->

--%>
