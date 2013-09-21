<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="member" scope="session" type="net.bitacademy.java41.vo.Member"/>
<jsp:useBean id="projectService" scope="application" type="net.bitacademy.java41.services.ProjectService"/>
<%
pageContext.setAttribute("projectList", projectService.getMyProjects(member.getEmail()));
%>
<!-- Side Menu Start -->
        <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">Menu 1</a>
                            <ul class="submenu">
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                              
                            </ul>
                        </li>
                        <li><a class="menuitem">Menu 2</a>
                            <ul class="submenu">
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                            </ul>
                        </li>
                        <li><a class="menuitem">Menu 3</a>
                            <ul class="submenu">
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                            </ul>
                        </li>
                        <li><a class="menuitem">Menu 4</a>
                            <ul class="submenu">
                                <li><a>Submenu 1</a> </li>
                                <li><a>Submenu 2</a> </li>
                                <li><a>Submenu 3</a> </li>
                                <li><a>Submenu 4</a> </li>
                                <li><a>Submenu 5</a> </li>
                                <li><a>Submenu 6</a> </li>
                                <li><a>Submenu 7</a> </li>
                                <li><a>Submenu 8</a> </li>
                                <li><a>Submenu 9</a> </li>
                                <li><a>Submenu 10</a> </li>
                    
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
<!-- Side Menu End -->









<%--	
	<aside class="side_menu_aside">
		<!-- 프로필 -->
		<div class="side_photo_div">
			<c:choose>
				<c:when test="${member.photos[0] != null}">
					<img  alt="photo" src="${rootPath}/res/photo/${member.photos[0]}" class="side_menu_member_photo">
				</c:when>
				<c:otherwise>
					<img  alt="photo" src="${rootPath}/res/photo/yk.jpg" class="side_menu_member_photo">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<p><a href="${rootPath}/member/myInfoUpdateForm.do">${member.name}</a><br>
			${member.email}<br>
			${member.tel}</p>
		</div>

<c:choose> 
	<c:when test="${member.level == 1}">
		<!-- 관리프로젝트 -->
		<div style="margin-top: 20px">
			<span>관리메뉴</span>
		</div>
		<div>
			<ul>
				<li><span><a href="${rootPath}/member/list.do">멤버관리</a></span></li>
				<li><span><a href="${rootPath}/project/list.do">프로젝트관리</a></span></li>				
			</ul>	
		</div>	
	</c:when>
	<c:otherwise>
		<!-- 참여프로젝트 -->
		<div style="margin-top: 20px">
			<span>참여 프로젝트</span>
			<span style="float: right;"><a href="${rootPath}/project/list.do">전체보기</a></span>
		</div>
		<div>
			<ul>
		<c:forEach var="myProject" items="${projectList}">			
				<li><span><a href="${rootPath}/project/view.do?no=${myProject.no}">${myProject.title}</a></span><c:if test="${myProject.level == 0}">★</c:if></li>
		</c:forEach>				
			</ul>	
		</div>
	</c:otherwise>
</c:choose>		
	</aside>
 --%>	