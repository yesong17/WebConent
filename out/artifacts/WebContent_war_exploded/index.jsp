<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/22
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--
    1.获取A节点，并为其添加onclick响 应函数
    2.return false
    3.创建一个XMLHttpRequest对象
    4.准备发送请求的数据：url
    5.调用XMLHttpRequest对象的open方法
    6.调用XMLHttpRequest对象的send方法
    7.为XMLRequest对象添加onreadystatechange响应函数
    8.判断readyState属性值 4
    9.status:http_code 200
    10.获取结果

-->
<head>
    <title>$Title$</title>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementsByTagName("a")[0].onclick = function () {
                var request = new XMLHttpRequest();
                var url = this.href;
                var method = "GET";
                request.open(method, url);
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200 || request.status == 304) {
                            alert(request.responseText);
                        }
                    }
                }
                return false;
            }

        }
    </script>
</head>
<body>
<a href="HelloAjax.txt">HelloAjax</a>
</body>
</html>
