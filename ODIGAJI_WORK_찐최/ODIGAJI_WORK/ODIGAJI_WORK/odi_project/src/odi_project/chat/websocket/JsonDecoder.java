package odi_project.chat.websocket;

import javax.websocket.DecodeException;
import javax.websocket.Decoder.Text;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

import odi_project.chat.model.vo.Message;


public class JsonDecoder implements Text<Message>{

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		
	}

	@Override
	public Message decode(String msg) throws DecodeException {
		return new Gson().fromJson(msg, Message.class);
	}

	@Override
	public boolean willDecode(String msg) {
		return true;
	}

}