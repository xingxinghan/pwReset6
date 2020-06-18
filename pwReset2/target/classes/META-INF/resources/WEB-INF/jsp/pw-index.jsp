<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>上网密码重置系统</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<style type="text/css">

body {
	background: url(${pageContext.request.contextPath }/images/bg-library.png) no-repeat center center;
	background-attachment: fixed; 
	background-size:cover;
	overflow: hidden;
}


#top {
	 background-color:rgba(86,88,84,0.4);
	  background-attachment: fixed; 
	background-size:cover;
} 
</style>
</head>
<body>
	
	<!-- 顶栏 -->
	<%-- <div id="top" class="row">
		<div class="col-md-2" >
			<button type="button" style="margin-top:18px;margin-left:30px;" class="btn btn-primary" οnclick="javascript:window.location.href='${pageContext.request.contextPath }'">主页</button>
		</div>	
		<div class="col-md-4" style="font-family:FangSong_GB2312; margin-left:50px;margin-top:12px;letter-spacing:2px;font-size:26px;color:#07272D;">
			<p>上网密码修改</p>
		</div>	
		<div style="text-align:right;margin-right: 25px;">
			<img src="images/netcenter.png" width="20%"/>
		</div>
	
	</div> --%>
	
	<!-- 顶栏 -->
<%-- 	<div id="top" class="row">
			
		<div class="col-md-2">	
			<img style="display: inline-block; vertical-align: middle;" src="${pageContext.request.contextPath}/images/netcenter.png" width="200%"/>
		</div>
		<div class="col-md-5 col-md-offset-2" 
			style="padding-top:22px;font-size:15px;letter-spacing: 2px;font-family: Times New Roman;font-weight: 1000;">
			<a href="${pageContext.request.contextPath}/" style="color: #5D5D59;">主页</a>
		</div>	
		<div class="col-md-3" style="font-family:FangSong_GB2312;margin-top:14px;letter-spacing:2px;font-size:26px;color:#07272D;">
			<p style="text-align: right;">密码修改</p>
		</div>
		<!-- <div style="text-align:right;margin-right: 25px;">
			<img src="images/netcenter.png" width="20%"/>
		</div> -->
		

	</div> --%>
	
		<!-- 顶栏 -->
	<div id="top" class="row">
			
		<div class="col-md-5 col-md-offset-1" 
			style="padding-top:16px;font-family:FangSong_GB2312;letter-spacing:2px;font-size:21px;font-weight: 1000;">
			<a href="${pageContext.request.contextPath}/" style="color: #DF2114;">主页</a>
		</div>	
		<div class="col-md-6" style="display:inline-block; float:right;">
			<img style="display:inline-block; float:right;vertical-align: middle;" src="${pageContext.request.contextPath}/images/netcenter.png" width="60%" />
		</div>
		

	</div>
	
	<!-- 中间主体 -->
	<div class="container">
		<div class="row">
			<!-- 左边导航栏 -->
			<jsp:include page="/WEB-INF/jsp/pw-body.jsp"></jsp:include>

		</div>

	</div>
	
	
	<script>
	    var t=600;
	    var timer=setInterval(time,1000);
	    function time(){
	        t--;
	        if (t==0){
	            clearInterval(timer);
				return window.location.href='${pageContext.request.contextPath}/';
	        }console.log(t);
	    }
	
		
	</script>
	
	
</body>

</html>