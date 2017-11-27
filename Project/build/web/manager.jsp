<%-- 
    Document   : manager
    Created on : Jun 26, 2017, 5:25:29 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager</title>
    </head>
    <body>
        <font color="red">
        Welcome, ${sessionScope.USER}
        </font>
        <a href="LogOut">Logout</a>
        <h1>Manager</h1>
        <form action="manager" method="POST">
            Search Value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" />
            <input type="submit" value="Search" name="btAction" />
            <input type="submit" value="ShowAll" name="btAction" /><br/>
        </form>

        <c:if test="${not empty param.txtSearchValue}">
            <c:set var="result" value="${requestScope.SEARCH}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Room</th>
                            <th>Description</th>
                            <th>hour Price</th>
                            <th>day Price</th>
                            <th>Update</th>
                            <th>Damge Report</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="manager1" method="POST">
                            <tr>
                                <td>
                                    ${counter.count}
                                    <input type="hidden" name="countnumb" value="${counter.count}" />
                                </td>
                                <td>
                                    ${dto.roomID}
                                    <input type="hidden" name="roomID" value="${dto.roomID}" />
                                </td>
                                <td>
                                    <input type="text" name="description" value="${dto.description}" />
                                </td>
                                <td>
                                    <input type="text" name="hourPrice" value="${dto.hourPrice}" /> 
                                </td>
                                <td>
                                    <input type="text" name="dayPrice" value="${dto.dayPrice}" />
                                </td>
                                <td>
                                    <input type="submit" value="Update" name="btAction${counter.count}" />
                                    <input type="hidden" name="lastsearchValue" value="${param.txtSearchValue}" />
                                </td>
                                <td>
                                    <input type="checkbox" name="chkDamge" value="${dto.roomID}" />
                                    <input type="text" name="textReport" value="" />
                                </td>
                            </tr>
                            <tr>
                                <c:set var="err" value="${requestScope.ERRORUPDATE}"/>
                                <c:if  test="${not empty err and requestScope.ERRORPOS eq dto.roomID }">
                                    <td><font color="red">ERROR</font></td>
                                    <td colspan="6">
                                    <c:if test="${not empty err.descriptionErr}">
                                        <font color="red">
                                        ${err.descriptionErr}
                                        <font>
                                    </c:if>
                                
                                    <c:if test="${not empty err.hourPriceErr}">
                                        <font color="red">
                                        ${err.hourPriceErr}
                                        <font>
                                   </c:if>
                                    <c:if test="${not empty err.dayPriceErr}">
                                        <font color="red">
                                        ${err.dayPriceErr}
                                        <font>
                                    </c:if>
                                        </td>
                                </c:if>
                                        
                                            <c:set var="err" value="${requestScope.ERRORREPORT}"/>
                                    <c:if  test="${not empty err}">
                                        <td colspan="6"></td>
                                        <td>
                                        <c:if test="${not empty err.reportNULL and requestScope.ERRORPOS eq dto.roomID}">
                                            <font color="red">
                                            ${err.reportNULL}
                                            <font>
                                        </c:if>
                                    </c:if>
                                        </td>
                           
                        </tr>
                        </c:forEach>
                        
                        <tr>
                            <td colspan="6"></td>
                            <td>
                                <input type="submit" value="Report" name="btAction" />
                                <input type="hidden" name="lastsearchValue" value="${param.txtSearchValue}"<br/>
                            </td>
                        </tr>
                    </form>
                </tbody>
            </table>

        </c:if>
        <c:if test="${empty result}">
            <h2>
                No record is matched
            </h2>
        </c:if>
    </c:if>
    <c:set var="resultAll" value="${requestScope.SHOWALL}"/>
    <c:if test="${not empty resultAll}">
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Room</th>
                    <th>Description</th>
                    <th>hour Price</th>
                    <th>day Price</th>
                    <th>Update</th>
                    <th>Damage Report</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dto" items="${resultAll}" varStatus="counter">
                <form action="manager1" method="POST">
                            <tr>
                                <td>
                                    ${counter.count}
                                    <input type="hidden" name="countnumb" value="${counter.count}" />
                                </td>
                                <td>
                                    ${dto.roomID}
                                    <input type="hidden" name="roomID" value="${dto.roomID}" />
                                </td>
                                <td>
                                    <input type="text" name="description" value="${dto.description}" />
                                </td>
                                <td>
                                    <input type="text" name="hourPrice" value="${dto.hourPrice}" /> 
                                </td>
                                <td>
                                    <input type="text" name="dayPrice" value="${dto.dayPrice}" />
                                </td>
                                <td>
                                    <input type="submit" value="Update" name="btAction${counter.count}" />
                                    <input type="hidden" name="lastsearchValue" value="${param.txtSearchValue}" />
                                </td>
                                <td>
                                    <input type="checkbox" name="chkDamge" value="${dto.roomID}" />
                                    <input type="text" name="textReport" value="" />
                                </td>
                            </tr>
                            <tr>
                                <c:set var="err" value="${requestScope.ERRORUPDATE}"/>
                                <c:if  test="${not empty err and requestScope.ERRORPOS eq dto.roomID }">
                                    <td><font color="red">ERROR</font></td>
                                    <td colspan="6">
                                    <c:if test="${not empty err.descriptionErr}">
                                        <font color="red">
                                        ${err.descriptionErr}
                                        <font>
                                    </c:if>
                                
                                    <c:if test="${not empty err.hourPriceErr}">
                                        <font color="red">
                                        ${err.hourPriceErr}
                                        <font>
                                   </c:if>
                                    <c:if test="${not empty err.dayPriceErr}">
                                        <font color="red">
                                        ${err.dayPriceErr}
                                        <font>
                                    </c:if>
                                        </td>
                                </c:if>
                                        
                                            <c:set var="err" value="${requestScope.ERRORREPORT}"/>
                                    <c:if  test="${not empty err}">
                                        <td colspan="6"></td>
                                        <td>
                                        <c:if test="${not empty err.reportNULL and requestScope.ERRORPOS eq dto.roomID}">
                                            <font color="red">
                                            ${err.reportNULL}
                                            <font>
                                        </c:if>
                                    </c:if>
                                        </td>
                           
                        </tr>
                        </c:forEach>
                        
                        <tr>
                            <td colspan="6"></td>
                            <td>
                                <input type="submit" value="Report" name="btAction" />
                                <input type="hidden" name="lastsearchValue" value="${param.txtSearchValue}"<br/>
                            </td>
                        </tr>
                    </form>
        </tbody>
    </table>
</c:if>

</body>
</html>
