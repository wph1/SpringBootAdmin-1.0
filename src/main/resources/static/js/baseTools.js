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
        }
    };
})();