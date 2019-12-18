<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<html>
<script>
    function load() {
        var formId = document.getElementById("formId");
        formId.submit();
    }
</script>
<body onload="load()">
    <form action="inlogin" method="get" id = "formId">
       loading the page ... ...
    </form>
</body>
</html>











<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 19.11.25
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>







<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta  name="viewport"  content="width=device-width,initial-scale=1, user-scalable=no">--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--    <meta name="format-detection" content="telephone=no">--%>
<%--    <title>test</title>--%>

<%--    <script>--%>

<%--        //获取Ajax对象--%>
<%--        function getAjx() {--%>
<%--            var ajax;--%>
<%--            if (window.XMLHttpRequest) {        //  支持火狐游览器--%>
<%--                return ajax = new XMLHttpRequest();--%>
<%--            } else if (window.ActiveXObject) {   //  支持 IE 游览器--%>
<%--                return ajax = new ActiveXObject("Msxml2.XMLHTTP");--%>
<%--            }--%>
<%--        }--%>

<%--        //向服务端发数据--%>
<%--        function ajaxSendMessage(method,url,param,func,sync) { // 方式/地址/参数/成功后的函数/同步--%>
<%--            var ajax = getAjx();--%>

<%--            ajax.onreadystatechange = function () {--%>
<%--                if(ajax.readyState == 4){--%>
<%--                    if(ajax.status == 200){--%>
<%--                        func(ajax);--%>
<%--                    }else {--%>
<%--                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");--%>
<%--                    }--%>
<%--                }else {--%>

<%--                }--%>
<%--            }--%>

<%--            if(method == "get"){--%>
<%--                // url += "?" + param;--%>
<%--                param = null;--%>
<%--            }--%>


<%--            ajax.open(method,url,sync);--%>
<%--            // ajax.setRequestHeader("Content-Type","false");--%>
<%--            ajax.send(param);--%>
<%--        }--%>
<%--    </script>--%>

<%--    <script>--%>

<%--        //选择图片时预览功能--%>
<%--        function imageshow(source){--%>
<%--            var file = source.files[0];--%>
<%--            var imageid = source.id;--%>

<%--            if (window.FileReader) {--%>
<%--                var fr = new FileReader();--%>
<%--                fr.onloadend = function(e) {--%>
<%--                    document.getElementById("portrait"+imageid).src = e.target.result;--%>
<%--                };--%>
<%--                fr.readAsDataURL(file);--%>

<%--                var formData = new FormData();--%>
<%--                formData.append("file",file);--%>
<%--                formData.append("blogid",1);--%>

<%--                ajaxSendMessage("post","uploadImage",formData,function (ajax) {--%>
<%--                    alert(ajax.responseText);--%>
<%--                },false);--%>
<%--            }--%>
<%--            document.getElementById("image"+imageid).style.display="none";--%>
<%--            document.getElementById("show"+imageid).style.display="block";--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <div id="image1" >　--%>
<%--        <p>上传截图</p><input id = "x" type="file" name="screenshot1" onchange="imageshow(this)"/>--%>
<%--    </div>--%>
<%--</body>--%>
<%--</html>--%>












<%--<!DOCTYPE>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>FileReader</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<p>--%>
<%--    <label>请选择一个文件：</label>--%>
<%--    <input type="file" id="file" />--%>
<%--    <input type="button" value="读取图像" onclick="readAsDataURL()" />--%>
<%--    <input type="button" value="读取二进制数据" onclick="readAsBinaryString()" />--%>
<%--    <input type="button" value="读取文本文件" onclick="readAsText()" />--%>
<%--</p>--%>
<%--<div id="result" name="result"></div>--%>


<%--<script type="text/javascript">--%>
<%--    var result=document.getElementById("result");--%>
<%--    var file=document.getElementById("file");--%>
<%--    //判断浏览器是否支持FileReader接口--%>
<%--    if(typeof FileReader == 'undefined'){--%>
<%--        result.InnerHTML="<p>你的浏览器不支持FileReader接口！</p>";--%>
<%--        //使选择控件不可操作--%>
<%--        file.setAttribute("disabled","disabled");--%>
<%--    }--%>

<%--    function readAsDataURL(){--%>
<%--        //检验是否为图像文件--%>
<%--        var file = document.getElementById("file").files[0];--%>
<%--        if(!/image\/\w+/.test(file.type)){--%>
<%--            alert("看清楚，这个需要图片！");--%>
<%--            return false;--%>
<%--        }--%>
<%--        var reader = new FileReader();--%>
<%--        //将文件以Data URL形式读入页面--%>
<%--        reader.readAsDataURL(file);--%>
<%--        reader.onload=function(e){--%>
<%--            var result=document.getElementById("result");--%>
<%--            //显示文件--%>
<%--            result.innerHTML='<img src="' + this.result +'" alt="" />';--%>
<%--        }--%>
<%--    }--%>

<%--    function readAsBinaryString(){--%>
<%--        var file = document.getElementById("file").files[0];--%>
<%--        var reader = new FileReader();--%>
<%--        //将文件以二进制形式读入页面--%>
<%--        reader.readAsBinaryString(file);--%>
<%--        reader.onload=function(f){--%>
<%--            var result=document.getElementById("result");--%>
<%--            //显示文件--%>
<%--            //result.innerHTML=this.result;--%>
<%--            result.innerText = this.result;--%>
<%--        }--%>
<%--    }--%>

<%--    function readAsText(){--%>
<%--        var file = document.getElementById("file").files[0];--%>
<%--        var reader = new FileReader();--%>
<%--        //将文件以文本形式读入页面--%>
<%--        reader.readAsText(file);--%>
<%--        reader.onload=function(f){--%>
<%--            var result=document.getElementById("result");--%>
<%--            //显示文件--%>
<%--            //result.innerHTML=this.result;--%>
<%--            result.innerText = this.result;--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>

<%--</body>--%>
<%--</html>--%>
