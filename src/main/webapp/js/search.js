$("#button").click(function () {
    $.ajax({
        type: "POST",   //提交的方法
        url:"/forum/servlet/SearchServlet", //提交的地址
        dataType : "html",
        data:$('#myform').serialize(),// 序列化表单值
        async: true,
        error: function(request) {  //失败的话
            alert("Connection error");
        },
        success: function(data) {  //成功
            alert("成功")
            window.location.href="/forum/jsp/search.jsp"
        }
    });
});
