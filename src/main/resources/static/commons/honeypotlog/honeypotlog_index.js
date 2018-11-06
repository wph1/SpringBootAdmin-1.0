$(document).ready(function () {
    FlowSessionIndex.onLoad();
});


var FlowSessionIndex = (function () {
    //私有属性
    var curSeg, $table;
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
                idField: "honeyptlogId",
                columns: [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "源mac地址", field: "srcMac"},
                    {title: "目的mac地址", field: "dstMac"},
                    {title: "源ip", field: "srcIp"},
                    {title: "目的ip", field: "dstIp"},
                    {title: "源端口", field: "srcPort"},
                    {title: "目的端口", field: "dstPort"},
                    {title: "协议", field: "proto"},
                    {title: "蜜罐ip", field: "honeyptIp"},
                    {title: "创建时间", field: "createTime", sortable: true},
                ]],
                url: '/functionView/honeyLog/list',
                queryParams: function (params) {
                    return params;
                },
                responseHandler: function (res) {
                    return {
                        rows: res.result.pageInfo.list,
                        total: res.result.pageInfo.total
                    }
                },
                // search: true,
                searchOnEnterKey: true,
                sortName: 'createTime',
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
        }
    };
})();