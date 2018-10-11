$(document).ready(function () {

});


var EditPwd = (function () {
    //私有属性
    var curSeg, formSearch, $table;
    // var tbList, tplTbList, curPage = 1, pageSize = 20;
    //私有方法
    //初始化页面UI
    var initLayout = function () {
        curSeg = EditPwd;
    };
    //公有方法
    return {
        editother : function () {
            layer.open({
                type: 2,
                shadeClose: true,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                btn: ['确定', '取消'],
                area: ['500px', '600px'],
                content: '/console/admin/fromother',
                yes: function (index, layero) {
                    var body = layer.getChildFrame('body', index);
                    var formId = body.find("#dataForm");
                    var rules = {
                        username: {
                            required: true
                        },
                        password: {
                            required: true
                        }
                    };
                    var messages = {
                        username: {
                            required: "用户名不能为空"
                        },
                        password: {
                            required: "没密码怎么登陆"
                        }
                    };
                    baseTools2.validateForm($(formId), rules, messages);
                    if (!$(formId).valid()) {
                        return;
                    }
                    baseTools2.ajaxSubmitForm($(formId), "/console/admin/savepwd");
                }
            });
        },
        edit: function () {
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                layer.alert("请选择一行！");
                return;
            }

            layer.open({
                type: 2,
//            title: '角色授权',
                shadeClose: true,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                btn: ['确定', '取消'],
                area: ['500px', '600px'],
                content: '/console/admin/from?uid=' + rows[0].uid,

//            end:function(){//关闭窗口事件（不管是取消还是保存都会执行）
//                alert("关闭窗口");
//               // window.parent.location.reload();//刷新父页面(连菜单等刷新了)
//               // parent.$('.btn-refresh').click();//刷新父页面
//                location.reload();//重新加载当前页面
//            }
                yes: function (index, layero) {
                    var body = layer.getChildFrame('body', index);
                    var formId = body.find("#dataForm");
                    var rules = {
                        username: {
                            required: true
                        },
                        password: {
                            required: true
                        }
                    };
                    var messages = {
                        username: {
                            required: "用户名不能为空"
                        },
                        password: {
                            required: "没密码怎么登陆"
                        }
                    };
                    baseTools2.validateForm($(formId), rules, messages);
                    if (!$(formId).valid()) {
                        return;
                    }
                    baseTools2.ajaxSubmitForm($(formId), formId.attr('action'));
                }
            });
        }
        ,
        toPage: function (id) {

        },
        //查询数据
        onQuery: function () {

        },
        //添加、新增
        onAdd: function () {

        },
        //编辑
        onEdit: function () {

        },
        //添加、编辑
        onAndOrEdit: function (params) {

        },
        //支持按钮或者记录行的更新状态、有效标志
        onUpdateYxbz: function (yxbz) {
            // var rows = [];
            // $("input:checkbox[name='IDS']:checked", tbList).each(function () {
            //     rows.push({ID: this.value});
            // });
            // if (rows.length === 0) {
            //     alert("请选择记录!");
            //     return;
            // }
            //
            // if (!confirm("确定要修改状态吗?")) {
            //     return;
            // }
            // var ids = jsonPath(rows, "$..ID");
            // baseTools.ajaxPost({
            //     url: "/crm/hyzc/onUpdateYxbz",
            //     params: {IDS: ids.join(','), YXBZ: yxbz},
            //     callback: [curSeg.pageFlowControl]
            // });
        },
        //支持按钮或者记录行的删除
        onDelete: function () {

        }
    };
})();