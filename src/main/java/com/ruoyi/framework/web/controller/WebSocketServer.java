package com.ruoyi.framework.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/userSocket")
@Component
public class WebSocketServer {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static ConcurrentHashMap<String, WebSocketServer> webSocketSet = new ConcurrentHashMap<>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    private static Logger log = LoggerFactory.getLogger(WebSocketServer.class);

    //当前消息对象编号
    public static String userNo;
 
    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        if (userNo != null){
            webSocketSet.put(userNo, this);
        }
        addOnlineCount();           //在线数加1
        log.info("有新连接加入！当前在线人数为" + getOnlineCount());
        try {
        	 sendToUser("连接成功");
        } catch (IOException e) {
            log.error("websocket IO异常");
        }
    }
 
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(userNo);  //从set中删除
        subOnlineCount();           //在线数减1
        log.info("有一连接关闭！当前在线人数为" + getOnlineCount());
    }
 
    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session) {
    	log.info("来自客户端的消息:" + message);
    }
 
	/**
	 * 
	 * @param session
	 * @param error
	 */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }
 
 
    public static void sendToUser(String message) throws IOException {
        if (webSocketSet.containsKey(message)){
            userNo = message;
            webSocketSet.get(message).sendMessage("out");
        }
    }

    public void sendMessage(String message) throws IOException {

        this.session.getBasicRemote().sendText(message);

    }

 
    private static synchronized int getOnlineCount() {
        return onlineCount;
    }
 
    private static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }
 
    private static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
}
