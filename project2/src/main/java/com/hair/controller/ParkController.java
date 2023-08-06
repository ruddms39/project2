package com.hair.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hair.service.ParkService;
import com.hair.vo.SeMessageDTO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ParkController {

	@Autowired
	private ParkService parkService;
	
    @Autowired
    private ImageFileTest imageFileTest;	

	// get 쪽지보내기
	@GetMapping("/mailbox")
	public String mailbox(HttpServletRequest request) {
		return "/mailbox";
	}

	// post 쪽지보내기
	@PostMapping("/mailbox")
	public String mailbox(HttpServletRequest request, SeMessageDTO seMessageDTO) {
		// messageDTO.setMsgNo1(0)
		int result = parkService.insertMailbox(seMessageDTO); // message1
		int result2 = parkService.insertMailbox2(seMessageDTO); // message2

		System.out.println("result : " + result);
		System.out.println("result2 : " + result2);

		return "redirect:/mailboxSend";
	}

	// 받은쪽지함
	@RequestMapping("/mailboxReceive")
	public ModelAndView mailboxReceive(HttpSession session,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo) {
		ModelAndView mv = new ModelAndView("mailboxReceive");

		SeMessageDTO seMessageDTO = new SeMessageDTO();
		seMessageDTO.setReceive((String) session.getAttribute("uid"));

		int totalCount = parkService.receiveTotalcount(seMessageDTO);
		System.out.println("totalCount : " + totalCount);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo); //
		paginationInfo.setRecordCountPerPage(10); //
		paginationInfo.setPageSize(5);//
		paginationInfo.setTotalRecordCount(totalCount); //

		//
		int startPage = paginationInfo.getFirstRecordIndex();
		//
		int lastPage = paginationInfo.getRecordCountPerPage();

		System.out.println("startPage" + startPage);
		System.out.println("lastPage" + lastPage);

		seMessageDTO.setStartPage(startPage);
		seMessageDTO.setLastPage(lastPage);

		mv.addObject("paginationInfo", paginationInfo);
		System.out.println("paginationInfo" + paginationInfo);

		List<SeMessageDTO> list = parkService.mailboxReceive(seMessageDTO);

		mv.addObject("list", list);

		return mv;
	}

	// 쪽지 상세보기
	@GetMapping("/mailboxDetail")
	public ModelAndView mailboxDetail(HttpSession session, SeMessageDTO seMessageDTO) {
		ModelAndView mv = new ModelAndView("mailboxDetail");

		seMessageDTO = parkService.mailboxDetail(seMessageDTO);

		mv.addObject("detail", seMessageDTO);

		return mv;
	}

	// 보낸쪽지함
	@RequestMapping("/mailboxSend")
	public ModelAndView mailboxSend(@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("mailboxSend");

		SeMessageDTO seMessageDTO = new SeMessageDTO();
		seMessageDTO.setSend((String) session.getAttribute("uid"));

		int totalCount = parkService.sendTotalcount(seMessageDTO);
		System.out.println("totalCount : " + totalCount);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo); //
		paginationInfo.setRecordCountPerPage(10); //
		paginationInfo.setPageSize(5);//
		paginationInfo.setTotalRecordCount(totalCount); //

		//
		int startPage = paginationInfo.getFirstRecordIndex();
		//
		int lastPage = paginationInfo.getRecordCountPerPage();

		System.out.println("startPage" + startPage);
		System.out.println("lastPage" + lastPage);

		seMessageDTO.setStartPage(startPage);
		seMessageDTO.setLastPage(lastPage);

		mv.addObject("paginationInfo", paginationInfo);
		System.out.println("paginationInfo" + paginationInfo);

		List<SeMessageDTO> list = parkService.mailboxSend(seMessageDTO);

		mv.addObject("list", list);

		return mv;
	}

	// 쪽지삭제 (휴지통 안만들거면 Get은 주석처리 해도 됨)
	@GetMapping("/mailboxDelete")
	public String mailboxDelete(HttpServletRequest request) {
		return "/mailboxDelete";
	}
	@PostMapping("/mailboxDelete")
	public String mailboxDelete(HttpServletRequest request, SeMessageDTO seMessageDTO) {
	    parkService.mailboxDelete(seMessageDTO);
	    String referer = request.getHeader("Referer");
	    return "redirect:" + referer;
	}
	
	// 체크박스로 삭제    	  //msgNoList라는 Name을 List형식으로 id변수에 저장
	@PostMapping("/checkDelete")
	public String checkDelete(@RequestParam() List<Integer> msgNoList, HttpServletRequest request) throws Exception {
	    for (Integer id : msgNoList) {
	        parkService.checkDelete(id);
	    }
	    
	    String referer = request.getHeader("Referer");
	    return "redirect:" + referer;
	}


	// 받은쪽지함 검색
	@RequestMapping(value = "/searchMessageList", method = RequestMethod.GET)
	public String searchMessageList(@RequestParam("msgSearchList") String msgSearchList,
			@RequestParam("msgSearchText") String msgSearchText, Model model, HttpServletRequest request) {
		Map<String, String> searchParams = new HashMap<>();
		searchParams.put("msgSearchList", msgSearchList);
		searchParams.put("msgSearchText", "%" + msgSearchText + "%");

		List<SeMessageDTO> searchResult = parkService.searchMailboxReceive(searchParams);
		model.addAttribute("list", searchResult);

		return "mailboxReceive";
	}

	// 보낸쪽지함 검색
	@RequestMapping(value = "/searchMessageList2", method = RequestMethod.GET)
	public String searchMessageList2(@RequestParam("msgSearchList2") String msgSearchList2,
			@RequestParam("msgSearchText2") String msgSearchText2, Model model, HttpServletRequest request) {
		Map<String, String> searchParams = new HashMap<>();
		searchParams.put("msgSearchList2", msgSearchList2);
		searchParams.put("msgSearchText2", "%" + msgSearchText2 + "%");

		List<SeMessageDTO> searchResult = parkService.searchMailboxSend(searchParams);
		model.addAttribute("list", searchResult);

		return "mailboxSend";
	}
	
	
	// 파일업로드
    @RequestMapping(value = "/fileupload", method = RequestMethod.POST)
    public String fileupload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
    	String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "+fileRealName);
		System.out.println("용량크기(byte) : "+size);

		String webappRoot = request.getServletContext().getRealPath("/");		//서버 경로 확인
		String folder = "resources" + File.separator; //\resource\images 저장폴더 지정
		System.out.println(webappRoot+folder);
		
		//배포위치에 저장
		String filename = webappRoot + folder + fileRealName; //서버위치+저장폴더+파일명
		try {
			file.transferTo(new File(filename)); //전달받은 파일을 지정된 위치에 파일명으로 저장한다.	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//개발위치에 저장				
		String path = "C:\\Users\\woori\\Desktop\\imagescrops";
		String filename2 =path+File.separator+fileRealName;
		try {
			file.transferTo(new File(filename2));	
		} catch (Exception e) {
			// TODO: handle exception
		}
		
        try {
            MultipartFile multipartFile = null;
			imageFileTest.file_transfer(multipartFile);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
				
    	return "redirect:/mailbox";
    	   	
     }
	
}
