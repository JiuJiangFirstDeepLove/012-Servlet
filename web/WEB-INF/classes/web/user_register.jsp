<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/simpleCart.min.js"></script>
    <script src="js/jquery.validate-1.19.3.min.js"></script>
    <script src="js/messages_zh.js"></script>

    <script>
        $(function () {
            $("#signupForm").validate({
                rules: {
                    username:{required:true,rangelength:[4,20]},
                    email:{required:true,email:true},
                    password:{required:true,rangelength:[6,20]}
                },
                messages:{
                    username:{required:"用户名不为空！",rangelength:"字符串长度不对"},
                    email:{required:"邮箱不为空！",email:"不符合邮箱格式"},
                    password:{required:"密码不为空！",rangelength:"字符串长度不对"}
                },

        })
})

    </script>
    <style>
        .error{
            font-style: italic;
            color:red;
        }
    </style>
</head>

<body>

<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="10"></jsp:param>
</jsp:include>
<!--//header-->


<!--account-->
<div class="account">
    <div class="container-fluid">
        <div class="register">
            <c:if test="${!empty msg }">
                <div class="alert alert-danger">${msg }</div>
            </c:if>
            <form action="/user_rigister" method="post"  id="signupForm" >
                <div class="register-top-grid">
                    <h3>注册新用户</h3>
                    <div class="form-group row">
                        <span>用户名 <label style="color:red;" class="col-form-label">*</label></span>
                        <input type="text" name="username" placeholder="请输入用户名"  id="username">
                    </div>
                    <div class="input">
                        <span>邮箱 <label style="color:red;">*</label></span>
                        <input type="text" name="email" placeholder="请输入邮箱"  id="email">
                    </div>
                    <div class="input">
                        <span>密码 <label style="color:red;">*</label></span>
                        <input type="password" name="password" placeholder="请输入密码"  id="password">
                    </div>
                    <div class="input">
                        <span>收货人<label></label></span>
                        <input type="text" name="name" placeholder="请输入收货" id="name">
                    </div>
                    <div class="input">
                        <span>收货电话<label></label></span>
                        <input type="text" name="phone" placeholder="请输入收货电话" id="phone">
                    </div>
                    <div class="form-group row">
                        <span>收货地址<label></label></span>
                        <input type="text" name="address" placeholder="请输入收货地址" id="address">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交" class="submit" onclick="" >
                    <div class="clearfix"></div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--//account-->


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
<!--//footer-->


</body>
</html>