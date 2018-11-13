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
   pageContext.setAttribute("username",request.getParameter("username"));
   
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>任课教师页面</title>
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
	          <p class="text-center text-primary">人物头像</p>
	          <address>
	             <strong>欢迎，
	            ${username } </strong><br/>
	             <span class="glyphicon glyphicon-home" title="Address"><code>  湘潭市雨湖区CAI部门</code></span><br/>
	          </address>
	         </div>
	       </div>
	      
	       <div class="panel panel-default">
	        <div class="panel-heading">Operate</div>
	        <div class="panel-body">
	          <ul class="nav nav-pills nav-stacked">
	           <li><a href="labOperate">通知信息</a></li>
	           <li><a href="labOperate">实验室操作</a></li>
	           <li><a href="#">日志记录</a></li>
	          </ul>
	        </div>
	        </div>
     </div>
      <!-- 右侧页面-->
     <div class="col-md-9">
        <div id="carousel-teacher" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="divCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="divCarousel" data-slide-to="1"></li>
		    <li data-target="divCarousel" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		  <div class="item active">
		      <img alt=".." src="${APP_PATH}/static/image/2018year.png" class="img-rounded img-responsive">
		      <div class="carousel-caption">Happy NewYear 2018</div>
		    </div>
		    <div class="item">
		      <img alt=".." src="${APP_PATH}/static/image/background.jpg" class="img-rounded img-responsive">
		      <div class="carousel-caption">灰色面板</div>
		    </div>
		    <div class="item">
		      <img alt=".." src="${APP_PATH}/static/image/background2.jpg" class="img-rounded img-responsive">
		      <div class="carousel-caption">蓝色科技</div>
		    </div>
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-teacher" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-teacher" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
       </div>
       
       
       
       <!-- 显示表格数据 -->
		<div class="row">
		  <div class="col-md-12">
		     <table class="table table-hover" id="laboratoryInformation_table">
		     <thead>
		       <tr>
		         <th>ID</th>
		         <th>LabName</th>
		         <th>负责人</th>
		         <th>email</th>
		         <th>操作</th>
		       </tr>
		      </thead>
		      <tbody>
		        <tr>
		         <th>1</th>
		         <th>多媒体教室</th>
		         <th>xxx</th>
		         <th>12166666@qq.com</th>
		         <th>
		         <button type="button" class="btn btn-primary">申请</button>
		         </th>
		        </tr>
		      </tbody>
		     </table>
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
    
    
  </script>
</body>
</html>