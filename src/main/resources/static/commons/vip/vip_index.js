$(document).ready(function () {
    MtdIndex.onLoad();
});
var MtdIndex = (function () {
    //私有属性
    var curSeg, formSearch, $table,click = false;
    var initLayout = function () {
        curSeg = MtdIndex;
        $table = $("#mtdGrid");
    };
    //公有方法
    return {
        onLoad: function () {
            initLayout();
            curSeg.initValidate();
            curSeg.initDataGrid();
            // curSeg.onQuery();
        },
        //多个name属性校验
        initValidate:function () {
            if ($.validator) {
                $.validator.prototype.elements = function () {
                    var validator = this,
                        rulesCache = {};
                    // select all valid inputs inside the form (no submit or reset buttons)
                    return $([]).add($(this.currentForm)
                        .find("input, select, textarea")
                        .not(":submit, :reset, :image, [disabled]")
                        .not(this.settings.ignore)
                        .filter(function () {
                            if (!this.name && validator.settings.debug && window.console) {
                                console.error("%o has no name assigned", this);
                            }
                            //注释这行代码
                            // select only the first element for each name, and only those with rules specified
                            //if ( this.name in rulesCache || !validator.objectLength($(this).rules()) ) {
                            //    return false;
                            //}
                            rulesCache[this.name] = true;
                            return true;
                        }));
                }
            }
        },
        //初始化表格数据
        initDataGrid: function () {
            $table.bootstrapTable({
                height : tableModel.getHeight(),
                idField : "virtualIpConfId",
                columns : [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "虚拟ipId", field: "virtualIpConfId"},
                    {title: "开始ip", field: "startIp"},
                    {title: "结束ip", field: "endIp"},
                    {title: "开启状态", field: "virtualIpConfStatus", formatter: tableModel.getState},
                    {title: "创建时间", field: "createAt", sortable: true},
                ]],
                url : '/functionView/vip/vipList',
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
                sortOrder : 'desc',
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
                area: ['850px', '400px'],
                content: '/functionView/vip/vipAdd',
                btn: ['确定', '取消'] //只是为了演示
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var mtdForm = body.find("#vipForm");
                 var jsonData =    mtdForm.serializeJson();
                    //组装分期数据结构
                    jsonData.mgList = [];
                    var mgTr = mtdForm.find("#vipTable").find("tbody > tr"),
                        mg;
                    mgTr.each(function () {
                        mg = $(this);
                        jsonData.mgList.push({
                            startIp: mg.find(":input[name='startIp']")[0].value,
                            endIp: mg.find(":input[name='endIp']")[0].value,
                        })
                    });
                 console.log(jsonData);
                    var rules = {
                        startIp:{
                            required: true,
                            validateIpAddress:true
                        },
                        endIp:{
                            required: true,
                            validateIpAddress:true
                        }
                    };
                    var messages = {

                        startIp:{
                            required: "开始ip不能为空"
                        },
                        endIp:{
                            required: "结束ip不能为空",
                        }

                    };
                    baseTools2.validateForm($(mtdForm), rules, messages);
                    if (!$(mtdForm).valid()) {
                        return;
                    }
                    // if(!click) {
                    //     click = true;

                        baseTools2.ajaxPost({
                            // bShow:false,
                            url: "/functionView/vip/vipSave",
                            params: {'STR_JSON': JSON.stringify(jsonData)},
                            callback: [curSeg.pageFlowControl]
                        });
                    // }
                },
                btn2: function () {
                    layer.closeAll();
                }
            })
            ;
        },
        /**
         * 需要的时候可以覆盖该方法
         * 在ajax调用中，在得到数据时调用该方法
         */
        pageFlowControl: function (jsonObj, xhrArgs) {
            switch (parseInt(jsonObj.status)) {
                //失败
                case 0:
                    layer.alert(jsonObj.msg, {icon: 1},function () {
                        layer.closeAll();
                    });
                    break;
                //成功
                case 1:
                    layer.alert(jsonObj.msg, {icon: 1},function () {
                        layer.closeAll();
                        $table.bootstrapTable('refresh',  {url: '/functionView/vip/vipList'});
                    });
                    break;
                default:
            }
        },
        del: function () {
            var ids = "";//得到用户选择的数据的ID
            var rows = $table.bootstrapTable('getSelections');
            if (rows.length == 0) {
                layer.alert("请最少选择一行！");
                return;
            }
            for (var i = 0; i < rows.length; i++) {
                ids += rows[i].virtualIpConfId + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            curSeg.delRow(ids, '/functionView/vip/vipDelete', 'virtualIpConfId');
        },
        delRow : function (rowid,url,field) {
            layer.confirm('确定删除吗?', function(index){
                $.getJSON(url, {ids:rowid}, function(ret){
                    if (ret.status){
                        layer.msg(ret.msg, {icon: 1});
                        $table.bootstrapTable('refresh',  {url: '/functionView/vip/vipList'});
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                });
            });
        }
    };
})();