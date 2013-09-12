<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header Start -->
<header id="header" role="banner" class="header_navi">
	<nav class="aui-header aui-dropdown2-trigger-group"
		role="navigation">
		<div class="aui-header-inner">
			<div class="aui-header-primary">
				<h1 class="aui-header-logo aui-header-logo-bitbucket logged-out">
					<a href="${rootPath}/main" class="aui-nav-imagelink" id="logo-link"> <span
						class="aui-header-logo-device">Green Apple</span>
					</a>
				</h1>
				<ul role="menu" class="aui-nav">
					<li><a href="#"> Feed </a></li>
					<li><a href="#"> Project </a></li>
				</ul>
			</div>
			<div class="aui-header-secondary">
				<ul role="menu" class="aui-nav">
					<li id="user-options"><a href="${rootPath}/auth/logout.do" class="aui-nav-link login-link">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<!-- Header End -->