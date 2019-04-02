<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/css/editormd.css"/> "></link>
    <%@ include file="common/head.jsp"%>
    <script src="<c:url value="/editormd.min.js"/> "></script>
    <script src="<c:url value="/lib/marked.min.js"/>"></script>
    <script src="<c:url value="/lib/prettify.min.js"/> "></script>
    <script src="<c:url value="/lib/raphael.min.js"/> "></script>
    <script src="<c:url value="/lib/underscore.min.js"/> "></script>
    <script src="<c:url value="/lib/sequence-diagram.min.js"/> "></script>
    <script src="<c:url value="/lib/flowchart.min.js"/> "></script>
    <script src="<c:url value="/lib/jquery.flowchart.min.js"/> "></script>

</head>

<body>
<%@ include file="common/topbar.jsp"%>

<div class="container-fluid">
    <div class="row">
        <%@ include file="common/sidebar.jsp"%>

        <main role="main" class="col-md-8 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="mx-auto">${article.article.articleTitle}</h1>
                <span>
                    <c:if test="${author!=null}">
                        <a class="btn btn-outline-primary" href="<c:url value="/blog/article/${article.article.articleId}.do"/> ">编辑</a>
                        <button class="btn btn-outline-primary" onclick="deleteArticle(${article.article.articleId});">删除</button>
                    </c:if>
                </span>
            </div>

            <div class="container">
                <div id="content-text">
                    <textarea style="display:none;">${article.article.articleContent}</textarea>
                </div>
            </div>

            <div class="border-top">
                <h3>文章评论</h3>
                <table class="table table-striped ">
                    <tbody>
                    <c:if test="${article.comments!=null || article.comments.size()>0}">
                        <c:forEach items="${article.comments}" var="comment">
                            <tr>
                                <td>
                                    作者：${comment.commentAuthor}<br>
                                    评论：${comment.commentContent}<br>
                                    <c:if test="${author!=null}">
                                        <button class="btn btn-link">回复</button>
                                        <button class="btn btn-link">删除</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <div class="border-top">
                    <h3>发表评论</h3>
                    <form action="<c:url value="/blog/comments/${article.article.articleId}.do"/> " method="post">
                        <input type="hidden" name="commentArticle" value="${article.article.articleId}">
                        作者：
                        <input class="form-control" placeholder="请输入您的大名" name="commentAuthor">
                        内容：
                        <textarea class="form-control" rows="3" placeholder="请在这里留下您的评论" name="commentContent"></textarea>
                        <button class="btn btn-outline-primary " type="submit" >提交</button>
                    </form>

                </div>
            </div>
        </main>

    </div>
</div>

<script type="text/javascript">
    $(function () {
        editormd.markdownToHTML("content-text", {
            htmlDecode: "style,script,iframe", //可以过滤标签解码
            emoji: true,
            taskList: true,
            tex: true,               // 默认不解析
            flowChart: true,         // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true
        });
    })
</script>
<script type="text/javascript">
    function deleteArticle(articleId){
        var r=confirm("确认删除这篇文章？");
        if(r){
        $.ajax({
                url:'<c:url value="/blog/article/${articleId}.do"/>',
                type:"DELETE",
                contentType:"application/json",
                success:function (result) {
                    if(result.result=="SUCCESS"){
                        alert(result.msg);
                        window.location.href='<c:url value="/blog/articles/.do"/>';
                    }else{
                        alert(result.msg);
                    }
                }
            });
        }
    }
</script>
</body>
</html>
