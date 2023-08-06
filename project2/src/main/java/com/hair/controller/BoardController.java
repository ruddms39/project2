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
import com.hair.service.BoardService;
import com.hair.service.CommentService;
import com.hair.service.ProductService;
import com.hair.vo.BoardVO;
import com.hair.vo.CommentVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationManager;

@Controller
public class BoardController {
	@Inject
	public ProductService productService;
	@Inject
	public CommentService commentService;
	@Inject
	BoardService boardservice;

	@Inject
	PaginationManager paginationManager;

	@RequestMapping("/boardlist")
	public ModelAndView boardList(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView("boardlist");

		int count = boardservice.totalCount(searchOption, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin() - 1;
		int end = pager.getPageEnd();
		List<BoardVO> list = boardservice.listAll(start, end, searchOption, keyword);
		mav.addObject("list", list); // 게시글
		mav.addObject("count", count);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("pager", pager);
		mav.setViewName("/boardlist");
		System.out.println(list);
		System.out.println(searchOption);
		System.out.println(keyword);
		return mav;
	}

	@RequestMapping(value = "boardwrite", method = RequestMethod.GET)
	public String boardWrite(Model model) {

		return "boardwrite"; // 페이지이면 메소드(Model model)선언
	}

	// 게시글 등록(데이터베이스 처리)
	@RequestMapping(value = "boardwrite", method = RequestMethod.POST)
	public String boardWrite(@ModelAttribute BoardVO vo) {
		boardservice.insert(vo);
		return "redirect:boardlist";
	}

	// 게시글 상세보기
	@RequestMapping("boardview")
	public String boardView(@ModelAttribute BoardVO vo, @RequestParam int bno, Model model) {
		// boardservice.view(int bno) 선언되어 있으면 boardVIew(@RequestParam int)변수별로 받기
		boardservice.increaseViewcnt(bno);
		// 상세 출력
		BoardVO data = boardservice.view(bno);
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
		return "boardview";
	}

	// 게시글 수정(데이터베이스)
	@RequestMapping(value = "boardupdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO vo, Model model, HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardVO bvo = new BoardVO();
		bvo.setBno(bno);
		boardservice.update(vo);
		return "redirect:boardview?bno=" + bno;
	}

	// 게시글 삭제(데이터베이스)
	@RequestMapping("boarddelete")
	public String boardDelete(HttpServletRequest request) {

		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardVO vo = new BoardVO();
		vo.setBno(bno);
		boardservice.delete(vo);

		return "redirect:boardlist";
	}
}
