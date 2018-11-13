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
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-ui-1.11.4/jquery-ui.js"></script>
<link href="${APP_PATH}/static/js/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>管理员界面</title>
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
              <p class="text-center text-primary">${username }</p>
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
       
       <div class="panel panel-success">
             <div class="panel-heading">校历设置</div>
             <div class="panel-body">
             <div class="row">
              <div class="col-md-4">
               <strong class="text-center">当前校历起始日期为:</strong>
              </div>
              <div class="col-md-4">
               <p id="startDay_now"></p>
              </div>
              <br/><br/>
             </div>
                <!-- 大型输入栏 -->
                <form class="form-horizontal" id="schoolCalendarForm">
                            <div class="form-group">
                                <label class="col-sm-3 control-label"> 
                                                                                开学日:
                                </label>
                                <div class="col-sm-6">
                                    <input runt="server" type="text" name="title" class="form-control" id="startDay_update_input" 
                                    placeholder="设置校历的初始日期">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4">
                                    <button type="button" class="btn btn-primary" id="startDay_update_btn">发布</button>
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
    
    Date.prototype.Format = function (fmt) { //author: meizz   
        var o = {  
            "M+": this.getMonth() + 1, //月份   
            "d+": this.getDate(), //日   
            "H+": this.getHours(), //小时   
            "m+": this.getMinutes(), //分   
            "s+": this.getSeconds(), //秒   
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度   
            "S": this.getMilliseconds() //毫秒   
        };  
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
        for (var k in o)  
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
        return fmt;  
    }  
    
    $(document).ready(function(){
    	 $.ajax({
             url:"${APP_PATH}/SchoolCalendarController/startDay",
             type:"GET",
             success:function(result){
            	 var date = new Date(result.extend.startDay).Format("yyyy-MM-dd");
                 $("#startDay_now").text(date);
             }
         });
    });
    
    $(function() {
        $("#startDay_update_input").datepicker({
        		 closeText: '关闭',
        	      prevText: '&#x3c;上月',
        	      nextText: '下月&#x3e;',
        	      currentText: '今天',
        	      monthNames: ['一月','二月','三月','四月','五月','六月',
        	        '七月','八月','九月','十月','十一月','十二月'],
        	      monthNamesShort: ['一','二','三','四','五','六',
        	        '七','八','九','十','十一','十二'],
        	      dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
        	      dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
        	      dayNamesMin: ['日','一','二','三','四','五','六'],
        	      weekHeader: '周',
        	      dateFormat: 'yy-mm-dd',
        	      firstDay: 1,
        	      isRTL: false,
        	      showMonthAfterYear: true,
        	      yearSuffix: '年'
        });
      });
    //{startDay:$("#startDay_update_input").val(),_method:"PUT"}
    $("#startDay_update_btn").click(function(){
        $.ajax({
            url:"${APP_PATH}/SchoolCalendarController/startDay",
            type:"POST",
            data:{startDay:$("#startDay_update_input").val(),_method:"PUT"},
            success:function(result){
                $("#startDay_now").text($("#startDay_update_input").val());
                $("#startDay_update_input").val("");
                layer.msg("校历修改成功",{icon:6});
            }
        });
    });
  </script>
</body>
</html>