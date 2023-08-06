package com.hair.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.util.Util2;
import com.hair.service.CommentService;
import com.hair.service.ProductService;
import com.hair.vo.CommentVO;
import com.hair.vo.ProductVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ProductController {
	@Inject
	public ProductService productService;
	@Inject
	CommentService commentService;

	@Autowired
	private ServletContext context;

	@RequestMapping(value = "/")
	public String main(Model model) {
		model.addAttribute("msg", "방문을 환영합니다.");

		return "main";
	}

	@RequestMapping("productlist")
	public ModelAndView productList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("productlist");
		int totalCount = productService.totalCount();


		ProductVO send = new ProductVO();

		List<ProductVO> list = productService.productList(send);

		System.out.println(send);
		System.out.println(list);
		mv.addObject("list", list); // 게시글
		return mv;
	}

	@RequestMapping("productview")
	public String productView(@RequestParam int pno, Model model) throws Exception {
		ProductVO vo = productService.productView(pno);

		model.addAttribute("vo", vo);
		List<CommentVO> commentList = commentService.CPList(pno);
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
		return "productview";
	}

	@RequestMapping(value = "productinsert", method = RequestMethod.POST)
	public String productInsert(HttpServletRequest request, MultipartFile file) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 경로 설정하기
		String realPath = context.getRealPath("resources/");
		System.out.println("실제 저장 경로" + realPath);
		// C:\workspace-spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\nov25_bootstrap\resources\
		String upFile = Util2.fileSave(realPath, file);
		System.out.println("저장된 파일명 : " + upFile);

		// 썸네일 만들기 fe83fewf.png = 파일명과 동일하게 만들었습니다.
		String thumbFile = Util2.makeThumbnail(realPath, upFile);
		System.out.println("썸네일 파일명 : " + thumbFile);
		map.put("ptitle", request.getParameter("ptitle"));
		map.put("pdetail", request.getParameter("pdetail"));
		map.put("upFile", upFile);
		map.put("thumbFile", thumbFile);
		map.put("sellprice", Integer.parseInt(request.getParameter("sellprice")));
		productService.productInsert(map);
		return "redirect:adminProductList";
	}

	@RequestMapping("product/updateP")
	public String productViewP(@RequestParam int pno, Model model) throws Exception {
		ProductVO vo = productService.productView(pno);

		model.addAttribute("vo", vo);

		return "productupdate";
	}

	@RequestMapping(value = "productupdate", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO vo) {

		productService.productUpdate(vo);

		return "redirect:adminProductList";
	}
	@RequestMapping(value = "productdelete")
	public String productDelete(HttpServletRequest request) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductVO vo = new ProductVO();
		vo.setPno(pno);
		int result = productService.productDelete(vo);
		System.out.println("result = " + result);
		return "redirect:adminProductList";
	}

	@RequestMapping(value = "productdeleteI")
	public String productDeleteI(HttpServletRequest request) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductVO vo = new ProductVO();
		vo.setPno(pno);
		int result = productService.productDeleteI(vo);
		System.out.println("result = " + result);
		return "redirect:adminProductList";
	}
	@RequestMapping(value = "productredelete")
	public String productReDelete(HttpServletRequest request) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductVO vo = new ProductVO();
		vo.setPno(pno);
		int result = productService.productReDelete(vo);
		System.out.println("result = " + result);
		return "redirect:adminProductList";
	}
	@RequestMapping(value = "productlike")
	public String like(HttpServletRequest request) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductVO vo = new ProductVO();
		vo.setPno(pno);
		productService.like(vo);
		String url = "redirect:/productview?pno=" + pno;
		return url;
	}
}
