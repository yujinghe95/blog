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
    <script src="<c:url value="/editormd.min.js" /> "></script>
</head>

<body>
<%@ include file="common/topbar.jsp"%>

<div class="container-fluid">
    <div class="row">
        <%@ include file="common/sidebar.jsp"%>

        <main role="main" class="col-md-8 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>文章编辑</h2>
            </div>


                <c:choose>
                    <c:when test="${article!=null}">
                        <form method="post" action="<c:url value="/blog/article/${article.articleId}.do"/> ">
                            <input type="hidden" value="${article.articleId}" name="articleId">
                            <h3>标题</h3>
                            <input class="form-control" placeholder="请输入标题" name="articleTitle" value="${article.articleTitle}">
                            <h3>正文</h3>
                            <div class="editormd" id="content" style="margin: 0;">
                                <textarea style="display: none;" class="editormd-markdown-textarea " name="text" id="text">${article.articleContent}</textarea>
                            </div>
                            <button class="btn btn-outline-primary" type="submit" >提交</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form method="post" action="<c:url value="/blog/article/.do"/> ">
                            <h3>标题</h3>
                            <input class="form-control" placeholder="请输入标题" name="articleTitle">
                            <h3>正文</h3>
                            <div class="editormd" id="content" style="margin: 0">
                                <textarea style="display: none;" class="editormd-markdown-textarea" name="text" id="text"></textarea>
                            </div>
                            <button class="btn btn-outline-primary" type="submit" >提交</button>
                        </form>
                    </c:otherwise>
                </c:choose>

        </main>

    </div>
</div>

<script type="text/javascript">
    $(function() {
        editormd("content", {
            width   : "90%",
            height  : 600,
            syncScrolling : "single",
            path    : "<c:url value="/lib/"/>",
            saveHTMLToTextarea : true,
            tex     :true,
            imageUpload:true,
            imageFormats: ["jpg","jpeg","gif","png","bmp","webp"],
            imageUploadURL: "<c:url value="/blog/picUploading.do"/>"
        });
    });
</script>
</body>
</html>
