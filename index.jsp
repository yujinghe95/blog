<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>#title#</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="<c:url value="/css/editormd.css"/> "></link>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="<c:url value="/editormd.min.js" /> "></script>


</head>

<body>
<form method="post" action="<c:url value="/blog/textUploading.do"/> ">
    <div class="editormd" id="content">
        <textarea style="display: none;" class="editormd-markdown-textarea" name="text" id="text"></textarea>
    </div>
    <input type="submit" value="提交">
</form>


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
