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
                    {title: "id", field: "id"},
                    {title: "姓名", field: "name"},
                    {title: "年龄", field: "age"},
                    {title: "城市", field: "country"},
                    {title: "创建时间", field: "date", sortable: true},
                ]],
                url: '/functionView/honeypotAttach/getDataByPage',
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
                sortName: 'date',
                sortOrder: 'asc',
                pagination: true,
                sidePagination: 'server',
                pageSize: 1,
                pageList: [1, 2, 3],
                toolbar: "#toolbar",
                showRefresh: true,
                showToggle: true,
                checkbox: true
            });
        }
    };
})();