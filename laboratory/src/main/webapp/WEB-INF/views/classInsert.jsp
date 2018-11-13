<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<%
   pageContext.setAttribute("APP_PATH",request.getContextPath());
   pageContext.setAttribute("username",session.getAttribute("sessionUsername"));
   
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>班级录入</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">

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

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="ListNavTitle">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <button type="button" class="btn btn-success navbar-btn" title="Notice" onclick="alert()">
          <span class="glyphicon glyphicon-bullhorn"></span></button>
          <button type="button" class="btn btn-danger  navbar-btn" title="Exit" id="exit-btn" onclick="">
          <span class="glyphicon glyphicon-off"></span></button>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
   </nav>
</header>

  
  <div class="row">
      <!-- 左侧列表项 -->
     <div class="col-md-3">
         <div class="panel panel-default">
             <div class="panel-heading">Person Information</div>
             <div class="panel-body">
              <img src="${APP_PATH}/static/image/tx2.jpg" class="img-responsive img-rounded img-thumbnail" alt="me"/>
              <p class="text-center text-primary">&nbsp;欢迎，${username }</p>
             </div>
           </div>
          
           <div class="panel panel-default">
            <div class="panel-heading">Operate</div>
            <div class="panel-body">
              <ul class="nav nav-pills nav-stacked">
               <li><a href="message">通知发布</a></li>
               <li><a href="userManage">用户管理</a></li>
               <li><a href="courseInsert">课程录入</a></li>
               <li><a href="schoolCalendarInsert">校历设置</a></li>
               <li><a href="classInsert">班级录入</a></li>
               <li><a href="labInsert">实验室录入</a></li>
               <li><a href="manageLogs">日志记录</a></li>
              </ul>
            </div>
            </div>
     </div>
      <!-- 右侧页面-->
     <div class="col-md-9">
        <div class="jumbotron">
         <p class="text-right small">管理员页面</p><br/>
       </div>
       
       <div class="panel panel-primary">
             <div class="panel-heading">班级录入</div>
             <div class="panel-body">
               <form class="form-horizontal" id="classForm">
                            <div class="form-group">
                                <label class="col-sm-4 control-label"> 
                                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 班级名称:
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" name="classname" class="form-control" id="classname_regin_input" 
                                    placeholder="班级名称">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label"> 
                                                                          班级人数:
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" name="number" class="form-control" id="number_regin_input"
                                        placeholder="请输入班级人数">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-sm-4 control-label"> 
                                                                          所在年级:
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" name="grade" class="form-control" id="grade_regin_input"
                                        placeholder="格式：入学年+级，如：2014级">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label"> 
                                                                          所学专业:
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" name="subject" class="form-control" id="subject_regin_input"
                                        placeholder="请输入所学专业">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4">
                                    <button type="button" class="btn btn-warning btn-block" id="class_regin_btn">确认</button>
                                </div>
                            </div>
                        </form>
             </div>
           </div>
       <!-- 通知面板 -->
       
     </div>
  </div>
 
 <footer>
   <nav class="navbar-default navbar-fixed-bottom text-center">
      <p>版权所有： &copy; 湘大software xc</p>
   </nav>
  </footer>
  
  <script type="text/javascript">
  
    $("#exit-btn").click(function(){
        window.location.href="login.jsp"; 
    });
    
         
      $("#class_regin_btn").click(function(){
           $.ajax({
                  url:"${APP_PATH}/class",
                  type:"POST",
                  data:$("#classForm").serialize(),
                  success:function(result){
                      $("#classname_regin_input").val("");
                      $("#number_regin_input").val("");
                      $("#grade_regin_input").val("");
                      $("#subject_regin_input").val("");
                     layer.msg(result.extend.classname+'注册成功', {icon: 6});
                  }
              });
       });
        
        
  </script>
</body>
</html>