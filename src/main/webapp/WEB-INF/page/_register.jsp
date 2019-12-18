<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<html>
<body>
<h2>Register</h2>
<hr/>
<form action="register" method="get">
    <input type="text"     name="username" placeholder="username ..." value="${sessionScope.username}"><br /><br />
    <input type="password" name="password" placeholder="password ..."><br /><br />
    <input type="password" name="againpassword" placeholder="password again ..."><br /><br />
    <hr/>
     birthday : <input type="date" name = "birthday" value="<%=session.getAttribute("birthday") != null ? session.getAttribute("birthday")  : "1999-01-07"%>"/>
     boy     <input type="radio" name="sex" value="boy" checked />
     girl    <input type="radio" name="sex" value="girl" /><br /><br />
    <textarea name="signature" rows="15" cols="60"><%=session.getAttribute("signature") != null ? session.getAttribute("signature")  : "Opportunities are only open to enterprising people, mediocre people can never patronize."%></textarea><br /><br />
    <hr/>
    <input type="submit" value="submit" style="width: 70px"><br />
</form>
<br/>
    <div style="color: red">${sessionScope.registerTip}</div>

</body>
</html>