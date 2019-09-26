<%--
  Created by IntelliJ IDEA.
  User: ctrq181
  Date: 9/26/2019
  Time: 12:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div align="center">
    <form action="/registerUser" method="post">
    <table>
        <tr>
            <td>Enter User Name</td>
            <td><input type="text" id="username" name="username"></td>
        </tr>

        <tr>
            <td>Enter Password</td>
            <td><input type="text" id="password" name="password"></td>
        </tr>

        <tr>
            <td>Select Role</td>
            <td><input type="radio" name="role_id" value="1">Librarian</td>
            <input type="radio" name="role_id" value="2">Principal</td></td>
        </tr>

        <tr>
            <td colspan="2">
                <input class="button" type="submit"
                       value="Register">
            </td>
        </tr>
    </table>
    </form>
</div>

</body>
</html>
