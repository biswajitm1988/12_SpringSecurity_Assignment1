<%--
  Created by IntelliJ IDEA.
  User: ctrq181
  Date: 9/26/2019
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includeCommonHeader.html" %>
<html>
<head>
</head>
<body>

<div align="center">
    <form action="doLogin" method="post">
        <table>
            <tr>
                <th>
                    <legend>Please sign in</legend>
                </th>
            </tr>
            <fieldset>

                <c:if test="${not empty error}">
                    <tr>
                        <td>
                            <div class="alert alert-danger">
                                <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/>
                                <br/>
                            </div>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>
                        <div class="form-group">
                            <input class="form:input-large" placeholder="User Name"
                                   name='username' type="text">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <input class=" form:input-large" placeholder="Password"
                                   name='password' type="password" value="">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="button" type="submit"
                               value="Login">
                    </td>
                </tr>
            </fieldset>
        </table>
    </form>
</div>
</body>
</html>
