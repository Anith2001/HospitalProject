package com.hospital;
import javax.servlet.http.*;
import javax.websocket.*;
import javax.websocket.server.*;

public class VitalCheckconfigurator extends ServerEndpointConfig.Configurator {
	public void modifyHandshake(ServerEndpointConfig conf,HandshakeRequest req,HandshakeResponse res) {
		HttpSession sess=(HttpSession)req.getHttpSession();
		String user=(String)sess.getAttribute("username");
		conf.getUserProperties().put("username",user);
	}
}
