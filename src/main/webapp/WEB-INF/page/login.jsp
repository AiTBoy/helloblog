<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<html>
<body>
    <h2>Hello Blog!</h2>
    <hr/>
    <form action="login" method="post">
        username : <input type="text" name="username" placeholder="input username ..."><br /><br />
        password : <input type="password" name="password" placeholder="input password ..."><br /><br />
                   <input type="submit" value="login">&nbsp;&nbsp;&nbsp;
    </form>
    <form action="inregister" method="get">
        <input type="submit" value="sign"><br />
    </form>
    <br/>
    <hr/>
    <div style="color: red">${sessionScope.loginTip}</div>
</body>
</html>