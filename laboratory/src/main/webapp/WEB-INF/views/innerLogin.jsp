<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实验室管理系统</title>
<%
   pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
     以/开始的相对路径，找资源，以服务器的路径为标注(http://localhost:3306),需要加上项目名
 -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
          <div class="col-md-7">
                <div class="panel panel-primary">
                    <!-- Default panel contents -->
                    <div class="panel-heading">用户登录/Login</div>
                    <div class="panel-body">
                        <br/>
                        <form class="form-horizontal" id="loginForm">
                            <div class="form-group">
                                <label class="col-sm-4 control-label"> <span
                                    class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户名
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" name="username" class="form-control" id="username_login_input"
                                        placeholder="用户名/学号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label"> <span
                                    class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                                    密&nbsp;&nbsp;&nbsp;码
                                </label>
                                <div class="col-sm-6">
                                    <input type="password" name="password" class="form-control" id="password_login_input"
                                        placeholder="密码">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label> <input type="checkbox"> 记住密码</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-primary" id="user_login_btn">登录</button>
                                    <button type="button" class="btn btn-link" id="user_regin_btn">注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
  <!-- 结束 -->
        <footer> 
            <nav
                class="navbar-default navbar-fixed-bottom text-center">
            <p>版权所有： &copy; 湘大software xc</p>
            </nav> 
        </footer>
    </div>
 
  <script type="text/javascript">
   $("#user_login_btn").click(function(){
       $.ajax({
           url:"${APP_PATH}/loginUser",
           type:"POST",
           data:$("#loginForm").serialize(),
           dataType:"json",
           success:function(result){
                if(result.code == 100 ){
                    if(result.extend.role == "任课老师"){
                        window.location.href = "teacher.jsp?username=" + result.extend.username;
                    }else if(result.extend.role == "实验室老师"){
                        window.location.href = "labTeacher.jsp?username=" + result.extend.username;
                    }else{
                         window.location.href = "manage.jsp?username=" + result.extend.username;
                    }
                }else{
                 $("#password_login_input").parent().addClass("has-error");
                 $("#password_login_input").next("span").text("用户名或者密码错误！");
                }
           }
       });
   });
   
   $("#user_regin_btn").click(function(){
       window.location.href ="regin.jsp";
   });
  </script>
</body>
</html>