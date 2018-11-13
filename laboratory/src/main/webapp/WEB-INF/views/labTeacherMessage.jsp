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
<title>实验室老师界面</title>
<style type="text/css">
  body{
    padding-top:70px; }
</style>
</head>
<body class="container">
<header>
       <!-- 申请记录按钮点击后的信息模态框 -->
      <div class="modal fade" tabindex="-1" role="dialog" id="recordInformationModal">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">申请信息</h4>
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
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default"  id="agree_btn">同意</button>
            <button type="button" class="btn btn-primary" id="disagree_btn">拒绝</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" tabindex="-1" role="dialog" id="disagreeReasonModal">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">请补充一下拒绝原因</h4>
          </div>
          <div class="modal-body">
           <form>
              <div class="form-group">
                <input type="checkbox"  id="time_checkbox"
                     value="实验室在该申请时间段已被占用"/>实验室在该申请时间段已被占用
              </div>
              <div class="form-group">
                <input type="checkbox"  id="laboratory_checkbox"
                     value="实验室正在维护，暂时无法使用"/>实验室正在维护，暂时无法使用
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label">其他原因:</label>
                <div class="col-sm-6">
                <textarea rows="8" cols="40" class="form-control"  id="other_reason"></textarea>
                </div>
              </div>
              <button type="button" class="btn btn-default" id="reason_btn">提交</button>
            </form>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
   </div><!-- /.modal -->

 <nav class="navbar navbar-inverse navbar-fixed-top">
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
                <p id="strongUsername" class="text-center">${username } </p>
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
          <!-- Nav tabs -->
          <ul class="nav nav-tabs nav-justified" role="tablist">
            <li class="active"><a href="#routine" data-toggle="tab">事务提醒</a></li>
            <li><a href="#apply_tabpanel" data-toggle="tab">申请信息</a></li>
            <li><a href="#messages" data-toggle="tab">系统通知</a></li>
          </ul>
        
          <!-- Tab panes -->
          <div class="tab-content">
            <div  class="tab-pane fade in active" id="routine">
              <h3 class="text-center text-primary">每日行程</h3>
              <hr>
              <div class="row">
              <div class="col-md-12">
                 <table class="table table-hover  table-bordered" id="routine_table">
                 <thead>
                   <tr>
                     <th class="text-center">时间段</th>
                     <th class="text-center">实验室</th>
                     <th class="text-center">班级</th>
                     <th class="text-center">年级</th>
                     <th class="text-center">课程</th>
                     <th class="text-center">助教</th>
                   </tr>
                  </thead>
                  <tbody>
                   <!-- 通过ajax建立表格数据 -->
                  </tbody>
                 </table>
              </div>
            </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="apply_tabpanel">
              
            </div>
            
            <div role="tabpanel" class="tab-pane fade" id="messages">
               <table class="table table-hover  table-bordered" id="messages_table">
                    <thead>
                      <tr>
                        <th width="10%"><input type="checkbox" id="check_all"/></th>
                        <th><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></th>
                        <th class="text-center" width="50%">标题</th>
                        <th class="text-center">时间<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></th>
                      </tr>
                     </thead>
                     <tbody>
                      <!-- 通过ajax建立表格数据 -->
                     </tbody>
                </table>
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
    
   // $("#systemMessage_href").click(function(){
       
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
           //获取对于的申请信息
           var sessionUsername =  $("#strongUsername").text();
           $.ajax({
                url:"${APP_PATH}/UserController/labRecord",
                type:"GET",
                data:"sessionUsername="+sessionUsername,
                success:function(result){
                    var records = result.extend.records;
                    $.each(records,function(index,item){
                        var showTime = new Date(item.reqdate);
                        var period = "第9~11节"
                        if(item.period == "one"){ period = "第1~2节"  }
                        if(item.period == "three"){ period = "第3~4节"  }
                        if(item.period == "five"){ period = "第5~6节"  }
                        if(item.period == "seven"){ period = "第7~8节"  }
                         var info = item.username+ " 申请" + item.labname + " | 时间：" + showTime.Format("yyyy-MM-dd")
                                   + "号的" + period + " | 详情请点击";
                         $("<button></button>").addClass("btn btn-default record_btn").attr("reqId",item.reqId).append(info).appendTo("#apply_tabpanel");
                    });
                }
            });
           
            //每日行程的信息
            $.ajax({
                url:"${APP_PATH}/UserController/userRoutine",
                type:"GET",
                data:"sessionUsername="+sessionUsername,
                success:function(result){
                	var records = result.extend.records;
                	$.each(records,function(index,item){
                		var periodTd = $("<td></td>").append(item.period);
                		var labnameTd = $("<td></td>").append(item.labname);
                		var classnameTd = $("<td></td>").append(item.classname);
                		var subjectTd = $("<td></td>").append(item.subject);
                		var courseTd = $("<td></td>").append(item.course);
                		var assistantTd = $("<td></td>").append(item.assistant);
                		
                		$("<tr></tr>").addClass("text-center").append(periodTd)
                		              .append(labnameTd)
                		              .append(classnameTd)
                		              .append(subjectTd)
                		              .append(courseTd)
                		              .append(assistantTd).appendTo("#routine_table tbody")
                	});
                }
            });
           
           //对于日志按钮提取信息显示在模态框
           $(document).on("click",".record_btn",function(){
               $("#recordInformationModal").modal({
                   backdrop:"static"
               });
               
               $.ajax({
                   url:"${APP_PATH}/RecordController/record",
                   type:"GET",
                   data:"id="+$(this).attr("reqId"),
                   success:function(result){
                       var record = result.extend.record;
                       //给同意和拒绝按钮提供该条申请记录的ID
                       $("#agree_btn").attr("reqId",record.reqId);
                       $("#disagree_btn").attr("reqId",record.reqId);
                       $("#reason_btn").attr("reqId",record.reqId);
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
                          }
                       });
           });
           
           $("#agree_btn").click(function(){
               var id = $(this).attr("reqId");
               updateApplyByRecordId(id);
                 $.ajax({
                     url:"${APP_PATH}/LogsController/agreeRecord",
                     type:"POST",
                     data:"id="+id,
                     success:function(result){
                         layer.msg("同意申请，日志已记录", {icon: 6});
                         updateRecordById(id);
                         $("#recordInformationModal").modal("hide");
                     }
                     }); 
               
             });
           
           //同意申请后需要更新申请表中的数据
           function updateApplyByRecordId(id){
               //先通过Id获取到Record对象，从而判断申请的apply的id
              $.ajax({
                  url:"${APP_PATH}/RecordController/recordToapplyId",
                  type:"GET",
                  data:"id="+id,
                  success:function(result){
                      var applyId = result.extend.applyId;
                      var period = result.extend.period;
                      alterApply(applyId,period);
                  }
              });
           }
               
              function alterApply(applyId,period){
               $.ajax({
                   url:"${APP_PATH}/ApplyController/apply",
                   type:"POST",
                   data:{id:applyId,period:period},
                   success:function(result){
                   }
               });
            }
           
           $("#disagree_btn").click(function(){
               $("#recordInformationModal").modal("hide");
               
               $("#disagreeReasonModal").modal({
                   backdrop:"static"
               });
             });
           
           $("#reason_btn").click(function(){
               var id = $(this).attr("reqId");
               var reason = $("#other_reason").val();
               if(reason == ""){
               if($("#time_checkbox").attr("checked") == "checked"){
                   reason = reason + $("#time_checkbox").val();
                 }
               if($("#laboratory_checkbox").attr("checked") == "checked"){
                   reason = reason + $("#laboratory_checkbox").val();
                 }
               }
               
               $.ajax({
                   url:"${APP_PATH}/LogsController/disagreeRecord",
                   type:"POST",
                   data:{id:id,reason:reason},
                   success:function(result){
                       layer.msg("拒绝申请，日志已记录", {icon: 6});
                       updateRecordById(id);
                   }
                   }); 
           });
           
           
           function updateRecordById(id){
               $.ajax({
                   url:"${APP_PATH}/RecordController/record",
                   type:"POST",
                   data:{id :id ,
                       _method:"PUT"},
                   success:function(result){
                   }
                   }); 
           }
           
           //获取系统通知数据
           $.ajax({
                url:"${APP_PATH}/MessageController/systemMessage",
                type:"GET",
                success:function(result){
                    $("#messages_table tbody").empty;
                    var messages = result.extend.pageInfo.list;
                    $.each(messages,function(index,item){
                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                    var iconTd = $("<td></td>").append($("<span></span>").addClass("glyphicon glyphicon-envelope"));
                    var titleTd = $("<td></td>").append(item.title);
                    var sendtime = new Date(item.sendtime).toLocaleString();
                    var dateTd = $("<td></td>").append(sendtime);
                     $("<tr></tr>").append(checkBoxTd)
                                   .append(iconTd)
                                   .append(titleTd)
                                   .append(dateTd)
                                   .appendTo("#messages_table tbody");
                    });
                }
            });
       });
       
       
  </script>
</body>
</html>