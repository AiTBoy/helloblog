/**
 *
 * 加载cookie信息
 * 该方法主要用于加载游览器中cookie信息
 *  返回值为map.map中包含 blogid username password
 */

function _loadCookeiesInfo() {
    var COOKIE = document.cookie.split(";");

    var map = new Object();
    for(var i = 0 ; i < COOKIE.length ; i++){
        var tmp = COOKIE[i].split("=");
        map[(tmp[0].toString()+" ").trim()] = tmp[1];
    }

    return map;
}

/**
 *
 * 获取radio的值
 */
function getRadioValue(radioName){
    var radios = document.getElementsByName(radioName);
    var value;
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked){
            value = radios[i].value;
            break;
        }
    }
    return value;
}

/**
 *
 * 获取select标签下的值
 */
function getSelectValue(selectId){
    var T = document.getElementById(selectId);
    var index = T.selectedIndex;
    return T.options[index].text;
}


/**
 *
 * 日期格式转换
 */
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