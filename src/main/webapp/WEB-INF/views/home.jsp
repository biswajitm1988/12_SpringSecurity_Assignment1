<%--
  Created by IntelliJ IDEA.
  User: ctrq181
  Date: 9/12/2019
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="includeCommonHeader.html" %>
<html>
<head>

</head>
<body>
<div align="right">
    <a href="logout">Logout</a>
</div>
<div align="center">
    <table class="mainTable">
        <tr>
            <th>
                Select Any Option
            </th>
        </tr>
        <tr>
            <td><a href="javascript:showDiv('addBook')" class="button">Add a Book</a></td>
        </tr>
        <tr>
            <td><a href="javascript:showDiv('delSub')" class="button">Delete a Subject</a></td>
        </tr>
        <tr>
            <td><a href="javascript:showDiv('delBook')" class="button">Delete a book</a></td>
        </tr>
        <tr>
            <td><a href="javascript:showDiv('searchBook')" class="button">Search for a book</a></td>
        </tr>
        <tr>
            <td><a href="javascript:showDiv('searchSubject')" class="button">Search for a subject</a></td>
        </tr>
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
<script>
    const errMsg = "Please enter a valid input";

    function showDiv(divId) {
        $("#addBook").hide();
        $("#delBook").hide();
        $("#delSub").hide();
        $("#searchBook").hide();
        $("#searchSubject").hide();
        $("#response").hide();
        $('#' + divId).show();
    }

    function searchWithSubTitle() {
        const inputValue = $("#searchSubTitle").val();
        console.log("input >>" + inputValue + "<< input length >>" + inputValue.length);
        if (inputValue.length === 0) {
            alert(errMsg);
        } else {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/searchWithSubTitle",
                data: {"searchSubTitle": $("#searchSubTitle").val()},
                success: function (response) {
                    $("#response").html(response);
                    $("#response").show();
                },
                error: function (errorThrown) {
                    $("#response").html(errorThrown);
                    $("#response").show();
                }
            });
        }
    }

    function searchWithBookTitle() {
        const inputValue = $("#searchBookTitle").val();
        console.log("input >>" + inputValue + "<< input length >>" + inputValue.length);
        if (inputValue.length === 0) {
            alert(errMsg);
        } else {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/searchWithBookTitle",
                data: {"searchBookTitle": $("#searchBookTitle").val()},
                success: function (response) {
                    $("#response").html(response);
                    $("#response").show();
                },
                error: function (errorThrown) {
                    $("#response").html(errorThrown);
                    $("#response").show();
                }
            });
        }
    }

    function deleteWithBookTitle() {
        const inputValue = $("#deleteBookTitle").val();
        console.log("input >>" + inputValue + "<< input length >>" + inputValue.length);
        if (inputValue.length === 0) {
            alert(errMsg);
        } else {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/deleteWithBookTitle",
                data: {"deleteBookTitle": $("#deleteBookTitle").val()},
                success: function (response) {
                    $("#response").html(response);
                    $("#response").show();
                },
                error: function (errorThrown) {
                    $("#response").html(errorThrown);
                    $("#response").show();
                }
            });
        }
    }

    function deleteWithSubjectTitle() {
        const inputValue = $("#deleteSubTitle").val();
        console.log("input >>" + inputValue + "<< input length >>" + inputValue.length);
        if (inputValue.length === 0) {
            alert(errMsg);
        } else {
            $.post({
                url: "${pageContext.request.contextPath}/deleteWithSubjectTitle",
                data: {"deleteSubTitle": $("#deleteSubTitle").val()},
                success: function (response) {
                    $("#response").html(response);
                    $("#response").show();
                },
                error: function (errorThrown) {
                    $("#response").html(errorThrown);
                    $("#response").show();
                }
            });
        }
    }

    function addBook() {
        const inputTitle = $("#title").val();
        const inputPrice = $("#price").val();
        const inputVolume = $("#volume").val();
        const inputPublishDate = $("#publishDate").val();
        if (inputTitle.length === 0
            || inputPrice.length === 0
            || inputVolume.length === 0
            || inputPublishDate.length === 0) {
            alert(errMsg);
        } else {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/addBook",
                data: $("#bookForm").serialize(),
                success: function (response) {
                    $("#response").html(response);
                    $("#response").show();
                },
                error: function (errorThrown) {
                    $("#response").html(errorThrown);
                    $("#response").show();
                }
            });
        }
    }
</script>
</html>
