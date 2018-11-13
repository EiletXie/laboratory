<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
   pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>用户注册</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body background="${APP_PATH}/static/image/background2.jpg">
<div class="container">
  <!-- 标题 -->
	<header>
	 <nav class="navbar navbar-inverse navbar-fixed-top"">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <a class="navbar-brand" href="innerLogin">XiangTan University Laboratory</a>
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ListNavTitle" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	    </div>
	   </nav>
   </header>
  <!-- 登录框 -->
       <div class="row">
           <!-- 配图 -->
          <div class="col-md-5">
            <img src="${APP_PATH}/static/image/reginLeft.png" alt="实验室登录配图" class="img-thumbnail">
		  </div>
		  <!-- 登录 -->
		  <div class="col-md-5">
				<div class="panel panel-primary">
					<!-- Default panel contents -->
					<div class="panel-heading">用户注册/Regin</div>
					<div class="panel-body" id="ReginPanel">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户名:
								</label>
								<div class="col-sm-6">
									<input type="text" name="username" class="form-control" id="username_regin_input" 
									placeholder="用户名/学号/手机号">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									密&nbsp;&nbsp;&nbsp;码:
								</label>
								<div class="col-sm-6">
									<input type="password" name="password" class="form-control" id="password_regin_input"
										placeholder="密码">
								</div>
							</div>
							<div class="form-group">
							    <label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									密&nbsp;&nbsp;&nbsp;码:
								</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password_regin_input2"
										placeholder="请再次输入密码">
								   <span id="passwordConflict" class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
							    <label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
									角&nbsp;&nbsp;&nbsp;色:
								</label>
								<div class="col-sm-6">
									<select class="form-control" name="role">
									   <option>任课老师 </option>
									   <option>实验室老师 </option>
									   <option>管理员 </option>
									</select>
								</div>
							</div>
							<div class="form-group">
							    <label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									性&nbsp;&nbsp;&nbsp;别:
								</label>
								<div class="col-sm-8">
								<label class="radio-inline">
								 <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
								</label>
							    </div>
							</div>
							<div class="form-group">
							   <label class="col-sm-4 control-label"> <span
									class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
									邮箱:
								</label>
								<div class="col-sm-6">
									<input type="text" name="email" class="form-control" id="email_regin_input"
										placeholder="邮箱">
									<span class="help-block"></span>
								</div>
							</div>
							<!-- <div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox"> 已阅读实验室用户协议
										</label>
									</div>
								</div>
							</div> -->
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<button type="submit" class="btn btn-warning btn-block" id="user_regin_btn">注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
  <!-- 结束 -->
       <<footer> 
			<nav
				class="navbar-default navbar-fixed-bottom text-center">
			<p>版权所有： &copy; 湘大software xc</p>
			</nav> 
		</footer>
 </div>
 <script type="text/javascript">
   $("#user_regin_btn").click(function(){
			if (!validate_add_form()) {
					return false;
				}
			//1.判断之前的ajax用户名校验是否成功，如果成功才进行保存
			if ($(this).attr("ajax_name") == "error") {
				return false;
			}
			//2.判断之前的两次密码是否一致，如果成功才进行保存
	          if($(this).attr("password")== "error"){
	            return false;
	           }
			$.ajax({
				url : "${APP_PATH}/user",
				type : "POST",
				data : $("#ReginPanel form").serialize(),
				success : function(result) {
					layer.msg('注册成功！'+{icon:1});
		                	  window.location.href ="login.jsp";
                              $("#username_regin_input").val("");
                              $("#password_regin_input").val("");
				}
			});
		});
        
	 //检验新增用户时两次密码是否一致
	   $("#password_add_input2").change(function(){
	       var secondPassword = $(this).value;
	       var password = $("#password_add_input").val();
	       if(secondPassword != password){
	           $("#user_save_btn").attr("password","error");
	           show_validate_msg("#password_add_input2","error","两次密码不一致");
	       }else{
	           $("#user_save_btn").attr("password","success");
	           show_validate_msg("#password_add_input2","success","密码一致");
	       }
	   });
   
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//先清空这个元素之前的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		function validate_add_form() {
			var username = $("#username_regin_input").val();
			var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
			if (!regName.test(username)) {
				show_validate_msg("#username_regin_input", "error",
						"用户名要求是2-6个中文或者3-16位英文和数字的组合！");
				return false;
			} else {
				show_validate_msg("#username_regin_input", "success", "");
			}

			//校验邮箱
			var email = $("#email_regin_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_regin_input", "error", "邮箱格式不正确！");
				return false;
			} else {
				show_validate_msg("#email_regin_input", "success", "");
			}
			return true;
		}

		//校验用户名是否可用
		$("#username_regin_input").change(
				function() {
					//发送ajax校验用户名是否可用
					var username = this.value;
					$.ajax({
								url : "${APP_PATH}/checkuser",
								data : "username=" + username,
								type : "POST",
								success : function(result) {
									if (result.code == 100) {
										show_validate_msg(
												"#username_regin_input",
												"success", "用户名可用");
										$("#user_regin_btn").attr("ajax_name",
												"success");
									} else {
										show_validate_msg(
												"#username_regin_input",
												"error", result.extend.va_msg);
										$("#user_regin_btn").attr("ajax_name",
												"error");
									}
								}
							});
				});
	</script>
</body>
</html>