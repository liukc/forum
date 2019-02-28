$("#button1").click(function () {
    $.ajax({
        type: "GET",   //提交的方法
        url:"/forum/servlet/SQLBackupServlet", //提交的地址
        dataType : "html",
        //data:$('#myform').serialize(),// 序列化表单值
        async: true,
        error: function(request) {  //失败的话
            alert("Connection error");
        },
        success: function(data) {  //成功
            alert("成功")
            //window.location.href="/forum/jsp/search.jsp"
        }
    });
});
$("#button2").click(function () {
    $.ajax({
        type: "GET",   //提交的方法
        url:"/forum/servlet/SQLRestoreServlet", //提交的地址
        dataType : "html",
        //data:$('#myform').serialize(),// 序列化表单值
        async: true,
        error: function(request) {  //失败的话
            alert("Connection error");
        },
        success: function(data) {  //成功
            alert("成功")
            //window.location.href="/forum/jsp/search.jsp"
        }
    });
});