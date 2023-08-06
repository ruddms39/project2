package com.hair.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hair.service.usersService;
import com.hair.vo.UsersVO;

@Controller
public class UsersController {
	
	@Inject
	usersService usersservice;
	
	@RequestMapping("userslist")
	public String usersList(Model model) {
		List<UsersVO> list = usersservice.usersList();
		model.addAttribute("list",list);
		
		return "users_list";
	}

	@RequestMapping("usersmembership")
	public String memberwriteView() { //Model 
		
		return "usersmembership";
	}
	
	@RequestMapping("usersinsert")
	public String usersInsert(@ModelAttribute UsersVO vo) {
		usersservice.insertUsers(vo);
		
		return "redirect:/userslogin";
	}
	
	@RequestMapping("usersview") 
	public String usersView(String uid, Model model) {
		model.addAttribute("dto", usersservice.viewUsers(uid)); //session

		return "usersview";
	}
	
	@RequestMapping("usersupdate")
	public String usersUpdate(@ModelAttribute UsersVO vo) {
		usersservice.updateUsers(vo);
		return "redirect:/";
	}
	
	@RequestMapping("usersdelete")
	public String usersDelete(@RequestParam String uid, @RequestParam String upw, Model model, HttpSession session) {
		boolean result = usersservice.checkPw(uid, upw);
		if(result) {
			usersservice.deleteUsers(uid);
			usersservice.logout(session); 
			return "redirect:/";
		} else {
			model.addAttribute("message","유효하지 않은 아이디 입니다.");
			model.addAttribute("dto", usersservice.viewUsers(uid));
			return "usersview";
		}
		
	}
	
	@RequestMapping("userslogin")
	public String login() {
		return "login";
			
	}
	
	@RequestMapping("loginCheck")
	public ModelAndView loginCheck(@ModelAttribute UsersVO vo, HttpSession session) {
		boolean result = usersservice.loginCheck(vo, session);
		
		ModelAndView mav = new ModelAndView(); 
		if(result == true) {  //if(result)
			mav.setViewName("main"); //home.jsp濡� �씠�룞
			mav.addObject("msg", "success"); //addAttribute�� �룞�씪
		} else { //濡쒓렇�씤 �떎�뙣
			mav.setViewName("login"); //home.jsp濡� �씠�룞
			mav.addObject("msg", "failure"); //addAttribute�� �룞�씪			
		}
		
		return mav;
			
	}
	
	@RequestMapping("logout")
	public ModelAndView loginout(HttpSession session) {
		//session.invalidate();
		usersservice.logout(session); //�꽮�뀡媛믪쓣 �젣嫄�
		
		ModelAndView mav = new ModelAndView(); //�쟾�떖�븷 �럹�씠吏��쓽 �젙蹂�
		
		mav.setViewName("login"); //home.jsp濡� �씠�룞
		mav.addObject("msg", "logout"); //addAttribute�� �룞�씪			
		
		return mav;
			
	}
	//아이디 중복 체크
	@GetMapping("idCheck")
	@ResponseBody 
	public int idCheck(String uid, HttpServletRequest request) {
		
		System.out.println("중복 확인 요청된 아이디 : " + uid);
		
		int result = usersservice.idCheck(uid);
		
		if(result == 0) {
			System.out.println("아이디 사용 가능!");
		} else {
			System.out.println("아이디 중복! 사용 불가!");
		}
		
		return result;				
	}
	 
	@GetMapping("nickCheck")
	@ResponseBody
	public int nickCheck(String unick, HttpServletRequest request) {
		
		System.out.println("중복 확인 요청된 닉네임 :" +unick);
		
		int cnt = usersservice.nickCheck(unick);
		
		if(cnt == 0) {
			System.out.println("닉네임 사용 가능");
		} else {
			System.out.println("닉네임 중복! 사용 불가!");
		}
		
		return cnt;
	}
	
}
