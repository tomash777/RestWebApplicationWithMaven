<%--
  Created by IntelliJ IDEA.
  User: tomasz
  Date: 01.12.17
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>>
<script>

    var displayContent;
    /*
    function getDataFromServer () {
        var emitJSON = {};
        emitJSON.type = $("input[type='radio'][name='type']:checked").val();
        emitJSON.number = $("#numberInput").val();

        return $.ajax({
            type: "POST",
            url: "/RestWithMaven/convert",
            data: emitJSON,
            dataType: "application/json"
        });

    }
    */

    $(function() {
        $("#submitButton").click(function() {


            var emitJSON = {};
            emitJSON.type = $("input[type='radio'][name='type']:checked").val();
            emitJSON.number = $("#numberInput").val();

            $.post ("/convert", emitJSON, function (returnedData) {
                $("#convertedNumber").val(returnedData);
            });


            /*
            var type = $("input[type='radio'][name='type']:checked").val();
            var number = $("#numberInput").val();
            //var url = "http://localhost:8080/RestWithMaven/api/"+type+"/"+number;
            var url = "http://localhost:8080/RestWithMaven/api/roman/10";

            var converted = $.ajax({
                type: "GET",
                url: url,
                dataType: "text"});

            $("#convertedNumber").val(converted);
            */


        });
    })
</script>
<body>
<%--
<form action="convert" method="post">
--%>
Decimal number to be converted: <input id = "numberInput" type="text" name="number">
<br> Type of conversion: <input type="radio" name="type" value="roman">Roman </input>
<input type="radio" name="type" value="hexadecimal">Hexadecimal </input>
<br>
<button id = "submitButton" type="submit" >Convert</button>
<input type = "text" id="convertedNumber" >
<%--
</form>
--%>
</body>
</html>
