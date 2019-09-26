<html>
<head>
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
</head>