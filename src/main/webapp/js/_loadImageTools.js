//加载个人头像HeadPhoto
function loadHP(blogid,HPid) {
    var ajax = getAjx();

    ajax.onreadystatechange = function () {
        if(ajax.readyState == 4){
            if(ajax.status == 200){
                // alert("下载图片成功");

                function blobToDataURL(blob) {
                    var a = new FileReader();
                    a.onload = function (e) {
                        // document.getElementById("header-HP").src             = e.target.result;
                        document.getElementById(HPid).src = e.target.result;
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
function loadBackgorund(blogid) {
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