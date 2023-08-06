package com.hair.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.service.CommentService;
import com.hair.vo.CommentVO;

@Controller
public class CommentController {

	@Inject
	private CommentService commentService;

	@RequestMapping(value = "commentboardW", method = RequestMethod.POST)
	public String commentInput(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();
		vo.setBno(Integer.parseInt(request.getParameter("bno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setCname(request.getParameter("cname"));
		vo.setUid((String) session.getAttribute("uid"));

		// Controller -> service -> dao -> sqlsession ->db
		int result = commentService.CBWrite(vo);

		System.out.println(result);

		return "redirect:/boardview?bno=" + request.getParameter("bno");
	}

	@RequestMapping(value = "commentproductW", method = RequestMethod.POST)
	public String pcommentInput(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();
		vo.setPno(Integer.parseInt(request.getParameter("pno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setCname(request.getParameter("cname"));
		vo.setUid((String) session.getAttribute("uid"));

		// Controller -> service -> dao -> sqlsession ->db
		int result = commentService.CPWrite(vo);

		System.out.println(result);

		return "redirect:/productview?pno=" + request.getParameter("pno");
	}

	@RequestMapping(value = "commentboardD", method = RequestMethod.POST)
	public @ResponseBody String commentDel(@RequestParam(value = "cno") int cno, @RequestParam(value = "bno") int bno,
			HttpSession session) {
		int result = 0;
		CommentVO vo = new CommentVO();
		vo.setCno(cno);
		vo.setBno(bno);
		vo.setUid((String) session.getAttribute("uid"));

		result = commentService.CBD(vo);
		return result + "";

	}

	@RequestMapping(value = "commentproductD", method = RequestMethod.POST)
	public @ResponseBody String pcommentDel(@RequestParam(value = "cno") int cno, @RequestParam(value = "pno") int pno,
			HttpSession session) {
		int result = 0;
		CommentVO vo = new CommentVO();
		vo.setCno(cno);
		vo.setPno(pno);
		vo.setUid((String) session.getAttribute("uid"));
		result = commentService.CPD(vo);
		return result + "";

	}

	@RequestMapping(value = "commentInsertP", method = RequestMethod.POST)
	public String pccommentInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();

		vo.setCno(Integer.parseInt(request.getParameter("cno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setCname(request.getParameter("cname"));
		vo.setUid((String) session.getAttribute("uid"));
		vo.setPno(Integer.parseInt(request.getParameter("pno")));

		commentService.CcPW(vo);

		return "redirect:/productview?pno=" + request.getParameter("pno");

	}

	@RequestMapping(value = "commentInsertB", method = RequestMethod.POST)
	public String bccommentInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();

		vo.setCno(Integer.parseInt(request.getParameter("cno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setCname(request.getParameter("cname"));
		vo.setUid((String) session.getAttribute("uid"));
		vo.setBno(Integer.parseInt(request.getParameter("bno")));

		commentService.CcBW(vo);

		return "redirect:/boardview?bno=" + request.getParameter("bno");

	}

	@RequestMapping(value = "repaircommentB", method = RequestMethod.POST)
	public String repaircomment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();
		vo.setBno(Integer.parseInt(request.getParameter("bno")));
		vo.setCno(Integer.parseInt(request.getParameter("cno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setUid((String) session.getAttribute("uid"));
		int result = commentService.RBC(vo);
		System.out.println(result);

		return "redirect:/boardview?bno=" + request.getParameter("bno");

	}

	@RequestMapping(value = "repaircommentP", method = RequestMethod.POST)
	public String prepaircomment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CommentVO vo = new CommentVO();
		vo.setPno(Integer.parseInt(request.getParameter("pno")));
		vo.setCno(Integer.parseInt(request.getParameter("cno")));
		vo.setCconte(request.getParameter("cconte"));
		vo.setUid((String) session.getAttribute("uid"));
		commentService.RPC(vo);

		return "redirect:/productview?pno=" + request.getParameter("pno");

	}

}
