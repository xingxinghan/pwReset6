<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>综合服务系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/qwebchannel.js"></script>
<style type="text/css">
body {
	background: url(images/bg-library.png) no-repeat center center;
	background-attachment: fixed; 
	background-size:cover;
	overflow: hidden;
}

#top {
	 
	background-color:rgba(86,88,84,0.4);
	background-attachment: fixed; 
	background-size:cover; 
} 
#title{

	font-family:SimSun;
}

/* 选择id为login-box的所有元素，进行设置 */
#login-box {
	/* border:1px solid #F00; */
	padding: 40px;
	border-radius: 50px;
	color: #000000;
}
button { /* 按钮美化 */
	width:50px;
	height:50px;
	margin:5px;
	background-color: #66CDAA; 
	color: black;
}
#theme{
	
	
	margin-top:150px;
	align-content:center;
	
	background-color:rgba(70,130,180,0.4);
}

#ibody{
	
	border-radius: 5px;
	margin-top:150px;
	align-content:center;
	
	background-attachment: fixed; 
	background-size:cover; 
	background-color:rgba(211,211,211,0.6);
}

</style>
</head>


<body>


<!-- 顶栏 -->
<!-- <div id="top" class="row">	
	<img src="images/netcenter.png" width="20%"/>
</div> -->
<div id="top" class="row">
		<div class="col-md-2">	
			<img style="display: inline-block; vertical-align: middle;" src="images/netcenter.png" width="200%"/>
		</div>
</div>
 
<div class="container">
<div class="col-md-12 col-md-offset-2">


<div class="row">
	<div  class="col-md-9" id="ibody">
		<div class="row" style="margin: 50px;">
				<div class="col-md-2" id="mmxg">
					<div class="text-center">
						<a href="${pageContext.request.contextPath }/pwReset">
							<img src="images/mmxg.png" width="90%"/>
						</a>
						
					</div>
					
					<div class="text-center" style="margin-top:10px;">
						密码修改
					</div>
				 
			
				</div>
				<div class="col-md-2" id="qywx"> 
					<div class="text-center">
						<a href="${pageContext.request.contextPath }/wechat">
							<img src="images/qywx.png" width="90%"/>
						</a>
						
					</div>
					
					<div class="text-center" style="margin-top:10px;">
						企业微信
					</div>
				</div>
		
		</div>
		
	
	
	 
	</div>
</div>
</div>
</div>
	
</body>
</html>