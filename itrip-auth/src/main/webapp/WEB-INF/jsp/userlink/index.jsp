<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/retoken.js"></script>
    <script type="text/javascript">

        $(function () {
            $("#search").click(function () {
                var str = {
                    "linkUserName": $("#name").val()
                };
                var arrs = JSON.stringify(str);
                $.ajax({
                    "url": "http://localhost:8080/biz/api/userinfo/queryuserlinkuser",
                    "type": "POST",
                    "contentType": 'application/json',
                    "dataType": "json",
                    "data": arrs,
                    "success": function (data) {
                        console.log(data);
                        if (data.success == "true") {
                            var list = data.data;
                            $("#tabDiv").html("");
                            var tab = $("<table border='1'></table>").append("<tr><td>id</td><td>userId</td><td>用户名</td><td>电话</td></tr>").appendTo($("#tabDiv"));
                            $(list).each(function () {
                                tab.append("<tr><td>" + this.id + "</td><td>" + this.userId + "</td><td>" + this.linkUserName + "</td><td>" + this.linkPhone + "</td><td><input type='checkbox' id='checkeds' name='checkboxed' value="+this.id+"/></td><td><button onclick='aa("+this.id+")'>修改</button></td></tr>");
                            });
                        } else {
                            alert("token失效，请重新登录");
                        }
                    },
                    beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                });
            });

            $("#add").click(function () {
                $("#tabDivAdd").toggle();
            });

            $("#addTijiao").click(function () {
                var str = {
                    linkUserName: $("#linkUserName").val(),
                    linkIdCard: $("#linkIdCard").val(),
                    linkPhone: $("#linkPhone").val(),
                    linkIdCardType:0
                };
                var arrs = JSON.stringify(str);
                console.log(arrs);
                $.ajax({
                    "url": "http://localhost:8080/biz/api/userinfo/adduserlinkuser",
                    "type": "POST",
                    "contentType": 'application/json',
                    "dataType": "json",
                    "data": arrs,
                    "success": function (data) {
                        console.log(data);
                        if (data.success == "true") {
                            var list = data.data;
                            $("#tabDiv").html("");
                            var tab = $("<table border='1'></table>").append("<tr><td>id</td><td>userId</td><td>用户名</td><td>电话</td></tr>").appendTo($("#tabDiv"));
                            $(list).each(function () {
                                tab.append("<tr><td>" + this.id + "</td><td>" + this.userId + "</td><td>" + this.linkUserName + "</td><td>" + this.linkPhone + "</td></tr>");
                            });
                        } else {
                            alert("token失效，请重新登录");
                        }
                    },
                    beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                });
            });

            $("#del").click(function () {
                var message=confirm("确定要删除吗？");
                if(message==true){
                var obj =document.getElementsByName("checkboxed");
                var str=[];
                for (i in obj){
                    if (obj[i].checked == true)
                        str.push(parseInt(obj[i].value));
                }
                var arrs=JSON.stringify(str);
                alert(arrs);
                $.ajax({
                    "url":"http://localhost:8080/biz/api/userinfo/deluserlinkuser",
                    "type":"GET",
                    "data":arrs,
                    "dataType":"json",
                    "contentType":'application/json',
                    "success":function (data) {
                        if (data.success=="true"){
                            console.log("删除成功！");
                        }else {
                            console.log("删除失败！");
                        }

                    },
                    beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                });
                }else {
                    alert("删除失败！");
                }
            });



            $("#update").click(function () {
                $("#updateDiv").toggle();
            });

            window.sid ="";
            $("#motify").click(function () {
                var str={
                    linkusername:$("#updateDiv input[name='updateName']").val(),
                    linkPhone:$("#updateDiv input[name='updatePhone']").val(),
                    linkIdCardType:0,
                    linkIdCard:$("#updateDiv input[name='updatecard']").val(),
                    id : sid
                };
                var arrs=JSON.stringify(str);
                $.ajax({
                    "url":"http://localhost:8080/biz/api/userinfo/modifyuserlinkuser",
                    "type":"POST",
                    "data":arrs,
                    "dataType":"json",
                    "contentType":'application/json',
                    "success":function (data) {
                        if (data.success=="true"){
                            console.log("修改成功！");
                            $("#motify").html("修改成功！");
                        }else {
                            console.log("修改失败！");
                            $("#motify").html("修改失败！");
                        }
                    },
                    beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                })
            });

        });
        function aa(id) {
            alert(id);
            var str = {
                "id": id
            };
            var attr = JSON.stringify(str);
            $.ajax({
                "url": "http://localhost:8080/biz/api/userinfo/getItripUserLinkUserById",
                "type": "POST",
                "contentType": 'application/json',
                "dataType": "json",
                "data": attr,
                "success": function (data) {
                  alert(data);
                    var list = data.data;

                    $(list).each(function () {
                        alert(this.id + "ddd" + this.linkUserName);
                        $("#updateName").attr("value", this.linkUserName);
                        $("#updatePhone").attr("value", this.linkPhone);
                        $("#updatecard").attr("value", this.linkIdCard);
                        sid = this.id;
                    })

                },
                beforeSend: function (request) {
                    request.setRequestHeader("token", $.cookie("token"));
                }
            });
        }

    </script>
</head>
<body>
<div>
    旅客姓名：<input type="text" id="name"/>
    <input type="button" id="search" value="获取常用联系人列表"/>
    <input type="button" id="add" value="新增"/>
    <input type="button" id="del" value="删除"/>
    <input type="button" id="update" value="更新" onclick="aa()"/>
</div>
<div id="tabDiv">

</div>
<div id="tabDivAdd" style="display: none;">
    <form>
        <table>
            <tr id="linkid">
                <td>
                    常用联系人id:
                </td>
                <td>
                    <input type="text" id="id" name="id">
                </td>
            </tr>
            <tr>
                <td>
                    常用联系人姓名:
                </td>
                <td>
                    <input type="text" id="linkUserName" name="linkUserName">
                </td>
            </tr>
            <tr>
                <td>
                    证件号码:
                </td>
                <td>
                    <input type="text" id="linkIdCard" name="linkIdCard">
                </td>
            </tr>
            <tr>
                <td>
                    常用联系人电话:
                </td>
                <td>
                    <input type="text" id="linkPhone" name="linkPhone">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="addTijiao" value="提交"/>
                </td>
                <td>
                    <input type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="updateDiv" style="display: none">
    <form>
        <table>
            <tr>
                <td>联系人姓名：<input type="text" name="updateName" id="updateName" value=""></td>
            </tr>
            <tr>
                <td>联系电话：<input type="text" name="updatePhone" id="updatePhone" value=""></td>
            </tr>
            <tr>
                <td>证号：<input type="text" name="updatecard" id="updatecard" value=""></td>
            </tr>
            <tr>
                <td><input type="button" id="motify" value="修改"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
