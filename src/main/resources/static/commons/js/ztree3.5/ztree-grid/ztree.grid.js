/**
 * <ol>
 * date:2017-9-11 editor:yanghongjian
 * <li>创建文档</li>
 * <li>扩展zTree为grid的样式</li>
 * </ol>
 */

/**
 * 自定义DOM节点
 */
function addDiyDom(treeId, treeNode) {
    var spaceWidth = 15;
    var liObj = $("#" + treeNode.tId);
    var aObj = $("#" + treeNode.tId + "_a");
    var switchObj = $("#" + treeNode.tId + "_switch");
    var icoObj = $("#" + treeNode.tId + "_ico");

    var spanObj = $("#" + treeNode.tId + "_span");
    aObj.attr('title', '');
    aObj.append('<div class="divTd swich fnt" style="width:{WIDTH}"></div>'.format(treeNode.THS[0]));
    var div = $(liObj).find('div').eq(0);
    //从默认的位置移除
    switchObj.remove();
    spanObj.remove();
    icoObj.remove();
    //在指定的div中添加
    div.append(switchObj);
    div.append(spanObj);
    //隐藏了层次的span
    var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
    switchObj.before(spaceStr);
    //图标垂直居中
    icoObj.css("margin-top", "9px");
    switchObj.after(icoObj);

    var ths = treeNode.THS
        , trTpl = '<div class="divTd" style="width:{WIDTH}">{TXT}</div>'
        , trs = [];
    //根据配置动态生成表头
    delete ths[0];  //删除第一列
    for (var i in ths) {
        var key = ths[i].COL;
        var txt = treeNode.hasOwnProperty(key) ? treeNode[key] : '';
        ths[i].TXT = txt.length === 0 ? '&nbsp;' : txt;
        trs.push(trTpl.format(ths[i]));

    }
    aObj.append(trs.join(''))
}