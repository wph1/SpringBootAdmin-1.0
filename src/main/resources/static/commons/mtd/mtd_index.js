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
                idField : "mtdId",
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
                area: ['850px', '750px'],
                content: '/functionView/mtd/mtdAdd',
                btn: ['确定', '取消'] //只是为了演示
                , yes: function (index, layero) {//layero 是弹出来的窗口对象
                    var body = layer.getChildFrame('body', index);
                    var mtdForm = body.find("#mtdForm");
                 var jsonData =    mtdForm.serializeJson();
                    //表单校验
                    var rules = {
                        honeypotIp:{
                            required: true,
                            validateIpAddress:true
                        },
                        isMtdMode:{
                            required: true
                        },
                        sessionIdle:{
                            required: true,
                            digits:true
                        },
                        externalAddress:{
                            required: true,
                            validateIpAddress:true
                        },
                        dnsForwardAddress:{
                            required: true,
                            validateIpAddress:true
                        },
                        dnsAddress:{
                            required: true,
                            validateIpAddress:true
                        },
                        externalSwitchPort:{
                            required: true
                        },
                        externalGateway:{
                            required: true,
                            validateIpAddress:true
                        },
                        useHoneypot:{
                            required: true
                        },
                        honeypotPathIdle:{
                            required: true,
                            digits:true
                        },
                        honeypotMac:{
                            required: true
                        },
                        // honeypotSwitchPort:{
                        //     required: true
                        // },
                        isPathMutation:{
                            required: true
                        },
                        pathTtl:{
                            required: true,
                            digits:true
                        },
                        kPath:{
                            required: true,
                            digits:true
                        }
                    };
                    var messages = {

                        honeypotIp:{
                            required: "蜜罐ip不能为空"
                        },
                        isMtdMode:{
                            required: "请选择mtd配置",
                        },
                        sessionIdle:{
                            required: "不能为空",
                            digits:"请输入整数"
                        },
                        externalAddress:{
                            required: "访问外网地址不能为空"
                        },
                        dnsForwardAddress:{
                            required: "dns服务器地址不能为空"
                        },
                        dnsAddress:{
                            required: "内部dns服务器地址不能为空"
                        },
                        externalSwitchPort:{
                            required: "出外网的端口不能为空"
                        },
                        externalGateway:{
                            required: "出外网的网关不能为空"
                        },
                        useHoneypot:{
                            required: "请选择蜜罐配置"
                        },
                        honeypotPathIdle:{
                            required: "流表最大空闲时间不能为空",
                            digits:"请输入整数"
                        },
                        honeypotMac:{
                            required: "请输入蜜罐服务器mac地址"
                        },
                        // honeypotSwitchPort:{
                        //     required: "请选择蜜罐交换机"
                        // },
                        isPathMutation:{
                            required: "请选择路径跳变配置"
                        },
                        pathTtl:{
                            required: "路径跳变周期不能为空",
                            digits:"路径跳变周期必须为整数"
                        },
                        kPath:{
                            required: "可跳变的最大路径数",
                            digits:"可调变的最大路径数为整数"
                        }

                    };
                    baseTools2.validateForm($(mtdForm), rules, messages);
                    if (!$(mtdForm).valid()) {
                        return;
                    }
                    //树形菜单数据，子页面对象iframeWin
                    var iframeWin = window[layero.find('iframe')[0]['name']];
                    // 调用子页面方法
                    var chkNode = iframeWin.onCheckNode();
                    if(chkNode.length==0){
                        layer.alert("请选择静态配置端口");
                        return;
                    }
                    jsonData.switchPort=chkNode;
                    // //组装服务信息
                    jsonData.serverList = [];
                    var mgTr = mtdForm.find("#serverTable").find("tbody > tr"),
                        mg;
                    mgTr.each(function () {
                        mg = $(this);
                        jsonData.serverList.push({
                            switchPort: mg.find(":input[name='switchPort']")[0].value,
                            serverPort: mg.find(":input[name='serverPort']")[0].value,
                        })
                    });
                    console.log(jsonData);

                    baseTools2.ajaxPost({
                        // bShow:false,
                        url: "/functionView/mtd/mtdSave",
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
                        $table.bootstrapTable('refresh',  {url: '/functionView/mtd/mtdList'});
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
                ids += rows[i].mtdId + ',';
            }
            ids = ids.substring(0, ids.length - 1);
            curSeg.delRow(ids, '/functionView/mtd/mtdDelete', 'mtdId');
        },
        delRow : function (rowid,url,field) {
            layer.confirm('确定删除吗?', function(){
                $.getJSON(url, {ids:rowid}, function(ret){
                    if (ret.status){
                        layer.msg(ret.msg, {icon: 1});
                        $table.bootstrapTable('refresh',  {url: '/functionView/mtd/mtdList'});
                    } else {
                        layer.msg(ret.msg, {icon: 2});
                    }
                });
            });
        }
    };
})();