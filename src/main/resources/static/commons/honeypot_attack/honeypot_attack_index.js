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
                idField: "id",
                columns: [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "事件id", field: "eventid"},
                    {title: "用户名", field: "username"},
                    {title: "密码", field: "password"},
                    {title: "源ip", field: "src_ip"},
                    {title: "目的ip", field: "dest_ip"},
                    {title: "目的端口", field: "dest_port"},
                    {title: "类型", field: "type"},
                    {title: "信息", field: "message"},
                    // {title: "创建时间", field: "date", sortable: true},
                ]],
                url: '/functionView/honeypotAttach/getHoneypotAttackDataByPage',
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
                // sortName: 'date',
                // sortOrder: 'asc',
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