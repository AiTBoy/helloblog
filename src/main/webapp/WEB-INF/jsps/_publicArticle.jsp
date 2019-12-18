<%@ page import="com.helloblog.domain.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.helloblog.domain.Remark" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>博文</title>

    <!-- 相关图标引入 -->
    <script url="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/layui.js"></script>
    <link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/css/layui.css" media="all" />

    <link rel="stylesheet" href="css/_publicArticle.css"/>

</head>

<body style="width:1920px;" onload="initBody()">

    <div class="header">
        <div style="margin-left: 200px; margin-top: 5px; font-size: 16px; float: left;">
            <img src="css/helloblogicon-dog.png" style="width: 40px;height: 40px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;float: left;">
            <a href="loadPublicAritcle" style="font-size: 28px;color: blue;">H E L L O B L O G </a>
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

    <div class="page">
        <div class="soma">

            <div class="left-soma">
                <!-- 基础信息 -->
                <div class="baseInfo" style="border: whitesmoke solid 1px;">
                    <div class="photo">
                        <img id="baseInfo-HP" src="css/user.jpg" height="60px" />
                    </div>
                    <div class="nickname-pc">
                        <div class="nickname" style="font-size: 25px; font-family: microsoft yahei;">
                        ${requestScope.blogger.username}
                    </div>
                    <div class="personal-center">
                        <a id="HisPage" href="#" style="text-decoration: none;color: blue;" onclick="inOthersPage()">进入 Ta 的 个 人 主 页 </a>
                    </div>
                </div>
                <!-- 总体信息 -->
                </div>
                <div class="totalInfo" style="border: whitesmoke solid 1px;">
                        <div class = "likeNum">
                            <a href="#" style="text-decoration: none; font-size: 28px;" onclick="like()">
                                <i class="layui-icon layui-icon-praise" style="font-size: 30px; color: #1E9FFF;"></i>
                            </a> <span id="LIKES" style="font-size: 10px;"> ${requestScope.article.like}  人</span>
                        </div>
                        <div class="remarkNum">
                            <a href="#REMAEK" style="text-decoration: none; font-size: 28px;" onclick="replyBlogger()">
                                <i class="layui-icon layui-icon-edit" style="font-size: 30px; color: #1E9FFF;"></i>
                            </a> <span style="font-size: 10px;"> ${requestScope.articleRemarks.size()} 人 </span>
                        </div>
                        <div class="lookNum">
                            <a style="text-decoration: none; font-size: 28px;">
                                <i class="layui-icon layui-icon-log" style="font-size: 30px; color: #1E9FFF;"></i>
                            </a> <span style="font-size: 10px;"> 131 人 </span>
                        </div>
                        <div class="fensNum">
                            <a style="text-decoration: none; font-size: 28px;">
                                <i class="layui-icon layui-icon-face-smile" style="font-size: 30px; color: #1E9FFF;"></i>
                            </a> <span style="font-size: 10px;"> 1 人 </span>
                        </div>
                    </div>
                <div class="Rank-ing" style="border: whitesmoke solid 1px;">

                    <div class="rank">
                        <b style="font-size: 20px;">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #1E9FFF;"></i>
                            等 级
                        </b>
                        <span> &nbsp;
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #1E9FFF;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #1E9FFF;"></i>
                            <i class="layui-icon layui-icon-rate-half" style="font-size: 30px; color: #1E9FFF;"></i>
                        </span>
                    </div>

                    <div class="ranking">
                        <b style="font-size: 20px;">
                            <i class="layui-icon layui-icon-chart-screen" style="font-size: 30px; color: #1E9FFF;"></i>
                            排 名
                        </b><span style="color: #2FA0EC;"> &nbsp; 111 位</span>
                    </div>
                </div>
                <!-- 个人简介 -->
                <div class="individual-resume" style="border: whitesmoke solid 1px;">
                    <div style="font-size: 25px; margin: 3px; text-align: center;">
                        <b>Ta 的 个 人 简 介</b>
                    </div>
                    <hr/>
                    <span style="margin-left: 8px">${requestScope.blogger.signature}</span>
                </div>
                <!-- 其他相关博客 -->
                <div class="AboutArticle" id="AboutArticle" style="border: whitesmoke solid 1px;">
                    <div style="font-size: 25px; margin: 3px; text-align: center;">
                        <b>Ta 的 博 客</b>
                    </div>
                    <hr/>
                </div>
            </div>

            <div class="rigt-soma" style="border: whitesmoke solid 1px;">
            <div class="title">
                <b style="font-size: 35px;">‍${requestScope.article.title}</b>
                <hr/>
            </div>
            <div class="content">
                ${requestScope.article.content}
            </div>
            <div style="float: right; margin: 20px;">
                <b style="font-family: microsoft yahei; font-size: 10px;">⏱ 发 表 时 间 : </b> ${requestScope.article.publictime}
            </div>
            <div class="remark">
                <div class="youRemark">
                    <form id="remarkForm">
                        <textarea id = "REMAEK" style="width: 100%; height: 100px; font-size: 20px; letter-spacing: 1px; font-family: microsoft yahei;" placeholder="✍留下你来过的痕迹......"></textarea>
                        <input type="button" style="cursor: hand;float: right; margin: 5px; width: 150px; font-size: 20px; background-color: white; color: red;" value=" 📃 发 布 评 论" onclick="remarkArticle()"  />
                    </form>
                </div>
                <div class="remarks">
                    <div style="font-size: 20px; margin: 10px;">
                        <b>🌲 评 论 区 🌲</b>
                        <hr/>
                    </div>
                    <div id="remarkPeople" style="font-size: 10px; margin: 10px;">

                    </div>
                </div>
            </div>
        </div>

        </div>
    </div>

    <!-- 用于页面的跳转隐藏表单 -->
    <form id="jump" style="display: none" method="post">
        <input type="text" name = "artid"  id = "artid" />
        <input type="text" name = "blogid" id = "blogid"/>
    </form>
</body>

    <script type="text/javascript" src="js/_loadImageTools.js"></script>
    <script type="text/javascript" src='js/_ajaxTools.js'></script>
    <script type="text/javascript" src='js/_commonPageTools.js'></script>

    <!-- 文章 / 评论 / 回复 / 点赞相关 js -->
    <script type="text/javascript">
        var replyFlag = 0;   //回复评论标志 如何该标志为1，RID才有值
        var RID;             //某条评论的id

        //点赞
        function like() {
            ajaxSendMessage("post","likeDeal","artid="+${requestScope.article.artid},function (ajax) {
                var LIEKS = document.getElementById("LIKES");
                var likes = ajax.responseText;
                LIKES.innerText = "";
                LIKES.innerText = likes + "人";
            },true);
        }

        //罗列某博主的所有博客
        function listArticles() {
            var AboutArticle = document.getElementById("AboutArticle");

            <%List<Article> arts =  (List<Article>)request.getAttribute("bloggerArticles");%>

            <%for(Article art : arts){ %>
            var DIV  = document.createElement("div");
            var div1 = document.createElement("div");
            var div2 = document.createElement("div");
            var a    = document.createElement("a");
            var hr   = document.createElement("hr");


            a.innerText    = '<%=art.getTitle()%>';
            div2.innerText = "⏱ 发表时间 :" + '<%=art.getPublictime()%>';

            // DIV.style.boxShadow = "10px 10px 10px #909090";
            // DIV.style.backgroundColor = "yellow";
            div1.style.margin     = "10px";
            div1.style.marginLeft = "15px";
            div1.style.fontSize   = "20px";
            div1.style.fontFamily = "microsoft yahei";
            div2.style.margin     = "10px";
            div2.style.marginLeft = "15px";
            div2.style.fontSize   = "12px";
            div2.style.fontFamily = "microsoft yahei";
            a.style.textDecoration= "none";
            a.style.color = "gray";
            a.setAttribute("href","#");

            a.onclick = function () {
                var artid    = document.getElementById("artid");
                var blogid   = document.getElementById("blogid");
                artid.value  = '<%=art.getArtid()%>';
                blogid.value = '<%=art.getBlogid()%>';
                sumbitForm("inPublicArticle");
            };


            div1.appendChild(a);
            DIV.appendChild(div1);
            DIV.appendChild(div2);
            DIV.appendChild(hr);
            AboutArticle.appendChild(DIV);
            <%}%>
        }

        //评论区容器 (评论人/点赞数/评论内容/评论日期)
        function remarkAreaContainer(remarkid,usrname,praise,remarkcontent,dateTime) {
            <!-- 容器 -->
            var remarkPeople       = document.getElementById("remarkPeople");
            var people_likes       = document.createElement("div");
            var people             = document.createElement("div");
            var likes              = document.createElement("div");
            var content_date_reply = document.createElement("div");
            var content            = document.createElement("div");
            var date               = document.createElement("div");
            var reply              = document.createElement("div");
            var replyRemark        = document.createElement("div");

            var peopleA = document.createElement("a");
            var peopleB = document.createElement("b");
            var likesA  = document.createElement("a");
            var likesB  = document.createElement("b");
            var replyB  = document.createElement("b");
            var replyA  = document.createElement("a");
            var replyRemarkB  = document.createElement("b");
            var replyRemarkA  = document.createElement("a");

            //回复评论部分
            var replyRearmkDiv = document.createElement("div");


            <!-- css -->
            peopleA.style.cssText       = "font-size:22px; text-decoration:none;"
            likesA.style.cssText        = "font-size:20px; text-decoration:none;"
            people.style.cssText        = "margin-left:10px; float:left;"
            likes.style.cssText         = "margin-left:10px; float:right;font-size: 12px;"
            people_likes.style.cssText  = "float: initial;";
            content.style.cssText       = "margin-left: 12px; font-family: microsoft yahei; font-size: 15px;";
            date.style.cssText          = "float: right; font-size: 12px;";
            reply.style.cssText         = "margin-right: 15px; float: right; font-size: 12px;";
            replyRemark.style.cssText   = "margin-right: 15px; float: right; font-size: 12px;";
            content_date_reply.style.cssText
                = "margin-top: 10px; float: initial; width: 100%;";
            replyA.style.cssText        = "text-decoration: none;";
            replyRemarkA.style.cssText  = "text-decoration: none;cursor:hand;";
            replyRearmkDiv.style.cssText= "border: skyblue solid 1px;border-width: 0 0 0 4px;width: 89%;float : left;margin-left: 121px;margin-top:5px;";

            <!-- 相关属性设置 -->
            // peopleA.setAttribute("href","#");
            likesA.setAttribute("id",remarkid);      //这里设置点赞时页面位置保存不变
            likesA.setAttribute("href","#"+likesA.id);
            replyA.setAttribute("href","#REMAEK");
            // replyRemarkA.href = "#";

            var ajax = getAjx();
            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        var data = JSON.parse(ajax.responseText);
                        likesB .innerText = "点赞数:\t" + data.likes + "人 \t";
                    }else {
                        alert("评论点赞失败 [服务器繁忙]");
                    }
                }else{

                }
            }

            likesA.onclick = function () {
                ajax.open("get","remarkLikeDeal?remarkid="+remarkid,false);
                ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
                ajax.send("remarkid="+remarkid);
            };

            replyA.onclick = function () { //回复评论
                replyFlag = 1;  //回复标志，标志回复别人的评论
                var REMAEK = document.getElementById("REMAEK");
                REMAEK.placeholder = "@"+usrname;
                RID = remarkid;//将要回复的这条评论的id
            }

            var lookreplyflag = 1;
            var replyNum = 0;
            replyRemarkA.onclick = function () {
                if(lookreplyflag == 1){
                    //动态加载回复评论的信息
                    ajaxSendMessage("post","getAllReply","remarkid="+remarkid,function (ajax) {
                        var data = JSON.parse(ajax.responseText);
                        var REPLYLIST = data.replyList;
                        replyRearmkDiv.innerHTML = "";
                        replyNum = REPLYLIST.length;
                        for(var i = 0 ; i < REPLYLIST.length ; i++){
                            replyRemarkItem(replyRearmkDiv,REPLYLIST[i]);
                        }
                    },false);
                    replyRemarkB.innerText = " 收起回复(" +  replyNum +")▲ |";
                    lookreplyflag = 0;
                }else {
                    replyRearmkDiv.innerHTML = "";
                    lookreplyflag = 1;
                    replyRemarkB.innerText = " 查看回复("+ replyNum  +")▼ |";
                }
            }

            //获取回复评论数目
            ajaxSendMessage("post","getAllReply","remarkid="+remarkid,function (ajax) {
                replyNum = JSON.parse(ajax.responseText).replyList.length;
                replyRemarkB.innerText = " 查看回复("+ replyNum  +")▼ |";
            },false);

            <!-- 插入内容 -->
            peopleA.innerText = usrname;
            likesA .innerText = "👍";
            likesB .innerText = "点赞数:\t" + praise + "人 \t";
            content.innerText = remarkcontent;
            date   .innerText = dateTime;
            replyB .innerText = "回复评论 |";

            <!-- 组装 ︿ ﹀   -->
            peopleB.appendChild(peopleA);
            people.appendChild(peopleB);
            likesB.appendChild(likesA);
            likes.appendChild(likesB);
            people_likes.appendChild(people);
            people_likes.appendChild(likes);
            replyA.appendChild(replyB);
            replyRemarkA.appendChild(replyRemarkB);
            reply.appendChild(replyA);
            replyRemark.appendChild(replyRemarkA);
            content_date_reply.appendChild(content);
            content_date_reply.appendChild(date);
            content_date_reply.appendChild(replyRemark);
            content_date_reply.appendChild(reply);
            remarkPeople.appendChild(people_likes);
            remarkPeople.appendChild(document.createElement("br"));
            remarkPeople.appendChild(document.createElement("br"));
            remarkPeople.appendChild(content_date_reply);
            remarkPeople.appendChild(document.createElement("br"));
            remarkPeople.appendChild(replyRearmkDiv);
            remarkPeople.appendChild(document.createElement("hr"));

        }

        //进入该页面时加载评论区域
        function loadRemarks(){
            <%for(Remark remark : (List<Remark>)request.getAttribute("articleRemarks")){ %>
            var dateTime = dateFormat(new Date('<%=remark.getDatetime()%>'));
            var ajax = getAjx();
            ajax.onreadystatechange=function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        var data = JSON.parse(ajax.responseText);
                        remarkAreaContainer('<%=remark.getRemarkid()%>',data.blogger.username,'<%=remark.getPraise()%>'
                            ,'<%=remark.getContent()%>',dateTime);
                    }else{
                        remarkAreaContainer('<%=remark.getRemarkid()%>','<%=remark.getRemarkblogid()%>','<%=remark.getPraise()%>'
                            ,'<%=remark.getContent()%>',dateTime);
                        alert(ajax.status + "获取评论人昵称错误！！！");
                    }
                }
            }

            ajax.open("post","bloggerinfo",false);
            ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
            ajax.send("bloggerNameReqFlag=1&"+"remarkblogid="+'<%=remark.getRemarkblogid()%>');
            <%}%>
        }

        //进行评论
        function remarkArticle() {

            var REMAEK = document.getElementById("REMAEK");
            var remarkcontent = REMAEK.value;

            if(remarkcontent.trim() == "")
                alert("温馨提示: 评论不能为空");
            else{

                if(replyFlag == 1){  //回复他人的评论
                    var param = "replyblogid="+blogid+"&remarkid="+RID+"&content="+remarkcontent;
                    ajaxSendMessage("post","addOneReply",param,function (ajax) {
                        alert("回复成功！！！");
                        document.getElementById("REMAEK").value = "";
                    },false);
                    return ;
                }

                //以下为回复博主
                var ajax = getAjx();

                ajax.onreadystatechange=function(){
                    if(ajax.readyState==4){
                        if(ajax.status==200){
                            //将服务端传来的JSON对象转换成JSON
                            var data = JSON.parse(ajax.responseText);
                            var dateTime = new Date(data.remark.datetime.time);

                            remarkAreaContainer(data.remark.remarkid,data.remark.remarkblogid,data.remark.praise,remarkcontent,dateFormat(dateTime));

                            alert("评论成功");
                        }else if(ajax.status==404){
                            alert("like is failed!!! Again");
                        }else if(ajax.status==500){
                            alert("500");
                        }
                    }
                }
                var url = "articleRemark";

                ajax.open("post",url,true);
                ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
                //ajax.send("blogid="+1+"&content="+remarkcontent);
                ajax.send("artid=" + ${requestScope.article.artid}
                    + "&content=" + remarkcontent
                    + "&remarkblogid=" + blogid);  //这里需要修改
            }

        }

        //将回复标志标志为回复博主
        function replyBlogger(){
            replyFlag = 0;
            var REMAEK = document.getElementById("REMAEK");
            REMAEK.placeholder = "@"+"博主";
        }

        //回复评论项 remark['']
        function replyRemarkItem(DIV,REPLYER) {
            var con     = document.createElement("div");
            var datetime= document.createElement("span");
            var replyer = document.createElement("span");
            var content = document.createElement("span");


            replyer.innerText = REPLYER['replyblogid']+"的回复:";
            content.innerText = REPLYER['content'];
            datetime.innerText= ""+ dateFormat(new Date(REPLYER['datetime'].time));

            con.style.cssText = "width: 100%;font-size: 12px;min-height: 50px;color: gray;";
            replyer.style.cssText = "margin-left: 12px;"
            content.style.cssText = "margin-left: 12px;"
            datetime.style.cssText = "margin-left: 0px;color: gray;";

            con.appendChild(datetime);
            con.appendChild(replyer);
            con.appendChild(content);

            DIV.appendChild(con);
        }

        //日期格式转换
        function dateFormat(date) {
            var  dateformat = "";

            dateformat +=          date.getFullYear();
            dateformat +=   "-"  + date.getMonth();
            dateformat +=   "-"  + date.getDay();

            dateformat +=   "  " + date.getHours();
            dateformat +=   ":"  + date.getMinutes();
            dateformat +=   ":"  + date.getSeconds();

            return dateformat;
        }

    </script>

    <!-- 博主首页个人信息相关 js -->
    <script type="text/javascript">
        //进入别人的主页
        function inOthersPage() {
            var HisPage = document.getElementById("HisPage");
            var blogid  = '<%=((Article)request.getAttribute("article")).getBlogid()%>';
            HisPage.href = "inPersonPage?fensBlogid="+blogid; //这里fensBlogId是从首页进入文章时博主的id
            HisPage.click();
        }

        //加载别人的背景图片以及图像
        function loadBackgroundHP() {
            loadHP('${requestScope.blogger.blogid}',"baseInfo-HP");
            loadBackgorund('${requestScope.blogger.blogid}');
        }

        //隐藏表单提交
        function sumbitForm(url) {
            var jump  = document.getElementById("jump");
            jump.action = url;
            jump.submit();
        }

        // 跳转到首页
        function titleJump() {
            sumbitForm("loadPublicAritcle");
        }

    </script>

    <!-- 页面初始化相关 js -->
    <script type="text/javascript">
        var blogid;
        var username;
        var password;

        <!-- 加载cookie信息 -->
        function loadCookeiesInfo() {
            var map = _loadCookeiesInfo();

            blogid = map['blogid'];
            blogUsername = map['username'];
            //blogPassword = map['password'];

            if(typeof(blgoid) == "undefined"){

            }
        }
        <!-- 登录检查 -->
        function checkLogin() {
            if(typeof(blogid)=="undefined"){
                var writerBlog = document.getElementById("writer-blog");
                writerBlog.innerText = "请登录";
                writerBlog.href = "inlogin";
            }else {
                //非游客登录时加载相关信息
                loadHP(blogid,"header-HP"); //头像
            }
        }

        //页面初始化时将实行
        function initBody() {
            loadCookeiesInfo();
            checkLogin();
            loadBackgroundHP();         //加载别人的头像以及背景图片
            loadRemarks();
            listArticles();
        }
    </script>
</html>

