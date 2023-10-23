
/**
 * 加入收藏
 */
function collect(goodid){
    $.post("/CollectBuyServlet", {goodsid:goodid}, function(data){
        if(data=="ok")
        {
            layer.msg("添加到收藏!", {time:800}, function(){
                location.reload();
            });
        }
        else if(data=="login"){
            alert("请登录后收藏!");
            location.href="/user_login.jsp";
        }

    });
}


/**
 * 收藏删除
 */
function deletes(goodid){
    $.post("/CollectDeleteServlet", {goodsid:goodid}, function(data){
        if(data=="ok"){
            layer.msg("删除成功!", {time:800}, function(){
                location.reload();
            });
        }else if(data=="login"){
            alert("请登录后收藏!");
            location.href="/user_login.jsp";
        }
    });
}

