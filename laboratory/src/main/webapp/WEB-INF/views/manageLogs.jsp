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
<title>管理员界面</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">
      <!-- 申请记录按钮点击后的信息模态框 -->
      <div class="modal fade" tabindex="-1" role="dialog" id="logInformationModal">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">日志详细信息</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-4 control-label">申请人:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_username"></p>
                </div>
              </div>
             <div class="form-group">
                <label class="col-sm-4 control-label">申请日期:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_reqdate"></p>
                </div>
              </div>
             <div class="form-group">
                <label class="col-sm-4 control-label">实验室:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_labname"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">时间段:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_period"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">班级:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_classname"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">年级:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_subject"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">课程:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_course"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">实验助教:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_assistant"></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">申请状态:</label>
                <div class="col-sm-6">
                  <p class="form-control-static" id="record_static_condition"></p>
                </div>
              </div>
            </form>
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
       
       <div class="panel panel-primary" >
             <div class="panel-heading">日志统计显示</div>
             <div class="panel-body" id="logs_context">
             </div>
             <div class="panel-footer">
              <div class="row">
                    <!-- 分页文字信息 -->
                    <div class="col-md-12" id="page_info_area"></div>
                    <!-- 分页条信息 -->
                    <div class="col-md-8 col-md-offset-4" id="page_nav_area">
                    </div>
             </div>
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
    
    function to_page(pn){
    	$("#logs_context").empty();
        $.ajax({
            url:"${APP_PATH}/LogsController/logs",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
            	 var logs = result.extend.pageInfo.list;
                 $.each(logs,function(index,item){
                     var condition = "正在申请";
                     if(item.judge == "1"){ condition = "同意申请"}
                     if(item.judge == "2"){ condition = "拒绝申请"}
                     findRecordAndShowLogs(item.rId,condition);
                 });
               //2.解析并显示分页信息
               build_page_info(result);
               //3.解析显示分页条数据
               build_page_nav(result);
            }
        });
    }
    
    $(document).ready(function(){
        to_page(1);
    });
    
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum 
                +"页，总页数"+result.extend.pageInfo.pages 
                +"页，总"+ result.extend.pageInfo.total +"条数")
          totalRecord = result.extend.pageInfo.total;
          currentPage = result.extend.pageInfo.pageNum;
    }
    
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
    
    
    function findRecordAndShowLogs(id,condition){
    	 $.ajax({
             url:"${APP_PATH}/RecordController/record",
             type:"GET",
             data:"id="+id,
             success:function(result){
                 var record = result.extend.record;
                 var showTime = new Date(record.reqdate);
                 var period = "第9~11节"
                     if(record.period == "one"){ period = "第1~2节"  }
                     if(record.period == "three"){ period = "第3~4节"  }
                     if(record.period == "five"){ period = "第5~6节"  }
                     if(record.period == "seven"){ period = "第7~8节"  }
                     var info = record.username+ " 申请" + record.labname + " | 时间：" + showTime.Format("yyyy-MM-dd")
                     + "号的" + period + " | 状态:"+ condition + " | 详情请点击";
           $("<button></button>").addClass("btn btn-default log_btn").attr("id",record.reqId).attr("condition",condition).append(info).appendTo("#logs_context");
             }
         });     
    	 
    	 function buildInformationModal(id,condition){
    		 $.ajax({
                 url:"${APP_PATH}/RecordController/record",
                 type:"GET",
                 data:"id="+id,
                 success:function(result){
                     var record = result.extend.record;
                     var showTime = new Date(record.reqdate);
                     var period = "第9~11节"
                         if(record.period == "one"){ period = "第1~2节"  }
                         if(record.period == "three"){ period = "第3~4节"  }
                         if(record.period == "five"){ period = "第5~6节"  }
                         if(record.period == "seven"){ period = "第7~8节"  }
			    		 $("#record_static_username").text(record.username);
			             $("#record_static_reqdate").text(showTime.Format("yyyy-MM-dd"));
			             $("#record_static_period").text(period);
			             $("#record_static_labname").text(record.labname);
			             $("#record_static_classname").text(record.classname);
			             $("#record_static_subject").text(record.subject);
			             $("#record_static_course").text(record.course);
			             $("#record_static_assistant").text(record.assistant);
			             $("#record_static_condition").text(condition);
    	           }
    		 });
    		 
    		 $("#logInformationModal").modal({
                 backdrop:"static"
             });
    	 }
    	 
    	 $(document).on("click",".log_btn",function(){
    		 var id = $(this).attr("id");
    		 var condition = $(this).attr("condition");
    		 buildInformationModal(id,condition);
    	 })
    }
  </script>
</body>
</html>