//对browser支持
$.browser = {};
$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());

/**
 * Date:2010-3-17<br>
 * 支持多浏览器的无线产品线辅助工具类
 * @author <a href="mailto:yanghongjian@htjs.net">YangHongJian</a>
 * @version 1.0
 * <pre>
 * <OL>
 * 功能支持：
 * <LI>添加通过ID获取对象的方法 byId
 * <LI>解析JSON的数据格式，并把数据绑定到显示控件    bindFormData
 * <LI>从URL中获取属性值     getUrlQueryString
 * <LI>封装减化版本的通讯控制组件 xhrAjax    请先引用jquery.js
 * <LI>根据DOM的ID获取对象(快速方法)   byId
 * <LI>2014.6.6 yanghongjian     新增parseUrl
 * <LI>2018.1.1 yanghongjian 新增 getTopWindow/getTopBaseTools
 * </OL>
 * </pre>
 */
var baseTools = (function () {
    //私有属性
    var curSeg;
    var _curPage = window.document.location.href;
    var _curPagePath = window.document.location.pathname;
    var pos = _curPage.indexOf(_curPagePath);
    var prePath = _curPage.substring(0, pos);
    var postPath = _curPagePath.substring(0, _curPagePath.substr(1).indexOf('/') + 1);
    var _rootPath = prePath + postPath;
    var pPage = "";
    try {
        pPage = parent.window.document.location.href;
    } catch (e) {
    }
    var _commonsJsPath = "";
    //私有方法
    //公有方法
    return {
        onInit: function () {
            curSeg = baseTools;
            _commonsJsPath = curSeg.getCommonsJsPath();
//            curSeg.loadJs(_commonsJsPath + "/js/jquery.blockUI.min.js");
        },
        //动态加载js文件
        loadJs: function (url, callback) {
            var paths = url.split('/'),
                newJs = paths[paths.length - 1];

            var oldJs = document.getElementById(newJs);
            if (oldJs)
                oldJs.parentNode.removeChild(oldJs);
            var done = false;
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.language = 'javascript';
            script.src = url;
            script.id = newJs;
            if (callback) {
                script.onload = script.onreadystatechange = function () {
                    if (!done && (!script.readyState || script.readyState === 'loaded' || script.readyState == 'complete')) {
                        done = true;
                        script.onload = script.onreadystatechange = null;
                        if (callback) {
                            callback.call(script);
                        }
                    }
                };
            }
            document.getElementsByTagName("head")[0].appendChild(script);
        },
        //动态加载css文件
        loadCss: function (url, callback) {
            var link = document.createElement('link');
            link.rel = 'stylesheet';
            link.type = 'text/css';
            link.media = 'screen';
            link.href = url;
            document.getElementsByTagName('head')[0].appendChild(link);
            if (callback) {
                callback.call(link);
            }
        },
        /**
         * 根据DOM的ID获取对象(快速方法)
         * @param tagId DOM的ID
         */
        byId: function (tagId) {
            return document.getElementById(tagId);
        },
        /**
         * 修改页面中所属的标签的ID包括form
         * @param panelObj 对象
         * @return 返回表单对象
         */
        setIdByPanel: function (panelObj) {
            var obj = panelObj;
            if (typeof panelObj == "string") {
                obj = $("#" + panelObj);
            }
            obj.find("form").each(function (x, frm) {
                this.id = obj[0].id + "_" + (this.name.length > 0 ? this.name : "form");
                baseTools.setIdByName([frm.id]);
            });
            return obj.find("form");
        },
        /**
         * 修改页面中所属的标签的ID包括form(对div/span/p的赋值,必须设置DOM的name属性)
         * @param formObj 对象
         * @return 返回表单对象
         */
        setIdByFormId: function (formObj) {
            var obj = formObj;
            if (typeof formObj === "string") {
                obj = $("#" + formObj);
            } else
                obj = typeof formObj === 'object' ? formObj : $(formObj);

            $("input,textarea,select", obj).attr("id", function () {
                //hasAttribute:Internet Explorer 8 以及更早的版本不支持该方法。
                if (this.hasAttribute("type") && 'button' == this.type.toLowerCase())
                    return this.id;

                obj.find("label[for='" + this.name + "']").attr("for", obj[0].id + "_" + this.name);
                return obj[0].id + "_" + this.name;
            });
            //2017.7.31 yanghongjian 添加对div/span/p的赋值,必须设置DOM的name属性
            $("div[name][name!=''],span[name][name!=''],p[name][name!='']", obj).attr("id", function () {
                return obj[0].id + "_" + this.getAttribute("name");
            });
            baseTools.checkFormLock([obj[0].id]);
            return obj;
        },
        /**
         *修改页面中form所属的标签的ID(对div/span/p的赋值,必须设置DOM的name属性)
         *返回form的jquery对象
         */
        setIdByForm: function () {
            return $("form").each(function (i) {
                this.id = (this.name.length > 0 ? this.name : "form_" + i);
                var formObj = $(this);
                $("input,textarea,select", formObj).attr("id", function () {
                    if (this.hasAttribute("type") && 'button' == this.type.toLowerCase())
                        return this.id;

                    formObj.find("label[for='" + this.name + "']").attr("for", formObj[0].id + "_" + this.name);
                    return formObj[0].id + "_" + this.name;
                });
                $("div[name][name!=''],span[name][name!=''],p[name][name!='']", formObj).attr("id", function () {
                    return formObj[0].id + "_" + this.id;
                });
                baseTools.checkFormLock([formObj[0].id]);
            });
        },
        /**
         * 修改页面中form所属的标签的ID(对div/span/p的赋值,必须设置DOM的name属性)
         * @param formIDs 表单名数组
         */
        setIdByName: function (formIDs) {
            if (!$.isArray(formIDs)) {
                var tem = formIDs;
                formIDs = [];
                formIDs[0] = tem;
            }
            //修改页面中form所属的标签的ID
            $.each(formIDs, function (i, formID) {
                $("input,textarea,select", $("#" + formID)).attr("id", function () {
                    if (this.hasAttribute("type") && 'button' == this.type.toLowerCase()) {
                        return this.id;
                    } else {
                        return formID + "_" + this.name;
                    }
                });
                $("div[name][name!=''],span[name][name!=''],p[name][name!='']", $("#" + formID)).attr("id", function () {
                    return formID + "_" + this.id;
                });
                baseTools.checkFormLock([formID]);
            });
        },
        /**
         * 获取发布域路径
         * <pre>
         * 例如地址栏中显示http://localhost/web/test.htm
         * 该方法返回:http://localhost/web
         * </pre>
         */
        getWebRoot: function () {
            return _rootPath;
        },
        getPrePath: function () {
            return prePath;
        },
        /**
         * 获取当前页的完整路径
         * <pre>
         * 例如地址栏中显示http://localhost/web/test.htm
         * 该方法返回:http://localhost/web/test.htm
         * </pre>
         */
        getCurPage: function () {
            return _curPage;
        },
        /**
         * 获取当前界面的相对路径<br>
         * <pre>
         * 例如地址栏中显示http://localhost/web/dojoajax.htm
         * 该方法返回:web/dojoajax.htm
         * </pre>
         */
        getCurPagePath: function () {
            return _curPagePath;
        },
        /**
         * 从url的属性值对中取值
         * <pre>
         * 例如:http://localhost/web/test.htm?name=yhj&note=good
         * var name = baseTools.getUrlQueryString('name');
         * name值为"yhj"
         * <pre>
         * @param val 要获取的属于
         * @return 没有找到时返回""
         */
        getUrlQueryString: function (val) {
            return this.getUrlQueryStringByUrl(this.getCurPage(), val);
        },
        getUrlQueryStringByUrl: function (url, val) {
            var re = new RegExp("" + val + "=([^&?]*)", "ig");

            var tem = '';
            try {
                tem = ((url.match(re)) ? (url.match(re)[0].substr(val.length + 1)) : "");
            } catch (e) {
                tem = ''
            }
            return tem;
        },
        /**
         * 解析url
         * @param url 为空时，自动获取当前地址的url
         */
        parseUrl: function (url) {
            if (typeof url == 'undefined' || url == null)
                url = location.href;
            var segment = url.match(/^(\w+\:\/\/)?([\w\d]+(?:\.[\w]+)*)?(?:\:(\d+))?(\/[^?#]*)?(?:\?([^#]*))?(?:#(.*))?$/);
            if (!segment[3]) {
                segment[3] = '80';
            }
            var params = {};
            if (segment[5]) {
                var pse = segment[5].match(/([^=&]+)=([^&]+)/g);
                if (pse) {
                    for (var i = 0; i < pse.length; i++) {
                        params[pse[i].split('=')[0]] = decodeURIComponent(pse[i].split('=')[1]);
                    }
                }
            }
            return {
                url: segment[0],
                sechme: segment[1],
                host: segment[2],
                port: segment[3],
                path: segment[4],
                queryString: segment[5],
                fregment: segment[6],
                params: params
            };
        },
        /**
         * 获取commons路径
         */
        getCommonsJsPath: function () {
            var path = [];
            $("head script").each(function () {
                var src = $(this).attr('src');
                if (src == undefined)
                    return true;
                if (src.indexOf('base_tools') != -1) {
                    var ds = src.split('/');
                    for (var i = 0; i < ds.length; i++) {
                        path.push(ds[i]);
                        if (ds[i] == 'commons') {
//                            loadImg.push(ds[i]);
                            break;
                        }
                    }
                }
            });
            return path.join('/');
        },
        /**
         * 获取commons路径
         */
        getRootJsPath: function () {
            var path = [];
            $("head script").each(function () {
                var src = $(this).attr('src');
                if (src.indexOf('base_tools') != -1) {
                    if (src.indexOf('..') != -1) {
                        var ds = src.split('/');
                        for (var i = 0; i < ds.length; i++) {
                            if (ds[i] == '..')
                                path.push(ds[i]);
                        }
                    }
                }
            });
            return path.join('/');
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
        },
        hideMash: function (maskObj) {
            $.unblockUI();
        },
        /**
         * 替换html特殊字符
         * @param strContext 需要替换的字符串
         */
        repHtml: function (strContext) {
            /*  if (strContext.length == 0)
             return "";
             strContext = strContext.replace(/</gi, '&lt;');
             strContext = strContext.replace(/>/gi, '&gt;');*/
            return strContext;
        },
        /**
         * 替换html特殊字符
         * @param strContext 需要替换的字符串
         */
        repText: function (strContext) {
            /* if (strContext.length == 0)
             return "";
             if (typeof(strContext) == "string") {
             strContext = strContext.replace(/&lt;/gi, '<');
             strContext = strContext.replace(/&gt;/gi, '>');
             }*/
            return strContext;
        },
        /**
         * 判断当前是否需要跨越请求
         * @return {boolean} true-跨域
         */
        checkCrossOrigin: function () {
            return 'file:' === document.location.protocol;
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
                , $.extend(this.prepareDataByArgs(xhrArgs), this.getXhrAjaxParams(xhrArgs),{BASE_TIMESTAMP:baseTools.getNextSeq()})
                , function (data) {
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools.hideMash(maskObj);
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
                    ,{BASE_TIMESTAMP:baseTools.getNextSeq()})   //使用时间戳解决浏览器设置缓存不发请求的问题
                , function (data) {
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools.hideMash(maskObj);
                });
        },
        /**
         * 自动组装指定表单数据
         * @param formNames 表单名称数组，可以为空
         * @param params 附加参数对象数组 可以为空
         * @return 返回值对字符串,找不到表单时返回""
         */
        preparePostData: function (formNames, params) {
            var result = [];
            if (formNames) {
                for (var x = 0; x < formNames.length; x++) {
                    var formObj = document.getElementById(formNames[x]);
                    if (formObj)
                        for (var i = 0; i < formObj.elements.length; i++) {
                            var el = formObj.elements[i];
                            var tagName = el.tagName.toLowerCase();
                            if (tagName == "textarea") {
                                el.value = this.repHtml(el.value);
                            } else if (tagName == "input") {
                                if (el.type.toLowerCase() == "text") {
                                    el.value = this.repHtml(el.value);
                                }
                                if (el.type.toLowerCase() == "radio") {
                                    el.value = this.repHtml(el.value);
                                }
                            }
                        }
                }
                var tem = "";
                for (var f = 0; f < formNames.length; f++) {
                    tem = $("#" + formNames[f]).serialize();
                    if (tem.length > 0)
                        result.push(tem);
                }
            }
            //添加附加参数
            if (params) {
                //                result.push("&" + $.param(params));
                var fjParam = [];
                for (var key in params) {
                    var val = params[key] != undefined ? params[key].toString() : "";
                    fjParam.push(encodeURIComponent(key) + "=" + encodeURIComponent(val));
                }
                //修正在tomcat下提示 WARNING: Parameters: Invalid chunk ignored.
//                result.push((result.length == 0 ? "" : "&") + fjParam.join("&"));
                result.push(fjParam.join("&"));
            }
            return result.join("&");
        },

        /**
         * 简化跨域调用版本,根据参数对象中指定的值向服务端提交请求
         * <pre>
         * 例如:
         *  var xhrArgs = {
         url:"getXT_USERByPage.do",
         forms:["saveForm"],
         params:params,
         msg:"正在加载..." ,//进度提示文字 可以不写
         //  callBefore:[callBefore],
         callback:[pageFlowControl]
         };
         baseTools.xhrAjaxJsonP(xhrArgs);
         * </pre>
         * @param xhrArgs
         */
        xhrAjaxJsonP: function (xhrArgs) {
            var maskObj = null;
            var bShow = true;
            if (typeof xhrArgs.bShow != 'undefined') {
                bShow = xhrArgs.bShow;
            }
            if (bShow) {
                maskObj = this.showMask(xhrArgs.msg);
            }
            xhrArgs.params = this.getXhrAjaxParams(xhrArgs);
            var urlParam = this.preparePostData(xhrArgs.forms, xhrArgs.params);

            var async = true;
            if (xhrArgs.async != 'undefined')
                async = xhrArgs.async;
            $.ajax({
                url: xhrArgs.url,
//                type: "GET",
                async: async,
                dataType: "jsonp",//只能使用get，否则无法提交数据
                jsonp: 'callback',
//                timeout:10000,
                //要发送到服务器的数据
                data: urlParam,
//                data:{NAME:"test"},
                //当请求失败时调用的函数
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 调用本次AJAX请求时传递的options参数
                    alert('操作提示\n操作失败原因:' + textStatus + "\n" + errorThrown);
                    if (bShow)
                        baseTools.hideMash(maskObj);
                },
                //当请求成功时调用的函数
                success: function (data, textStatus) {
                    //  this; // 调用本次AJAX请求时传递的options参数
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools.hideMash(maskObj);
                },
                //当请求完成时调用的函数
                complete: function (XMLHttpRequest) {
                }
            });
        },
        /**
         * 简化调用版本,根据参数对象中指定的值向服务端提交请求
         * <pre>
         * 例如:
         *  var xhrArgs = {
         dataType:'json',//默认json，可以是xml,html,script,json
         url:"getXT_USERByPage.do",
         type:"POST",   //默认POSt，可以是POSt,GET
         forms:["saveForm"],
         params:params,
         msg:"正在加载..." ,//进度提示文字 可以不写
         //  callBefore:[callBefore],
         callback:[pageFlowControl]
         };
         baseTools.xhrAjax(xhrArgs);
         * </pre>
         * @param xhrArgs
         */
        xhrAjax: function (xhrArgs) {
            var maskObj = null;
            var bShow = true;
            if (typeof xhrArgs.bShow != 'undefined') {
                bShow = xhrArgs.bShow;
            }
            if (bShow) {
                maskObj = this.showMask(xhrArgs.msg);
            }

            var type = 'POST';
            if (xhrArgs.type)
                type = xhrArgs.type;
            var dataType = 'json';
            if (xhrArgs.dataType)
                dataType = xhrArgs.dataType;
            var async = true;
            if (xhrArgs.async != 'undefined')
                async = xhrArgs.async;
            xhrArgs.params = this.getXhrAjaxParams(xhrArgs);

            var urlParam = this.preparePostData(xhrArgs.forms, xhrArgs.params);
//            alert(urlParam)

            $.ajax({
                url: xhrArgs.url,
                type: type,
                async: async,
                dataType: dataType,
                //要发送到服务器的数据
                data: urlParam,
                beforeSend: function (XMLHttpRequest) {
                    //使用csrf-token解决csrf安全问题 需要和配置文件中的CSRF_TOKEN_KEY保持一致
                    var val = $.cookie("x-csrf-token");
//                    console.log("@@@"+(val != null ? val : ""))
                    XMLHttpRequest.setRequestHeader("x-csrf-token", (val != null ? val : ""));
//                    var jsessionid=document.cookie.split(";")[0].split("=")[1];
//                    console.log(jsessionid)
                },
                //当请求失败时调用的函数
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // 调用本次AJAX请求时传递的options参数
                    alert('操作提示\n操作失败原因:' + textStatus + "\n" + errorThrown);
                    if (bShow)
                        baseTools.hideMash(maskObj);
                },
                //当请求成功时调用的函数
                success: function (data, textStatus) {
                    //  this; // 调用本次AJAX请求时传递的options参数
                    if (xhrArgs.callback)
                        for (var i = 0; i < xhrArgs.callback.length; i++)
                            xhrArgs.callback[i](data, xhrArgs);
                    if (bShow)
                        baseTools.hideMash(maskObj);
                },
                //当请求完成时调用的函数
                complete: function (XMLHttpRequest, textStatus) {
                    //需要和配置文件中的CSRF_TOKEN_KEY保持一致
                    $.cookie("x-csrf-token", XMLHttpRequest.getResponseHeader("x-csrf-token"), {path: "/"});
//                    console.log("complete CSRF-token=" + $.cookie("X-CSRF-TOKEN"))
                }
            });
        },
        /**
         * 解析JSON的数据格式，并把数据绑定到显示控件
         * strJson 基本格式为控件NAME:值
         * @param formName json格式的对象,注意显示控件的NAME要与JSON的键名要保持一致
         */
        bindFormData: function (formName, jsonObj) {
            if (typeof formName === 'string')
                formName = $("#" + formName);

            try {
                //排除不需要显示的列
                for (var key in jsonObj) {
                    var obj = this.getTagObj(formName, key);
                    if (obj) {
                        var tagName = obj.tagName.toLowerCase();
                        if (['div', 'span', 'p'].indexOf(tagName) !== -1) {
                            obj.innerHTML = jsonObj[key];
                            continue;
                        }

                        if (tagName == "input") {
                            /*历史版本 修改日期：2016.8.9 修改人:jipengfei
                             if (obj.type.toLowerCase() == "checkbox")
                             obj.checked = jsonObj[key] == obj.value;*/
                            if (obj.type.toLowerCase() == "checkbox") {
                                formName.find('input:checkbox[name="' + key + '"][value="' + jsonObj[key] + '"]')
                                    .attr("checked", true);
//                                var checkboxObj = document.getElementsByName(obj.name);
//                                var jsonOb = typeof jsonObj[key] == "string" ? jsonObj[key].split(',') : jsonObj[key];
//                                for (var i = 0; i < checkboxObj.length; i++) {
//                                    for (var j = 0; j < jsonOb.length; j++) {
//                                        if (checkboxObj[i].value == jsonOb[j]) {
//                                            checkboxObj[i].checked = true;
//                                        }
//                                    }
//                                }
                            }
                        }
                        if (obj.type.toLowerCase() == "radio") {
                            formName.find('input:radio[name="' + key + '"][value="' + jsonObj[key] + '"]')
                                .attr("checked", true);
//                            var radioObj = document.getElementsByName(obj.name);
//                            for (var i = 0; i < radioObj.length; i++) {
//                                if (radioObj[i].value == jsonObj[key]) {
//                                    radioObj[i].checked = true;
//                                    break;
//                                }
//                            }
                        }
                        if (obj.type.toLowerCase() != "checkbox" && obj.type.toLowerCase() != "radio") {
                            obj.value = jsonObj[key] != null ? this.repText(jsonObj[key]) : "";
                        }
                    }
                }
            } catch (e) {
                alert("客户端绑定错误:\n"
                    + "URL:\n\t" + this._curPage
                    + "\nmessage:\n\t" + e.message);
            }
        },
        //生成UUID len长度 radix=2进制,10进制,16进制
        createUUID: function (len, radix) {
            var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
            var uuid = [], i;
            radix = radix || chars.length;

            if (len) {// Compact form
                for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
            } else {// rfc4122, version 4 form
                var r;
                // rfc4122 requires these characters
                uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
                uuid[14] = '4';
                // Fill in random data.  At i==19 set the high bits of clock sequence as per rfc4122, sec. 4.1.5
                for (i = 0; i < 36; i++) {
                    if (!uuid[i]) {
                        r = 0 | Math.random() * 16;
                        uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
                    }
                }
            }
            return uuid.join('');
        },
        //和BaseTools中的getUUID保持一致
        getUUID: function () {
            return this.createUUID(32, 16).toUpperCase().replace(new RegExp('-', 'g'), '');
        }
    };
})();
baseTools.onInit();

/**
 * 在页面中任何嵌套层次的窗口中获取顶层窗口
 * @return {Window} 当前页面的顶层窗口对象
 */
baseTools.getTopWindow = function () {
    var winObj = window;
    while (winObj !== winObj.parent) {
        winObj = winObj.parent;
    }
    return winObj;
};

/**
 * 在页面中任何嵌套层次的窗口中获取顶层窗口的baseTools
 * @return 返回顶层窗口的baseTools
 */
baseTools.getTopBaseTools = function () {
    return this.getTopWindow().baseTools;
};

baseTools.getJqFormObj = function (form) {
    if (typeof form === 'string')
        return $("#" + form);
    return typeof form === 'object' ? form : $(form)
};
baseTools.getJqTagObj = function (formObj, tagID) {
    return this.getJqFormObj(formObj).find("#" + this.getTagId(formObj, tagID));
};
baseTools.getTagObj = function (formObj, tagID) {
    return this.getJqTagObj(formObj, tagID)[0];
};
baseTools.getTagId = function (formObj, tagName) {
    return this.getJqFormObj(formObj)[0].id + '_' + tagName;
};
baseTools.getVal = function (formObj, tagID) {
    return this.getJqFormObj(formObj).find("#" + this.getTagId(formObj, tagID)).val();
};
baseTools.setVal = function (formObj, tagID, val) {
    this.getJqFormObj(formObj).find("#" + this.getTagId(formObj, tagID)).val(val)
};

//产生4位随机数
baseTools.getRandom4 = function () {
    var charactors = "ab1cd2ef3gh4ij5kl6mn7opq8rst9uvw0xyz";
    var value = '', i;
    for (var j = 1; j <= 4; j++) {
        i = parseInt(35 * Math.random());
        value = value + charactors.charAt(i);
    }
    return value;
};

/**
 * 兼容火狐的回车换焦点
 */
/*
 baseTools.checkLock = function() {
 //兼容火狐的回车换焦点
 $('input:text:first').focus();
 var inp = $('input[type!="hidden"]:enabled,select:enabled');
 inp.bind("keydown", function(e) {
 var key = e.which;
 if (key == 13) {
 var nextIdx = inp.index(this) + 1;
 inp.get(nextIdx >= inp.size() ? nextIdx - 1 : nextIdx).focus();
 }
 });
 };
 */

/**
 * 兼容火狐的回车换焦点
 * @param formIDS 表单ID数组
 */
baseTools.checkFormLock = function (formIDS) {
    $.each(formIDS, function (i, val) {
        $("#" + val + " input[type!='hidden'][require !='false']:not([readonly]),select,textarea").keypress(function (e) {
            var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;

            if (keyCode == 13) {//判断所按是否回车键
                //获取表单中的所有输入项
                var inputs = $("#" + val).find("input[type!='hidden'],select");
                var idx = inputs.index(this);//获取当前焦点输入框所处的位置
                idx == inputs.length - 1 ? $("#" + val).click() : inputs[idx + 1].focus();
                return false;//取消默认的提交行为
            }
        });
    });
};

//兼容火狐的回车换焦点
baseTools.checkLock = function (event) {
    try {
        var keycode;

        event = event ? event : (window.event ? window.event : event);
        //event = this.getEvent();
        if (document.all) {
            keycode = event.keyCode;
        } else {
            keycode = event.which;
        }
        var src = event.srcElement ? event.srcElement : event.target;
        if (keycode == 13) {
            if (document.all) {
                event.keyCode = 9;
            } else {
                var fl = document.forms.length;  //子桢个数.
                for (var a = 0; a < fl; a++) {
                    var ele = document.forms[a].elements;
                    for (var i = 0; i < ele.length; i++) {
                        var q = (i == ele.length - 1) ? 0 : i + 1;//   if   last   element   :   if   any   other
                        if (src == ele[i]) {
                            ele[q].focus();
                            break;
                        }
                    }
                }
                event.preventDefault();
            }
        }
    } catch (e) {
    }
};


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

Date.daysInMonth = function (year, month) {
    if (month == 1) {
        if (year % 4 == 0 && year % 100 != 0)
            return 29;
        else
            return 28;
    } else if ((month <= 6 && month % 2 == 0) || (month = 6 && month % 2 == 1))
        return 31;
    else
        return 30;
};
Date.prototype.addMonth = function (addMonth) {
    var y = this.getFullYear();
    var m = this.getMonth();
    var nextY = y;
    var nextM = m;
    //如果当前月+要加上的月>11 这里之所以用11是因为 js的月份从0开始
    if (m > 11) {
        nextY = y + 1;
        nextM = parseInt(m + addMonth) - 11;
    } else {
        nextM = this.getMonth() + addMonth
    }
    var daysInNextMonth = Date.daysInMonth(nextY, nextM);
    var day = this.getDate();
    if (day > daysInNextMonth) {
        day = daysInNextMonth;
    }
    return new Date(nextY, nextM, day);
};

baseTools.getCurData = function () {
    return new Date().format("yyyy-MM-dd");
    /*var curDate = new Date();
     var year = curDate.getFullYear();
     var month = curDate.getMonth() + 1;
     var day = curDate.getDate();
     return year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);*/
};
baseTools.getCurMonthStartEnd = function () {
    var curDate = new Date();
    var year = curDate.getFullYear();
    var month = curDate.getMonth() + 1;
    var lastDay = this.getLastDay(year, month);
    var cur = [];
    cur.push(year + '-' + (month < 10 ? '0' + month : month) + '-01');
    cur.push(year + '-' + (month < 10 ? '0' + month : month) + '-' + (lastDay < 10 ? '0' + lastDay : lastDay));
    return cur;
};
baseTools.getLastDay = function (year, month) {
    var new_year = year;    //取当前的年份
    var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）
    if (month > 12)            //如果当前大于12月，则年份转到下一年
    {
        new_month -= 12;        //月份减
        new_year++;            //年份增
    }
    var new_date = new Date(new_year, new_month, 1);                //取当年当月中的第一天
    return (new Date(new_date.getTime() - 1000 * 60 * 60 * 24)).getDate();//获取当月最后一天日期
};

/**
 * 左填充
 * @param str 字符串
 * @param len 需要的长度
 * @param pad 需要填充的字符
 */
baseTools.lpad = function (str, len, pad) {
    if (str.trim() == '') return '';
    var ret = '';
    for (var i = 1; i < len - str.length + 1; i++)
        ret += pad;

    return ret + str;
};
/**
 * 右填充
 * @param str 字符串
 * @param len 需要的长度
 * @param pad 需要填充的字符
 */
baseTools.rpad = function (str, len, pad) {
    var ret = '';
    for (var i = 1; i < len - str.length + 1; i++)
        ret += pad;

    return str + ret;
};

String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.ltrim = function () {
    return this.replace(/(^\s*)/g, "");
};
String.prototype.rtrim = function () {
    return this.replace(/(\s*$)/g, "");
};

baseTools.seq = 0;
baseTools.MAX_PRE_SECOND = 1000;
baseTools.resetSeq = function (curSeq) {
    this.seq = curSeq;
};
/**
 *生成15位的数字流水号(16位以后会出现科学计数影响业务操作)
 */
baseTools.getNextSeq = function () {
    ++this.seq;

    var curDate = new Date().format("yyyyMMddHHmm");
    var strSeq = (this.seq % this.MAX_PRE_SECOND).toString();
    var temSeq = "000";
    //return curDate + (temSeq.substring(strSeq.length) + strSeq);
    return curDate + this.lpad(strSeq, 3, "0");
};

String.prototype.isMobile = function () {
    return (/^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(this.trim()));
};
String.prototype.isTel = function () {
    return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(this.trim()));
};
String.prototype.isMobileTel = function () {
    return (this.isTel() || this.isMobile());
};
String.prototype.isEmail = function () {
    return (/^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)$/.test(this.trim()));
};
String.prototype.isNumber = function () {
    return (!isNaN(this.trim()));
};
String.prototype.isInt = function () {
    return (/^(-?[0-9]\d*)$/.test(this.trim()));
};
String.prototype.isFloat = function () {
    return (/^(-?([0-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0))$/.test(this.Trim()));
};
String.prototype.isPwd = function () {
    return (/^[\w+]{6,20}$/.test(this.Trim()));
};
String.prototype.isChineseFirstName = function () {
    return (/^[\u4e00-\u9fa5]{1,2}$/.test(this.trim()));
};
String.prototype.isChineseLastName = function () {
    return (/^[\u4e00-\u9fa5]{1,15}$/.test(this.trim()));
};
String.prototype.isEmpty = function () {
    return (this.trim() == "" || this == null);
};
String.prototype.isDate = function () {
    return /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/
        .test(this.trim());
};
String.prototype.isMoney = function () {
    return (/^(-?\d+)(\.\d+)?$/.test(this.trim()));
};

function isNumber(s) {
    return (!isNaN(s.trim()));
}

function isDate(str) {
    var reg = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
    return (reg.test(str));
}

//ECMAScript 5对解析JSON进行规范，定义了全局对象JSON，
//支持的浏览器有：IE8+，Firefox 3.5+,Safari4+，Chrome和Opera 10.5+;
//JSON对象提供两个方法：stringify()和parse()
//stringify()是将JSON对象转成字符串，而parse()则是将符合规范的字符串转成可用JSON对象。

//转换json对象为字符串
baseTools.stringify = function (object) {
    var type = typeof object;
    if ('object' == type) {
        if ((object != null) && (Array == object.constructor))
            type = 'array';
        else if ((object != null) && (RegExp == object.constructor))
            type = 'regexp';
        else
            type = 'object';
    }
    var results = [];
    switch (type) {
        case 'undefined':
        case 'unknown':
            return;
            break;
        case 'function':
        case 'boolean':
        case 'regexp':
            return object.toString();
            break;
        case 'number':
            return isFinite(object) ? object.toString() : 'null';
            break;
        case 'string':
            return '"' + object.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g,
                function () {
                    var a = arguments[0];
                    return (a == '\n') ? '\\n' :
                        (a == '\r') ? '\\r' :
                            (a == '\t') ? '\\t' : ""
                }) + '"';
            break;
        case 'object':
            if (object === null) return 'null';
            results.length = 0;
            for (var property in object) {
                var value = this.stringify(object[property]);
                if (value !== undefined)
                    results.push(this.stringify(property) + ':' + value);
            }
            return '{' + results.join(',') + '}';
            break;
        case 'array':
            results.length = 0;
            for (var i = 0; i < object.length; i++) {
                var value = this.stringify(object[i]);
                if (value !== undefined) results.push(value);
            }
            return '[' + results.join(',') + ']';
            break;
    }
};

baseTools.parse = function (strJson) {
    return (/[\]\}]$/.test(strJson)) ? eval("(" + strJson + ")") : strJson;
};
baseTools.parseJson = function (strJson) {
    return this.parse(strJson);
};

baseTools.getCurBrowser = function () {
    var isIE = !!window.ActiveXObject;
    var isIE10 = isIE && !!window.atob;
    var isIE9 = isIE && document.addEventListener && !window.atob;
    var isIE8 = isIE && document.querySelector && !document.addEventListener;
    var isIE7 = isIE && window.XMLHttpRequest && !document.querySelector;
    var isIE6 = isIE && !window.XMLHttpRequest;

    return {
        isIE: isIE, isIE6: isIE6, isIE7: isIE7, isIE8: isIE8, isIE9: isIE9, isIE10: isIE10
    };
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
