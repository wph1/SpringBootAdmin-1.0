/**
 * <ol>
 * <li>创建文档</li>
 * <li>应用平台构建的APP按需使用编码加载业务组件辅助工具类</li>
 * </ol>
 */
var includeTools = {
    BASE_PARAMS: {INCLUDE_NAME: 'include.web.ui', COMMONS_NAME: "commons"},
    //根据JS编码获取对应的js组件路径
    getCssJsPath: function (basePath, dm) {
        var path = [];
        switch (parseInt(dm, 10)) {
            case 10: //基础类css/JS
                path.push('<script src="/static/js/baseTools.js" type="text/javascript"></scr' + 'ipt>');
                path.push('<script src="/static/commons/base/jquery.cookie.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  11://用户管理首页
                path.push('<script src="/static/commons/admin/admin_index.js" type="text/javascript"></scr' + 'ipt>');
            break;
            case  13://修改密码
                path.push('<script src="/static/commons/admin/edit_pwd.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  14://回话信息
                path.push('<script src="/static/commons/flowsession/flowsession_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  15://真实子网配置
                path.push('<script src="/static/commons/rip/rip_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  16://mtd配置
                path.push('<script src="/static/commons/mtd/mtd_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  17://vip配置
                path.push('<script src="/static/commons/vip/vip_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  18://switches交换机信息
                path.push('<script src="/static/commons/switches/switches_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  19://ztree树形
                path.push('<link href="/static/commons/js/ztree3.5/css/zTreeStyle/zTreeStyle.css"  rel="stylesheet" type="text/css">');
                path.push('<script src="/static/commons/js/ztree3.5/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  20://黑名单列表信息
                path.push('<script src="/static/commons/blacklist/balcklist_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  21://flot图表
                path.push('<script src="/static/commons/js/flot/jquery.flot.js" type="text/javascript"></scr' + 'ipt>');
                path.push('<script src="/static/commons/js/flot/jquery.flot.resize.js" type="text/javascript"></scr' + 'ipt>');
                path.push('<script src="/static/commons/js/flot/jquery.flot.pie.js" type="text/javascript"></scr' + 'ipt>');
                path.push('<script src="/static/commons/js/flot/jquery.flot.categories.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  22://蜜罐日志
                path.push('<script src="/static/commons/honeypotlog/honeypotlog_index.js" type="text/javascript"></scr' + 'ipt>');
                break;
            case  12://统计图标组件
                path.push('<script src="/static/commons/chart/Chart.min.js" type="text/javascript"></scr' + 'ipt>');
                path.push('<script src="/static/commons/chart/echarts.common.min.js" type="text/javascript"></scr' + 'ipt>');

//                 //path.push('<link href="' + basePath + '../themes/default/main.css"  rel="stylesheet" type="text/css">');
//
//                 path.push('<script src="' + basePath + 'base/jquery.blockUI.min.js" type="text/javascript"></scr' + 'ipt>');
//
//                 path.push('<script src="' + basePath + 'base/jsonpath.js" type="text/javascript"></scr' + 'ipt>');
// //            path.push('<script src="' + basePath + 'base/base.tools.min.js" type="text/javascript"></scri' + 'pt>');
//                 path.push('<script src="' + basePath + 'base/base.tools.js" type="text/javascript"></scr' + 'ipt>');
//                 path.push('<script src="' + basePath + 'base/jquery.cookie.js" type="text/javascript"></scr' + 'ipt>');
//
//                 path.push('<link href="' + basePath + 'font-Awesome-4.7.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">');

                break;
            default:
                alert('未知的JS组件编号:' + dm);
        }
        return path.join('');
    }
};

/**
 * 获取指定两个条件下commons路径路径
 * @param params {INCLUDE_NAME:'需要引用的JS文件名称',COMMONS_NAME:'includeName的上级目录'}
 */
//BASE_PARAMS: {INCLUDE_NAME: 'include.web.ui', COMMONS_NAME: "commons"},
includeTools.getPath = function (params) {
    var opts = {};
    var includeName = 'include.mobile.ui';
    var commonsName = 'commons';
    if (params) {
        includeName = params.INCLUDE_NAME === undefined ? includeName : params.INCLUDE_NAME;
        commonsName = params.COMMONS_NAME === undefined ? commonsName : params.COMMONS_NAME;
        opts = params;
    }
    opts = {INCLUDE_NAME: includeName, COMMONS_NAME: commonsName};

    var path = [];
    var hds = document.getElementsByTagName("script");
    var src, ds;
    for (var i = 0; i < hds.length; i++) {
        if (hds[i].src.length > 0) {
            src = hds[i].getAttribute('src');
            if (src.indexOf(includeName) != -1) {
                ds = src.split('/');
                for (var x = 0; x < ds.length; x++) {
                    path.push(ds[x]);
                    if (ds[x] == commonsName) {
                        opts.DM = hds[i].getAttribute("dm");
                        break;
                    }
                }
                break;
            }
        }
    }
    opts.INCLUDE_PATH = path.join('/');
    opts.INCLUDE_SRC = src;
    return opts;
};

/**
 * 加载js/css组件
 * @param params
 */
includeTools.loadJsCss = function (params) {
    var includeDM = 'dm';
    var re = new RegExp("" + includeDM + "=([^&?]*)", "ig");
    var dm = params.DM,
        includeSrc = params.INCLUDE_SRC,
        commonsJsPath = params.INCLUDE_PATH;
    try {
        if (dm == null)
            dm = ((includeSrc.match(re)) ? (includeSrc.match(re)[0].substr(includeDM.length + 1)) : "");
    } catch (e) {
        dm = ''
    }
    if (dm.length == 0) {

    }
    //没有指定js代码时，只加载基础JS
    var path = [];
    if (dm.length == 0) {
        //为指定dm时返回基础类css/JS
        path.push(this.getCssJsPath(commonsJsPath + "/js/", 10));
    } else {
        re = /[^13579]{1,2}/;//表示不可以有1 3 5 7 9的1到2位的偶数
        if (!re.test(dm)) {
            alert('请正确使用CSS/JS编码!');
            return;
        }
        var tem;
        for (var i = 0; i < dm.length; ++i) {
            tem = this.getCssJsPath(commonsJsPath + "/js/", dm.charAt(i) + dm.charAt(++i));
            if (tem.length > 0)
                path.push(tem);
        }
    }
    if (path.length > 0)
        document.write(path.join(''));
};

//立即加载需要的组件
includeTools.loadJsCss(
    includeTools.getPath(includeTools.BASE_PARAMS)
);