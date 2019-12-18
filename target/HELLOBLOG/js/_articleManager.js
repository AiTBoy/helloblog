// 菜单项跳转(主菜单项跳转)
function chooseToJump(arg,arg_){
    var menue     = document.getElementById("menue");
    var container = document.getElementById("container");

    var menueChilds     = menue.children;
    var containerChilds = container.children;

    var Arg = document.getElementById(arg);
    for(var i = 0 ; i < menueChilds.length ; i++){
        menueChilds[i].style.backgroundColor = "white";
        menueChilds[i].getElementsByTagName("a")[0].style.color = "black";
    }
    Arg.style.backgroundColor = "firebrick";
    Arg.getElementsByTagName("a")[0].style.color = "white";

    var Arg_ = document.getElementById(arg_);
    for(var j = 0 ; j < containerChilds.length ; j++){
        containerChilds[j].style.display = "none";
    }
    Arg_.style.display = "block";

    loadArticleList(arg);//加载文章管理中所有的文章
    loadRemarkList(arg); //加载评论管理中的全部评论
}

// 菜单项跳转(博客编辑菜单项跳转)
function chooseToJumpBlogEditor(arg,arg_){
    var allitem = document.getElementById("editor-article-page-all-item");
    var pubitem = document.getElementById("editor-article-page-pub-item");
    var priitem = document.getElementById("editor-article-page-pri-item");

    allitem.getElementsByTagName("a")[0].style.color = "gray";
    pubitem.getElementsByTagName("a")[0].style.color = "gray";
    priitem.getElementsByTagName("a")[0].style.color = "gray";

    var allcon = document.getElementById("editor-article-page-all");
    var pubcon = document.getElementById("editor-article-page-pub");
    var pricon = document.getElementById("editor-article-page-pri");

    allcon.style.display = "none";
    pubcon.style.display = "none";
    pricon.style.display = "none";

    var item = document.getElementById(arg);
    var con = document.getElementById(arg_);
    item.getElementsByTagName("a")[0].style.color = "blue";
    con.style.display = "block";
}

//编辑文章中菜单项
function articleItem(DIV,t,ty,c,p,r,l,artid,blogid) {
    var Item        = document.createElement("div");

    var title       =document.createElement("div");
    var method      =document.createElement("span");
    var titleA      =document.createElement("a");

    var footer      =document.createElement("div");
    var blank1      =document.createElement("span");
    var publictime  =document.createElement("span");
    var blank2      =document.createElement("span");
    var remarkNum   =document.createElement("span");
    var likeNum     =document.createElement("span");
    var blank3      =document.createElement("span");
    var del         =document.createElement("span");
    var delA        =document.createElement("a");
    var look        =document.createElement("span");
    var lookA       =document.createElement("a");
    var hr          =document.createElement("hr");


    titleA.href = "#"; //修改文章标题a标签
    delA.href   = "#"; //删除文章a标签
    lookA.href  = "#"; //查看文章a标签

    titleA.onclick = function () {
        chooseToJump('menue-write','write-article-page');
        document.getElementById("write-article-page-title").value = t;

        editor.txt.clear();
        editor.txt.html(''+c);
        var type = document.getElementById("write-article-page-type");
        var option=type.getElementsByTagName("option");
        for(var i = 0 ; i < option.length; i++){
            if((option[i].innerText + ' ').trim() == (ty + ' ').trim()){
                option[i].selected = true;
            }
        }
    }

    delA.onclick = function () {
        if(confirm("是否确认删除该文章!!!")){
            var param = "blogid="+blogid+"&artid="+artid;
            ajaxSendMessage("post","removeOneArticle",param,function (ajax) { // /removeOneArticle待写
                loadArticleList('menue-editor');
            },false);
        }
    }

    lookA.onclick = function () {
        var form = document.createElement("form");
        var artidI= document.createElement("input");
        var blogidI= document.createElement("input");

        form.action = "inPublicArticle";
        artidI.name = "artid";
        blogidI.name = "blogid";
        artidI.value= ""+artid;
        blogidI.value= ""+blogid;

        form.appendChild(artidI);
        form.appendChild(blogidI);
        document.body.appendChild(form);

        form.submit();
    }


    Item.style.cssText="height: 100px; width: 100%;float: left;margin-top: 5px;";

    title.style.cssText="height: 45%;margin-top: 5px;";
    method.style.cssText="border: #74777b solid 1px;height: 25px;width: 50px;display: block;float: left;margin-left: 20px;text-align: center;color: green;";
    titleA.style.cssText="margin-left: 20px;font-size: 20px;text-decoration: none;";

    footer.style.cssText="height: 30%;font-size: 12px;color: gray;margin-top: 10px;";
    blank1.style.cssText="margin-left: 10px;";
    //publictime.style.cssText="margin-left: 10px;";
    blank2.style.cssText="margin-left: 10px;";
    //remarkNum.style.cssText="height: 100px; width: 100%;float: left;margin-top: 5px;";
    //likeNum.style.cssText="height: 100px; width: 100%;float: left;margin-top: 5px;";
    blank3.style.cssText="float:right;margin-right: 30px;";
    del.style.cssText="float: right";
    delA.style.cssText="text-decoration: none;color: red;";
    look.style.cssText="float: right;";
    lookA.style.cssText="text-decoration: none;color: blue;";

    method.innerText = "私密";
    titleA.innerText = t+"";
    publictime.innerText = "发布时间" + p;
    remarkNum.innerText = "评论数"+l;
    likeNum.innerText = "点赞数"+r;
    delA.innerText = "删除";
    lookA.innerText = "查看|";

    title.appendChild(method);
    title.appendChild(titleA);

    footer.appendChild(blank1);
    footer.appendChild(publictime);
    footer.appendChild(blank2);
    footer.appendChild(remarkNum);
    footer.appendChild(likeNum);
    footer.appendChild(blank3);
    del.appendChild(delA);
    look.appendChild(lookA);
    footer.appendChild(del);
    footer.appendChild(look);

    Item.appendChild(title);
    Item.appendChild(footer);
    Item.appendChild(hr);

    DIV.appendChild(Item);
}

//评论管理菜单项
function remarkItem(DIV,ARTICLE,REMARK) { //
    var Item        = document.createElement("div");

    var title       =document.createElement("div");
    var titleA      =document.createElement("a");
    var author      =document.createElement("span");
    var myRemark    =document.createElement("span");
    var reCotent    =document.createElement("span");

    var footer      =document.createElement("div");
    var blank1      =document.createElement("span");
    var remarktime  =document.createElement("span");
    var blank2      =document.createElement("span");
    var replyNum    =document.createElement("span");
    var likeNum     =document.createElement("span");
    var blank3      =document.createElement("span");
    var del         =document.createElement("span");
    var delA        =document.createElement("a");
    var look        =document.createElement("span");
    var lookA       =document.createElement("a");

    var hr          =document.createElement("hr");

    titleA.href = "#"; //修改文章标题a标签
    delA.href   = "#"; //删除文章a标签
    lookA.href  = "#"; //查看文章a标签



    Item.style.cssText="width: 100%;float: left;margin-top: 5px;";

    title.style.cssText="height: 45%;margin-top: 5px;";
    titleA.style.cssText="margin-left: 20px;font-size: 18px;text-decoration: none;color: blue";
    author.style.cssText="font-size: 12px";
    myRemark.style.cssText="font-size: 12px;margin-left: 20px;";
    reCotent.style.cssText="ont-size: 12px;";

    footer.style.cssText="height: 30%;font-size: 12px;color: gray;margin-top: 10px;";
    blank1.style.cssText="margin-left: 10px;";
    //remarktime.style.cssText="margin-left: 10px;";
    blank2.style.cssText="margin-left: 10px;";
    //replyNum.style.cssText="height: 100px; width: 100%;float: left;margin-top: 5px;";
    //likeNum.style.cssText="height: 100px; width: 100%;float: left;margin-top: 5px;";
    blank3.style.cssText="float:right;margin-right: 30px;";
    del.style.cssText="float: right";
    delA.style.cssText="text-decoration: none;color: red;";
    look.style.cssText="float: right;";
    lookA.style.cssText="text-decoration: none;color: blue;";


    titleA.innerText = ARTICLE['title']+"";

    var AUTHOR;
    ajaxSendMessage("post","bloggerinfo","remarkblogid="+ARTICLE['blogid']+"&bloggerNameReqFlag=1",function (ajax) {
        var data = JSON.parse(ajax.responseText);
        AUTHOR = data.blogger['username'];
        author.innerText = "[作者:" + AUTHOR +"]";
    },true);

    reCotent.innerText = "我的评论:" +REMARK['content'];
    remarktime.innerText = "发布时间" + REMARK['datetime'];
    replyNum.innerText = "回复数"+1;
    likeNum.innerText = "点赞数"+REMARK['praise'];
    delA.innerText = "删除";
    lookA.innerText = "查看|";

    function lookRemark() { //点击评论将进入文章
        var form = document.createElement("form");
        var artidI= document.createElement("input");
        var blogidI= document.createElement("input");

        form.action = "inPublicArticle";
        artidI.name = "artid";
        blogidI.name = "blogid";
        artidI.value= ""+ARTICLE['artid'];
        blogidI.value= ""+ARTICLE['blogid'];

        form.appendChild(artidI);
        form.appendChild(blogidI);
        document.body.appendChild(form);

        form.submit();
    }

    delA.onclick = function () {
        if(confirm("是否确认删除该评论!!!")){
            ajaxSendMessage("post","removeOneRemark","remarkid="+REMARK['remarkid'],function (ajax) { // /removeOneArticle待写
                loadRemarkList('menue-remark');
            },false);
        }
    }

    lookA.onclick = lookRemark;
    titleA.onclick = lookRemark;


    title.appendChild(titleA);
    title.appendChild(author);
    title.appendChild(document.createElement("br"));
    title.appendChild(document.createElement("br"));
    title.appendChild(myRemark);
    title.appendChild(reCotent);

    footer.appendChild(blank1);
    footer.appendChild(remarktime);
    footer.appendChild(blank2);
    footer.appendChild(replyNum);
    footer.appendChild(likeNum);
    footer.appendChild(blank3);
    del.appendChild(delA);
    look.appendChild(lookA);
    footer.appendChild(del);
    footer.appendChild(look);

    Item.appendChild(title);
    Item.appendChild(footer);
    Item.appendChild(hr);

    DIV.appendChild(Item);



}

//从服务端加载文章信息，显示在编辑博客的列表中
function loadArticleList(arg) {
    if(arg === 'menue-editor'){
        ajaxSendMessage("post","bloggerArticles","blogid="+blogid,function (ajax) {
            var data = JSON.parse(ajax.responseText);
            // alert(ajax.responseText);
            var DIV = document.getElementById("editor-article-page-all");
            var DIV1= document.getElementById("editor-article-page-pub");
            DIV.innerHTML = "";
            DIV1.innerHTML = "";
            var BA = data.bloggerArticlesList; //
            var AS = data.B_R; //文章id与之对应的评论

            document.getElementById("allNum").innerText = BA.length;
            document.getElementById("pubNum").innerText = BA.length;

            for (var i = 0; i < BA.length; i++) {
                var title = BA[i].title;
                var type  = BA[i].type;
                var content=BA[i].content;
                var publictime = new Date(BA[i].publictime.time);
                var reply = AS['artid'+BA[i].artid];
                var like = BA[i].like;
                var artid= BA[i].artid;
                var blogid=BA[i].blogid;
                articleItem(DIV,title,type,content,publictime,reply,like,artid,blogid);
                articleItem(DIV1,title,type,content,publictime,reply,like,artid,blogid);
            }

        },true);
    }
}

//从服务端获取评论信息，现在在管理评论列表中
function loadRemarkList(arg) {
    if(arg === 'menue-remark'){
        var DIV = document.getElementById("remark-article-page");
        var header = document.getElementById("remark-article-page-historyremark");
        var hr     = document.createElement("hr");
        hr.style.cssText = "width: 98%;float: left;color: gray";
        DIV.innerHTML = ""; //清楚历史评论列表稍后重新从服务端获取
        DIV.appendChild(header);
        DIV.appendChild(hr);

        ajaxSendMessage("post","bloggerAllRemarks","blogid="+blogid,function (ajax) {
            var data = JSON.parse(ajax.responseText);
            var ARTICLES = data.map.articles;
            var REMARKS  = data.map.bloggerAllremarks;

            for(var i = 0 ; i < REMARKS.length ; i++){
                var j = 0;
                for(; j < ARTICLES.length ; j++){
                    if(ARTICLES[j].artid == REMARKS[i].artid)
                        break;
                }
                remarkItem(DIV,ARTICLES[j],REMARKS[i]);
            }

        },false);
    }

}