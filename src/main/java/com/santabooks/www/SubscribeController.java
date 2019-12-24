package com.santabooks.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscribeController {

	@RequestMapping(value="/subscribe/main")
	public void main() {}
	
}
