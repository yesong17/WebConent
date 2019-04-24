<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--
    1.获取点击事件
    2.请求URL发送AJAX请求
    3.包括bookname,totalBookNumber,totalMoney
    4.在网页里面显示出来
-->
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            var isHasCart = "${sessionScope.sc == null}";
            if (isHasCart == "true"){
                $("#cartstatus").hide();
            }else{
                $("#cartstatus").show();
                $("#bookName").text("${sessionScope.sc.bookName}");
                $("#totalBookNumber").text("${sessionScope.sc.totalBookNumber}");
                $("#totalMoney").text("${sessionScope.sc.totalMoney}");
            }

            $("a").click(function () {
                $("#cartstatus").show();
               var url =  this.href;
                var args = {"time":new Date()};
                $.getJSON(url,args,function (data) {
                   $("#bookName").text(data.bookName);
                   $("#totalBookNumber").text(data.totalBookNumber);
                   $("#totalMoney").text(data.totalMoney);
                })
                return false;
            });
        })
    </script>
</head>
<body>
    <div id="cartstatus">
        您已将 &nbsp; <span id="bookName"></span>&nbsp;加入到购物车中
        购物车中的书有 &nbsp; <span id="totalBookNumber"></span> &nbsp;本
        总价格 &nbsp; <span id="totalMoney"></span> &nbsp;钱。
    </div>
        <br><br>
        Java &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/addToCart?id=Java&price=100">加入购物车</a>
        <br><br>
        Mysql &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/addToCart?id=Mysql&price=100">加入购物车</a>
        <br><br>
        Hadoop &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/addToCart?id=Hadoop&price=200">加入购物车</a>
</body>
</html>
