<%--
  Created by IntelliJ IDEA.
  User: ctrq181
  Date: 9/12/2019
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="includeCommonHeader.html" %>
<%@include file="commonJS.jsp" %>
<html>
<body>
<sec:authorize access="isAuthenticated()">
    <div align="right">
        <legend>Welcome <sec:authentication property="principal.username"/></legend>
            | <a href="logout" align="right">Logout</a>
    </div>
</sec:authorize>

<div align="center">
    <table class="mainTable">
        <tr>
            <th>
                Select Any Option
            </th>
        </tr>
        <sec:authorize access="hasRole('LIBRARIAN')">
            <tr>
                <td><a href="javascript:showDiv('addBook')" class="button">Add a Book</a></td>
            </tr>
        </sec:authorize>
        <sec:authorize access="hasRole('PRINCIPAL')">
            <tr>
                <td><a href="javascript:showDiv('delSub')" class="button">Delete a Subject</a></td>
            </tr>
        </sec:authorize>
        <sec:authorize access="hasRole('LIBRARIAN')">
            <tr>
                <td><a href="javascript:showDiv('delBook')" class="button">Delete a book</a></td>
            </tr>
        </sec:authorize>
        <sec:authorize access="hasRole('LIBRARIAN')">
            <tr>
                <td><a href="javascript:showDiv('searchBook')" class="button">Search for a book</a></td>
            </tr>
        </sec:authorize>
        <sec:authorize access="hasRole('PRINCIPAL')">
            <tr>
                <td><a href="javascript:showDiv('searchSubject')" class="button">Search for a subject</a></td>
            </tr>
        </sec:authorize>
    </table>
    <br>

    <form name="bookForm" id="bookForm">
        <div id="addBook" style="display: none">
            <table>
                <tr>
                    <th>Book Title</th>
                    <th>Price</th>
                    <th>Volume</th>
                    <th>Published Date</th>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="title" id="title" width="20" placeholder="Enter Book Title">
                    </td>
                    <td>
                        <input type="text" name="price" id="price" width="20" placeholder="Enter Book Price">
                    </td>
                    <td>
                        <input type="text" name="volume" id="volume" width="20" placeholder="Enter Book Volume">
                    </td>
                    <td>
                        <input type="text" name="publishDate" id="publishDate" width="20" placeholder="mm/dd/yy">
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <button type="button" onclick="addBook()">Submit</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id="delSub" style="display: none">
        Enter the Subject Title To Delete <input type="text" name="deleteSubTitle" id="deleteSubTitle" width="20">
        <button type="button" onclick="deleteWithSubjectTitle()">Submit</button>
    </div>
    <div id="delBook" style="display: none">
        Enter the Book Title To Delete <input type="text" name="deleteBookTitle" id="deleteBookTitle" width="20">
        <button type="button" onclick="deleteWithBookTitle()">Submit</button>
    </div>
    <div id="searchBook" style="display: none">
        Enter the Book Title To Search <input type="text" name="searchBookTitle" id="searchBookTitle" width="20">
        <button type="button" onclick="searchWithBookTitle()">Submit</button>
    </div>
    <div id="searchSubject" style="display: none">
        Enter the Subject Title To Search <input type="text" name="searchSubTitle" id="searchSubTitle" width="20">
        <button type="button" onclick="searchWithSubTitle()">Submit</button>
    </div>
    <br>
    <div id="response" style="display: none">

    </div>
</div>
</body>
</html>
