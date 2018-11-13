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
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>Laboratory Information Page</title>
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
          <button type="button" class="btn btn-success navbar-btn" title="Notice">
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
	          <address>
	             <p class="text-center" id="strongUsername">${username }</p>
	          </address>
	         </div>
	       </div>
	      
	       <div class="panel panel-default">
	        <div class="panel-heading">Operate</div>
	        <div class="panel-body">
	          <ul class="nav nav-pills nav-stacked">
	           <li><a href="labTeacherMessage">通知信息 <span class="badge">14</span></a></li>
               <li><a href="labTeacherWeekApply">每周次申请表</a></li>
               <li><a href="labTeacherApply">实验室申请</a></li>
               <li><a href="labTeacherMultipleApply">多课时实验室申请</a></li>
               <li><a href="laboratoryInformation">实验室信息</a></li>
               <li><a href="labTeacherLogs">日志记录</a></li>
	          </ul>
	        </div>
	        </div>
     </div>
      <!-- 右侧页面-->
     <div class="col-md-9">
        <div class="jumbotron">
         <p class="text-right small">实验室信息页面</p><br/>
       </div>
       
       <!-- 显示表单数据 -->
        <div class="panel panel-primary">
	        <div class="panel-heading">Laboratory Information</div>
	        <div class="panel-body">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">负责人ID :</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="input_static_id"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">实验室名称 :</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="input_static_labname"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">容纳人数 :</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="input_static_personnum"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">用途 :</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="input_static_introduce"></p>
					</div>
				</div>
			</form>
			</div>
		</div>
		</div>
  </div>
 
 <footer>
   <nav class="navbar-default navbar-fixed-bottom text-center">
      <p>版权所有： &copy; 湘大software xc</p>
   </nav>
  </footer>
  
  <script type="text/javascript">
    $("#exit-btn").click(function(){
    	window.location.href="index.jsp"; 
    });
    
    var sessionUsername = $("#strongUsername").text();
    $(document).ready(function(){
    	$.ajax({
    		url:"${APP_PATH}/UserController/labInformation",
    		type:"GET",
    		data:"sessionUsername="+sessionUsername,
    		success:function(result){
    			var lab = result.extend.laboratory;
    			$("#input_static_labname").text(lab.labname);
    			$("#input_static_id").text(lab.uId);
    			$("#input_static_personnum").text(lab.personnum);
    			$("#input_static_introduce").text(lab.introduce);
    		}
    	});
    });
  </script>
</body>
</html>