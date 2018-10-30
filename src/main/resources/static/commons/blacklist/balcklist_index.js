$(document).ready(function () {
    BalckListIndex.onLoad();
});


var BalckListIndex = (function () {
    //私有属性
    var curSeg, formSearch, $table;
    var initLayout = function () {
        curSeg = BalckListIndex;
        $table = $("#blackListGrid");
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
                idField : "blackListId",
                columns : [[
                    {
                        field: 'checked',
                        checkbox: true
                    },
                    {title: "id", field: "blackListId"},
                    {title: "黑名单ip", field: "blackListIp"},
                    {title: "是否开启", field: "isUseBlackList", formatter: tableModel.getState},
                    {title: "创建时间", field: "createTime", sortable: true},
                    // {title: "操作", field: "operate", align: 'center', events: operateEvents, formatter: operateFormatter}
                ]],
                url : '/functionView/blackList/blackList',
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
                sortName : 'create_time',
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
                area: ['950px', '550px'],
                content: '/functionView/blackList/blackAdd',
                btn: ['确定', '取消'] //只是为了演示
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var balckForm = body.find("#balckForm");
                    //表单校验
                    var rules = {
                        blackListIp:{
                            required: true,
                            validateIpAddress:true
                        },
                        honeypotIp:{
                            required: true,
                            validateIpAddress:true
                        },
                        isUseBlackList:{
                            required: true
                        },
                        honeypotGateway:{
                            required: true,
                            validateIpAddress:true
                        },
                        honeypotMac:{
                            required: true,
                            validateMacAddress:true
                        },
                        honeypotSwitchPort:{
                            required: true
                        }
                    };
                    var messages = {
                        blackListIp:{
                            required: "黑名单ip不能为空"
                        },
                        honeypotIp:{
                            required: "蜜罐ip不能为空"
                        },
                        isUseBlackList:{
                            required: "请选择黑名单配置",
                        },
                        honeypotGateway:{
                            required: "请输入蜜罐网关",
                        },
                        honeypotMac:{
                            required: "请输入蜜罐服务器mac地址"
                        },
                        honeypotSwitchPort:{
                            required: "请选择蜜罐交换机端口"
                        }

                    };


                 var jsonData =    balckForm.serializeJson();
                    //组装蜜罐数据结构
                    jsonData.mgList = [];
                    var mgTr = balckForm.find("#mGTable").find("tbody > tr"),
                        mg;
                    mgTr.each(function () {
                        mg = $(this);
                        jsonData.mgList.push({
                            honeypotIp: mg.find(":input[name='honeypotIp']")[0].value,
                            honeypotMac: mg.find(":input[name='honeypotMac']")[0].value,
                            honeypotGateway: mg.find(":input[name='honeypotGateway']")[0].value,
                            honeypotSwitchPort: mg.find(":input[name='honeypotSwitchPort']")[0].value
                        })
                    });
                    //组装黑名单数据结构
                    jsonData.blackList = [];
                    var blackTr = balckForm.find("#blackTable").find("tbody > tr"),
                        black;
                    blackTr.each(function () {
                        black = $(this);
                        jsonData.blackList.push({
                            blackListIp: black.find(":input[name='blackListIp']")[0].value,
                        })
                    });
                 console.log(jsonData);


                    baseTools2.validateForm($(balckForm), rules, messages);
                    if (!$(balckForm).valid()) {
                        return;
                    }



                    baseTools2.ajaxPost({
                        // bShow:false,
                        url: "/functionView/blackList/blackSave",
                        params: {  'STR_JSON': JSON.stringify(jsonData) },
                        callback: [curSeg.pageFlowControl]
                    });
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
                        $table.bootstrapTable('refresh',  {url: '/functionView/blackList/blackList'});
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
                ids += rows[i].blackListId + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            curSeg.delRow(ids, '/functionView/blackList/blackDelete', 'blackListId');
        },
        delRow : function (rowid,url,field) {
            layer.confirm('确定删除吗?', function(){
                $.getJSON(url, {ids:rowid}, function(ret){
                    if (ret.status){
                        layer.msg(ret.msg, {icon: 1});
                        $table.bootstrapTable('refresh',  {url: '/functionView/blackList/blackList'});
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                });
            });
        }
    };
})();