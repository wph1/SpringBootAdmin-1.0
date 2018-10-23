$(document).ready(function () {
    SwitchesIndex.onLoad();
});


var SwitchesIndex = (function () {
    //私有属性
    var curSeg, $table;
    //私有方法
    //初始化页面UI
    var initLayout = function () {
        curSeg = SwitchesIndex;
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
                idField: "switchesId",
                columns: [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "id", field: "switchesId"},
                    {title: "名称", field: "switchesName"},
                    {title: "创建时间", field: "createTime", sortable: true},
                ]],
                url: '/functionView/switches/list',
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
                sortName: 'createTime',
                sortOrder: 'desc',
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
                shadeClose: false,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                area: ['800px', '700px'],
                content: '/functionView/switches/toDetails?switchesId='+ rows[0].switchesId
            })
            ;
//        window.location.href = "/console/admin/from";
        }
    };
})();