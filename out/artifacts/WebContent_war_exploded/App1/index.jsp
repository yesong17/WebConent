<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!--
    1.导入JQeury库
    2.获取username输入框输入的信息
    3.获取username chaange响应函数
      a.获取值，去除前后空格，准备发送ajax
      b.检验username是否可用
      c.服务器端返回结果
      d.在message 位置中显示用户信息，可不可用，用红色或者绿色显示
-->
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":input[name='username']").change(function () {
               var val = $(this).val();
               val = $.trim(val);

               if(val != ""){
                   var url = "${pageContext.request.contextPath}/valiateUserName";
                   var args = {"userName":val,"time":new Date()};
                   $.post(url,args,function (data) {
                       $("#message").html(data);
                   });
               }
            })
        })
    </script>
</head>
<body>
    <form action="" method="post">
        UserName:<input type="text" name="username"/>
        <br><br>
        <div id="message"></div>
        <br><br>
        <input type="submit" value="Submit"/>
    </form>
</body>
</html>
