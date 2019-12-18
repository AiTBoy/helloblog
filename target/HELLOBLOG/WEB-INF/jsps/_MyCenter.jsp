<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
</head>

<link rel="stylesheet" href="css/_MyCenter.css" charset="utf-8"/>

<script url="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/layui.js"></script>
<link rel="stylesheet" href="https://heerey525.github.io/layui-v2.4.3/layui-v2.4.5/css/layui.css" media="all" />


<body style="width:1920px;" onload="initBody()">
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

    <div class="major" style="margin-top: 130px;width: 88%;margin-left: 120px">
    <div class="MenuOptions" >
        <div class="personal-data" id="personal-data" style="background-color: firebrick;">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: white;" onclick="chooseToJump('personal-data-page','personal-data');">个人资料</a>
        </div>
        <div class="edit-data" id="edit-data">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: black;" onclick="chooseToJump('edit-data-page','edit-data');">修改资料</a>
        </div>
        <div class="remark-data" id="remark-data">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: black;" onclick="chooseToJump('remark-data-page','remark-data');">我的评论</a>
        </div>
        <div class="fens-data" id="fens-data">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: black;" onclick="chooseToJump('fens-data-page','fens-data');">我的粉丝</a>
        </div>
        <div class="attention-data" id="attention-data">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: black;" onclick="chooseToJump('attention-data-page','attention-data');">关注的人</a>
        </div>
        <div class="set-data" id="set-data">
            <a href="#" style="font-size: 18px;display:block;margin-top:8px;text-decoration: none; color: black;" onclick="chooseToJump('set-data-page','set-data');">其它设置</a>
        </div>
    </div>
    <hr />

    <div class="personal-data-page" id="personal-data-page" style="width: 1400px;">
        <div style="text-align: left; margin-left: 50px;">
            <h3>基本信息</h3>
        </div>
        <hr style="margin: 15px; color: black; width: 1666px;" />
        <div style="float: left;width: 15%;">
            <div>
                <img id="personal-data-page-HP" src="css/user.jpg" style="margin-left: 50px;margin-top: 40px;margin-right: 50px;width: 110px;height: 110px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">
            </div>
            <div style="text-align: left; font-size: 16px;">
                <a onclick="modifyHeadPortrait()" style="color: #2FA0EC; text-decoration: none; margin: 5px; margin-left: 74px; margin-right: 60px;" href="#">修改头像</a>
                <input onchange="setHP(this)" id="personal-data-page-modHP-input" type="file" name="image" accept="image/*" style="display: none;"/>
            </div>
        </div>

        <div style="float: left; height: 174px;width: 50%;">
            <div style="margin: 5px;float: left; width: 90%; height: 164px;">
                <div style="margin: 15px;text-align: left;margin-left: 50px;font-size: 20px">
                    blogId : <span id="personal-data-page-blogid"></span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 50px;font-size: 20px">
                    粉丝 : <span id="personal-data-page-fens">0</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 50px;font-size: 20px">
                    关注 : <span id="personal-data-page-care">0</span>
                </div>
            </div>
        </div>
        <div style="margin: 5px;float: right;width: 8%; height: 164px;margin-right: 176px;">
            <div style="margin: 15px; font-size: 10px;">
                <a href="inPersonPage" style="text-decoration: none;">
                    <i class="layui-icon layui-icon-friends" style="font-size: 30px; color: #1E9FFF;"></i><br />
                    个人主页
                </a>
            </div>
        </div>

        <hr style="margin: 15px; float: left; width: 1200px;margin-left: 200px;" />

        <div style="float: left;margin: 0px; height: 394px;width: 1300px; font-family: microsoft yahei;">

            <div style="margin: 5px;float: left; width: 80%; height: 384px; font-size: 18px">
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    昵称 : <span id="personal-data-page-nick">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    实名 : <span id="personal-data-page-name">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    性别: <span id="personal-data-page-sex">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    生日 : <span id="personal-data-page-birthday">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    年龄 : <span id="personal-data-page-age">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    地址 : <span id="personal-data-page-address">111</span>
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 250px;">
                    个人简介 : <span id="personal-data-page-signature">111</span>
                </div>
            </div>

            <div style="margin: 5px;float: right; width: 18%; height: 384px;font-family: microsoft yahei;">
                <div style="margin: 10px; font-size: 10px;">
                    <a href="#" style="text-decoration: none;" onclick="chooseToJump('edit-data-page','edit-data');">
                        <i class="layui-icon layui-icon-form" style="font-size: 30px; color: #1E9FFF;"></i><br />
                        修改资料
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="edit-data-page" id="edit-data-page" style="display: none;">
        <div style="text-align: left; margin-left: 50px;">
            <h3>修改个人信息</h3>
        </div>
        <hr style="margin: 15px; color: black;" />
        <div style="margin: 15px;">
            <form>
                <fieldset>
                    <legend style="text-align: left;margin-left: 25px; font-family: microsoft yahei;font-size: 20px;">基础信息</legend>
                    <div style="float: left;margin: 5px;float: left; width: 80%; font-size: 18px;">
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            昵称 : <input id="edit-data-page-nick" type="text" style="width: 260px; height: 30px; font-size: 20px;" />
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            实名 :  <input id="edit-data-page-name" type="text" style="width: 260px; height: 30px; font-size: 20px;" />
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            性别 :
                            <select id="edit-data-page-sex" style="width: 260px; height: 40px; font-size: 20px;">
                                <option selected="selected">男</option>
                                <option >女</option>
                                <option >不愿意公开性别</option>
                            </select>
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            生日 :  <input id="edit-data-page-birthday" type="date" style="width: 260px; height: 30px; font-size: 20px;" />
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            年龄 :  <input id="edit-data-page-age" type="text" style="width: 260px; height: 30px; font-size: 20px;" />
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            地址 :  <input id="edit-data-page-address" type="text" style="width: 260px; height: 30px; font-size: 20px;" />
                        </div>
                        <div style="margin: 15px;text-align: left;margin-left: 40px;">
                            个人简介:
                            <br />
                            <div style="float:left; ;margin: 15px;text-align: left;margin-left: 0px;margin-bottom: 15px;">
                                <textarea id="edit-data-page-signature" style="width: 800px; height: 300px; font-size: 20px; letter-spacing: 1px; font-family: microsoft yahei;" placeholder="个人简介......"></textarea>
                            </div>
                        </div>
                    </div>
                    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                    <input id="edit-data-page-sumbit" type="button" style="width: 100px; height: 30px; float: right; margin-right: 50px;" value="确认修改" onclick="sendModify();" />
                </fieldset>
            </form>
        </div>
    </div>

    <div class="fens-data-page" id="fens-data-page" style="display: none;overflow-y: hidden; overflow-x: hidden;">
        <div id="fens-data-page-fens" style="margin: 10px;margin-top: 30px;width: 100%;text-align: left;">
            <div id="fens-data-page-fens-header" style="margin: 10px;width: 98%;height: 40px;">
                <b><span style="font-size: 25px; margin-left: 40px;">我 的 Fens</span></b>
            </div>
            <hr style="width: 98%" />

<%--            <div style="width: 96%;margin: 10px;margin-left: 20px; float: left">--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px;">--%>
<%--                    <a href="#">--%>
<%--                        <img src="css/user.jpg" style="width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px;">--%>
<%--                    <div>--%>
<%--                        梅花十三--%>
<%--                    </div>--%>
<%--                    <div style="margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b;">--%>
<%--                        双手创找财富--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr style="float: left;width: 96%"/>--%>
<%--            </div>--%>

<%--            <div style="width: 96%;margin: 10px;margin-left: 20px;float: left">--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px;">--%>
<%--                    <a href="#">--%>
<%--                        <img src="css/user.jpg" style="width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px;">--%>
<%--                    <div>--%>
<%--                        梅花十三--%>
<%--                    </div>--%>
<%--                    <div style="margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b;">--%>
<%--                        双手创找财富--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr style="float: left;"/>--%>
<%--            </div>--%>

            <div style="width: 96%;margin: 10px;margin-left: 20px;height: 60px;font-size: 18px;text-align: right;float: left;">
                <span style="color: gainsboro;">no more......</span>
            </div>
        </div>
    </div>

    <div class="remark-data-page" id="remark-data-page" style="display: none;">
        <div id="remark-data-page-myremark" style="margin: 10px;margin-top: 30px;width: 100%;text-align: left;">
            <div id="remark-data-page-myremark-header" style="margin: 10px;width: 98%;height: 40px;">
                <b><span style="font-size: 25px; margin-left: 40px;">我 评 论 的</span></b>
            </div>
            <hr style="width: 98%" />

        </div>

        <div id="remark-data-page-remarkme" style="margin: 10px;margin-top: 30px;width: 100%;text-align: left;">
            <div id="remark-data-page-remarkme-header" style="margin: 10px;width: 98%;height: 40px;">
                <b><span style="font-size: 25px; margin-left: 40px;">评 论 我 的</span></b>
            </div>
            <hr style="width: 98%" />
            <%--            <div style="width: 96%;margin: 10px;margin-left: 20px;">--%>
            <%--                <span style="font-size: 20px;margin-left: 26px;color: firebrick;">文 章 标 题</span>--%>
            <%--                <span style="font-size: 16px;color:blue">(作者: AiTBoy)</span>--%>
            <%--                <br />--%>
            <%--                <div style="margin-left: 24px;margin-top: 14px;">--%>
            <%--                    <span style="font-size: 16px;">他的评论:</span>--%>
            <%--                    <span style="font-size: 16px;">good!!!</span><br />--%>
            <%--                    <span style="font-size: 14px;color: darkgreen;">评论时间:2019-10-10 12:12:12</span>--%>
            <%--                    <span style="font-size: 14px;color: darkgreen;">|评论获赞:33 人</span>--%>
            <%--                    <span style="font-size: 14px;color: darkgreen;">|评论回复数:33 人</span>--%>
            <%--                </div>--%>
            <%--                <hr/>--%>
            <%--            </div>--%>

            <%--            <div style="width: 96%;margin: 10px;margin-left: 20px;height: 60px;font-size: 18px;text-align: right;">--%>
            <%--                <span style="color: gainsboro;">no more...</span>--%>
            <%--            </div>--%>
        </div>
    </div>

    <div class="attention-data-page" id="attention-data-page" style="display: none;">
        <div id="attention-data-page-care" style="margin: 10px;margin-top: 30px;width: 100%;text-align: left;">
            <div id="attention-data-page-care-header" style="margin: 10px;width: 98%;height: 40px;">
                <b><span style="font-size: 25px; margin-left: 40px;">我 的 Care</span></b>
            </div>
            <hr style="width: 98%" />

<%--            <div style="width: 96%;margin: 10px;margin-left: 20px; float: left">--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px;">--%>
<%--                    <a href="#">--%>
<%--                        <img src="css/user.jpg" style="width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px;">--%>
<%--                    <div>--%>
<%--                        梅花十三--%>
<%--                    </div>--%>
<%--                    <div style="margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b;">--%>
<%--                        双手创找财富--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr style="float: left;width: 96%"/>--%>
<%--            </div>--%>

<%--            <div style="width: 96%;margin: 10px;margin-left: 20px;float: left">--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px;">--%>
<%--                    <a href="#">--%>
<%--                        <img src="css/user.jpg" style="width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div style="float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px;">--%>
<%--                    <div>--%>
<%--                        梅花十三--%>
<%--                    </div>--%>
<%--                    <div style="margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b;">--%>
<%--                        双手创找财富--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr style="float: left;width: 96%"/>--%>
<%--            </div>--%>
        </div>
    </div>

    <div class="set-data-page" id="set-data-page" style="display: none;">
        <div style="text-align: left; margin-left: 50px;">
            <h3>其他设置</h3>
        </div>
        <hr style="margin: 15px; color: black;" />
        <fieldset>
            <legend style="text-align: left;margin-left: 25px; font-family: microsoft yahei;font-size: 20px;">安全设置</legend>
            <div style="float: left;margin: 5px;float: left; width: 80%;">
                <div style="margin: 15px;text-align: left;margin-left: 40px;font-size: 20px;">
                    旧密码 : <input id="set-data-page-oldpwd" type="password" style="width: 260px; height: 30px; font-size: 20px;" />
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 40px;font-size: 20px;">
                    新密码 :  <input id="set-data-page-newpwd" type="password" style="width: 260px; height: 30px; font-size: 20px;" />
                </div>
                <div style="margin: 15px;text-align: left;margin-left: 40px;font-size: 20px;">
                    新密码 :  <input id="set-data-page-newpwd_" type="password" style="width: 260px; height: 30px; font-size: 20px;" placeholder="再次输入" />
                </div>
                <input type="button" style="font-size: 10px;width: 100px; height: 30px; float: left; margin-left: 300px;" value="确认修改" onclick="modifyPassword();" />
            </div>
        </fieldset>
        <br />
        <fieldset>
            <legend style="text-align: left;margin-left: 25px; font-family: microsoft yahei;font-size: 20px;">系统设置</legend>
            <div style="float: left;margin: 5px;float: left; width: 80%;">
                <div style="margin: 15px;text-align: left;margin-left: 40px;font-size: 20px;">
<%--                    <form id="set-data-page-form" action="uploadImage" method="post" enctype="multipart/form-data">--%>
                        背景图片 :
                        <input id="set-data-page-background" type="file" name="image" accept="image/*"  style="width: 260px; height: 30px; font-size: 20px;"/>
                        <input id="set-data-page-backgroundsumbit" onclick="setBackground(document.getElementById('set-data-page-background'))" type="button" value="设置" style="width: 60px; height: 30px; font-size: 14px;" />
<%--                    </form>--%>
                </div>
            </div>
        </fieldset>
    </div>
</div>

</body>

    <script type="text/javascript" src="js/_loadImageTools.js"></script>
    <script type="text/javascript" src="js/_commonPageTools.js"></script>

    <!-- 其他修改个人资料相关 js -->
    <script type="text/javascript">
        //选择跳转
        function chooseToJump(_arg,arg_){
            var arg1 =document.getElementById("personal-data-page");
            var arg2 =document.getElementById("edit-data-page");
            var arg3 =document.getElementById("fens-data-page");
            var arg4 =document.getElementById("remark-data-page");
            var arg5 =document.getElementById("attention-data-page");
            var arg5_=document.getElementById("set-data-page");

            arg1.style.display = "none";
            arg2.style.display = "none";
            arg3.style.display = "none";
            arg4.style.display = "none";
            arg5.style.display = "none";
            arg5_.style.display= "none";

            var __arg = document.getElementById(_arg);

            __arg.style.display = "block";

            var arg6  =document.getElementById("personal-data");
            var arg7  =document.getElementById("edit-data");
            var arg8  =document.getElementById("fens-data");
            var arg9  =document.getElementById("remark-data");
            var arg10 =document.getElementById("attention-data");
            var arg10_ =document.getElementById("set-data");

            arg6.style.backgroundColor   = "white";
            arg7.style.backgroundColor   = "white";
            arg8.style.backgroundColor   = "white";
            arg9.style.backgroundColor   = "white";
            arg10.style.backgroundColor  = "white";
            arg10_.style.backgroundColor = "white";
            arg6.getElementsByTagName("a")[0].style.color = "black";
            arg7.getElementsByTagName("a")[0].style.color = "black";
            arg8.getElementsByTagName("a")[0].style.color = "black";
            arg9.getElementsByTagName("a")[0].style.color = "black";
            arg10.getElementsByTagName("a")[0].style.color = "black";
            arg10_.getElementsByTagName("a")[0].style.color = "black";

            var arg__ = document.getElementById(arg_);

            arg__.style.backgroundColor = "firebrick";
            arg__.getElementsByTagName("a")[0].style.color = "white";

            loadBlogInfoAgain(arg_);
            loadRemarkRemarked(arg_);
            loadFenss(arg_);
            loadCares(arg_);
        }

        //再次点击personal-data/edit-data重新从服务器加载数据
        function loadBlogInfoAgain(pD) {
            if(pD === "personal-data"){
                loadBlogger(1);
            }else if(pD === "edit-data"){
                loadBlogger(2);
            }
        }

        //点击我的评论时将触发该方法想服务端获得评论信息
        function loadRemarkRemarked(rD) {
            if(rD === "remark-data") {
                //加载我的评论(博主评论的所有文章)
                ajaxSendMessage("post", "bloggerAllRemarks", "blogid=" + blogid, function (ajax) {
                    var data = JSON.parse(ajax.responseText);
                    // alert(ajax.responseText);

                    var DIV = document.getElementById("remark-data-page-myremark");
                    var header = document.getElementById("remark-data-page-myremark-header");
                    var hr = document.createElement("hr");

                    DIV.innerHTML = "";//清空该div下所有内容
                    hr.style.cssText = "width: 98%";

                    DIV.appendChild(header);
                    DIV.appendChild(hr);

                    var BA = data.map.bloggerAllremarks;
                    var AS = data.map.articles;

                    function foreachAS(as, str) {
                        for (var i = 0; i < as.length; i++) {
                            if ((as[i].artid + "").trim() === str)
                                return i;
                        }
                        return -1;
                    }

                    for (var i = 0; i < BA.length; i++) {
                        var j = foreachAS(BA, (BA[i].artid + ' ').trim());

                        var title = AS[j].title;
                        var author = AS[j].blogid;
                        var remarker = "我的评论: ";
                        var content = BA[i].content;
                        var remarkTime = new Date(BA[i].datetime.time);
                        var like = BA[i].praise;
                        var reply = "0";

                        remarkItem(DIV, title, author, remarker, content, remarkTime, like, reply);
                    }
                    DIV.appendChild(nomore());
                }, false);
                //加载评论我的(博主所有文章的评论)
                ajaxSendMessage("post", "bloggerArticles", "blogid=" + blogid + "&RemarkRemarkedFlag=1", function (ajax) {
                    var data = JSON.parse(ajax.responseText);

                    var DIV = document.getElementById("remark-data-page-remarkme");
                    var header = document.getElementById("remark-data-page-remarkme-header");
                    var hr = document.createElement("hr");

                    DIV.innerHTML = "";//清空该div下所有内容
                    hr.style.cssText = "width: 98%";

                    DIV.appendChild(header);
                    DIV.appendChild(hr);

                    var ARTICLES = data.bloggerArticlesList;//所有博主的文章
                    var artidRemark = data.artidRemark;        //所有博主的文章


                    for (var i = 0; i < ARTICLES.length; i++) {
                        var title = ARTICLES[i].title;
                        var author = ARTICLES[i].blogid;

                        for (var j = 0; j < artidRemark['artid' + ARTICLES[i].artid].length; j++) {
                            var REMARK = (artidRemark['artid' + ARTICLES[i].artid])[j];

                            var remarker = REMARK.remarkid + " 的评论 :";
                            var content = REMARK.content;
                            var remarkTime = new Date(REMARK.datetime.time);
                            var like = REMARK.praise;
                            var reply = "0";
                            remarkItem(DIV, title, author, remarker, content, remarkTime, like, reply);
                        }
                    }

                    DIV.appendChild(nomore());
                }, false);
            }
        }

        function remarkItem(DIV,title,author,remarker,content,remarkTime,like,reply) {
            var div1= document.createElement("div");
            var span1=document.createElement("span");
            var span2=document.createElement("span");

            var div2= document.createElement("div");
            var span3=document.createElement("span");
            var span4=document.createElement("span");
            var span5=document.createElement("span");
            var span6=document.createElement("span");
            var span7=document.createElement("span");

            div1.style.cssText = "width: 96%;margin: 10px;margin-left: 20px;height: 100px";
            span1.style.cssText= "font-size: 18px;margin-left: 26px;color: gray";
            span2.style.cssText= "font-size: 16px;color:gray";
            div2.style.cssText = "margin-left: 24px;margin-top: 14px";

            span3.style.cssText= "font-size: 16px;color: gray";
            span4.style.cssText= "font-size: 16px;color: gray;font-";
            span5.style.cssText= "font-size: 14px;color: gray";
            span6.style.cssText= "font-size: 14px;color: gray";
            span7.style.cssText= "font-size: 14px;color: gray";

            span1.innerText = title;
            span2.innerText = "<" + author + ">";
            span3.innerText = remarker;
            span4.innerText = content;
            span5.innerText = "评论时间:" + remarkTime;
            span5.innerText += "|评论获赞:" + like + " 次";
            span5.innerText += "|评论回复:" + reply + " 人";

            div2.appendChild(span3);
            div2.appendChild(span4);
            div2.appendChild(span5);
            div2.appendChild(span6);
            div2.appendChild(span7);

            div1.appendChild(span1);
            div1.appendChild(span2);
            div1.appendChild(document.createElement("br"));
            span4.appendChild(document.createElement("br"));
            div1.appendChild(div2);
            div1.appendChild(document.createElement("hr"));

            DIV.appendChild(div1);
        }

        function nomore() {
            var div = document.createElement("div");
            var span= document.createElement("span");

            div.style.cssText = "width: 96%;margin: 10px;margin-left: 20px;height: 60px;font-size: 18px;text-align: right;";
            span.style.cssText= "color: gray";

            span.innerText = "no more ......";

            div.appendChild(span);
            return div;
        }

        //加载我的粉丝fens-data
        function loadFenss(fD) {
            if(fD === "fens-data"){
                ajaxSendMessage("post","loadAllFens","blogid="+blogid,function (ajax) {
                    var data = JSON.parse(ajax.responseText);
                    var fenss= data.fenss;
                    var DIV  = document.getElementById("fens-data-page-fens");
                    var fensDataPageFensHeader = document.getElementById("fens-data-page-fens-header");
                    var hr   = document.createElement("hr");
                    hr.style.cssText = "width: 98%";

                    DIV.innerHTML = "";

                    DIV.appendChild(fensDataPageFensHeader);
                    DIV.appendChild(hr);

                    for(var i = 0 ; i < fenss.length;i++){
                        var fensName       = fenss[i].username;
                        var fensSignture   = fenss[i].signature;
                        var fensBlogid     = fenss[i].blogid;
                        fensItem(DIV,fensName,fensSignture,fensBlogid,'F');
                    }
                    // DIV.appendChild(nomore());

                },false);
            }
        }

        function fensItem(DIV,fensName,fensSignture,fensBlogid,FC){
            var container = document.createElement("div");

            var imageDiv = document.createElement("div");
            var imageA   = document.createElement("a");
            var imageI   = document.createElement("img");

            var nameSigntureDiv = document.createElement("div");
            var nameDiv         = document.createElement("div");
            var signtureDiv     = document.createElement("div");

            var hr              = document.createElement("hr");

            imageA.href = "#";
            // imageI.src  = "css/user.jpg";
            imageI.id   = "imageIid"+fensBlogid+FC;

            imageA.onclick = function () {
                var form = document.createElement("form");
                var input= document.createElement("input");

                input.name  = "fensBlogid";
                input.value = fensBlogid;
                form.method = "get";
                form.action = "inPersonPage";

                form.appendChild(input);
                document.body.appendChild(form);

                form.submit();
            }

            loadHP(fensBlogid,imageI.id); //加载我粉丝或关注的人的头像

            container.style.cssText = "width: 96%;margin: 10px;margin-left: 20px; float: left";
            imageDiv.style.cssText  = "float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px";
            imageI.style.cssText    = "width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden";

            nameSigntureDiv.style.cssText = "float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px";
            signtureDiv.style.cssText     = "margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b";
            hr.style.cssText              = "float: left;width: 96%";

            nameDiv.innerText     = (" "+fensName).trim();
            signtureDiv.innerText = (" "+fensSignture).trim();

            imageA.appendChild(imageI);
            imageDiv.appendChild(imageA);

            nameSigntureDiv.appendChild(nameDiv);
            nameSigntureDiv.appendChild(signtureDiv);

            container.appendChild(imageDiv);
            container.appendChild(nameSigntureDiv);
            container.appendChild(hr);

            DIV.appendChild(container);
        }

        //加载我关注的人
        function loadCares(aD) {
            if(aD === "attention-data"){
                ajaxSendMessage("post","loadAllCares","blogid="+blogid,function (ajax) {
                    var data = JSON.parse(ajax.responseText);
                    var cares= data.fenss;  //fenss在后台加载的是我关注的人
                    var DIV  = document.getElementById("attention-data-page-care");
                    var attentionDataPageFensHeader = document.getElementById("attention-data-page-care-header");
                    var hr   = document.createElement("hr");
                    hr.style.cssText = "width: 98%";

                    DIV.innerHTML = "";

                    DIV.appendChild(attentionDataPageFensHeader);
                    DIV.appendChild(hr);

                    for(var i = 0 ; i < cares.length;i++){
                        var careName       = cares[i].username;
                        var careSignture   = cares[i].signature;
                        var careBlogid     = cares[i].blogid;

                        fensItem(DIV,careName,careSignture,careBlogid,'C');
                    }
                    // DIV.appendChild(nomore());

                },false);
            }
        }

        // <div style="width: 96%;margin: 10px;margin-left: 20px; float: left">
        //     <div style="float: left;background-color: white;height: 80px;width: 4%;margin-left: 40px;margin-top: 20px;">
        //         <a href="#">
        //             <img src="css/user.jpg" style="width: 50px;height: 50px;display: flex;border-radius: 50%;align-items: center;justify-content: center;overflow: hidden;">
        //         </a>
        //     </div>
        //     <div style="float: left;background-color: white;height: 80px;width: 70%;margin-top: 20px;font-size: 16px;">
        //         <div>
        //             梅花十三
        //         </div>
        //         <div style="margin-top: 8px;font-size: 12px;font-family: 'Microsoft YaHei';color: #74777b;">
        //         双手创找财富
        //         </div>
        //     </div>
        //     <hr style="float: left;width: 96%"/>
        // </div>


        // <div style="width: 96%;margin: 10px;margin-left: 20px;">
        //     <span style="font-size: 20px;margin-left: 26px;color: firebrick;">文 章 标 题</span>
        // <span style="font-size: 16px;color:blue">(作者: AiTBoy)</span>
        // <br />
        // <div style="margin-left: 24px;margin-top: 14px;">
        //     <span style="font-size: 16px;">我的评论:</span>
        // <span style="font-size: 16px;">good!!!</span><br />
        // <span style="font-size: 14px;color: darkgreen;">评论时间:2019-10-10 12:12:12</span>
        // <span style="font-size: 14px;color: darkgreen;">|评论获赞:33 人</span>
        // <span style="font-size: 14px;color: darkgreen;">|评论回复数:33 人</span>
        // </div>
        // <hr/>
        // </div>
        // <div style="width: 96%;margin: 10px;margin-left: 20px;height: 40px;font-size: 18px;text-align: right;">
        //     <span style="color: gainsboro;">no more...</span><br/>
        // </div>


        //日期格式转换
        function dateFormat(date) {
            var  dateformat = "";

            dateformat +=           date.getFullYear();
            dateformat +=   "-"  + (date.getMonth() + 1);
            dateformat +=   "-"  + (date.getDay() + 1);

            dateformat +=   "  " + date.getHours();
            dateformat +=   ":"  + date.getMinutes();
            dateformat +=   ":"  + date.getSeconds();

            return dateformat;
        }

        //页面加载时将加载博主的基本信息
        function loadBlogger(mode) {
            var ajax = getAjx();

            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        var data = JSON.parse(ajax.responseText);
                        if(mode ==  1){ //显示个人信息页面
                            var personalDataPageBlogid = document.getElementById("personal-data-page-blogid");
                            personalDataPageBlogid.innerText = data.blogger.blogid;
                            var personalDataPageNick = document.getElementById("personal-data-page-nick");
                            personalDataPageNick.innerText = data.blogger.username;
                            var personalDataPageName = document.getElementById("personal-data-page-name");
                            personalDataPageName.innerText = data.blogger.name;
                            var personalDataPageSex = document.getElementById("personal-data-page-sex");
                            personalDataPageSex.innerText = data.blogger.sex;
                            var personalDataPageBirthday = document.getElementById("personal-data-page-birthday");
                            personalDataPageBirthday.innerText = dateFormat(new Date(data.blogger.birthday.time));
                            var personalDataPageAge = document.getElementById("personal-data-page-age");
                            personalDataPageAge.innerText = data.blogger.age;
                            var personalDataPageAddress = document.getElementById("personal-data-page-address");
                            personalDataPageAddress.innerText = data.blogger.address;
                            var personalDataPageSignature = document.getElementById("personal-data-page-signature");
                            personalDataPageSignature.innerText = data.blogger.signature;
                        }
                        else if(mode == 2){ //修改个人信息页面
                            var editDataPageNick = document.getElementById("edit-data-page-nick");
                            editDataPageNick.value = data.blogger.username;
                            var editDataPageName = document.getElementById("edit-data-page-name");
                            editDataPageName.value = data.blogger.name;
                            var editDataPageSex = document.getElementById("edit-data-page-sex");
                            editDataPageSex.value = data.blogger.sex;
                            var editDataPageBirthday = document.getElementById("edit-data-page-birthday");
                            var date = new Date((new Date(data.blogger.birthday.time)/1000+86400)*1000); //当前时间加1
                            editDataPageBirthday.valueAsDate = date;
                            var editDataPageAge = document.getElementById("edit-data-page-age");
                            editDataPageAge.value = data.blogger.age;
                            var editDataPageAddress = document.getElementById("edit-data-page-address");
                            editDataPageAddress.value = data.blogger.address;
                            var editDataPageSignature = document.getElementById("edit-data-page-signature");
                            editDataPageSignature.value = data.blogger.signature;
                        }
                        //加载粉丝的数目
                        ajaxSendMessage("post","loadAllFens","blogid="+data.blogger.blogid,function (ajax) {
                            var data = JSON.parse(ajax.responseText);
                            document.getElementById("personal-data-page-fens").innerText = data.fenss.length;
                        },false);
                        //加载关注的人的数目
                        ajaxSendMessage("post","loadAllCares","blogid="+data.blogger.blogid,function (ajax) {
                            var data = JSON.parse(ajax.responseText);
                            document.getElementById("personal-data-page-care").innerText = data.fenss.length;
                        },false);

                    }else{
                        alert("服务器繁忙!!!")
                    }
                }else {

                }
            }

            ajax.open("get","bloggerinfo?blogid="+blogid+"&mycenterFlag=1",false);
            ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charest=utf-8");
            ajax.send(null);
        }

        //修改个人头像
        function modifyHeadPortrait(){
            var HPINPUT = document.getElementById("personal-data-page-modHP-input");
            HPINPUT.click();
        }

        //设置并且上传个人头像
        function setHP(source) {
            var ajax = getAjx();
            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        alert("图片上传成功");
                        loadHP1();
                    }else {
                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");
                    }
                }else {

                }
            }

            var formData = new FormData();
            formData.append("file",source.files[0]);
            formData.append("blogid",blogid);
            formData.append("type","0");  //0表示上传的时头像
            ajax.open("post","uploadImage",false);
            ajax.send(formData);
        }

        //加载个人头像HeadPhoto
        function loadHP1() {
            var ajax = getAjx();

            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        // alert("下载图片成功");

                        function blobToDataURL(blob) {
                            var a = new FileReader();
                            a.onload = function (e) {
                                document.getElementById("header-HP").src             = e.target.result;
                                document.getElementById("personal-data-page-HP").src = e.target.result;
                            }
                            a.readAsDataURL(blob);
                        }

                        blobToDataURL(ajax.response)
                    }else {
                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");
                    }
                }else {

                }
            }

            ajax.open('GET','downloadImage?blogid='+blogid+'&type=0');
            ajax.responseType = "blob";
            ajax.send(null);
        }

        //背景图片加载(个人)
        function loadBackgorund() {
            var ajax = getAjx();

            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        // alert("下载图片成功");

                        function blobToDataURL(blob) {
                            var a = new FileReader();
                            a.onload = function (e) {
                                // alert(e.target.result);
                                document.body.style.backgroundImage = "url(" + e.target.result + ")";
                            }
                            a.readAsDataURL(blob);
                        }

                        blobToDataURL(ajax.response)
                    }else {
                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");
                    }
                }else {

                }
            }

            ajax.open('GET','downloadImage?blogid='+blogid+'&type='+1);
            ajax.responseType = "blob";
            ajax.send(null);
        }

        //设置背景图片
        function setBackground(source){
            var ajax = getAjx();

            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        alert("图片上传成功");
                        loadBackgorund();//重新加载背景图片
                    }else {
                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");
                    }
                }else {

                }
            }

            var formData = new FormData();
            formData.append("file",source.files[0]);
            formData.append("blogid",blogid);
            formData.append("type","1");  //1表示上传的是头像图片

            var param = formData;
            ajax.open("post","uploadImage",false);
            ajax.send(param);
        }

        //检查个人信息修改
        function checkModify(message) {
            var kv1 = {};
            kv1.key = "nick";
            kv1.value = document.getElementById("edit-data-page-nick").value;

            if(kv1.value == ""){
                alert("温馨提示:昵称不能为空");
                return 0;
            }
            message.push(kv1);

            var kv2 = {};
            kv2.key = "sex";
            kv2.value = document.getElementById("edit-data-page-sex").value;

            if(kv2.value == ""){
                alert("温馨提示:性别不能为空");
                return 0;
            }
            message.push(kv2);

            var kv3 = {};
            kv3.key = "birthday";
            kv3.value = document.getElementById("edit-data-page-birthday").value;

            if(kv3.value == ""){
                alert("温馨提示:生日不能为空");
                return 0;
            }
            message.push(kv3);

            var kv4 = {};
            kv4.key = "age";
            kv4.value = document.getElementById("edit-data-page-age").value;

            if(kv4.value == ""){
                alert("温馨提示:年龄不能为空");
                return 0;
            }else if(isNaN(Number(kv4.value))){
                alert("温馨提示:年龄输入有误");
                return 0;
            }
            message.push(kv4);

            var kv5 = {};
            kv5.key = "address";
            kv5.value = document.getElementById("edit-data-page-address").value;

            if(kv5.value == ""){
                alert("温馨提示:地址不能为空");
                return 0;
            }
            message.push(kv5);

            var kv6 = {};
            kv6.key = "signature";
            kv6.value = document.getElementById("edit-data-page-signature").value;

            if(kv6.value == ""){
                alert("温馨提示:个人简介不能为空");
                return 0;
            }
            message.push(kv6);

            var kv7 = {};
            kv7.key = "name";
            kv7.value = document.getElementById("edit-data-page-name").value;

            message.push(kv7);

            return 1;
        }

        //数组转字符参数key -- 0 value -- 1
        function stringToParam(arr) {
            var param = "";

            for(var j = 1 ; j < arr.length ; j++){
                param += arr[j].key + "=" + arr[j].value;
                if(j != (arr.length - 1))
                    param += "&";
            }

            return param;
        }

        //发送个人信息修改
        function sendModify(){
            var message = [7];

            if(checkModify(message) == 1){ //修改通过
                alert(stringToParam(message));
                ajaxSendMessage("post","dealModify",stringToParam(message)+"&blogid="+blogid,function (ajax) {
                    var data = JSON.parse(ajax.responseText);
                    if(data.successFlag == 1){
                        alert("修改成功[表情]");
                    }else
                        alert("服务器繁忙!!修改失败[表情]");
                },false);
            }
        }

        //页面密码验证
        function checkPwd(arg1,arg2,arg3) {
            if(arg1 == ""){
                alert("请输入过去的密码!!!");
                return 0;
            }else if(arg2 === "" || arg3 === ""){
                alert("请输入你想要设置的密码!!!");
                return 0;
            }else if(arg2 !== arg3){
                alert("两次输入密码不同!!!");
                return 0;
            }else if(arg1 === arg2){
                alert("新密码和旧密码相同!!!");
                return 0;
            }
            return 1;
        }

        //个人密码修改
        function modifyPassword() {
            var oldPwd = document.getElementById("set-data-page-oldpwd").value;
            var newPwd = document.getElementById("set-data-page-newpwd").value;
            var newPwd_= document.getElementById("set-data-page-newpwd_").value;


            var param = "blogid=1&oldPwd="+oldPwd+"&newPwd="+newPwd+"&newPwd_="+newPwd_;
            if(checkPwd(oldPwd,newPwd,newPwd_) == 1){
                ajaxSendMessage("post","passwordModify",param,function (ajax) {
                    if(ajax.responseText === "error"){
                        alert("旧密码输入有误!!!");
                    }else if(ajax.responseText === "success"){
                        alert("密码修改成功!!!");
                    }
                },false);
            }
        }

    </script>

    <!-- 页面初始化相关 js -->
    <script type="text/javascript">
        var blogid;
        var blogUsername;
        var blogPassword;

        //获取Ajax对象
        function getAjx() {
            var ajax;
            if (window.XMLHttpRequest) {        //  支持火狐游览器
                return ajax = new XMLHttpRequest();
            } else if (window.ActiveXObject) {   //  支持 IE 游览器
                return ajax = new ActiveXObject("Msxml2.XMLHTTP");
            }
        }

        //向服务端发数据
        function ajaxSendMessage(method,url,param,func,sync) { // 方式/地址/参数/成功后的函数/同步
            var ajax = getAjx();

            ajax.onreadystatechange = function () {
                if(ajax.readyState == 4){
                    if(ajax.status == 200){
                        func(ajax);
                    }else {
                        alert("服务繁忙请稍后重试"+"[ "+ ajax.status + "]");
                    }
                }else {

                }
            }

            if(method == "get"){
                // url += "?" + param;
                param = null;
            }
            ajax.open(method,url,sync);
            ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charest=utf-8");
            ajax.send(param);
        }

        <!-- 加载cookie信息 -->
        function loadCookeiesInfo() {
            var map = _loadCookeiesInfo();

            blogid = map['blogid'];
            blogUsername = map['username'];
            blogPassword = map['password'];

            if(typeof(blogid) == "undefined"){ //直接跳入首页
                var chiefA = document.createElement("a");
                chiefA.href = "inlogin";
                document.body.appendChild(chiefA);
                chiefA.click();
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
                loadHP1();
                loadBackgorund();

                loadBlogger(1);
                loadBlogger(2);
            }
        }

        //页面初始化时调用该函数
        function initBody() {
            loadCookeiesInfo();
            checkLogin(blogid)
        }
    </script>

</html>
