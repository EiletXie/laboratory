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
<title>用户管理</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">
 <!-- 编辑员工的模态框Modal -->
    <div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" >用户修改</h4>
                </div>
                <div class="modal-body">
                
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Username:</label>
                            <div class="col-sm-10">
                                 <p class="form-control-static" id="username_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input" >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                 <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                       </div>
                       <div class="form-group">
                            <label class="col-sm-2 control-label">Role</label>
                            <!-- 详细考虑过，觉得角色不能更改，不然角色的功能全都会冲突 -->
                            <div class="col-sm-10">
                                 <p class="form-control-static" id="role_update_static"></p>
                            </div>
                       </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="user_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

<!-- 员工添加的模态框Modal -->
    <div class="modal fade" id="userAddModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">添加用户</h4>
                </div>
                <div class="modal-body">
                
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">username:</label>
                            <div class="col-sm-10">
                                <input type="text" name="username" class="form-control" id="username_add_input" placeholder="username">
                                 <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">password:</label>
                            <div class="col-sm-10">
                                <input type="password" name="password" class="form-control" id="password_add_input1" placeholder="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">password:</label>
                            <div class="col-sm-10">
                                <input type="password"  class="form-control" id="password_add_input2" placeholder="verify password">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email:</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                 <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                       </div>
                       <div class="form-group">
                            <label class="col-sm-2 control-label">role</label>
                            <div class="col-sm-4">
                                    <!-- 部门提交Id即可 -->
                                   <select class="form-control" name="role" id="role_add_select">
                                      <option>实验室老师</option>
                                      <option>任课老师</option>
                                   </select>
                            </div>
                       </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

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
	         <div class="panel-heading">用户管理</div>
	         <div class="panel-body">
	            <!-- 用户管理栏 -->
	            <div class="row">
                 <div class="col-md-2 col-md-offset-10">
                 <button class="btn btn-success" id="user_add_modal_btn">新增</button>
                 </div>
                </div>
				<!-- 显示表格数据 -->
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover" id="users_table">
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
					<div class="col-md-12" id="page_info_area"></div>
					<!-- 分页条信息 -->
					<div class="col-md-8 col-md-offset-4" id="page_nav_area">
					</div>
				</div>
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
    $(function(){
        //页面一加载，跳转到第一页
        to_page(1);
    });
    
 function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/getUsers",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
               //console.log(result);
               //1.在页面解析并显示员工数据
               build_users_table(result);
               //2.解析并显示分页信息
               build_page_info(result);
               //3.解析显示分页条数据
               build_page_nav(result);
            }
        });
    }
 
 //建立用户的表格数据
 function build_users_table(result){
      //先清空表格数据
     $("#users_table tbody").empty();
     var labTeachers = result.extend.pageInfo.list;
      $.each(labTeachers,function(index,item){
          var idTd = $("<td></td>").append(item.userId);
          var usernameTd = $("<td></td>").append(item.username);
          var roleTd = $("<td></td>").append(item.role);
          var genderTd = $("<td></td>").append(item.gender);
          var emailTd = $("<td></td>").append(item.email);
          
          var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
          .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
          //为编辑按钮添加自定义属性，表示当前员工id
            editBtn.attr("edit-id",item.userId);
          var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
             delBtn.attr("del-id",item.userId);
          var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
          
            $("<tr></tr>").append(idTd)
            .append(usernameTd)
            .append(genderTd)
            .append(roleTd)
            .append(emailTd)
            .append(btnTd)
            .appendTo("#users_table tbody");
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
  
   //显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
      //先清空这个元素之前的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
  
    //我们是在按钮创建之前就绑定了click，所以绑定不上
    //解决方案：1.在创建按钮时绑定  2.绑定点击.live()
    $(document).on("click",".edit_btn",function(){
        //1.查出员工信息，查出部门信息，显示部门列表
        getUser($(this).attr("edit-id"));
        
        //把员工id传给更新按钮
        $("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#userUpdateModal").modal({
            backdrop:"static"
        });
    });
    
    // 获取单个用户信息
    function getUser(id){
        $.ajax({
            url:"${APP_PATH}/user/"+id,
            type:"GET",
            success:function(result){
                var userData = result.extend.user;
                $("#username_update_static").text(userData.username);
                $("#email_update_input").val(userData.email);
                $("#userUpdateModal input[name=gender]").val([userData.gender]);
                $("#role_update_static").text(userData.role);
            }
            
        });
    }
    
  //点击更新按钮，更新用户信息
    $("#user_update_btn").click(function(){
        //校验邮箱
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式不正确！");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","");
        }
        //2.发送更新员工的请求+"&_method=PUT"
        $.ajax({
            url:"${APP_PATH}/user/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#userUpdateModal form").serialize(),
            success:function(result){
                    //1.提示注册成功
            	    layer.msg('更新成功', {icon: 6});
                    //2.关闭模态框
                    $("#userUpdateModal").modal("hide");
                    // 3.回到本页面
                    to_page(currentPage);
            }
        });
        
    });
  
     //单个删除
    $(document).on("click",".delete_btn",function(){
        //1.弹出是否确认删除的确认框
        var username = $(this).parents("tr").find("td:eq(1)").text();
        var userId = $(this).attr("del-id");
        // layer confirm的确认不响应的问题无法解决 暂时用默认的confirm
        //layer.confirm( " 确认删除 " + username +" 吗？", {icon: 7, title:'提示'}),function(index){
        if(confirm( " 确认删除 " + username +" 吗？")){
        $.ajax({
            url:"${APP_PATH}/user/"+ userId,
            type:"DELETE",
            success:function(result){
            	 layer.msg('删除成功', {icon: 6,time: 1000});
                    // 回到本页面
                    to_page(currentPage);
            }
        });
        }
    });
     
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
     
    //点击新增按钮，弹出模态框
    $("#user_add_modal_btn").click(function(){
        //先清除模态框中的表单数据防止session后可重复保存(数据、样式都重置)
        reset_form("#userAddModal form");
        
        $("#userAddModal").modal({
            backdrop:"static"
        });
    });
    
    //校验用户名是否可用
    $("#username_add_input").change(function(){
        //发送ajax校验用户名是否可用
        var username = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"username="+username,
            type:"POST",
            success:function(result){
                if(result.code == 100){
                    show_validate_msg("#username_add_input","success","用户名可用");
                    $("#user_save_btn").attr("ajax_name","success");
                }else{
                    show_validate_msg("#username_add_input","error",result.extend.va_msg);
                    $("#user_save_btn").attr("ajax_name","error");
                }
            }
        });
    });
    
  //检验新增用户时两次密码是否一致
    $("#password_add_input2").change(function(){
        var secondPassword = this.value;
        var password = $("#password_add_input1").val();
        if(secondPassword != password){
        	$("#user_save_btn").attr("password","error");
        	show_validate_msg("#password_add_input2","error","两次密码不一致");
        }else{
        	$("#user_save_btn").attr("password","success");
        	show_validate_msg("#password_add_input2","success","密码一致");
        }
    });
  
    //点击保存，保存员工
    $("#user_save_btn").click(function(){
        //1.模态框中填写的表单数据提交给服务器进行保存
        //2.发送ajax请求保存员工
         if(!validate_add_form()){
            return false;
        } 
        //1.判断之前的ajax用户名校验是否成功，如果成功才进行保存
          if($(this).attr("ajax_name")== "error"){
            return false;
           }
        
          //1.判断之前的ajax用户名校验是否成功，如果成功才进行保存
          if($(this).attr("password")== "error"){
            return false;
           }
        
        
        $.ajax({
            url:"${APP_PATH}/user",
            type:"POST",
            data:$("#userAddModal form").serialize(),
            success:function(result){
                if(result.code == 100){
                layer.msg("添加用户成功",{icon: 6});
                //员工保存成功 
                //1.关闭模态框
                $("#userAddModal").modal("hide");
                // 2.来到最后一页查看结果
                to_page(totalRecord);
                }else{
                    //显示失败信息
                    //console.log(result);
                    if(undefined != result.extend.errorFields.email){
                        //显示邮箱的错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.username){
                        //显示员工名字的错误信息
                        show_validate_msg("#username_add_input","error",result.extend.errorFields.empName);
                    }
                }
            }
        }); 
    });
    
    //校验表单数据
    function validate_add_form(){
        //1.拿到要校验的数据，使用正则表达式
        var username = $("#username_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
        if(!regName.test(username)){
            //alert("用户名要求是2-6个中文或者3-16位英文和数字的组合！");
            show_validate_msg("#username_add_input","error","用户名要求是2-6个中文或者3-16位英文和数字的组合！");
            return false;
        }else{
            show_validate_msg("#username_add_input","success","");
        }
        
        //校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式不正确！");
            show_validate_msg("#email_add_input","error","邮箱格式不正确！");
            return false;
        }else{
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }
  </script>
</body>
</html>