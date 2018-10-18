$(document).ready(function () {
    MtdIndex.onLoad();
});


var MtdIndex = (function () {
    //私有属性
    var curSeg, formSearch, $table;
    var initLayout = function () {
        curSeg = MtdIndex;
        $table = $("#mtdGrid");
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
                height : tableModel.getHeight(),
                idField : "id",
                columns : [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    // {title: "导向蜜罐的流量的流表最大空闲时间", field: "honeypotPathIdle"},
                    {title: "可跳变的最大路径数", field: "kPath"},
                    {title: "路径跳变周期", field: "pathTtl"},
                    {title: "mtd模式开启与否", field: "isMtdMode", formatter: tableModel.getState},

                    {title: "流表最大空闲时间", field: "sessionIdle"},

                    {title: "访问外网的地址", field: "externalAddress"},

                    {title: "路径跳变开启与否", field: "isPathMutation", formatter: tableModel.getState},
                    {title: "dns服务器地址", field: "dnsForwardAddress"},
                    {title: "内部dns服务器地址", field: "dnsAddress"},
                    {title: "出外网的端口", field: "externalSwitchPort"},
                    {title: "使用蜜罐与否", field: "useHoneypot", formatter: tableModel.getState},
                    {title: "出外网的网关", field: "externalGateway"},
                    {title: "创建时间", field: "createAt", sortable: true},
                    // {title: "操作", field: "operate", align: 'center', events: operateEvents, formatter: operateFormatter}
                ]],
                url : '/functionView/mtd/mtdList',
                queryParams: function(params){
                    return params;
                },
                method: "get", //请求格式
                responseHandler : function (res) {
                    return {
                        rows : res.result.pageInfo.list,
                        total : res.result.pageInfo.total
                    }
                },
                search : true,
                searchOnEnterKey : true,
                sortName : 'create_at',
                sortOrder : 'asc',
                pagination : true,
                sidePagination : 'server',
                pageSize: 20,
                pageList : [20, 40, 50, 100],
                toolbar : "#toolbar",
                showRefresh : true,
                showToggle : true
            });
        },
        add: function () {
            layer.open({
                type: 2,
//            title: '添加用户',
                shadeClose: false,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                area: ['850px', '800px'],
                content: '/functionView/mtd/mtdAdd',
                btn: ['确定', '取消'] //只是为了演示
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var btn = body.find("#ripForm");
                    var rules = {
                        net: {
                            required: true
                        },
                        prefix: {
                            required: true
                        }
                    };
                    var messages = {
                        net: {
                            required: "用户名不能为空"
                        },
                        prefix: {
                            required: "没密码怎么登陆"
                        }
                    };
                    baseTools2.validateForm($(btn), rules, messages);
                   // $(btn).click();
                    if (!$(btn).valid()) {
                        return;
                    }
                    console.log("校验通过");
                    baseTools2.ajaxSubmitForm($(btn), $(btn).attr('action'));
                },
                btn2: function () {
                    layer.closeAll();
                }
            })
            ;
        },
        del: function () {
            var ids = "";//得到用户选择的数据的ID
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                layer.alert("请最少选择一行！");
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].id + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            curSeg.delRow(ids, '/functionView/rip/ripDelete', 'uid');
        },
        delRow : function (rowid,url,field) {
            layer.confirm('确定删除吗?', function(){
                $.getJSON(url, {ids:rowid}, function(ret){
                    if (ret.status){
                        layer.msg(ret.msg, {icon: 1});
                        $table.bootstrapTable('refresh',  {url: '/admin/function/ripList'});
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                });
            });
        }
    };
})();