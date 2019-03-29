let socket;

if (typeof (WebSocket) === 'undefined'){

    layer.alert("请更换其他浏览器");

}else {

    console.log("the browser is OK!");

    socket = new WebSocket("ws://127.0.0.1:8088/userSocket");

    socket.onopen = () => {
        console.log("socket is opening!");
    };

    socket.onmessage = msg => {
        if (msg.data == "out"){
            layer.confirm("您已被强制下线， 请重新登录",
                {
                    btn: ["好的", "不要"], cancel: function(index){
                        window.location.href = '/';
                        layer.close(index);
                    }
                },
                function (index) {
                    window.location.href = "/";
                    layer.close(index);
                }, function (index) {
                    window.location.href = "/";
                    layer.close(index);
                }
            );
        }
    };

    socket.onclose = () => {
        console.log("web socket is closed");
    };

    socket.onerror = () => {
        console.log("webSocket 连接出错...")
    };

    window.onbeforeunload = () => {
        socket.close();
    }
}