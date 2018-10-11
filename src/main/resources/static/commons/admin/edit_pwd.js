$(document).ready(function () {
    EditPwd.onLoad();
});


var EditPwd = (function () {
    //私有属性
    var curSeg, rules,messages,formId,body;
    //初始化页面UI
    var initLayout = function () {
        curSeg = EditPwd;
        rules = {
            oldPassword: {
                required: true,
            //     remote: {
            //         url: "/console/validateOldPwd",
            //         type: "post",
            //         data: {
            //             username: function() {
            //                 return $("formId input[name='oldPassword']").val();
            //             }
            //         }
            // }
            },
            password: {
                required: true,
            },
            confirmPassword:{
                required: true,
            }

        };
        messages = {
            oldPassword: {
                required: "请输入原密码",
                // remote:"原密码不正确"
            },
            password: {
                required: "请输入新密码"
            },
            confirmPassword:{
                required: "请再次输入新密码",
            }
        };

    };
    //公有方法
    return {
        onLoad: function () {
            initLayout();
        },
        editother : function () {
            layer.open({
                type: 2,
                shadeClose: true,
                shade: 0.8,
                maxmin: true, //开启最大化最小化按钮
                btn: ['确定', '取消'],
                area: ['500px', '600px'],
                content: '/console/admin/fromother',
                yes: function (index, layero) {
                     body = layer.getChildFrame('body', index);
                     formId = body.find("#dataForm");
                    baseTools2.validateForm($(formId), rules, messages);
                    if (!$(formId).valid()) {
                        return;
                    }
                    var oldPwd =  body.find("#oldPassword").val();
                    var uid =  body.find("#uid").val();
                    $.ajax({
                        type:'post',
                        url:'/console/admin/validateOldPwd',
                        data:{uid:uid,oldPassword:oldPwd},
                        cache:false,
                        dataType:'json',
                        success:function(data){
                           if(data){
                               var pwd =  body.find("#password").val();
                               var pwd2 =  body.find("#confirmPassword").val();
                               if(pwd!=pwd2){
                                   layer.msg("两次输入的密码不一致", {icon: 2});
                                   return
                               }
                               baseTools2.ajaxSubmitForm($(formId), "/console/admin/savepwd");
                           }else{
                               layer.msg("原密码错误", {icon: 2});
                           }

                        }
                    });

                }
            });
        }
    };
})();