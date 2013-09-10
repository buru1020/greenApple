<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title>Sign up for Green Apple account</title>
<link rel="icon" type="image/png" href="../res/logo_sim.png">
	
<link rel="stylesheet" href="../css/signup_1.css" type="text/css" />
<link rel="stylesheet" href="../css/signup_2.css" type="text/css" />

<script type="text/javascript">
function signUp() {	
	var email = document.getElementById('email').value;
	var name = document.getElementById('name').value;
	var password1 = document.getElementById('password1').value;
	var password2 = document.getElementById('password2').value;
	var tel = document.getElementById('tel').value;
	
	if (email == null || email == "") {
		alert("이메일을 입력하세요.");
		return;
	}
	if (name == null || name == "") {
		alert("이름을 입력하세요.");
		return;
	}
	if (password1 == null || password1 == "") {
		alert("비밀번호를 입력하세요.");
		return;
	}
	if (password2 == null || password2 == "") {
		alert("비밀번호를 입력하세요.");
		return;
	}
	if (password1 != password2) {
		alert("비밀번호를 다릅니다. 다시입력하세요.");
		//document.getElementById('password1').value = "";
		document.getElementById('password2').value = "";
		return;
		
	}
	if (tel == null || tel == "") {
		alert("전화번호를 입력하세요.");
		return;
	}
	
	document.getElementById("registration-form").submit();
	
}



</script>

</head>


<body class="production workflow-layout">

	<div id="page">
		<div id="wrapper">
			<header id="header" role="banner">
				<nav class="aui-header aui-dropdown2-trigger-group"
					role="navigation">
					<div class="aui-header-inner">
						<div class="aui-header-primary">
							<h1 class="aui-header-logo aui-header-logo-bitbucket logged-out">
								<a href="${rootPath}/auth/login" class="aui-nav-imagelink" id="logo-link"> <span
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
								<li id="user-options"><a href="${rootPath}/auth/login" class="aui-nav-link login-link">Log in</a></li>
							</ul>

						</div>
					</div>
				</nav>
			</header>


			<div id="content" role="main">
				<div id="registration" class="registration-box workflow-box social">
					<header>
						<h1>Sign up for free</h1>
					</header>

					<section class="form-container">
						<div class="sidebar"></div>

						<form id="registration-form" method="post" action="signUp"
							class="aui team-members-form registration-form selected">
							<div id="id_email_group" class="field-group ">
								<label for="id_email"> ID<span 
									class="aui-icon icon-required"></span><span class="content">required</span>
								</label> 
								<input id="email" type="email" class="required text" name="email" maxlength="75" placeholder="hong@test.com"/>
							</div>
							<div id="id_username_group" class="field-group ">
								<label for="id_username"> Username<span
									class="aui-icon icon-required"></span><span class="content">required</span>
								</label> 
								<input id="name" type="text" class="required text" name="name" maxlength="30" placeholder="홍길동"/>
								<div class="description">e.g. jdoe</div>
							</div>
							<div id="id_password1_group" class="field-group ">
								<label for="id_password1"> Password<span
									class="aui-icon icon-required"></span><span class="content">required</span>
								</label> 
								<input id="password1" type="password" class="required text" name="password1" placeholder="password" />
							</div>
							<div id="id_password2_group" class="field-group ">
								<label for="id_password2"> Password (again)<span
									class="aui-icon icon-required"></span><span class="content">required</span>
								</label> 
								<input id="password2" type="password" class="required text" name="password2" placeholder="password (again)"/>
							</div>
							<div id="id_phone_group" class="field-group ">
								<label for="id_phone"> Phone<span
									class="aui-icon icon-required"></span><span class="content">required</span>
								</label> 
								<input id="tel" type="phone" class="required text" name="tel" placeholder="010-0000-0000" />
							</div>
							<div id="team-members-container"
								data-modules="registration/create-team-form">
								<h1>Add team members</h1>
								<div id="team-members" class="team-members-widget-container">
									<table class="widget bb-list aui team-members-widget">
										<thead>
											<tr class="assistive">
												<th class="user">User</th>
												<th class="role">Role</th>
												<th class="actions">Actions</th>
											</tr>
										</thead>
										<tbody>
											<tr class="form">
												<td colspan="3">
													<div>
														<input type="text" id="team-member"
															class="text user-input bb-user-typeahead"
															placeholder="Enter username or email address" />
														<button type="button"
															class="aui-button aui-style add-user">Add</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="error"></div>
								</div>
							</div>

							<div class="buttons-container">
								<div class="buttons">
									<button class="aui-button aui-button-primary aui-style"
										type="button" onclick="signUp()">Sign up</button>
									<a class="cancel" href="login">Cancel</a>
								</div>
							</div>

							<div style='display: none'>
							</div>
						</form>
						
						<div style="color: red; width: 300px; height: 200px; float: left; margin-left: 10px;">
							<video autoplay="autoplay" loop="loop" style="width: 300px; height: 200px; vertical-align: top;">
								<source src="../res/What Most Schools Don't Teach.mp4">
							</video>
						</div>
						
					</section>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
