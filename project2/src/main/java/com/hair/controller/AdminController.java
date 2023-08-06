package com.hair.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.Pager;
import com.hair.service.AdminService;
import com.hair.service.BoardService;
import com.hair.service.CommentService;
import com.hair.service.ProductService;
import com.hair.vo.BoardVO;
import com.hair.vo.CommentVO;
import com.hair.vo.ProductVO;
import com.hair.vo.UsersVO;

@Controller
public class AdminController {

	@Inject
	AdminService adminService;
	@Inject
	BoardService boardservice;
	@Inject
	ProductService productService;
	@Inject
	public CommentService commentService;
	// 관리자페이지 보여주기
	@RequestMapping("admin")
	public String admin() {

		return "/admin";
	}

	@RequestMapping("adminBoardList")
	public ModelAndView adminBoardList(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView("adminBoardList");

		int count = adminService.totalCountB(searchOption, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin() - 1;
		int end = pager.getPageEnd();
		List<BoardVO> blist = adminService.adminBoardList(start, end, searchOption, keyword);
		BoardVO bvo = new BoardVO(); 
		mav.addObject("blist", blist); // 게시글
		mav.addObject("count", count);
		mav.addObject("vo", bvo);
		bvo.setBdel(request.getParameter("udel"));
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("pager", pager);
		System.out.println(blist);
		System.out.println(searchOption);
		System.out.println(keyword);
		return mav;
	}

	@RequestMapping("adminProductList")
	public ModelAndView productList(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("adminProductList");
		int count = adminService.totalCountP(searchOption, keyword);
		
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin() - 1;
		int end = pager.getPageEnd();
		ProductVO send = new ProductVO();

		List<ProductVO> plist = adminService.adminProductList(start, end, searchOption, keyword);

		System.out.println(send);
		System.out.println(plist);
		mv.addObject("plist", plist);
		mv.addObject("count", count);
		mv.addObject("searchOption", searchOption);
		mv.addObject("keyword", keyword);
		mv.addObject("pager", pager);
		return mv;
	}

	@RequestMapping("adminUsersList")
	public ModelAndView adminUsersList(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("adminUsersList");
		UsersVO usersVO = new UsersVO();

		int count = adminService.userTotalCnt(searchOption, keyword);
		System.out.println("userTotalCnt : " + count);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin() - 1;
		int end = pager.getPageEnd();

		List<UsersVO> user = adminService.userAll(usersVO, start, end, searchOption, keyword);

		mv.addObject("user", user);
		mv.addObject("count", count);
		mv.addObject("searchOption", searchOption);
		mv.addObject("keyword", keyword);
		mv.addObject("pager", pager);

		return mv;
	}

	// 관리자용 회원정보 수정
	@RequestMapping("adminUser")
	public String adminUsers(@RequestParam int uno, Model model) {
		UsersVO vo = adminService.adminUsers(uno);
		model.addAttribute("vo", vo);
		return "adminUser";
	}
	@RequestMapping("adminBoardView")
	public String boardView(@ModelAttribute BoardVO vo, @RequestParam int bno, Model model) {
		// boardservice.view(int bno) 선언되어 있으면 boardVIew(@RequestParam int)변수별로 받기
		// 상세 출력
		BoardVO data = adminService.viewB(bno);
		model.addAttribute("dto", data); // 페이지에 값을 전달
		List<CommentVO> commentList = commentService.CBList(bno);
		List<CommentVO> Lastcomment = new ArrayList<CommentVO>();

		for (int i = 0; i < commentList.size(); i++) {
			if (commentList.get(i).getCgroup() == 0) {
				int index = commentList.get(i).getCno();
				Lastcomment.add(commentList.get(i));
				for (int j = 0; j < commentList.size(); j++) {
					if (index == commentList.get(j).getCgroup()) {
						Lastcomment.add(commentList.get(j));
					}
				}
			}
		}

		model.addAttribute("Lastcomment", Lastcomment);
		return "adminBoardView";
	}
	// 게시글 수정(데이터베이스)
	@RequestMapping(value = "adminBoardupdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO vo, Model model, HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardVO bvo = new BoardVO();
		bvo.setBno(bno);
		boardservice.update(vo);
		return "redirect:adminBoardView?bno=" + bno;
	}
	@RequestMapping(value = "adminBoardD")
	public String adminBoardD(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardVO vo = new BoardVO();
		vo.setBno(bno);
		int result = adminService.adminBoardD(vo);
		System.out.println("BD : " +result);
		return "redirect:adminBoardList";
	}	
	@RequestMapping(value = "adminBoardRD")
	public String adminBoardRD(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardVO vo = new BoardVO();
		vo.setBno(bno);
		int result = adminService.adminBoardRD(vo);
		System.out.println("BRD : " +result);
		return "redirect:adminBoardList";
	}	
	@RequestMapping(value = "adminUsersUpdate", method = RequestMethod.POST)
	public String adminUsersUpdate(HttpServletRequest request, Model model) {
		UsersVO usersVO = new UsersVO();
		usersVO.setRole(request.getParameter("role2"));
		usersVO.setUnick(request.getParameter("unick2"));
		usersVO.setUdel(request.getParameter("udel2"));
		usersVO.setUid(request.getParameter("uid2"));
		usersVO.setUno((Integer.parseInt(request.getParameter("uno2"))));

		String msg = "", url = "adminUsers?uno=" + (Integer.parseInt(request.getParameter("uno2")));

		int result = adminService.adminUsersUpdate(usersVO);
		if (result == 1) {
			msg = "수정 되었습니다.";

		} else {
			msg = "수정 실패하였습니다.  ";
		}

		System.out.println("회원정보 수정 result : " + result);
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "redirect:adminUsersList";

	}

}
