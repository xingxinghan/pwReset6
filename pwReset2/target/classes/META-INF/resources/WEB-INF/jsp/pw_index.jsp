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
	  background: url(images/login_bg.jpg);  
}
</style>
</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="/WEB-INF/jsp/top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container">
		<div class="row">
			<!-- 左边导航栏 -->
			<jsp:include page="/WEB-INF/jsp/pw-body.jsp"></jsp:include>

		</div>

	</div>
</body>

</html>