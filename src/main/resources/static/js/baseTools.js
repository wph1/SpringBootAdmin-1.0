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
                messages: messages,
                showErrors: function (errorMap, errorList) {
                    if (parseInt(errorList.length) > 0) {
                        $(errorList[0].element).focus();
                        layer.msg(errorList[0].message, {icon: 2});
                    }
                }
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
                    index = layer.load(0, {shade: false});
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
        },
        hideMash: function (maskObj) {
            $.unblockUI();
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