<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更改密码</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/k3.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 100px"></div>
<div style="position: relative">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>
<div class="col-xs-4 col-md-offset-4" style="position: relative;">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            <h3 class="panel-title">密码修改</h3>
        </div>
        <div class="panel-body">
            <form method="post" action="admin_repasswd_do" class="form-inline" id="repasswd">
                <div class="input-group">
					<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control">
				</div>
				<div class="input-group">
					<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control js-password-control1">
					<div class="input-group-addon js-password-btn1"><span class="glyphicon glyphicon-eye-open"></span></div>
				</div>
				<div class="input-group">
					<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control js-password-control2">
					<div class="input-group-addon js-password-btn2"><span class="glyphicon glyphicon-eye-open"></span></div>
                </div>
					
				</br>
				<p style="text-align: right;color: red;position: absolute" id="tishi"></p>
				<span>
				</br><div align="center"><input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left" draggable="true"></div>
				</span>
				
            </form>
        </div>
    </div>
</div>
	<script>
	$(document).ready(function(){
		var flag = 1;
		$(".js-password-btn1").click(function(event) {
			if( flag === 1 ){
				$(".js-password-control1").attr("type","text");
				flag = 0;
			}else{
				$(".js-password-control1").attr("type","password");
				flag = 1;
			}
		});
	});
	</script>
	<script>
	$(document).ready(function(){
		var flag1 = 1;
		$(".js-password-btn2").click(function(event) {
			if( flag1 === 1 ){
				$(".js-password-control2").attr("type","text");
				flag1 = 0;
			}else{
				$(".js-password-control2").attr("type","password");
				flag1 = 1;
			}
		});
	});
	</script>
<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tishi").text("两次输入的新密码不同，请检查");
        } else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tishi").text("请填写完毕后提交");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tishi").text("两次输入的新密码不同，请检查");
            return false;
        }
    })
</script>
</body>
</html>
