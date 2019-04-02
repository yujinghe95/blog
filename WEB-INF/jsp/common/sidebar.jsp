<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">
                <li class="nav-item mx-auto">
                    <img src="<c:url value="/html/pili1.png"/> " class="round_icon img-thumbnail" >
                </li>
                <li class="nav-item text-center">
                    <a class="nav-link" href="<c:url value="/blog/articles/.do"/> " style="margin-top: 10px">
                        <h4 class="text-muted">景舟</h4>
                    </a>
                </li>
                <li class="nav-item text-center" >
                    <form class="form-inline" action="#" method="get">
                        <div class="input-group mx-auto">
                            <input class="form-control" type="text" placeholder="搜索一下" name="bookName" style="width: 120px;"/>
                            <span class="input-group-append">
                                <button class="btn" type="submit">🔍</button>
                            </span>
                        </div>
                    </form>
                </li>

                <table class="table table-hover text-center">
                    <tbody>
                    <tr>
                        <td><li class="nav-item text-center">
                            <a class="nav-link" href="<c:url value="/blog/articles/.do"/> ">
                                <h6 class="text-info">所有文章</h6>
                            </a>
                        </li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item text-center">
                            <a class="nav-link" href="#">
                                <h6 class="text-info">文章分类</h6>
                            </a>
                        </li></td>
                    </tr>
                    <tr>
                        <td><li class="nav-item text-center">
                            <a class="nav-link" href="#">
                                <h6 class="text-info">关于我</h6>
                            </a>
                        </li></td>
                    </tr>
                    <c:if test="${author!=null}">
                        <tr>
                            <td><li class="nav-item text-center">
                                <a class="nav-link" href="<c:url value="/blog/article/.do"/>">
                                    <h6 class="text-info">写文章</h6>
                                </a>
                            </li></td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </ul>
        </div>
    </nav>