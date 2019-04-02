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
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">文章列表</h1>
            </div>
            <h2>全部</h2>
            <div class="table-responsive">
                <table class="table table-hover table-sm">
                    <tbody>
                    <c:if test="${articles!=null}">
                        <c:forEach items="${articles}" var="article">
                            <tr>
                                <td>
                                    <div class="card">
                                        <div class="card-body">
                                            <a href="<c:url value="/blog/articles/${article.articleId}.do"/> " class="card-link">
                                                <h4 class="card-title">${article.articleTitle}</h4>
                                            </a>
                                            <p class="card-text">${article.atricleDate}</p>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </main>

    </div>
</div>


</body>
</html>
