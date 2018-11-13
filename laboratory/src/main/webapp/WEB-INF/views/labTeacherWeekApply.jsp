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
	       <div class="col-md-3">
	         <select id="weekSelect" class="btn btn-default btn-sm">
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
			
			<div class="col-md-2 ">
			  <button id="findWeekInfo" type="button" class="btn btn-info btn-sm">查询</button>
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
    
    $(document).ready(function(){
    	$.ajax({
    		url:"${APP_PATH}/UserController/getlabnameByUsername",
    		type:"GET",
    		data:"sessionUsername="+$("#sessionUsername").text(),
    		success:function(result){
    			$("#labname_title").text(result.extend.labname);
    		}
    	});
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
      
    $("#findWeekInfo").click(function(){
    	var username = $("#sessionUsername").text();
        var weekDate = null;
        
        switch($("#weekSelect").val()){
        case "oneWeek" : weekDate = 1; break;
        case "twoWeek" : weekDate = 2; break;
        case "threeWeek" : weekDate = 3; break;
        case "fourWeek" : weekDate = 4; break;
        case "fiveWeek" : weekDate = 5; break;
        case "sixWeek" : weekDate = 6; break;
        case "sevenWeek" : weekDate = 7; break;
        case "eightWeek" : weekDate = 8; break;
        case "nineWeek" : weekDate = 9; break;
        case "tenWeek" : weekDate = 10; break;
        case "elevenWeek" : weekDate = 11; break;
        case "twelveWeek" : weekDate = 12; break;
        case "threeteenWeek" : weekDate = 13; break;
        case "fourteenWeek" : weekDate = 14; break;
        case "fiveteenWeek" : weekDate = 15; break;
        case "sixteenWeek" : weekDate = 16; break;
        }
        
        $.ajax({
            url:"${APP_PATH}/UserController/WeekApplyInformation",
            type:"GET",
            data:{sessionUsername:username,weekDate:weekDate},
            success:function(result){
            	//applys为一个7x5的二维数组
            	$("#weekApplyInformation_table tbody").empty();
                var applys = result.extend.doubleapplys;
                var dayperiods = ["第一 二节","第三 四节","第五 六节","第七 八节","第九 十一节"];
               // var periods = ["one","three","five","seven","nine"];
                for(var i = 0 ; i < 5 ; i++){
                	var dayperiod = $("<td></td>").append(dayperiods[i]);
                	dayperiod.attr("style","vertical-align:middle");
                	if(applys[0][i] == 0){
                	   var Monday = $("<td></td>").append("空").addClass("success");
	                }else{
	                   var Monday = $("<td></td>").append("满").addClass("danger");
	                }
	                   Monday.attr("height","80"); Monday.attr("style","vertical-align:middle");
                	if(applys[1][i] == 0){
                        var Tuesday = $("<td></td>").append("空").addClass("success");
                     }else{
                        var Tuesday = $("<td></td>").append("满").addClass("danger");
                     }
                	Tuesday.attr("style","vertical-align:middle");
                	if(applys[2][i] == 0){
                        var Wednesday = $("<td></td>").append("空").addClass("success");
                     }else{
                        var Wednesday = $("<td></td>").append("满").addClass("danger");
                     }
                	Wednesday.attr("style","vertical-align:middle");
                	if(applys[3][i] == 0){
                        var Thurday = $("<td></td>").append("空").addClass("success");
                     }else{
                        var Thurday = $("<td></td>").append("满").addClass("danger");
                     }
                	Thurday.attr("style","vertical-align:middle");
                	if(applys[4][i] == 0){
                        var Friday = $("<td></td>").append("空").addClass("success");
                     }else{
                        var Friday = $("<td></td>").append("满").addClass("danger");
                     }
                	Friday.attr("style","vertical-align:middle");
                	if(applys[5][i] == 0){
                        var Saturday = $("<td></td>").append("空").addClass("success");
                     }else{
                        var Saturday = $("<td></td>").append("满").addClass("danger");
                     }
                	Saturday.attr("style","vertical-align:middle");
                	if(applys[6][i] == 0){
                        var Sunday = $("<td></td>").append("空").addClass("success");
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
  </script>
</body>
</html>