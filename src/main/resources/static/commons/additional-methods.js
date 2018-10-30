//校验真实子网网络名称
//4-20位字符，英文、数字、下划线的组合。
$.validator.addMethod("validateNet", function(value, element) {
    var regEx = /^[a-zA-Z0-9_]{4,20}$/;
    if (value) {
        if (!regEx.test(value)) {
            return false;
        } else {
            return true;
        }
    } else {
        return null;
    }

}, "名称必须为4-20位字符，英文、数字、下划线组合");

//校验真实子网域名前缀
//4-20位字符，英文、数字、下划线的组合。
$.validator.addMethod("validatePrefix", function(value, element) {
    var regEx = /^[a-zA-Z0-9_]{1,10}$/;
    if (value) {
        if (!regEx.test(value)) {
            return false;
        } else {
            return true;
        }
    } else {
        return null;
    }

}, "名称必须为1-10位字符，英文、数字、下划线组合");

//校验ip地址是否合法
$.validator.addMethod("validateIpAddress", function(value, element) {
    var regEx = /^((25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))$/;
    if (value) {
        if (!regEx.test(value)) {
            return false;
        } else {
            return true;
        }
    } else {
        return null;
    }

}, "IP地址不合法");

//校验mac地址是否合法
$.validator.addMethod("validateMacAddress", function(value, element) {
    var regEx = /^[A-F\d]{2}:[A-F\d]{2}:[A-F\d]{2}:[A-F\d]{2}:[A-F\d]{2}:[A-F\d]{2}$/;
    if (value) {
        if (!regEx.test(value)) {
            return false;
        } else {
            return true;
        }
    } else {
        return null;
    }

}, "mac地址不合法");
