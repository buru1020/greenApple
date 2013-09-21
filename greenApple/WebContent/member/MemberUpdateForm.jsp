<%@page import="net.bitacademy.java41.vo.ProjectEx"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="${rootPath}/css/fancy-button/fancy-button.css" rel="stylesheet" type="text/css" />
    <!--Jquery UI CSS-->
    <link href="${rootPath}/css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN: load jquery -->
    <script src="${rootPath}/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${rootPath}/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!--jQuery Date Picker-->
    <script src="${rootPath}/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>
    <!-- jQuery dialog related-->
    <script src="${rootPath}/js/jquery-ui/external/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.ui.dialog.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.blind.min.js" type="text/javascript"></script>
    <script src="${rootPath}/js/jquery-ui/jquery.effects.explode.min.js" type="text/javascript"></script>
    <!-- jQuery dialog end here-->
    <script src="${rootPath}/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <!--Fancy Button-->
    <script src="${rootPath}/js/fancy-button/fancy-button.js" type="text/javascript"></script>
    <script src="${rootPath}/js/setup.js" type="text/javascript"></script>
    <!-- Load TinyMCE -->
    <script src="${rootPath}/js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupTinyMCE();
            setupProgressbar('progress-bar');
            setDatePicker('date-picker');
            setupDialogBox('dialog', 'opener');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>
    <!-- /TinyMCE -->
    <style type="text/css">
        #progress-bar
        {
            width: 400px;
        }
    </style>
    
    
    <!-- 추가  CSS-->
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/sidebar.css"/>
    <link rel="stylesheet" type="text/css" href="${rootPath}/css/content.css"/>
    
    <!-- //추가 CSs-->
</head>
<body>
    <div class="container_12">
<!-- Header -->
<jsp:include page="/Header.jsp"></jsp:include>
        
<!-- Sidebar -->
<jsp:include page="/Sidebar.jsp"></jsp:include>

<!-- Content -->
        <div class="grid_10">
            <div class="box round first fullpage">
                <h2>
					회원등록</h2>
                <div class="block ">
                    <form action="add.do" method="post">
                    <table class="form">
                        <tr>
                            <td>
                                <label>
                                    *이메일</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="email"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    *비밀번호</label>
                            </td>
                            <td>
                                <input type="password" class="mini" name="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    *비밀번호(확인)</label>
                            </td>
                            <td>
                                <input type="password" class="mini" name="password2"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    *이름</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    *전화</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="tel"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    	블로그</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="blog"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    	우편변호</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="postno"/>
                                <input type="button" value="우편번호찾기">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                   	  	기본주소</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="basicAddr"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    	상세주소</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="detailAddr"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    	태그</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="tag"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    	권한</label>
                            </td>
                            <td>
                                <select id="select" name="level">
                                	<option value="0" selected>일반회원</option>
									<option value="1">관리자</option>
									<option value="2">PM</option>
									<option value="9">손님</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div class="form_submit_div">
						<input type="submit" value="등록" class="btn btn-green submit">
						<input type="reset" value="취소" class="btn btn-grey reset">
					</div>
                    </form>
                </div>
            </div>
        </div>
<!-- //Content -->


        <div class="clear">
        </div>
    </div>
<!-- Tail -->
<jsp:include page="/Tail.jsp"></jsp:include>

</body>
</html>









	<!-- Section Start -->
	<section class=main_content_section>
			<h1>회원 등록</h1>
			<form action="update.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberInfo" value="${memberInfo}">
			이메일: <input type="text" name="email" value="${memberInfo.email}" readonly="readonly"><br>
			암호: <input type="password" name="password"><br>
			이름: <input type="text" name="name" value="${memberInfo.name}"><br>
			전화: <input type="text" name="tel" value="${memberInfo.tel}"><br>
			사진: <input type="file" name="photo"><br>
			블로그: <input type="text" name="blog" value="${memberInfo.blog}"><br>
			우편번호: <input type="text" name="postno" value="">
					<input type="button" value="우편번호찾기"><br>
			기본주소: <input type="text" name="basicAddr" value=""><br>
			상세주소: <input type="text" name="detailAddr" value="${memberInfo.detailAddress}"><br>
			태그: <input type="text" name="tag" value="${memberInfo.tag}"><br>
			권한: <select name="level">
			<c:choose>
			<c:when test="${memberInfo.level == 0}">
				<option value="0" selected>일반회원</option>
			</c:when>
			<c:when test="${memberInfo.level == 1}">
			<option value="1" selected>관리자</option>
			</c:when>
			<c:when test="${memberInfo.level == 2}">
			<option value="2" selected>PM</option>
			</c:when>
			<c:when test="${memberInfo.level == 3}">
			<option value="9" selected>손님</option>
			</c:when>
			</c:choose>
			</select><br>
			
			<input type="submit" value="변경">
			<a href="${rootPath}/member/view.do?email=${memberInfo.email}">취소</a>
			</form>
			<p><a href="list.do">[목록]</a></p>
	</section>
