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
                    {title: "会话id", field: "id"},
                    {title: "源虚拟MAC地址", field: "srcVMac"},
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
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                layer.alert("请选择一行！");
                return;
            }
            layer.open({
                type: 2,
//            title: '添加用户',
                shadeClose: false,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                area: ['800px', '700px'],
                content: '/nework/flowsession/toDetails?sessionId='+ rows[0].sessionId
            })
            ;
//        window.location.href = "/console/admin/from";
        }
    };
})();