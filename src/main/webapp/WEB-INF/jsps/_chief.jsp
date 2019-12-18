<%@ page import="com.helloblog.domain.Article" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<html>
<head>
    <meta charset="utf-8">
    <title>个人主页</title>
    <link rel="stylesheet" href="css/_chief.css"/>

    <!-- 相关图标引入 -->
    <script url="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/layui.js"></script>
    <link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/css/layui.css" media="all" />

</head>
    <body style="width:1920px;" onload="initBody();">

        <div class="header">
            <div style="margin-left: 200px; margin-top: 5px; font-size: 16px; float: left;">
                <img src="css/helloblogicon-dog.png" style="width: 40px;height: 40px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;float: left;">
                <a href="loadPublicAritcle" style="font-size: 28px;color: blue;">H E L L O B L O G </a>
            </div>

            <div class="bloggerheader" style="height:50px;padding: 0px;margin-top:0px;margin-left:760px;float:left;width:260px;font-size: 18px; font-family: microsoft yahei; text-align: center;">
                    <input id="search-input" type="text" style="width:200px;margin-top:8px;margin-left:10px;float: left;color: gray;background-color: rgb(245,245,245);border-radius: 10px;border: deepskyblue solid 1px;outline: none;" placeholder="请输入关键字..." onkeyup="searchEnter(0)"/>
                    <input onclick="serarchButton()" type="button" value="🔍" style="margin-top:8px;float: left;width: 50px;margin-left: 0px;background-color: whitesmoke; text-align: center; font-size: 22px;outline: none;cursor:hand;" />
            </div>

            <div style="overflow:hidden; float: right; margin-right: 250px; margin-top: 5px;">
                <a href="inMyCenter">
                    <img id="header-HP" src="css/user.jpg" style="width: 40px;height: 40px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">
                </a>
            </div>
            <div style="margin-right: 30px; margin-top: 17px; font-size: 14px; float: right; font-family: microsoft yahei;">
                <a id="writer-blog" href="inWriteBlog" style="text-decoration: none;">🖊 写博客</a>
            </div>
        </div>
        <br />

        <div class="page" style="width: 1920px" style="display: none;">

            <div class="soma">
                <div class="rigt-soma" id="right-soma" style="min-height: 880px;background-color: transparent;">

                </div>
            </div>
        </div>

<%--        <div class="footer" style="position:absolute;bottom:0;">--%>
<%--            <b>H E L L O B L O G 欢 迎 你 的 到 来 </b>--%>
<%--        </div>--%>

        <!-- 页面右侧导航栏 -->
        <div class="L-E-float">
            <div style="margin: 4px;">
                <a id="login_exit" href="inlogin">退出账号</a>
            </div>
            <hr />
            <div style="margin: 4px;">
                <a href="inregister">注册账号</a>
            </div>
            <hr />
            <div style="margin: 4px;">
                <a href="#">联系我们</a>
            </div>
            <hr />
            <div style="margin: 4px;">
                <a href="#">关于我们</a>
            </div>
        </div>

    </body>

    <!-- js 部分(外部工具js) -->
    <script type="text/javascript" src='js/_ajaxTools.js'></script>
    <script type="text/javascript" src="js/_loadImageTools.js"></script>
    <script type="text/javascript" src="js/_codecKitTools.js"></script>
    <script type="text/javascript" src="js/_commonPageTools.js"></script>

    <!-- 主页文章加载相关 js -->
    <script type="text/javascript">

        //加载首页博客列表
        function loadArticlesInfo() {
            ajaxSendMessage("get","loadHomePageAritcle",null,function (ajax) {
                var data = JSON.parse(ajax.responseText);
                var DIV = document.getElementById("right-soma");
                if(data.bloggerArticlesList == null) //不存在任何文章
                    return;
                for(var i = 0 ; i < data.bloggerArticlesList.length ; i++){
                    var ARTICLE = data.bloggerArticlesList[i];
                    var AT =  ARTICLE.title;

                    var len = ARTICLE.content.length;
                    var AC =  (len > 120 ?
                        ARTICLE.content.slice(0,70) + "......"
                        + ARTICLE.content.slice(len-40,len-10) + "......"
                        : ARTICLE.content);
                    var AD =  dateFormat(new Date(ARTICLE.publictime.time));
                    var AR =  data.B_R['artid'+ARTICLE.artid];
                    var AL = ARTICLE.like;
                    var ATY= ARTICLE.type;
                    var div = articleItem(ARTICLE.blogid,ARTICLE.artid,AT,AC,AD,AR,AL,ATY);///
                    DIV.appendChild(div);
                }
                //DIV.appendChild(nooMre());

            },false);
        }

        //文章列表单项
        function articleItem(blogid,artid,articleTitle,articleContent,articleDate,articleRemark,articleLike,articleType) {
            var div     = document.createElement("div");

            var leftDiv = document.createElement("div");
            var img     = document.createElement("img");


            var rightDiv= document.createElement("div");
            var title   = document.createElement("div");
            var content = document.createElement("div");
            var footer  = document.createElement("div");

            var titleA  = document.createElement("a");
            var titleB  = document.createElement("b");
            var authorImg=document.createElement("img"); //文章作者的图片
            var footerB = document.createElement("b");
            var footerSpan1 = document.createElement("span");
            var footerSpan2 = document.createElement("span");
            var footerSpan3 = document.createElement("span");

            var lastDiv = document.createElement("div");
            var lk      = document.createElement("i");

            var lastDiv1 = document.createElement("div");
            var rm       = document.createElement("i");

            img.style.cssText = "margin-left:20px;width: 60px;height: 60px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;float: left;"
            if((articleType + "").trim() == "C"){
                img.style.cssText+="width: 60px;height: 60px;";
                img.src = "css/cicon.jfif";
            }else if((articleType + "").trim() == "其他"){
                img.style.cssText+="width: 60px;height: 60px;";
                img.src = "css/hellowordicon.jpg";
            }else if((articleType + "").trim() == "Redis"){
                img.style.cssText+="width: 70px;height: 60px;";
                img.src = "css/redisicon.jpg";
            }else if((articleType + "").trim() == "Linux"){
                img.style.cssText+="width: 60px;height: 70px;";
                img.src = "css/linuxicon.jpg";
            }else if((articleType + "").trim() == "C#"){
                img.style.cssText+="width: 60px;height: 60px;";
                img.src = "css/cXicon.jfif";
            }else if((articleType + "").trim() == "Python"){
                img.style.cssText+="width: 60px;height: 60px;";
                img.src = "css/pythonicon.jpg";
            }else if((articleType + "").trim() == "JS"){
                img.style.cssText+="width: 60px;height: 60px;";
                img.src = "css/jsicon.jfif";
            }else if((articleType + "").trim() == "Java"){
                img.style.cssText+="width: 80px;height: 40px;";
                img.src = "css/javaicon.jfif";
            }

            title.style.cssText = "margin: 8px;margin-left: 20px;font-size: 20px;font-family: microsoft yahei; color: blue;";
            titleA.style.cssText = "text-decoration: none;color: blue;";
            content.style.cssText = "height: 25px;margin: 26px;margin-left: 20px;font-family: microsoft yahei;font-size:12px;letter-spacing:1px;color: gray;";
            footer.style.cssText  = "margin: 5px;margin-left: 20px;font-size: 12px;color: gray;margin-bottom:0px;position:absolute;";
            footerB.style.cssText  = "margin: 5px;";
            authorImg.style.cssText = "width: 25px;height: 25px;margin-left:0px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;float:left;";
            lk.style.cssText ="margin-left: 32px;font-size: 22px; color: rgb(176,114,25);";
            rm.style.cssText ="margin-left: 32px;font-size: 22px; color: rgb(176,114,25);";
            leftDiv.style.cssText ="width: 8%;float: left;height: 100%;";
            rightDiv.style.cssText ="width: 60%;float: left;";
            lastDiv.style.cssText ="width: 8%;float: right;height: 100%;";
            lastDiv1.style.cssText ="width: 8%;float: right;height: 100%;";
            div.style.cssText = "background-color: white;margin-top: 18px;min-height: 150px;border: rgb(245,245,245) solid 1px;";

            //鼠标移入div产生阴影
            div.onmouseover = function () {
                div.style.boxShadow ="2px 2px 10px #909090";
            }
            //鼠标移出div消除阴影
            div.onmouseout = function () {
                div.style.boxShadow ="";
            }

            authorImg.id = blogid+"-HP"+artid;
            loadHP(blogid,authorImg.id);

            lk.className = "layui-icon layui-icon-praise";
            lk.innerText = articleLike + "";
            rm.className = "layui-icon layui-icon-reply-fill";
            rm.innerText = articleRemark + "";
            titleA.innerText = "" + articleTitle;
            content.innerText= articleContent;
            footerB.innerText="发 表 时 间 : ";
            footerSpan1.innerText = articleDate;
            footerSpan2.innerText = "| 评论数" +  articleRemark + "人";
            footerSpan3.innerText = "| 点赞数" + articleLike + "人";

            titleA.href = "inPublicArticle?artid="+artid+"&blogid="+blogid;
            titleA.target="_blank";


            titleA.appendChild(titleB);
            title.appendChild(titleA);
            footer.appendChild(authorImg);
            footer.appendChild(footerB);
            footer.appendChild(footerSpan1);
            footer.appendChild(footerSpan2);
            footer.appendChild(footerSpan3);

            leftDiv.appendChild(document.createElement("br"));
            leftDiv.appendChild(img);
            leftDiv.appendChild(document.createElement("br"));
            leftDiv.appendChild(document.createElement("br"));
            leftDiv.appendChild(document.createElement("br"));
            rightDiv.appendChild(title);
            rightDiv.appendChild(content);
            rightDiv.appendChild(footer);
            lastDiv.appendChild(document.createElement("br"));
            lastDiv.appendChild(lk);
            lastDiv1.appendChild(document.createElement("br"));
            lastDiv1.appendChild(rm);

            div.appendChild(leftDiv);
            div.appendChild(rightDiv);
            div.appendChild(lastDiv);
            div.appendChild(lastDiv1);

            return div;
        }

        //没有更多
        function nooMre() {
            var div = document.createElement("div");
            var span= document.createElement("span");
            div.style.cssText = "font-size: 15px;  color: #909090; text-align: center; padding: 8px;background-color : white;"

            span.innerText = "没 有 更 多";

            div.appendChild(span);

            return div;
        }

    </script>

    <!-- 搜索相关 js -->
    <script type="text/javascript">
        function searchEnter(searchButtonFlag) {
            var code = event.keyCode;
            var searchContent = document.getElementById("search-input").value;
            if(code == 13||searchButtonFlag == 1){ //按下回车时code为13或直接按下搜索按钮时
                if(searchContent == ''){ //如何没有输入任何内容将刷新当前页面
                    var CHIEF = document.getElementById("CHIEF");
                    CHIEF.click();
                }else{
                    ajaxSendMessage("post","searchArticle","searchContent="+searchContent,function (ajax) {
                        var data = JSON.parse(ajax.responseText);
                        // alert(ajax.responseText);
                        var DIV = document.getElementById("right-soma");

                        DIV.innerHTML = "";

                        if(data.bloggerArticlesList == null) //不存在任何文章
                            return;

                        for(var i = 0 ; i < data.bloggerArticlesList.length ; i++){
                            var ARTICLE = data.bloggerArticlesList[i];
                            var AT =  ARTICLE.title;

                            var len = ARTICLE.content.length;
                            var AC =  (len > 120 ?
                                ARTICLE.content.slice(0,70) + "......"
                                + ARTICLE.content.slice(len-40,len-10) + "......"
                                : ARTICLE.content);
                            var AD =  dateFormat(new Date(ARTICLE.publictime.time));
                            var AR =  data.B_R['artid'+ARTICLE.artid];
                            var AL = ARTICLE.like;

                            var div = articleItem(ARTICLE.blogid,ARTICLE.artid,AT,AC,AD,AR,AL);///
                            DIV.appendChild(div);
                        }
                        DIV.appendChild(nooMre());
                    },false);
                }
            }
        }

        function serarchButton(){
            searchEnter(1);
        }
    </script>

    <!-- 页面初始胡相关 js -->
    <script type="text/javascript">
        var blogid;
        var blogUsername;
        var blogPassword;

        <!-- 加载cookie信息 -->
        function loadCookeiesInfo() {
            var map = _loadCookeiesInfo();

            blogid = map['blogid'];
            blogUsername = map['username'];
            blogPassword = map['password'];

            if(typeof(blogid) == "undefined"){ //游客进入

            }
        }

        <!-- 登录检查 -->
        function checkLogin() {
            if(typeof(blogid)=="undefined"){
                // var bloggerImage    = document.getElementById("bloggerImage");
                // var bloggerImageImg = document.getElementById("bloggerImage-img");
                // alert(bloggerImage);
                // bloggerImage.href= "inlogin";
                // bloggerImageImg.src = "css\/login.jpg";

                var loginExit       = document.getElementById("login_exit");  //更改页面右侧导航栏第一项为进行登录
                loginExit.innerText = "进行登录";
                loginExit.href      = "inlogin";

                var writerBlog = document.getElementById("writer-blog");
                writerBlog.innerText = "请登录";
                writerBlog.href = "inlogin";
            }else {
                //非游客登录时加载相关信息
                loadHP(blogid,"header-HP"); //头像
                loadBackgorund(blogid);     //背景图片
                loadPersonInfo();           //个人相关信息
            }
        }

        <!-- 加载个人信息 -->
        function loadPersonInfo() {

        }

        //页面初始化时调用该函数
        function initBody() {
            loadCookeiesInfo();
            checkLogin();       //检查登录
            loadArticlesInfo(); //加载所有文章信息
        }
    </script>
</html>

