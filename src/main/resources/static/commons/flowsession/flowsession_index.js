$(document).ready(function () {
    FlowSessionIndex.onLoad();
});


var FlowSessionIndex = (function () {
    //私有属性
    var curSeg, formSearch, $table;
    //私有方法
    //初始化页面UI
    var initLayout = function () {
        curSeg = FlowSessionIndex;
        $table = $("#dataGrid");
    };
    //公有方法
    return {
        onLoad: function () {
            initLayout();
            curSeg.initDataGrid();
            // curSeg.onQuery();
        },
        //初始化表格数据
        initDataGrid: function () {
            $table.bootstrapTable({
                height: tableModel.getHeight(),
                idField: "sessionId",
                columns: [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "回话id", field: "id"},
                    {title: "源虚拟MAC地址", field: "src_v_mac"},
                    {title: "目的真实MAC", field: "dstMac"},
                    {title: "目的服务端口", field: "dstPort"},
                    {title: "协议类型", field: "proto"},
                    {title: "目的虚拟IP", field: "dstVIp"},
                    {title: "目的虚拟MAC地址", field: "dstVMac"},
                    {title: "源真实MAC", field: "srcMac"},
                    {title: "目的真实IP", field: "dstIp"},
                    {title: "路径是否动态跳变", field: "sType"},
                    {title: "源真实IP", field: "srcIp"},
                    {title: "路径跳变周期", field: "topoMutation"},
                    {title: "源服务端口", field: "srcPort"},
                    {title: "会话生命(存活)周期", field: "ttl"},
                    {title: "源虚拟ip", field: "srcVIp"},
                    {title: "创建时间", field: "createAt", sortable: true},
                ]],
                url: '/nework/flowsession/list',
                queryParams: function (params) {
                    return params;
                },
                responseHandler: function (res) {
                    return {
                        rows: res.result.pageInfo.list,
                        total: res.result.pageInfo.total
                    }
                },
                search: true,
                searchOnEnterKey: true,
                sortName: 'createAt',
                sortOrder: 'asc',
                pagination: true,
                sidePagination: 'server',
                pageSize: 20,
                pageList: [20, 40, 50, 100],
                toolbar: "#toolbar",
                showRefresh: true,
                showToggle: true,
                checkbox: true
            });
        },
        toDetails: function () {
            layer.open({
                type: 2,
//            title: '添加用户',
                shadeClose: false,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                area: ['800px', '700px'],
                content: '/nework/flowsession/toDetails',
                btn: ['确定', '取消'] //只是为了演示
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var formId = body.find("#dataForm");

                },
                btn2: function () {
                    layer.closeAll();
                }
            })
            ;
//        window.location.href = "/console/admin/from";
        },
        del: function () {
            var ids = "";//得到用户选择的数据的ID
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                layer.alert("请最少选择一行！");
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].ID + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            curSeg.delRow(rows[0].uid, '/console/admin/delete', 'uid');
        },
        delRow : function (rowid,url,field) {
            layer.confirm('确定删除吗?', function(){
                $.getJSON(url, {ids:rowid}, function(ret){
                    if (ret.status){
                        layer.msg(ret.msg, {icon: 1});
                        $table.bootstrapTable('remove', {
                            field: field,
                            values: [rowid]
                        });
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                });
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