<%--
  Created by IntelliJ IDEA.
  User: ctrq181
  Date: 9/26/2019
  Time: 12:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includeCommonHeader.html" %>

<div align="center">
    <form action="registerUser" path="user" method="post">
        <table>
            <tr>
                <th colspan="2">
                    Register New User
                </th>
            </tr>
            <tr>
                <td>Enter User Name</td>
                <td><input type="text" id="username" name="username" placeholder="Enter User Name"></td>
            </tr>

            <tr>
                <td>Enter Password</td>
                <td><input type="password" id="password" name="password"placeholder="Enter Password"></td>
            </tr>

            <tr>
                <td>Select Role</td>
                <td>
                    <input type="radio" name="userRole.name" value="ROLE_LIBRARIAN">Librarian
                    <input type="radio" name="userRole.name" value="ROLE_PRINCIPAL">Principal
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <input class="button" type="submit"
                           value="Register">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="index">Go Back To Login</a>
                </td>
            </tr>
        </table>
    </form>
</div>