<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/head.jsp"%>
</head>

<body>
    <%@ include file="common/topbar.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <%@ include file="common/sidebar.jsp"%>

            <main role="main" class="col-md-8 ml-sm-auto col-lg-10 px-4">
                <div class="container" style="margin-top: 5%">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h2>管理员登陆</h2>
                        </div>
                    </div>

                    <div class="card" style="margin: 25%;margin-top: 0%">
                        <div class="card-body" >
                            <h4 class="card-title text-center">登陆系统</h4>
                            <form id="signupForm" action="<c:url value="/blog/session.do"/> " method="post">
                                <div class="form-group">
                                    <label for="username">用户名:</label>
                                    <input name="userName" type="text" class="form-control" id="username" placeholder="请输入用户名" value="${userName}">
                                    <c:if test="${msg!=null}">
                                        <div class="alert alert-danger alert-dismissible">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <strong>登陆失败!</strong> ${msg}
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="password">密码:</label>
                                    <input type="password" class="form-control" name="userPassword" id="password" placeholder="请输入密码">
                                </div>
                                <button type="submit" class="btn btn-primary" style="margin-left:40% ">登陆</button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

        </div>
    </div>

    <script type="text/javascript">
        $().ready(function() {
            $("#signupForm").validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 2,
                        maxlength:10
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {
                    username: {
                        required: "请输入用户名",
                        minlength: "用户名必需由两个字母组成",
                        maxlength: "用户名不能超过10个字符"
                    },
                    password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 5 个字母"
                    }
                }
            });
        });
    </script>
</body>
</html>
