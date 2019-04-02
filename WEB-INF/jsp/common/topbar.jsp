<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-dark fixed-top bg-dark p-0 ">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0 text-center " href="#">Blog</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <c:choose>
                <c:when test="${author==null}">
                    <a class="nav-link" href="<c:url value="/blog/session.do"/> ">登陆</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-link">欢迎您，${author.userName}</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</nav>
