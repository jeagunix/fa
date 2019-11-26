package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu47Service;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu47Controller.MAINMENU)
public class Menu47Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "47";
	
	@Autowired
	private Menu47Service menu47Service;
	
	                                   //   /11/47, /11/47/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		menu47Service.test();
		/*
		 *    JSP
		 *    11/47/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
