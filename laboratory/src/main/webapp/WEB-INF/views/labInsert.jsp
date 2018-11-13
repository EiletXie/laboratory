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
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>实验室录入</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">
<!-- 选择实验室老师的模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="selectLabTeacherModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">可选择的实验室教师</h4>
      </div>
      <div class="modal-body">
        <!-- 显示表格数据 -->
		<div class="row">
		  <div class="col-md-12">
		     <table class="table table-hover" id="labTeachers_table">
		     <thead>
		       <tr>
		         <th>ID</th>
		         <th>name</th>
		         <th>gender</th>
		         <th>role</th>
		         <th>email</th>
		         <th>operate</th>
		       </tr>
		      </thead>
		      <tbody>
		       <!-- 通过ajax建立表格数据 -->
		      </tbody>
		     </table>
		  </div>
		</div>
		
		<div class="row">
		<!-- 分页文字信息 -->
		  <div class="col-md-12" id="page_info_area">
		  </div>
		  <!-- 分页条信息 -->
			<div class="col-md-8 col-md-offset-4" id="page_nav_area">
			</div>
		</div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
	         <div class="panel-heading">实验室录入</div>
	         <div class="panel-body">
	           <form class="form-horizontal" id="laboratoryForm">
							<div class="form-group">
								<label class="col-sm-4 control-label"> 
								<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 实验室名称:
								</label>
								<div class="col-sm-6">
									<input type="text" name="labname" class="form-control" id="labname_regin_input" 
									placeholder="实验室名称">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
							   <label class="col-sm-4 control-label"> 
							   <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									负&nbsp;&nbsp;&nbsp;&nbsp;责&nbsp;&nbsp;&nbsp;&nbsp;人:
								</label>
								<div class="col-sm-2">
								    <input type="text" name="uId" class="form-control" id="principal_regin_ID" 
									  placeholder="ID:" disabled>
								</div>
								<div class="col-sm-4">
									<p class="form-control-static" id="principal_regin_username">Username:</p>
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#selectLabTeacherModal" id="select_regin_btn">选择</button>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label"> 
								<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
									容&nbsp;纳&nbsp;人&nbsp;数:
								</label>
								<div class="col-sm-6">
									<input type="text" name="personnum" class="form-control" id="personnum_regin_input"
										placeholder="personnum">
								</div>
							</div>
							<div class="form-group">
							    <label class="col-sm-4 control-label"> 
							    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									实验室介绍:
								</label>
								<div class="col-sm-6">
								    <textarea rows="3" cols="50" class="form-control" name="introduce" id="introduce_regin_input">介绍历史，用途，器材等80字左右</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<button type="button" class="btn btn-warning btn-block" id="lab_regin_btn">确认</button>
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
    
    var totalRecord,currentPage;
	   //1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
	   $("#select_regin_btn").click(function(){
		   //页面一加载，跳转到第一页
		   to_page(1);
	   });
	   
    function to_page(pn){
		   $.ajax({
			   url:"${APP_PATH}/labTeachers",
			   data:"pn="+pn,
			   type:"GET",
			   success:function(result){
				  //console.log(result);
				  //1.在页面解析并显示员工数据
				  build_labTeachers_table(result);
				  //2.解析并显示分页信息
				  build_page_info(result);
				  //3.解析显示分页条数据
				  build_page_nav(result);
			   }
		   });
	   }
    
    //建立教师的表格数据
    function build_labTeachers_table(result){
    	 //先清空表格数据
	    $("#labTeachers_table tbody").empty();
    	var labTeachers = result.extend.pageInfo.list;
    	 $.each(labTeachers,function(index,item){
    		 var idTd = $("<td></td>").append(item.userId);
			 var usernameTd = $("<td></td>").append(item.username);
			 var roleTd = $("<td></td>").append(item.role);
			 var genderTd = $("<td></td>").append(item.gender);
			 var emailTd = $("<td></td>").append(item.email);
			 
			 var selectBtn = $("<button></button>").addClass("btn btn-primary btn-sm select_btn")
             .append($("<span></span>").addClass("glyphicon glyphicon-check")).append("选择");
			 //为编辑按钮添加自定义属性，表示当前员工id
			   selectBtn.attr("select-id",item.userId);
			 
			   $("<tr></tr>").append(idTd)
			   .append(usernameTd)
               .append(genderTd)
               .append(roleTd)
               .append(emailTd)
               .append(selectBtn)
               .appendTo("#labTeachers_table tbody");
    	 });
    }
    
     function build_page_info(result){
		   $("#page_info_area").empty();
		   $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum 
				   +"页，总页数"+result.extend.pageInfo.pages 
				   +"页，总"+ result.extend.pageInfo.total +"条数")
		     totalRecord = result.extend.pageInfo.total;
		     currentPage = result.extend.pageInfo.pageNum;
	   }
    
     //解析显示分页条 ,点击分页有相应的功能跳转
	   function build_page_nav(result){
		   $("#page_nav_area").empty();
		   //page_nav_area
		  var ul = $("<ul></ul>").addClass("pagination");
		   
		  var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		  var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		  if(result.extend.pageInfo.hasPreviousPage == false){
			  firstPageLi.addClass("disabled");
			  prePageLi.addClass("disabled");
		  }else{
		  //为元素添加点击翻页的=事件
        firstPageLi.click(function(){
     	   to_page(1);
        });	  
        prePageLi.click(function(){
     	   to_page(result.extend.pageInfo.pageNum - 1);
        });
		  }
		  
		  var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		  var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		  if(result.extend.pageInfo.hasNextPage == false){
			  nextPageLi.addClass("disabled");
			  lastPageLi.addClass("disabled");
		  }else{
			     lastPageLi.click(function(){
		       	   to_page(result.extend.pageInfo.pages);
		          });	  
				  nextPageLi.click(function(){
		       	   to_page(result.extend.pageInfo.pageNum + 1);
		          }); 
		  }
		  
		  ul.append(firstPageLi).append(prePageLi);
		  $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			  var numLi = $("<li></li>").append($("<a></a>").append(item));
			  if(result.extend.pageInfo.pageNum == item){
				  numLi.addClass("active");
			  }
			  numLi.click(function(){
				  to_page(item);
			  });
			  ul.append(numLi);
		  });
		  ul.append(nextPageLi).append(lastPageLi);
		  
		  var navEle = $("<nav></nav>").append(ul);
		  navEle.appendTo("#page_nav_area");
	   }
     
	   $(document).on("click",".select_btn",function(){
	    	 var labTeacherId = $(this).attr("select-id");
	    	 var labTeacherName = $(this).parent("tr").find("td:eq(1)").text();
	    	 $("#principal_regin_username").text(labTeacherName);
	    	 $("#principal_regin_ID").val(labTeacherId);
	    	 
	    	 $('#selectLabTeacherModal').modal('toggle');
	     });
	     
	    $("#lab_regin_btn").click(function(){
	    	$.ajax({
				   url:"${APP_PATH}/addLaboratory",
				   type:"POST",
				   data:$("#laboratoryForm").serialize(),
				   success:function(result){
					   $("#principal_regin_username").text("Username:");
				       $("#principal_regin_ID").val("ID:");
				       $("#personnum_regin_input").val("");
				       $("#labname_regin_input").val("");
				       $("#introduce_regin_input").val("介绍历史，用途，器材等80字左右");
					  layer.msg(result.extend.labname+'注册成功', {icon: 6});
				   }
			   });
	    });
	    
	    
  </script>
</body>
</html>