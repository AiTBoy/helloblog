
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