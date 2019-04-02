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

<div id="content-text">
    <textarea style="display:none;">${mdText}</textarea>
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
</body>
</html>
