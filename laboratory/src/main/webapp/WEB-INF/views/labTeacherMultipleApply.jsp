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
  td{
     text-align: center;
     align:middle;
  }
  
</style>
</head>
<body class="container">
<header>
     <!-- 选择班级的模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="selectClassModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">选择班级</h4>
          </div>
          <div class="modal-body">
            <!-- 显示表格数据 -->
            <div class="row">
              <div class="col-md-12">
                 <table class="table table-hover" id="classes_table">
                 <thead>
                   <tr>
                     <th>名称</th>
                     <th>人数</th>
                     <th>年级</th>
                     <th>专业</th>
                     <th>操作</th>
                   </tr>
                  </thead>
                  <tbody>
                   <!-- 通过ajax建立表格数据 -->
                  </tbody>
                 </table>
              </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
            <!-- 分页文字信息 -->
              <div class="col-md-6" id="page_info_area">
              </div>
            </div>
            <div class="row">
              <!-- 分页条信息 -->
                <div class="col-md-8 col-md-offset-4" id="page_nav_area">
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
     <!-- 选择课程的模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="selectCourseModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">选择课程</h4>
          </div>
          <div class="modal-body">
           <div class="row">
                <div class="col-md-4 col-md-offset-8">
                <input id="blurredCourseSelect" type="text" class="form-control" placeholder="搜索课程">
                </div>
           </div>
            <!-- 显示表格数据 -->
            <div class="row">
              <div class="col-md-12">
                 <table class="table table-hover" id="courses_table">
                 <thead>
                   <tr>
                     <th></th>
                     <th></th>
                     <th></th>
                   </tr>
                  </thead>
                  <tbody>
                   <!-- 通过ajax建立表格数据 -->
                  </tbody>
                 </table>
              </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
            <!-- 分页文字信息 -->
              <div class="col-md-6" id="course_page_info_area">
              </div>
            </div>
            <div class="row">
              <!-- 分页条信息 -->
                <div class="col-md-8 col-md-offset-4" id="course_page_nav_area">
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- 选择实验室的模态框 -->  
   <div class="modal fade" tabindex="-1" role="dialog" id="labSelectModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">请选择要选课的实验室</h4>
	      </div>
	      <div class="modal-body">
	        <input id="blurredselect" type="text" class="form-control" placeholder="要查询的实验室">
	        <div class="row">
	         <div class="col-md-12">
             <table class="table table-bordered" id="laboratoryInformation_table">
             <thead>
               <tr>
                 <th>实验室名称</th>
                 <th>容纳人数</th>
                 <th>介绍</th>
                 <th>负责人ID</th>
                 <th>操作</th>
               </tr>
              </thead>
              <tbody>
               <!-- ajax获取当日的信息 -->
              </tbody>
             </table>
          </div>
        </div>
           <div class="row">
               <!-- 分页文字信息 -->
               <div class="col-md-12" id="table_info_area"></div>
               <!-- 分页条信息 -->
               <div class="col-md-8 col-md-offset-4" id="table_nav_area"></div>
            </div>
	        </div>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->    
      
    <!-- 实验室申请的模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="LabApplyModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">实验室多课时申请</h4>
          </div>
          <div class="modal-body">
          
            <form class="form-horizontal">
              <div class="form-group">
                <label  class="col-sm-4 control-label">实验室名称:</label>
                <div class="col-sm-4">
                <input type="text" class="form-control" id="input_labname" name="labname"  readonly/>
                </div>
              </div>
              <div class="form-group">
                <label  class="col-sm-4 control-label">申请人:</label>
                <div class="col-sm-4">
                <input type="text" class="form-control" id="input_username" name="username" value="${username }" readonly/>
                </div>
              </div>
              <div class="form-group">
                <label  class="col-sm-4 control-label">申请时间:</label>
                <div class="col-sm-8">
                <!-- 由于无法通过jquery传入java.util.date -->
                 <p class="text-danger text-lowercase" id="input_reqdate" />
                </div>
              </div>
              <div class="form-group">
                <label  class="col-sm-4 control-label">助&nbsp;&nbsp;&nbsp;&nbsp;教:</label>
                <div class="col-sm-6">
                  <input type="text" name="assistant" class="form-control" id="input_log_assistant" placeholder="本次实验的助教姓名"/>
                </div>
              </div>
              <div class="form-group">
                <label  class="col-sm-4 control-label">班&nbsp;&nbsp;&nbsp;&nbsp;级:</label>
                <div class="col-sm-3">
                  <input type="text" class="form-control" id="input_log_classname" name="classname" placeholder="classname" readonly/>
                </div>
                <div class="col-sm-3">
                  <input class="form-control" id="input_log_subject" name="subject" placeholder="subject" readonly/>
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-info btn-sm"  id="select_class_btn">选择</button>
                </div>
                <span id="personNumWarning"></span>
              </div>
              <div class="form-group">
                <label  class="col-sm-4 control-label">课&nbsp;&nbsp;&nbsp;程:</label>
                 <div class="col-sm-4">
                  <input type="text" class="form-control" name="course" id="input_log_course" placeholder="所选课程" readonly/>
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-info btn-sm"  id="select_course_btn">选择</button>
                </div>
              </div>
            </form>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="log_apply_btn">申请</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
   
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
                <p id="sessionUsername" class="text-center">${username } </p>
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
       <div class="row">
       <div class="col-md-4 col-md-offset-5">
          <h4 id="labname_title">LABNAME</h4>
       </div>
       </div>
        
       <div class="row">
           <div class="col-md-2">
           <button id="laboratory_select_btn" type="button" class="btn btn-primary btn-sm">选择实验室</button>
           </div>
       
           <div class="col-md-3">
           <Strong>起始周:</Strong>
             <select id="startWeekSelect" class="btn btn-default btn-sm">
              <option value ="oneWeek">第一周</option>
              <option value ="twoWeek">第二周</option>
              <option value ="threeWeek">第三周</option>
              <option value ="fourWeek">第四周</option>
              <option value ="fiveWeek">第五周</option>
              <option value ="sixWeek">第六周</option>
              <option value ="sevenWeek">第七周</option>
              <option value ="eightWeek">第八周</option>
              <option value ="nineWeek">第九周</option>
              <option value ="tenWeek">第十周</option>
              <option value ="elevenWeek">第十一周</option>
              <option value ="twelveWeek">第十二周</option>
              <option value ="threeteenWeek">第十三周</option>
              <option value ="fourteenWeek">第十四周</option>
              <option value ="fiveteenWeek">第十五周</option>
              <option value ="sixteenWeek">第十六周</option>
             </select>
            </div>
            
            
            <div class="col-md-3">
            <Strong>结束周:</Strong>
             <select id="endWeekSelect" class="btn btn-default btn-sm">
              <option value ="oneWeek">第一周</option>
              <option value ="twoWeek">第二周</option>
              <option value ="threeWeek">第三周</option>
              <option value ="fourWeek">第四周</option>
              <option value ="fiveWeek">第五周</option>
              <option value ="sixWeek">第六周</option>
              <option value ="sevenWeek">第七周</option>
              <option value ="eightWeek">第八周</option>
              <option value ="nineWeek">第九周</option>
              <option value ="tenWeek">第十周</option>
              <option value ="elevenWeek">第十一周</option>
              <option value ="twelveWeek">第十二周</option>
              <option value ="threeteenWeek">第十三周</option>
              <option value ="fourteenWeek">第十四周</option>
              <option value ="fiveteenWeek">第十五周</option>
              <option value ="sixteenWeek">第十六周</option>
             </select>
            </div>
            <div class="col-md-1">
              <button id="findWeekInfo" type="button" class="btn btn-info btn-sm">查询</button>
            </div>
            <div class="col-md-2">
              <button id="apply_info_btn" type="button" class="btn btn-primary btn-sm">确定</button>
            </div>
       </div>
       <hr>
       <div class="row">
           <div class="col-md-12">
             <table class="table table-bordered" id="weekApplyInformation_table">
             <thead>
               <tr>
                 <th class="text-center">时间段</th>
                 <th class="text-center">星期一</th>
                 <th class="text-center">星期二</th>
                 <th class="text-center">星期三</th>
                 <th class="text-center">星期四</th>
                 <th class="text-center">星期五</th>
                 <th class="text-center">星期六</th>
                 <th class="text-center">星期日</th>
               </tr>
              </thead>
              <tbody>
              </tbody>
             </table>
          </div>
        
       </div> 
       <hr>
      <p  class="text-success"><kbd>操作说明:</kbd>通过按钮先选择实验室，并设置起始周，点击查询显示该实验室在起始周的排课情况，点击选课并设置结束周后，点击申请便可以申请多课时选课！</p>
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
    
    var strcheck = null;
    var labname = null;
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
    
    $("#log_apply_btn").click(function(){
        //2,先进行时间冲突判断，给用户相应的提示信息，在根据信息是否提交申请
        //1,提出时间段数组，进行遍历检测
        var classname = $("#input_log_classname").val();
        var subject = $("#input_log_subject").val();
         $.ajax({
            url:"${APP_PATH}/RecordController/mutlipleRecords", 
            type:"POST",
            data:{labname:labname,info:strcheck},
            success:function(result){
            	var applydates = result.extend.applydates;
            	var applyperiods = result.extend.applyperiods;
            		var judge = 0;
            	//1,先遍历对象，进行时间冲突判断
            	$.each(applydates,function(index,item){
            		var applydate = item;
            		var period = applyperiods[index];
            		//这里说一下：由于这里的applydate类型传入后为string类型，故只能新建一个多时段时间冲突检测方法
            		 $.ajax({
            	            url:"${APP_PATH}/RecordController/mutlipleTimeConflict",
            	            type:"GET",
            	            data:{period:period,applydate:applydate,classname:classname,subject:subject},
            	            success:function(result){
            	                var flag = result.extend.flag;
            	                if(flag == 1){
            	                    judge = 1;
            	                }
            	            }
            	        });
            	});
            	//2,询问后在进行遍历存储
            		 if(judge == 1){
            			 layer.confirm(subject+classname+' 在该时间段已有了 课程!   确认继续申请吗？', {
                             btn: ['确定','取消'] //按钮
                           }, function(){
                        	   $.each(applydates,function(index,item){
                        		   var applydate = item;
                                   var period = applyperiods[index];
                                   submitApply(applydate,period);
                        	   });
                           }, function(){
                             $("#LabApplyModal").modal("hide");
                             layer.msg('已取消申请',{icon: 1});
                           });
            		 }else{
            			 $.each(applydates,function(index,item){
                             var applydate = item;
                             var period = applyperiods[index];
                             submitApply(applydate,period);
                         });
            			 $("#input_log_classname").val("");
                         $("#input_log_subject").val("");
                         $("#input_log_assistant").val("");
                         $("#input_log_course").val("");
            		 }
            }
         });
        
    });
    
    //与普通申请不同，由于多时间段的申请，日期和时间段需要单独输入
    function submitApply(applydate,period){
    	var username = $("#input_username").val();
    	var labname = $("#input_labname").val();
    	var assistant = $("#input_log_assistant").val();
    	var classname = $("#input_log_classname").val();
    	var subject = $("#input_log_subject").val();
    	var course = $("#input_log_course").val();
         $.ajax({
             url:"${APP_PATH}/RecordController/mutipleRecord",
             type:"POST",
             data:{username:username,
            	   labname:labname,
            	   assistant:assistant,
            	   classname:classname,
            	   subject:subject,
            	   course:course,
            	   applydate:applydate,
            	   period:period
                },
             success:function(result){
                 $("#LabApplyModal").modal("hide");
                 var id = result.extend.id;
                 InsertApplyLogs(id);
             }
         });
    }
    
    //插入一条正在申请的日志,传入一条申请记录的id
    function InsertApplyLogs(id){
        $.ajax({
            url:"${APP_PATH}/LogsController/applyRecord",
            type:"POST",
            data:"id="+id,
            success:function(result){
            }
        });
    }
    
    $("#laboratory_select_btn").click(function(){
    	$("#labSelectModal").modal("show");
    });
    
    var blurredLabname = "";
    $("#blurredselect").change(function(){
        blurredLabname = $("#blurredselect").val();
        if(blurredLabname != null){
           labToPage(1,blurredLabname);
        }
    });
    
     function labToPage(pn){
    	 $.ajax({
             url:"${APP_PATH}/LaboratoryController/blurredLabname",
             type:"GET",
             data:{pn:pn,blurredLabname:blurredLabname},
             success:function(result){
            	  build_laboratorys_tbody(result);
                  build_page_info(result,"#table_info_area");
                  build_page_nav(result,"#table_nav_area",labToPage);
             }
         });
     }
     
     $(document).on("click",".selectLab_btn",function(){
         var labname = $(this).attr("labname");
         $("#labname_title").text(labname);
         $("#labSelectModal").modal("hide");
         layer.msg("实验室设为"+labname+',请进行下一步操作！',{icon:1});
     });
     
     $("#apply_info_btn").click(function(){
    	  var checkapplys = new Array();
    	  $("table input:checked").each(function(){
    		  checkapplys.push($(this).val());
    	  });
    	  var startWeek = judgeWeek($("#startWeekSelect").val());
    	  checkapplys.push(startWeek);
    	  var endWeek = judgeWeek($("#endWeekSelect").val());
    	  checkapplys.push(endWeek);
    	  if(endWeek < startWeek){
    		  layer.open({
    			  title: '操作错误'
    			  ,content: '结束周需要不小于起始周！',
    			  icon : 7
    			});  
    		  return false;
    	  }
          var labname = $("#labname_title").text();
    	   strcheck = checkapplys.join('-');
    	  //var weekday = ["星期一","星期二","星期三","星期四","星期五","星期六","星期天"];
          //var dayperiods = ["第一 二节","第三 四节","第五 六节","第七 八节","第九 十一节"];
         // var str = "";
    	 // $.each(checkapplys,function(index,item){
    		//  var i = parseInt(item) / 10;
    		  //var j = parseInt(item) % 10;
    		//  var str =  str + weekday[i] + dayperiods[j] + "-";
    	  //});
    	 $.ajax({
    		url:"${APP_PATH}/RecordController/mutlipleRecords", 
    		type:"POST",
    		data:{labname:labname,info:strcheck},
    		success:function(result){
    			$("#input_reqdate").text(result.extend.applysInfo);
    			$("#input_labname").val(labname.replace(/(|)(\d)/g,"$1\n$2"));
    			$("#LabApplyModal").modal({
    	            backdrop:"static"
    	        });
    		}
    	 });
     });
    
     function judgeWeek(week){
    	 var endWeek = null;
    	 switch(week){
         case "oneWeek" : endWeek = 1; break;
         case "twoWeek" : endWeek = 2; break;
         case "threeWeek" : endWeek = 3; break;
         case "fourWeek" : endWeek = 4; break;
         case "fiveWeek" : endWeek = 5; break;
         case "sixWeek" : endWeek = 6; break;
         case "sevenWeek" : endWeek = 7; break;
         case "eightWeek" : endWeek = 8; break;
         case "nineWeek" : endWeek = 9; break;
         case "tenWeek" : endWeek = 10; break;
         case "elevenWeek" : endWeek = 11; break;
         case "twelveWeek" : endWeek = 12; break;
         case "threeteenWeek" : endWeek = 13; break;
         case "fourteenWeek" : endWeek = 14; break;
         case "fiveteenWeek" : endWeek = 15; break;
         case "sixteenWeek" : endWeek = 16; break;
         }
    	 return endWeek;
     }
     
    $("#findWeekInfo").click(function(){
        var username = $("#sessionUsername").text();
        var weekDate = judgeWeek($("#startWeekSelect").val());
        var labname = $("#labname_title").text();
        
        $.ajax({
            url:"${APP_PATH}/UserController/WeekApplyByLabname",
            type:"GET",
            data:{labname:labname,weekDate:weekDate},
            success:function(result){
                //applys为一个7x5的二维数组
                var applys = result.extend.doubleapplys;
                var dayperiods = ["第一 二节","第三 四节","第五 六节","第七 八节","第九 十一节"];
               // var periods = ["one","three","five","seven","nine"];
                for(var i = 0 ; i < 5 ; i++){
                    var dayperiod = $("<td></td>").append(dayperiods[i]);
                    dayperiod.attr("style","vertical-align:middle");
                    if(applys[0][i] == 0){
                       var Monday = $("<td></td>").append("<input type='checkbox' value='0"+i+"'  style='width:100%; height: 100%'/>").addClass("success");
                    }else{
                       var Monday = $("<td></td>").append("满").addClass("danger");
                    }
                       Monday.attr("height","80"); Monday.attr("style","vertical-align:middle");
                    if(applys[1][i] == 0){
                        var Tuesday = $("<td></td>").append("<input type='checkbox' value='1"+i+"'  style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Tuesday = $("<td></td>").append("满").addClass("danger");
                     }
                    Tuesday.attr("style","vertical-align:middle");
                    if(applys[2][i] == 0){
                        var Wednesday = $("<td></td>").append("<input type='checkbox' value='2"+i+"' name='check' style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Wednesday = $("<td></td>").append("满").addClass("danger");
                     }
                    Wednesday.attr("style","vertical-align:middle");
                    if(applys[3][i] == 0){
                        var Thurday = $("<td></td>").append("<input type='checkbox' value='3"+i+"' name='check' style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Thurday = $("<td></td>").append("满").addClass("danger");
                     }
                    Thurday.attr("style","vertical-align:middle");
                    if(applys[4][i] == 0){
                        var Friday = $("<td></td>").append("<input type='checkbox' value='4"+i+"' name='check' style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Friday = $("<td></td>").append("满").addClass("danger");
                     }
                    Friday.attr("style","vertical-align:middle");
                    if(applys[5][i] == 0){
                        var Saturday = $("<td></td>").append("<input type='checkbox' value='5"+i+"' name='check' style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Saturday = $("<td></td>").append("满").addClass("danger");
                     }
                    Saturday.attr("style","vertical-align:middle");
                    if(applys[6][i] == 0){
                        var Sunday = $("<td></td>").append("<input type='checkbox' value='6"+i+"' name='check' style='width:100%; height: 100%'/>").addClass("success");
                     }else{
                        var Sunday = $("<td></td>").append("满").addClass("danger");
                     }
                    Sunday.attr("style","vertical-align:middle");
                    $("<tr></tr>").addClass("text-center").append(dayperiod)
                                  .append(Monday)
                                  .append(Tuesday)
                                  .append(Wednesday)
                                  .append(Thurday)
                                  .append(Friday)
                                  .append(Saturday)
                                  .append(Sunday)
                                  .appendTo("#weekApplyInformation_table tbody");
                }
            }
        });
    });
    
    
    function build_laboratorys_tbody(result){
        $("#laboratoryInformation_table tbody").empty();
        var labs = result.extend.pageInfo.list;
        $.each(labs,function(index,item){
        var labnameTd = $("<td></td>").append(item.labname);
        var numTd = $("<td></td>").append(item.personnum);
        var introduceTd = $("<td></td>").append(item.introduce);
        var uIdTd = $("<td></td>").append(item.uId); 
        var selectBtn = $("<button></button>").addClass("btn btn-success btn-sm selectLab_btn")
        .append($("<span></span>").addClass("glyphicon glyphicon-comment")).append("选择");
        //给申请button添加该行的申请id，方便操作
        selectBtn.attr("labname",item.labname);
        $("<tr></tr>").addClass("text-center").append(labnameTd)
                      .append(numTd)
                      .append(introduceTd)
                      .append(uIdTd)
                      .append(selectBtn)
                      .appendTo("#laboratoryInformation_table tbody");
        });
    }
    
    function build_page_info(result,site){
        $(site).empty();
        $(site).append("当前"+result.extend.pageInfo.pageNum 
                +"页，总页数"+result.extend.pageInfo.pages 
                +"页，总"+ result.extend.pageInfo.total +"条数")
          totalRecord = result.extend.pageInfo.total;
          currentPage = result.extend.pageInfo.pageNum;
    }
    
    //解析显示分页条 ,点击分页有相应的功能跳转
    function build_page_nav(result,site,suitfunction){
        $(site).empty();
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
             suitfunction(1,blurredLabname);
         });   
         prePageLi.click(function(){
             suitfunction(result.extend.pageInfo.pageNum - 1,blurredLabname);
         });
       }
       
       var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
       var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
       if(result.extend.pageInfo.hasNextPage == false){
           nextPageLi.addClass("disabled");
           lastPageLi.addClass("disabled");
       }else{
              lastPageLi.click(function(){
                  suitfunction(result.extend.pageInfo.pages,blurredLabname);
               });     
               nextPageLi.click(function(){
                   suitfunction(result.extend.pageInfo.pageNum + 1,blurredLabname);
               }); 
       }
       
       ul.append(firstPageLi).append(prePageLi);
       $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
           var numLi = $("<li></li>").append($("<a></a>").append(item));
           if(result.extend.pageInfo.pageNum == item){
               numLi.addClass("active");
           }
           numLi.click(function(){
               suitfunction(item,blurredLabname);
           });
           ul.append(numLi);
       });
       ul.append(nextPageLi).append(lastPageLi);
       
       var navEle = $("<nav></nav>").append(ul);
       navEle.appendTo(site);
    }
    
    $("#select_class_btn").click(function(){
        $("#LabApplyModal").modal("hide");
        $("#selectClassModal").modal({
            backdrop:"static"
        }); 
        
        classToPage(1);
    });
    
    function classToPage(pn){
        $.ajax({
            url:"${APP_PATH}/classes",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
               //1.在页面解析并显示课程数据
               build_classes_table(result);
               //2.解析并显示分页信息
               build_page_info(result,"#page_info_area");
               //3.解析显示分页条数据
               build_page_nav(result,"#page_nav_area",classToPage);
            }
        });
    }
    
    function build_classes_table(result){
        $("#classes_table tbody").empty();
        var classes = result.extend.pageInfo.list;
        $.each(classes,function(index,item){
            var classnameTd = $("<td></td>").append(item.classname);
            var numberTd = $("<td></td>").append(item.number);
            var gradeTd = $("<td></td>").append(item.grade);
            var subjectTd = $("<td></td>").append(item.subject);
            var selectBtn = $("<button></button>").addClass("btn btn-primary btn-sm select_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-check")).append("选择");
            
             $("<tr></tr>").append(classnameTd)
             .append(numberTd)
             .append(gradeTd)
             .append(subjectTd)
             .append(selectBtn)
             .appendTo("#classes_table tbody");
        });
    }
    
    $("#blurredCourseSelect").change(function(){
        var blurredCourse = $("#blurredCourseSelect").val();
        if(blurredCourse != null){
        $.ajax({
            url:"${APP_PATH}/CourseController/blurredCourse",
            type:"GET",
            data:{blurredCourse:blurredCourse},
            success:function(result){
                build_course_tbody(result);
                build_page_info(result,"#course_page_info_area");
                build_page_nav(result,"#course_page_nav_area",getPageCourses);
            }
        });
        }
    });
    
    $("#select_course_btn").click(function(){
        $("#LabApplyModal").modal("hide");
        $("#selectCourseModal").modal({
            backdrop:"static"
        });
        
        getPageCourses(1);
    });
    
    function getPageCourses(pn){
        $.ajax({
            url:"${APP_PATH}/CourseController/course",
            type:"GET",
            data:"pn="+pn,
            success:function(result){
                build_course_tbody(result);
                build_page_info(result,"#course_page_info_area");
                build_page_nav(result,"#course_page_nav_area",getPageCourses);
            }
        });
    }
    
    function build_course_tbody(result){
        $("#courses_table tbody").empty();
        var courses = result.extend.pageInfo.list;
        var flag = 0;
        $.each(courses,function(index,item){
            var courseNameTd = $("<button></button>").append(item.coursename);
            courseNameTd.attr("courseName",item.coursename)
            switch(flag){
            case 0: courseNameTd.addClass("btn btn-success course_btn"); break;
            case 1: courseNameTd.addClass("btn btn-info course_btn"); break;
            case 2: courseNameTd.addClass("btn btn-warning course_btn"); break;
            case 3: courseNameTd.addClass("btn btn-danger course_btn"); break;
            }
                courseNameTd.appendTo("#courses_table tbody");
                flag = flag + 1;
            if(flag == 4){
               flag = 0;
            }
        });
    }
    
    $(document).on("click",".course_btn",function(){
        $("#selectCourseModal").modal("hide");
        $("#LabApplyModal").modal({
            backdrop:"static"
        });
        $("#input_log_course").val($(this).attr("courseName"));
    });
    
    $(document).on("click",".select_btn",function(){
        $("#LabApplyModal").modal({
            backdrop:"static"
        }); 
        $("#selectClassModal").modal("hide");
        $("#input_log_classname").val($(this).parent("tr").find("td:eq(0)").text());
        $("#input_log_subject").val($(this).parent("tr").find("td:eq(2)").text());
    });
  </script>
</body>
</html>