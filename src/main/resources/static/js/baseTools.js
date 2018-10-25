//对browser支持
$.browser = {};
$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());


var baseTools2 = (function () {
    // //私有属性
    // var curSeg, formSearch;
    // var tbList, tplTbList, curPage = 1, pageSize = 20;
    //私有方法
    //初始化页面UI
    // var initLayout = function () {
    //     // curSeg = CRM_HY_ZCIndex;
    //     // //按权限动态生成工具栏操作按钮
    //     // $("#divBtnPerms").btnPerms(jsonPath(top.baseTools.userBtns
    //     //     , "$.[?(@.FMK_ID=='" + (baseTools.parseUrl().params.MK_ID) + "')]"));
    //     //
    //     // tbList = $("#tbList");
    //     // tplTbList = BaseTemplate("tplTbList");
    //     // tbList.find("tbody").click(function (event) {
    //     //     //解决点击行自动选择
    //     //     if (event.target.tagName == 'TD') {
    //     //         //解决点击行自动选择
    //     //         var curSel = event.target.parentNode.cells[0].children[0];
    //     //         curSel.checked = !curSel.checked;
    //     //         event.target.parentNode.className = curSel.checked ? 'success' : '';
    //     //     }
    //     // });
    //     //
    //     // formSearch = baseTools.setIdByFormId('formSearch');
    //
    //
    // };
    //公有方法
    return {
        //校验form表单
        validateForm: function (formId, rules, messages) {
            // curSeg.onQuery();
            $(formId).validate({
                onfocusin:false,
                onfocusout:false,
                rules: rules,
                onkeyup:false,
                messages: messages,
                showErrors: function (errorMap, errorList) {
                    if (parseInt(errorList.length) > 0) {
                        $(errorList[0].element).focus();
                        layer.msg(errorList[0].message, {icon: 2});
                    }
                }
                // showErrors: function (errorMap, errorList) {
                //     var msg = "";
                //     $.each(errorList, function (i, v) {
                //         console.log("提示框的参数详解：：："+v.element);
                //         layer.tips(v.message , v.element, {
                //             tips: [1, '#3595CC'],
                //             time: 2000
                //         });
                //         return false;
                //     });
                // }

            });
        },
        //查询数据
        onQuery: function () {
            // baseTools.ajaxGet({
            //     url: "/crm/hyzc/selectCRM_HY_ZC",
            //     forms: [formSearch],
            //     params: {
            //         // JG_DM: baseTools.getUserJgDm(),
            //         CURPAGE: curPage, PAGESIZE: pageSize
            //     },
            //     callback: [curSeg.pageFlowControl]
            // });
        },
        //ajax异步提交表单
        //加载层
        // var index = layer.load(0, {shade: 0.5}); //0代表加载的风格，支持0-2
        //layer.close(index);
        ajaxSubmitForm: function (formId, url) {
            var index;
            $(formId).ajaxSubmit({
                url: url,
                dataType: 'json',
                beforeSubmit: function (arr, $form, options) {
                    index = layer.load(0, {shade: 0.2});
                    // alert("提交之前");
                    // $btn.data("loading",true);
                    // var text = $btn.text();
                    // $btn.text(text + '中...').prop('disabled', true).addClass('disabled');
                },
                success: function (data, statusText, xhr, $form) {
                    // layer.close(index);
                    layer.closeAll();
//                        var text = $btn.text();
//                        $btn.removeClass('disabled').prop('disabled', false).text(text.replace('中...', '')).parent().find('span').remove();
                    if (data.state === 'success') {
                        layer.msg(data.msg, {icon: 1}, function () {
                            debugger;
                            if (data.referer) {
                                operaModel.redirect(data.referer);//返回带跳转地址
                            } else {
                                if (data.state === 'success') {
                                    operaModel.reloadPage(window);//刷新当前页
                                }
                            }
                        });
                    } else if (data.state === 'error') {
                        layer.msg(data.msg, {icon: 2});
                    }
                },
                error: function (xhr, e, statusText) {
                    console.log(statusText);
                    operaModel.reloadPage(window);//刷新当前页
                },
                complete: function () {
                    // $btn.data("loading", false);
                }
            });
        },
        /**
         * 使用ajax的GET方式调用接口
         * <pre>
         * 例如:
         *  var xhrArgs = {
         url:"",
         params:params,
         msg:"正在加载..." ,//进度提示文字 可以不写
         callback:[pageFlowControl]
         };
         baseTools.ajaxGet(xhrArgs);
         * </pre>
         * @param xhrArgs
         */
        ajaxGet: function (xhrArgs) {
            var maskObj = null;
            var bShow = xhrArgs.hasOwnProperty("bShow") ? xhrArgs.bShow : true;

            if (bShow)
                maskObj = this.showMask(xhrArgs.msg);

            //2017.11.29 yanghongjian 支持微服务跨域调用
            var url = (xhrArgs.hasOwnProperty("fw") && xhrArgs.fw === 1
                ? "" : this.getServerUrl()) + xhrArgs.url;
            $.get(url
                , $.extend(this.prepareDataByArgs(xhrArgs), this.getXhrAjaxParams(xhrArgs),{BASE_TIMESTAMP:baseTools2.getNextSeq()})
                , function (data) {
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools2.hideMash(maskObj);
                });
        },
        /**
         * 使用ajax的Post方式调用接口
         * <pre>
         * 例如:
         *  var xhrArgs = {
         url:"",
         params:params,
         msg:"正在加载..." ,//进度提示文字 可以不写
         callback:[pageFlowControl]
         };
         baseTools.ajaxPost(xhrArgs);
         * </pre>
         * @param xhrArgs
         */
        ajaxPost: function (xhrArgs) {
            var maskObj = null;
            var bShow = xhrArgs.hasOwnProperty("bShow") ? xhrArgs.bShow : true;

            if (bShow)
                maskObj = this.showMask(xhrArgs.msg);

            var url = (xhrArgs.hasOwnProperty("fw") && xhrArgs.fw === 1
                ? "" : this.getServerUrl()) + xhrArgs.url;
            $.post(url
                , $.extend(this.prepareDataByArgs(xhrArgs), this.getXhrAjaxParams(xhrArgs)
                    ,{BASE_TIMESTAMP:baseTools2.getNextSeq()})   //使用时间戳解决浏览器设置缓存不发请求的问题
                , function (data) {
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools2.hideMash(maskObj);
                });
        },
        showMask: function (msg) {
            // var loading = includeTools.getPath(includeTools.BASE_PARAMS).INCLUDE_PATH + '/images/loading.gif';
            // msg = msg ? msg : "数据加载中...";
            // $.blockUI({
            //     message: '<img src="' + loading + '" style="margin-right:6px">' + msg + '</img>',
            //     css: {
            //         border: 'none'                   // 无边界
            //         , width: "240px"                     // 中间框框的宽度
            //         , height: '50px', backgroundColor: '#eee', lineHeight: '50px', verticalAlign: 'middle'
            //         // ,border: '1px solid red'
            //         //, top:"50%",                        // 高居中
            //         // left:"50%"                        // 左居中
            //         , '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .5
            //     }
            // });
            var maskObj = layer.load(0, {shade: 0.1});
            return maskObj;
        },
        hideMash: function (maskObj) {
           layer.close(maskObj);
        },
        /**
         * 在ajax请求时添加其他参数(需要在主体软件中重载)
         * @param xhrArgs ajax请求参数
         */
        getXhrAjaxParams: function (xhrArgs) {
            //添加附加参数
            return xhrArgs.params || {};
        },
        prepareDataByArgs: function (xhrArgs) {
            var params = xhrArgs.hasOwnProperty('params')
                ? xhrArgs.params : {};
            var forms = xhrArgs.hasOwnProperty('forms')
                ? xhrArgs.forms : [];
            if (forms.length === 1) {
                $.extend(params,
                    (typeof forms[0] === 'object'
                        ? forms[0] : $(forms[0])).serializeJson());
            } else {
                for (var formObj in forms) {
                    var obj = typeof formObj === 'object'
                        ? formObj : $(formObj);

                    var tem = {};
                    tem[obj.id] = obj.serializeJson();
                    $.extend(params, tem);
                }
            }
            return params;
        },
        /**
         * 实时获取服务器地址
         * @return {string} 跨域调用时返回服务器网址
         */
        getServerUrl: function () {
            return this.checkCrossOrigin()
                ? 'http://serverUrl:port'
                : '';
        },
        /**
         * 判断当前是否需要跨越请求
         * @return {boolean} true-跨域
         */
        checkCrossOrigin: function () {
            return 'file:' === document.location.protocol;
        }
    };
})();
/**
 * 对Date的扩展，将 Date 转化为指定格式的String
 * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
 * 例如:
 * var str = "2014/01/01 01:01:01" // yyyy/mm/dd这种格式转化成日期对像可以用new Date(str);在转换成指定格式
 * alert("格式化字符串\n" + str + " 为日期格式 \n" + new Date(str).format('yyyy-MM-dd hh:mm:ss'))
 *
 * var str1 = "2014-12-31 00:55:55" // yyyy-mm-dd这种格式的字符串转化成日期对象可以用new Date(Date.parse(str.replace(/-/g,"/")));
 * var saveDate = new Date(str1.replace(/-/g, "/"));
 *
 * var saveDate = new Date(Date.parse(str1.replace(/-/g, "/")));
 *
 * (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
 * (new Date()).format("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04
 * (new Date()).format("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04
 * (new Date()).format("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04
 * (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
 */
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    var week = {
        "0": "/u65e5",
        "1": "/u4e00",
        "2": "/u4e8c",
        "3": "/u4e09",
        "4": "/u56db",
        "5": "/u4e94",
        "6": "/u516d"
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(E+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
};
baseTools2.seq = 0;
baseTools2.MAX_PRE_SECOND = 1000;
/**
 *生成15位的数字流水号(16位以后会出现科学计数影响业务操作)
 */
baseTools2.getNextSeq = function () {
    ++this.seq;

    var curDate = new Date().format("yyyyMMddHHmm");
    var strSeq = (this.seq % this.MAX_PRE_SECOND).toString();
    var temSeq = "000";
    //return curDate + (temSeq.substring(strSeq.length) + strSeq);
    return curDate + this.lpad(strSeq, 3, "0");
};
/**
 * 左填充
 * @param str 字符串
 * @param len 需要的长度
 * @param pad 需要填充的字符
 */
baseTools2.lpad = function (str, len, pad) {
    if (str.trim() == '') return '';
    var ret = '';
    for (var i = 1; i < len - str.length + 1; i++)
        ret += pad;

    return ret + str;
};

//Jquery中有serialize方法，可以将表单序列化为一个“&”连接的字符串;
// 在该基础上供序列化为Json的方法
(function ($) {
    $.fn.serializeJson = function () {
        var serializeObj = {};
        var array = this.serializeArray();
        //var str = this.serialize();
        $(array).each(function () {
            if (serializeObj[this.name]) {
                if ($.isArray(serializeObj[this.name])) {
                    serializeObj[this.name].push(this.value);
                } else {
                    serializeObj[this.name] = [serializeObj[this.name], this.value];
                }
            } else {
                serializeObj[this.name] = this.value;
            }
        });
        return serializeObj;
    };
})(jQuery);