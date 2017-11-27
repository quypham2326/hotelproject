<%-- 
    Document   : search
    Created on : Jun 26, 2017, 5:19:13 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff</title>
    </head>
    <font color="red">
    Welcome, ${sessionScope.USER}
    </font>
    <a href="LogOut">Logout</a>
    <body>
        <h1>Staff Page</h1>
        <form action="staff" method="POST">
            Date <input type="text" name="txtDateSearch" value="${param.txtDateSearch}" />
            <input type="submit" value="Filter" name="btAction" />
        </form><br/>
        <c:if test="${not empty param.txtDateSearch}">
            <h3>Damage report Information</h3>
            <c:set var="result" value="${requestScope.STAFFSEARCH}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Room ID</th>
                            <th>Reason</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.roomId}</td>
                                <td>${dto.reason}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
            <c:if test="${empty result}">
                <h2>No record is Matched</h2>
            </c:if>
        </c:if>
        <c:if test="${empty param.txtDateSearch}">
            <c:set var="result" value="${sessionScope.STAFFSEARCH}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Room ID</th>
                            <th>Reason</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.roomId}</td>
                                <td>${dto.reason}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
    </body>
</html>
