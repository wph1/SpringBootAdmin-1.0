$(document).ready(function () {
    RipIndex.onLoad();
});


var RipIndex = (function () {
    //私有属性
    var curSeg, $table;
    var initLayout = function () {
        curSeg = RipIndex;
        $table = $("#networkGrid");
    };
    //公有方法
    return {
        onLoad: function () {
            initLayout();
            curSeg.initDataGrid();
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
                    {title: "网络名称", field: "net"},
                    {title: "域名前缀", field: "prefix"},
                    {title: "真实网络起始地址", field: "startIpString"},
                    {title: "真实网络结束地址", field: "endIpString"},

                    {title: "网关地址", field: "gateway"},

                    {title: "真实IP租期", field: "period"},

                    {title: "虚拟地址跳变时间(毫秒)", field: "virtualPeriod"},
                    {title: "域名跳变时间(毫秒)", field: "domainPeriod"},
                    {title: "创建时间", field: "createTime", sortable: true},
                    // {title: "操作", field: "operate", align: 'center', events: operateEvents, formatter: operateFormatter}
                ]],
                url : '/functionView/rip/ripList',
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
                sortName : 'createTime',
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
                shadeClose: false,
                shade: 0.8,
                maxmin: true,
                area: ['500px', '600px'],
                content: '/functionView/rip/ripAdd',
                btn: ['确定', '取消']
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var ripForm = body.find("#ripForm");
                    var rules = {
                        net: {
                            required: true,
                            validateNet: true

                        },
                        prefix: {
                            required: true
                        },
                        startIpString:{
                            required: true,
                            validateIpAddress:true
                        },
                        endIpString:{
                            required: true,
                            validateIpAddress:true
                        },
                        gateway:{
                            required: true,
                            validateIpAddress:true
                        },
                        period:{
                            required: true,
                            digits:true
                        },
                        virtualPeriod:{
                            required: true,
                            digits:true
                        },
                        domainPeriod:{
                            required: true,
                            digits:true
                        }
                    };
                    var messages = {
                        net: {
                            required: "名称不能为空",
                            validatePrefix:true
                        },
                        prefix: {
                            required: "不能为空"
                        },
                        startIpString:{
                            required: "开始ip不能为空"
                        },
                        endIpString:{
                            required: "结束ip不能为空"
                        },
                        gateway:{
                            required: "网关地址不能为空"
                        },
                        period:{
                            required: "不能为空",
                            digits:"请输入整数"
                        },
                        virtualPeriod:{
                            required: "不能为空",
                            digits:"请输入整数"
                        },
                        domainPeriod:{
                            required: "不能为空",
                            digits:"请输入整数"
                        }
                    };
                    baseTools2.validateForm($(ripForm), rules, messages);
                    if (!$(ripForm).valid()) {
                        return;
                    }
                    console.log("校验通过");
                    // baseTools2.ajaxSubmitForm($(ripForm), $(ripForm).attr('action'));
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