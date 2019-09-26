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

<div align="center">
    <form action="doLogin" method="post">
        <table>
            <tr>
                <th colspan="2">
                    Please sign in
                </th>
            </tr>
            <fieldset>
                <c:if test="${not empty failureMessage}">
                    <tr>
                        <td colspan="2">
                            <div class="alert alert-danger">
                                    ${failureMessage}
                            </div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <tr>
                        <td colspan="2">
                            <div class="alert alert-success">
                                    ${successMessage}
                            </div>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td>
                        User Name
                    </td>

                    <td>
                        <div class="form-group">
                            <input class="form:input-large" placeholder="User Name"
                                   name='username' type="text">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <div class="form-group">
                            <input class=" form:input-large" placeholder="Password"
                                   name='password' type="password" value="">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="button" type="submit"
                               value="Login">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="register">Register New User</a>
                    </td>
                </tr>
            </fieldset>
        </table>
    </form>
</div>