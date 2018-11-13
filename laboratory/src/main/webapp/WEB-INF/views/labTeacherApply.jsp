<%@page import="java.util.Calendar"%>
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
   java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(    
           "yyyy-MM-dd ");    
         //java.util.Date currentTime = new java.util.Date(); 
         java.sql.Date currentTime = new java.sql.Date(System.currentTimeMillis());
         String time = simpleDateFormat.format(currentTime).toString();
         java.util.Calendar calendar = Calendar.getInstance(); 
         calendar.setTime(currentTime);
         int i = calendar.get(java.util.Calendar.DAY_OF_WEEK);
         String[] weeks = new String[] {"星期天","星期一","星期二","星期三","星期四","星期五","星期六"};
         String weekNow = weeks[i-1];
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>实验室申请</title>
<style type="text/css">
  body{
    padding-top:70px; }
    
</style>
</head>
<body class="container">
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

     <!-- 实验室申请的模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="LabApplyModal">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">实验室申请</h4>
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
                <div class="col-sm-4">
                <!-- 由于无法通过jquery传入java.util.date -->
                 <input type="text" class="form-control"  name="reqdate" id="input_reqdate"  readonly/>
                </div>
                <div class="col-sm-4">
                 <select class="form-control" name="period" id="select_period">
                </select>
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
                 <p id="sessionUsername" class="text-center">${username }</p>
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
       
       <!-- 显示实验室当前申请表格数据 -->
        <div class="row">
         <div class="col-md-9 col-md-offset-3">
             <form class="form-inline">
              <div class="form-group">
                <input id="blurredselect" type="text" class="form-control" placeholder="要查询的实验室">
              </div>
              <div class="form-group">
                <p  class="form-control-static" id="alter_time">&nbsp;&nbsp;&nbsp;&nbsp;查询日期：
                 &nbsp;&nbsp;&nbsp;&nbsp;
                </p>
              </div>
              <div class="form-group">
                <p  class="form-control-static" id="alter_day">
                 <%= weekNow %>&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
              </div>
              <div class="form-group">
               <button type="button" class="btn btn-primary " id="lastday_btn">
                 <span class="glyphicon glyphicon-chevron-left"></span>上一天</button>
               <button type="button" class="btn btn-primary " id="nextday_btn">
               下一天<span class="glyphicon glyphicon-chevron-right"></span></button>
              </div>
            </form>
            <p></p>
         </div>
          <div class="col-md-12">
             <table class="table table-bordered" id="laboratoryInformation_table">
             <thead>
               <tr>
                 <th>实验室名称</th>
                 <th>第1~2节</th>
                 <th>第3~4节</th>
                 <th>第5~6节</th>
                 <th>第7~8节</th>
                 <th>第9~11节</th>
                 <th>Operate</th>
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
 
 <footer>
   <nav class="navbar-default navbar-fixed-bottom text-center">
      <p>版权所有： &copy; 湘大software xc</p>
   </nav>
  </footer>
  
  <script type="text/javascript">
    $("#exit-btn").click(function(){
        window.location.href="index.jsp"; 
    });
    
    var applydate;
    
    //发现在jquery中写java修改时间无效后只好通过返回LaboratoryController页面进行修改
    //通过参入参数值判断，0为获取当天时间，+1为下一天，+2为上一天
    function getTime(flag){
        $.ajax({
            url:"${APP_PATH}/laboratoryController/getTime",
            type:"GET",
            data:"flag="+flag,
            async: false,
            success:function(result){
                var time = new Date(result.extend.alterTime);
                applydate = result.extend.alterTime;
                $("#alter_time").text(time.toLocaleDateString());
                var weeks = new Array(7);
                weeks[0] = "星期天"; weeks[1] = "星期一"; weeks[2] = "星期二"; weeks[3] = "星期三";
                weeks[4] = "星期四"; weeks[5] = "星期五"; weeks[6] = "星期六";
                $("#alter_day").text(weeks[time.getDay()]);
                $("#input_reqdate").val(time);
                applyToPage(1,applydate);
            }
        });
    }
    
    $(document).ready(function(){
        getTime(0);
    });
    
    $("#blurredselect").change(function(){
        var blurredLabname = $("#blurredselect").val();
        if(blurredLabname != null){
        $.ajax({
        	url:"${APP_PATH}/ApplyController/blurredLabname",
        	type:"GET",
        	data:{blurredLabname:blurredLabname,applydate:applydate},
        	success:function(result){
        		build_applys_tbody(result);
                build_page_info(result,"#table_info_area");
                build_page_nav(result,"#table_nav_area",applyToPage);
        	}
        });
        }
    });
    
    $("#blurredCourseSelect").change(function(){
        var blurredCourse = $("#blurredCourseSelect").val();
        if(blurredCourse != null){
        $.ajax({
            url:"${APP_PATH}/CourseController/blurredCourse",
            type:"GET",
            data:{blurredCourse:blurredCourse,applydate:applydate},
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
    
    function applyToPage(pn,applydate){
         $.ajax({
             url:"${APP_PATH}/ApplyController/dateApply",
             type:"GET",
             data:{pn:pn,applydate:applydate},
             success:function(result){
                 build_applys_tbody(result);
                 build_page_info(result,"#table_info_area");
                 build_page_nav(result,"#table_nav_area",applyToPage);
             }
         });
    }
    
    $("#nextday_btn").click(function(){
        getTime(1);
    });
    
    $("#lastday_btn").click(function(){
        getTime(2);
    });
    
    
    function build_applys_tbody(result){
        $("#laboratoryInformation_table tbody").empty();
        var applys = result.extend.pageInfo.list;
        $.each(applys,function(index,item){
        var labnameTd = $("<td></td>").append(item.labname);
           
       if(item.one == 0){
        var oneTd = $("<td></td>").append("空").addClass("success");
       }else{
           var oneTd = $("<td></td>").append("满").addClass("danger");
       }
       
       if(item.three == 0){
           var threeTd = $("<td></td>").append("空").addClass("success");
          }else{
              var threeTd = $("<td></td>").append("满").addClass("danger");
          }
       
       if(item.five == 0){
           var fiveTd = $("<td></td>").append("空").addClass("success");
          }else{
              var fiveTd = $("<td></td>").append("满").addClass("danger");
          }
       
       if(item.seven == 0){
           var sevenTd = $("<td></td>").append("空").addClass("success");
          }else{
              var sevenTd = $("<td></td>").append("满").addClass("danger");
          }
       
       if(item.nine == 0){
           var nineTd = $("<td></td>").append("空").addClass("success");
          }else{
              var nineTd = $("<td></td>").append("满").addClass("danger");
          }
       
        var applyBtn = $("<button></button>").addClass("btn btn-success btn-sm apply_btn")
        .append($("<span></span>").addClass("glyphicon glyphicon-comment")).append("申请");
        //给申请button添加该行的申请id，方便操作
        applyBtn.attr("apply_id",item.applyId);
        $("<tr></tr>").addClass("text-center").append(labnameTd)
                      .append(oneTd)
                      .append(threeTd)
                      .append(fiveTd)
                      .append(sevenTd)
                      .append(nineTd)
                      .append(applyBtn)
                      .appendTo("#laboratoryInformation_table tbody");
        });
    }
        
        $(document).on("click",".apply_btn",function(){
            var applyId = $(this).attr("apply_id");
            //给申请按钮添加该天申请记录的id
            $("#log_apply_btn").attr("logApplyId",applyId);
            var labName = $(this).parent("tr").find("td:eq(0)").text();
            $("#input_labname").val(labName);
            $("#LabApplyModal select").empty();
            //提供可选的时间段period
            var one = $(this).parent("tr").find("td:eq(1)").text();
            if(one == "空"){
                $("<option></option>").append("第1~2节").attr("value","one").appendTo("#LabApplyModal select");
            }
            var three = $(this).parent("tr").find("td:eq(2)").text();
            if(three == "空"){
                $("<option></option>").append("第3~4节").attr("value","three").appendTo("#LabApplyModal select");
            }
            var five = $(this).parent("tr").find("td:eq(3)").text();
            if(five == "空"){
                $("<option></option>").append("第5~6节").attr("value","five").appendTo("#LabApplyModal select");
            }
            var seven = $(this).parent("tr").find("td:eq(4)").text();
            if(seven == "空"){
                $("<option></option>").append("第7~8节").attr("value","seven").appendTo("#LabApplyModal select");
            }
            var nine = $(this).parent("tr").find("td:eq(5)").text();
            if(nine == "空"){
                $("<option></option>").append("第9~11节").attr("value","nine").appendTo("#LabApplyModal select");
            }
            $("#LabApplyModal").modal({
                backdrop:"static"
            });
        });
        
        
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
                 suitfunction(1,applydate);
             });   
             prePageLi.click(function(){
                 suitfunction(result.extend.pageInfo.pageNum - 1,applydate);
             });
           }
           
           var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
           var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
           if(result.extend.pageInfo.hasNextPage == false){
               nextPageLi.addClass("disabled");
               lastPageLi.addClass("disabled");
           }else{
                  lastPageLi.click(function(){
                      suitfunction(result.extend.pageInfo.pages,applydate);
                   });     
                   nextPageLi.click(function(){
                       suitfunction(result.extend.pageInfo.pageNum + 1,applydate);
                   }); 
           }
           
           ul.append(firstPageLi).append(prePageLi);
           $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
               var numLi = $("<li></li>").append($("<a></a>").append(item));
               if(result.extend.pageInfo.pageNum == item){
                   numLi.addClass("active");
               }
               numLi.click(function(){
                   suitfunction(item);
               });
               ul.append(numLi);
           });
           ul.append(nextPageLi).append(lastPageLi);
           
           var navEle = $("<nav></nav>").append(ul);
           navEle.appendTo(site);
        }
        
        $(document).on("click",".select_btn",function(){
            $("#LabApplyModal").modal({
                backdrop:"static"
            }); 
            $("#selectClassModal").modal("hide");
            $("#input_log_classname").val($(this).parent("tr").find("td:eq(0)").text());
            $("#input_log_subject").val($(this).parent("tr").find("td:eq(2)").text());
        });
        
        $("#log_apply_btn").click(function(){
        	//1,先进行时间冲突判断，给用户相应的提示信息，在根据信息是否提交申请
        	var period = $("#select_period").val();
        	var username = $("#sessionUsername").text();
        	var classname = $("#input_log_classname").val();
        	var subject = $("#input_log_subject").val();
        	$.ajax({
        		url:"${APP_PATH}/RecordController/timeConflict",
        		type:"GET",
        		data:{period:period,applydate:applydate,classname:classname,subject:subject},
        		success:function(result){
        			var flag = result.extend.flag;
        			if(flag == 0){
        				submitApply();
        			}else{
        				var record = result.extend.record;
        				layer.confirm(record.subject+record.classname+' 在该时间段已有了 '+record.course+' 课程，在'+record.labname+'!   确认继续申请吗？', {
        					  btn: ['确定','取消'] //按钮
        					}, function(){
        						submitApply()
        					}, function(){
        				      $("#LabApplyModal").modal("hide");
        					  layer.msg('已取消申请',{icon: 1});
        					});
        			}
        		}
        	});
        	
        });
        
        function submitApply(){
        	 $.ajax({
                 url:"${APP_PATH}/RecordController/record",
                 type:"POST",
                 data:$("#LabApplyModal form").serialize(),
                 success:function(result){
                     layer.msg("申请已递交！", {icon: 6});
                     $("#LabApplyModal").modal("hide");
                     $("#input_log_classname").val("");
                     $("#input_log_subject").val("");
                     $("#input_log_assistant").val("");
                     $("#input_log_course").val("");
                     var id = result.extend.id;
                     InsertApplyLogs(id);
                 }
             });
        }
        
        function alterApply(){
           var id = $("#log_apply_btn").attr("logApplyId");
           var period = $("#select_period").val();
           $.ajax({
               url:"${APP_PATH}/ApplyController/apply",
               type:"POST",
               data:{id:id,period:period},
               success:function(result){
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
  </script>
</body>
</html>