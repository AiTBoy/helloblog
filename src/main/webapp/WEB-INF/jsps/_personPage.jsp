<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<html>
<head>
    <meta charset="utf-8">
    <title>个人主页</title>
    <link rel="stylesheet" href="css/_personPage.css" charset="utf-8"/>

    <!-- 相关图标引入 -->
    <script url="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/layui.js"></script>
    <link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/css/layui.css" media="all" />

</head>
<body style="width:1920px;" onload="initBody();">
    <div class="header">
        <div style="margin-left: 200px; margin-top: 5px; font-size: 16px; float: left;">
            <img src="css/helloblogicon-dog.png" style="width: 40px;height: 40px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;float: left;">
            <a href="loadPublicAritcle" style="font-size: 28px;color: blue;text-decoration: none;">H E L L O B L O G </a>
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

    <div class="page" style="width: 1920px">
        <div class="bloggerheader">
            <div style="margin-top: 30px; font-size: 30px; font-family: microsoft yahei;">
                <span id="bloggerheader-username">✖ ✖ ✖</span>个人主页
            </div>
        </div>

        <div class="soma">

            <div class="left-soma">
                <div class="baseInfo" style="border: whitesmoke solid 1px;">
                    <div class="photo">
                        <img id="baseInfo-photo-HP" src="css/user.jpg" style="width: 60px;height: 60px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">
                    </div>
                    <div class="nickname-pc">
                        <div id="baseInfo-nickname" class="nickname" style="font-size: 25px; font-family: microsoft yahei;">AiT Boy</div>
                        <div class="personal-center">
                            <a href="#" style="text-decoration: none;color: deepskyblue;">进入 Ta 的 论坛 </a>
                        </div>
                    </div>
                    <div style="float: left;width: 100px;height: 30px;text-align: center;margin-left:80px;margin-top: 10px;">
                        <a id="careA" href="#" onclick="careDeal()"><div style="float: left;"><i id="careI" class="layui-icon layui-icon-add-circle" style="font-size: 25px; color: #1E9FFF;"></i></div></a>
                        <div id="unfollow" style="float: left;margin-top : 10px;font-size: 8px;">添加关注</div>
    <%--                    <a id="careA" href="#" onclick="careDeal()"><div style="float: left;"><i id="careI" class="layui-icon layui-icon-ok-circle" style="font-size: 25px; color: #1E9FFF;"></i></div></a>--%>
    <%--                    <div id="unfollow " style="float: left;margin-top : 10px;font-size: 8px;">取消关注</div>--%>
                    </div>
                </div>
                <div class="totalInfo" style="border: whitesmoke solid 1px;">
                    <div class = "artilceNum">
                        <a style="text-decoration: none; font-size: 14px;"> 作品数: </a> <span id="totalInfo-artilceNum-articles" style="font-size: 12px;">0</span>
                    </div>
                    <div class="remarkNum">
                        <a style="text-decoration: none; font-size: 14px;"> 评论数: </a> <span id="totalInfo-artilceNum-remarkedNum" style="font-size: 12px;">0 </span>
                    </div>
                    <div class="lookNum">
                        <a style="text-decoration: none; font-size: 14px;"> 访问数: </a> <span style="font-size: 12px;"> 131 人 </span>
                    </div>
                    <div class="fensNum">
                        <a style="text-decoration: none; font-size: 14px;"> 粉丝数: </a> <span id="totalInfo-fensNum-span" style="font-size: 12px;"> 0 人 </span>
                    </div>
                </div>
                <div class="Rank-ing" style="border: whitesmoke solid 1px;">
                    <div class="rank">
                        <b style="font-size: 20px;">当 前 等 级</b><span> &nbsp; 7 级</span>
                    </div>
                    <div class="ranking">
                        <b style="font-size: 20px;">全 网 排 名</b><span style="color: #2FA0EC;"> &nbsp; 1110 位</span>
                    </div>
                </div>
                <div class="individual-resume" style="font-size: 18px;" style="border: whitesmoke solid 1px;">
                    <div style="font-size: 25px; margin: 3px; text-align: center;">
                        <b>Ta 的 基 本 信 息</b>
                    </div>
                    <hr/>
                    <div  style="margin-left: 18px;margin-top: 20px;">
                        性别 : <span id="individual-resume-sex"></span><br /><br />
                    </div>
                    <div  style="margin-left: 18px">
                        年龄 : <span id="individual-resume-age"></span><br /><br />
                    </div>
                    <div  style="margin-left: 18px">
                        生日 : <span id="individual-resume-birthday"></span><br /><br />
                    </div>
                    <div  style="margin-left: 18px">
                        地址 : <span id="individual-resume-address"></span><br /><br />
                    </div>
                    <div  style="margin-left: 18px">
                        入驻时间 : <span id="individual-resume-registerdate"></span><br /><br />
                    </div>
                </div>
                <div class="individual-resume" style="border: whitesmoke solid 1px;">
                    <div style="font-size: 25px; margin: 3px; text-align: center;">
                        <b>Ta 的 个 人 简 介</b>
                    </div>
                    <hr/>
                    <span id="individual-resume-signature" style="margin-left: 8px">where there is a will there is a way</span>
                </div>
                <div class="AboutArticle" id="AboutArticle" style="border: whitesmoke solid 1px;">
                    <div style="font-size: 25px; margin: 3px; text-align: center;">
                        <a href="#right-soma" style="text-decoration: none;"><b>Ta 的 博 客 >>></b></a>
                    </div>
                    <hr/>
                </div>
            </div>

            <div class="rigt-soma" id="right-soma" style="border: whitesmoke solid 1px;">
                <div class="title">
                    <b style="font-size: 20px;">‍他的博客</b>
                </div>
                <hr/>
            </div>

        </div>

        <div class="footer">
            <b>H E L L O B L O G 欢 迎 你 的 到 来 </b>
        </div>
    </div>

</body>

    <!-- js 部分 -->
    <script type="text/javascript" src='js/_ajaxTools.js'></script>
    <script type="text/javascript" src="js/_loadImageTools.js"></script>
    <script type="text/javascript" src="js/_commonPageTools.js"></script>

    <!-- 关注相关js -->
    <script type="text/javascript">
        var careFlag = 0; //0表示还未关注该博主 否则1

        function loadCookeies(){
            var COOKIE = document.cookie.split(";");

            var map = new Object();
            for(var i = 0 ; i < COOKIE.length ; i++){
                var tmp = COOKIE[i].split("=");
                map[(tmp[0].toString()+" ").trim()] = tmp[1];
            }

            return map;
        }

        // 关注处理
        function careDeal(){
            var map = loadCookeies();

            if(careFlag == 0){ //转为关注状态
                var unfollow = document.getElementById("unfollow");
                unfollow.innerText = "取消关注";
                var careI = document.getElementById("careI");
                careI.className = "layui-icon layui-icon-ok-circle";
                careFlag = 1;
                ajaxSendMessage("post","addCare","fensid="+map['blogid']+"&careid="+blogid,function (ajax) { //添加关注请求

                },false);
            }else if(careFlag == 1){
                var unfollow = document.getElementById("unfollow");
                unfollow.innerText = "添加关注";
                var careI = document.getElementById("careI");
                careI.className = "layui-icon layui-icon-add-circle";
                careFlag = 0;

                ajaxSendMessage("post","cancelCare","fensid="+map['blogid']+"&careid="+blogid,function (ajax) { //取消关注请求

                },false);
            }
            loadCare();
        }

        //页面初始化时从服务端加载关注信息 caredid:被关注人的id
        function loadCare() {
            var data;
            //在家caredid的所有粉丝
            ajaxSendMessage("post","loadAllFens","blogid="+blogid,function (ajax) {
                data = JSON.parse(ajax.responseText);
                document.getElementById("totalInfo-fensNum-span").innerText = data.fenss.length + "人";
            },false);
            return data.fenss;
        }

        //查看是否已经关注某人
        function isCare() {
            var map = loadCookeies();

            var Blogid = map['blogid'];
            var Username = map['username'];
            if((Blogid+' ').trim() != ''){
                var Fenss = loadCare();
                for(var i = 0 ;i < Fenss.length ; i++){
                    if((Fenss[i])['username'] === Username){
                        return true;
                    }
                }
            }

            return false;
        }
    </script>

    <!-- 个人信息以及 博客相关信息加载 js-->
    <script type="text/javascript">

        //日期格式转换
        function dateFormat(date) {
            var  dateformat = "";

            dateformat +=           date.getFullYear();
            dateformat +=   "-"  + (date.getMonth() + 1);
            dateformat +=   "-"  + (date.getDay() + 1);

            // dateformat +=   "  " + date.getHours();
            // dateformat +=   ":"  + date.getMinutes();
            // dateformat +=   ":"  + date.getSeconds();

            return dateformat;
        }

        <!-- 加载个人信息 -->
        function loadPersonInfo() {
            ajaxSendMessage("get","bloggerinfo?blogid="+blogid+"&mycenterFlag=1",null,function (ajax) {
                var data = JSON.parse(ajax.responseText);
                var username = document.getElementById("bloggerheader-username");
                username.innerText = data.blogger.username;
                var nickname = document.getElementById("baseInfo-nickname");
                nickname.innerText = data.blogger.username;
                var sex = document.getElementById("individual-resume-sex");
                sex.innerText = data.blogger.sex;
                var age = document.getElementById("individual-resume-age");
                age.innerText = data.blogger.age;
                var birthday = document.getElementById("individual-resume-birthday");
                birthday.innerText = dateFormat(new Date(data.blogger.birthday.time));
                var address = document.getElementById("individual-resume-address");
                address.innerText = data.blogger.address;
                var registerdate = document.getElementById("individual-resume-registerdate");
                registerdate.innerText = dateFormat(new Date(data.blogger.registerdate.time));
                var signature = document.getElementById("individual-resume-signature");
                signature.innerText = data.blogger.signature;
                // alert(ajax.responseText);
            },false);
        }

        <!-- 加载博客信息 -->
        function loadArticlesInfo() {
            ajaxSendMessage("get","bloggerArticles?blogid="+blogid+"&",null,function (ajax) {
                var data = JSON.parse(ajax.responseText);

                var DIV = document.getElementById("right-soma");

                var remarkedNum = 0;
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

                    var ARTID = ARTICLE.artid;
                    var BLOGID= ARTICLE.blogid;

                    var div = articleItem(AT,AC,AD,AR,AL,ARTID,BLOGID);
                    DIV.appendChild(div);

                    ajaxSendMessage("get","bloggerRemarkedNum?artid="+ARTICLE.artid+"&",null,function (ajax) {//评论数目 博主被评论的次数
                        var data = JSON.parse(ajax.responseText);
                        remarkedNum += data.rNum;
                    },false);
                }
                DIV.appendChild(nooMre());

                document.getElementById("totalInfo-artilceNum-articles").innerText = data.bloggerArticlesList.length + "个";//该博主的作品数量
                document.getElementById("totalInfo-artilceNum-remarkedNum").innerText = remarkedNum + "次";//该博主的作品数量

            },false);
        }

        //文章列表单项
        function articleItem(articleTitle,articleContent,articleDate,articleRemark,articleLike,articleArtid,articleBlogid) {
            var div     = document.createElement("div");

            var title   = document.createElement("div");
            var content = document.createElement("div");
            var footer  = document.createElement("div");

            var titleA  = document.createElement("a");
            var titleB  = document.createElement("b");
            var footerB = document.createElement("b");
            var footerSpan1 = document.createElement("span");
            var footerSpan2 = document.createElement("span");
            var footerSpan3 = document.createElement("span");


            title.style.cssText = "margin: 8px;margin-left: 20px;font-size: 20px;font-family: microsoft yahei; color: blue"
            titleA.style.cssText = "text-decoration: none;";
            content.style.cssText = "margin: 8px;margin-left: 20px;font-family: microsoft yahei;font-size:12px;letter-spacing:1px;";
            footer.style.cssText  = "margin: 5px;font-size: 12px";
            footerB.style.cssText  = "margin: 5px;";

            titleA.innerText = articleTitle;
            content.innerText= articleContent;
            footerB.innerText="⏱ 发 表 时 间 : ";
            footerSpan1.innerText = articleDate;
            footerSpan2.innerText = "| 评论数" +  articleRemark + "人";
            footerSpan3.innerText = "| 点赞数" + articleLike + "人";

            titleA.href = "#";
            titleA.onclick = function () {
                var form = document.createElement("form");
                var artid= document.createElement("input");
                var blogid= document.createElement("input");

                form.action = "inPublicArticle";
                artid.name = "artid";
                blogid.name = "blogid";
                artid.value= articleArtid;
                blogid.value= articleBlogid;

                form.appendChild(artid);
                form.appendChild(blogid);
                document.body.appendChild(form);

                form.submit();
            }

            titleA.appendChild(titleB);
            title.appendChild(titleA);
            footer.appendChild(footerB);
            footer.appendChild(footerSpan1);
            footer.appendChild(footerSpan2);
            footer.appendChild(footerSpan3);
            footer.appendChild(document.createElement("hr"));

            div.appendChild(title);
            div.appendChild(content);
            div.appendChild(footer);

            return div;
        }

        //没有更多
        function nooMre() {
            var div = document.createElement("div");
            var span= document.createElement("span");
            div.style.cssText = "font-size: 15px;  color: #909090; text-align: center; padding: 8px"

            span.innerText = "没 有 更 多";

            div.appendChild(span);

            return div;
        }

    </script>

    <!-- 页面初始化相关js -->
    <script type="text/javascript">
        var blogid; //该首页博主的id
        var blogUsername;
        var blogPassword;

        <!-- 判断是否是他人的个人主页 -->
        function isOthersPage() {
            blogid = '${requestScope.othersId}';   ///\

            if(blogid !== null && blogid !== ''&&typeof (blogid) !== "undefined")
                return 1;
            return 0;
        }

        //加载别人的背景图片以及图像
        function loadBackgroundHP() {
            loadHP(blogid,"baseInfo-photo-HP");
            loadBackgorund(blogid);
        }

        <!-- 登录检查 -->
        function checkLogin(blogid) {
            if(typeof(blogid)=="undefined"){
                var writerBlog = document.getElementById("writer-blog");
                writerBlog.innerText = "请登录";
                writerBlog.href = "inlogin";
            }else {
                //非游客登录时加载相关信息
                loadHP(blogid,"header-HP"); //头像
            }
        }

        //页面初始化时调用该函数
        function initBody() {
            var map = _loadCookeiesInfo();

            if(isOthersPage() == 0){ //如果这里返回的是1那么blogid全局变量为该主页博主的id
                blogid       = map['blogid'];
                blogUsername = map['username'];
                blogPassword = map['password'];
            }
            checkLogin(map['blogid']);

            loadBackgroundHP();

            loadPersonInfo();
            loadArticlesInfo();

            if(isCare()){  //确定是否已经关注博主
                careDeal();
            }
        }


    </script>

</html>
