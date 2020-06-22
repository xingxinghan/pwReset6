<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/qwebchannel.js"></script>
<script src="${pageContext.request.contextPath }/js/cardread.js"></script>
<style type="text/css">


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
	background-color: rgba(8, 61, 101,0.5); 
	color: black;
}
#boarder{
	
	border-radius: 5px;
	margin:50px 100px;
	padding:12px;
	align-content:center;
	color:#EEEEEE;
	background-color: rgba(125, 124, 121,0.2);
}
#hint{
	
	border-radius: 5px;
	margin-top:110px;
	margin-left:30%;
	
	
	background-color:rgba(211,211,211,0.8);
}

.modal-content{
	background-color:rgba(255,255,255,0.9);
	
}

</style>
</head>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<body>


	
<div id="app">
	<div class="container">
		
		<div class="row" style="margin-top: 100px;">
			<div class="text-center" id="title">
				<h1 style="font-family:SimHei">若需要修改上网密码，请先贴卡 </h1>
			
			</div>
		
		</div>
		
		<div class="row" style="margin-top: 50px;" >
			<div class="col-md-4 col-md-offset-4" id="login-box">
				<%-- <form class="form-horizontal" action="${pageContext.request.contextPath }/validateID" method="post">  --%>
				
					<div class="form-group form-group-lg">
						<!-- <label for="inputUsername">学号</label> -->
						<!-- <div class="col-xs-9"> -->
							<input type="text" class="form-control" id="uid" name="stu_num" onkeydown="getEnterKey(event)" onblur="message()"
								 placeholder="学工号">
								 <!-- <input type="text" class="form-control" id="uid" name="stu_num"
								 placeholder="学工号"> -->
							
							
							
						<!-- </div> -->
					</div>
				
				
				<!-- </form> -->
			</div>
			<div class="row"  > 
				<div class="col-md-5" id="hint">
					<p style="margin-top:9px;font-family:STZhongsong;font-size:16px;">提示：若不显示学工号，请先前往卡务中心处理一卡通问题！</p>
				</div>
			
			
		</div>
		</div>
		
	</div>
	
	<!-- validateModal -->
	<div class="modal fade" id="cust_add_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button> -->
					<p class="modal-title" id="myModalLabel" style="font-family: SimHei;font-weight: bold;font-size:20px">身份验证</p>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" name="IDinput">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-8"> 
								<!-- <input type="text" class="form-control" id="add_name" aria-describedby="add_name_desc"
									name="name" placeholder="请输入身份证号">
								<span id="add_name_desc" class="help-block"></span> -->
								
								
     								<input class="form-control" v-model="message" placeholder="请输入身份证号" name="iD_num" disabled>
     								<!-- <button>{{ message }}</button> -->
										<!-- <p>{{ message }}</p> -->  
   								
							</div> 
						</div>
					</form>
						<div class="row" id="boarder">
							<div class="col-md-8">
								<div>
									<button type="button" class="btn btn-lg" @click="one" id="bt">1</button>
									<button type="button" class="btn btn-lg" @click="two">2</button>
									<button type="button" class="btn btn-lg" @click="three">3</button>
								</div>
								
								<div>
									<button type="button" class="btn btn-lg" @click="four">4</button>
									<button type="button" class="btn btn-lg" @click="five">5</button>
									<button type="button" class="btn btn-lg" @click="six">6</button>
								</div>
								
								<div>
									<button type="button" class="btn btn-lg" @click="seven">7</button>
									<button type="button" class="btn btn-lg" @click="eight">8</button>
									<button type="button" class="btn btn-lg" @click="nine">9</button>
									<!-- <button type="button" class="btn btn-default btn-lg" style="width:70px;height:50px" @click="ok">确定</button> -->
								</div>
								
								<div>
									<button type="button" class="btn btn-lg" style="width:115px;" @click="zero">0</button>
									<button type="button" class="btn btn-lg" @click="x">X</button>
								</div>
							
							</div>
							<div>
								<button type="button" class="btn btn-lg" style="width:70px;height:105px;" @click="del">删除</button>
								
								<button type="button" class="btn btn-lg" style="width:70px;height:105px;" @click="clr">清空</button>
							</div>
							
							
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"  data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="validateID()">验证</button>
					<%-- <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath }/validateID"
						id="cust_add_modal_btn">验证</a> --%>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	<script type="text/javascript">
	$(function() {
		$('#uid').focus();
	});
		
	function isnull(val) {
		 
        var str = val.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
 
        if (str == '' || str == undefined || str == null) {
            return true;
            
        } else {
            return false;
        }
    };
  
  
  
 function showw(str){
	 
	 $('#uid').val(str);
	 setTimeout("test()","100");
	 //$('#cust_add_modal').modal('show');
 } 
 
 function modalOut(){
	 alert('11111111');
	 $('#cust_add_modal').modal('show');
 }
 
//init();
    
    
		 function getEnterKey(e){
			var evt = window.event || e; 
			  if (evt.keyCode == 13){
			    //回车事件
			    
			    if(!isnull($("#uid").val())){
			    	
			    	 $('#cust_add_modal').modal('show');
			    }
			   	
			  }
			
		};  
		
		var vm = new Vue({
			
			el: '#app',
			data: {
				message: ''
			},
			
			methods:{
				
				one: function() {
					this.message += '1';
				}, 
				two: function() {
					this.message += '2';
				},
				three: function() {
					this.message += '3';
				},
				four: function() {
					this.message += '4';
				},
				five: function() {
					this.message += '5';
				},
				six: function() {
					this.message += '6';
				},
				seven: function() {
					this.message += '7';
				},
				eight: function() {
					this.message += '8';
				},
				nine: function() {
					this.message += '9';
				},
				zero: function() {
					this.message += '0';
				},
				x: function() {
					this.message += 'X';
				},
				del: function() {
					this.message = this.message.substring(0,this.message.length-1);
				},
				clr: function() {
					this.message = '';
				}
			} 
		});
	
		function validateID(){
			var ID=IDinput.iD_num.value;
			window.location.href="${pageContext.request.contextPath }/pwReset/validateID?uid="+$('#uid').val()+"&iD_num="+ID;
		}; 
		
		
	
	</script>
	
</body>
</html>