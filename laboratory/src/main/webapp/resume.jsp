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
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>Resume</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">
  <header>
    <nav class="navbar navbar-inverse navbar-fixed-top">
       <div class="container"> <!-- 这个div container是为了将按钮和brand居中一点 -->
       <div class="navbar-header">
         <div class="navbar-brand">Personal Resume</div>
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#divNav">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </button>
       </div>
       <div id="divNav" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
             <li>
               <button type="button" class="btn btn-success navbar-btn" data-toggle="modal" data-target="#divModal" title="Print">Print</button>
               <div class="modal fade" id="divModal">
                 <div class="modal-dialog">
                   <div class="modal-content">
                      <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">&times;</span></button>
                         <h4 class="modal-title">Modal title</h4>
                      </div>
                      <div class="modal-body">
                         Print Preview
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Print</button>
                      </div>
                    </div>
                 </div>
               </div>
               
               <button type="button" class="btn btn-info navbar-btn" data-toggle="tooltip" data-placement="bottom" >Download</button>
               <script type="text/javascript">
                $(function(){
                	$('[data-toggle="tooltip"').tooltip();
                });
               </script>
             </li>
          </ul>
       </div>
       </div>
    </nav>
  </header> 
   
   <div class="row">
     <div class="col-sm-3">
       <div class="panel panel-default">
         <div class="panel-heading">Person Information</div>
         <div class="panel-body">
          <img src="${APP_PATH}/static/image/tx1.png" class="img-responsive img-rounded img-thumbnail" alt="me"/>
          <p class="text-center text-primary">Handsome XC</p>
          <address>
             <strong>Tarena Inc</strong><br/>
             <span class="glyphicon glyphicon-home" title="Address"><code>  湘潭市雨湖区CAI部门</code></span><br/>
             <span class="glyphicon glyphicon-file" title="PostalCode">  <kbd>100101</kbd></span><br/>
             <span class="glyphicon glyphicon-envelope" title="Email"><var> 1215669789@qq.com</var></span><br/>
          </address>
         </div>
       </div>
       <div class="panel panel-info">
        <div class="panel-heading">Person Skill</div>
        <div class="panel-body">
           <div class="row">
               <div class="col-sm-3">
                 <span class="text-muted">Spring</span>
               </div>
               <div class="col-sm-9">
		           <div class="progress">
						<div class="progress-bar progress-bar-striped active" style="width: 60%;">
							<span class="sr-only">60% Complete</span>
						</div>
				   </div>
			   </div>
		   </div>
		   <div class="row">
               <div class="col-sm-3">
                 <span class="text-muted">Mybatis</span>
               </div>
               <div class="col-sm-9">
		           <div class="progress">
						<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 80%;">
							<span class="sr-only">80% Complete</span>
						</div>
				   </div>
			   </div>
		   </div>
		   <div class="row">
               <div class="col-sm-3">
                 <span class="text-muted">SpringMvc</span>
               </div>
               <div class="col-sm-9">
		           <div class="progress">
						<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: 50%;">
							<span class="sr-only">50% Complete</span>
						</div>
				   </div>
			   </div>
		   </div>
		   <div class="row">
               <div class="col-sm-3">
                 <span class="text-muted">bookstrap</span>
               </div>
               <div class="col-sm-9">
		           <div class="progress">
						<div class="progress-bar progress-bar-info progress-bar-striped active" style="width: 90%;">
							<span class="sr-only">90% Complete</span>
						</div>
				   </div>
			   </div>
		   </div>
        </div>
       </div>
       <div class="panel panel-primary">
         <div class="panel-heading">Contact me</div>
         <div class="panel-body">
            <form class="form-horizontal">
              <div class="form-group">
                 <label for="email" class="col-sm-2 control-label">Email </label>
                 <div class="col-sm-10">
                  <input type="email" class="form-control" id="email" placeholder="Email">
                 </div>
              </div>
              <div class="form-group">
                 <label for="name" class="col-sm-2 control-label">Name </label>
                 <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" placeholder="Name">
                 </div>
              </div>
              <div class="form-group">
                 <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-primary pull-right" id="sendbtn">Send</button>
                  <div class="clearfix"></div>
                 </div>
              </div>
            </form>
         </div>
       </div>
     </div>
     
     <div class="col-sm-9">
       <div class="jumbotron">
         <p class="text-right small">独立制作过几个系统，参与过一些网页设计</p><br/>
         <p class="text-right small">项目详情见<a href="#">网站</a><br/>
                    对业务流程，需求分析，项目测试，数据库设计等方面有一定的了解<br/>
                   对于项目风险，数据结构有基本的涉猎 。<br/>
         </p>
       </div>
       
       <div class="panel-group" id="accordion">
         <div class="panel panel-default">
             <div class="panel-heading">
               <div class="panel-title">
                 <a href="#collapseOne" data-toggle="collapse" data-parent="#accordion">Work Experense</a>
               </div>
               <div id="collapseOne" class="panel-collapse collapse">
                 <div class="panel-body">
                   <ul class="list-group">
                     <li class="list-group-item list-group-item-success">
                       <div class="row"> 
                          <div class="col-sm-4">
                           2017/7-2017/9
                          </div>
                           <div class="col-sm-4">
                                                              常州集客软件公司
                          </div>
                          <div class="col-sm-4">
                            Java工程师
                          </div>
                       </div>
                     </li>
                     <li class="list-group-item list-group-item-warning">
                       <div class="row"> 
                          <div class="col-sm-4">
                           2017/11-至今
                          </div>
                           <div class="col-sm-4">
                                                              密训软件公司
                          </div>
                          <div class="col-sm-4">
                                                              软件工程师
                          </div>
                       </div>
                     </li>
                   </ul>
                 </div>
               </div>
             </div>
         </div>
         
         <div class="panel panel-default">
             <div class="panel-heading">
               <div class="panel-title">
                 <a href="#collapseTwo" data-toggle="collapse" data-parent="#accordion">Education</a>
               </div>
               <div id="collapseTwo" class="panel-collapse collapse">
                 <div class="panel-body">
                   <ul class="list-group">
                     <li class="list-group-item list-group-item-success">
                       <div class="row"> 
                          <div class="col-sm-4">
                           2014/7-至今
                          </div>
                           <div class="col-sm-4">
                                                              湘潭大学
                          </div>
                          <div class="col-sm-4">
                                                              软件工程
                          </div>
                       </div>
                     </li>
                   </ul>
                 </div>
               </div>
             </div>
         </div>
         
         <div class="panel panel-default">
             <div class="panel-heading">
               <div class="panel-title">
                 <a href="#collapseThree" data-toggle="collapse" data-parent="#accordion">Project</a>
               </div>
               <div id="collapseThree" class="panel-collapse collapse">
                 <div class="panel-body">
                   <ul class="list-group">
                     <li class="list-group-item list-group-item-success">
                       <div id="divCarousel" class="carousel slide" data-ride="carousel"> 
                          <ol class="carousel-indicators">
                            <li data-target="divCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="divCarousel" data-slide-to="1"></li>
                            <li data-target="divCarousel" data-slide-to="2"></li>
                          </ol>
                          <div class="carousel-inner">
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
                          <a class="left carousel-control" href="#divCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                          </a>
                          <a class="right carousel-control" href="#divCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                          </a>
                       </div>
                     </li>
                   </ul>
                 </div>
               </div>
             </div>
         </div>
       </div>
     </div>
   </div>
   
  <footer>
   <nav class="navbar-default navbar-fixed-bottom text-center">
      <p>All image and context &copy; tarena</p>
   </nav>
  </footer>
</body>
</html>