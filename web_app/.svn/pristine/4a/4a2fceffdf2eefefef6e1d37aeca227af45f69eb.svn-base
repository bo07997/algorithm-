package web_app.com.ben.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web_app.com.ben.service.TestService;

@Controller
@Component("dataSourece")
public class TestController {
	@Autowired
	private TestService testService;
	@Value("${jndi.name}")
	private String name;
	
	@RequestMapping("/test")
	public String test(String test){
		System.out.println("******Controller********" + test);
		System.out.println("******name********" + name);
		return "index";
	}
}
