package com.fitmate.websocket;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.websocket.server.ServerEndpoint;

@Service
@ServerEndpoint(value = "/msg")
public class WebSocket {
}
