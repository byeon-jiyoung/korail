package com.yi.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.domain.Criteria;
import com.yi.domain.Event;
import com.yi.domain.Notice;
import com.yi.domain.PageMaker;
import com.yi.service.NoticeService;
import com.yi.util.UploadFileUtils;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("---------- listPage ----------");
		
		List<Notice> list = service.listNotice(cri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listNoticeCount()); //count에 cri없앴음. 에러뜨면 다시 넣어라
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public void readGet(int noNo, Criteria cri, Model model) throws Exception {
		logger.info("---------- readGet ---------- & noNo : " + noNo);
		
		Notice notice = service.readNotice(noNo);
		
		model.addAttribute("notice", notice);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="/displayFile", method=RequestMethod.GET)
	public @ResponseBody ResponseEntity<byte[]> displayFile(String filename) { //외부에 저장되어 있는 파일을 불러오기 위해 byte배열로 데이터를 주고받아야 한다.
		logger.info("------------- displayFile, filename : " + filename);
		
		String originFilename = filename.substring(0, 12) + filename.substring(14);
		
		String formatName = filename.substring(filename.lastIndexOf(".")+1); //확장자만 뽑아냄
		MediaType mType = null;
		ResponseEntity<byte[]> entity = null;
		
		if(formatName.equalsIgnoreCase("jpg")) {
			mType = MediaType.IMAGE_JPEG;
		}else if(formatName.equalsIgnoreCase("gif")) {
			mType = MediaType.IMAGE_GIF;
		}else if(formatName.equalsIgnoreCase("png")) {
			mType = MediaType.IMAGE_PNG;
		}
		
		InputStream in = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + "/" + originFilename);
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in != null) {
				try {
					in.close(); //파일을 열었으면 반드시 닫아줘야 한다!!!!★★★★★ 이거 안닫아주면 계속 inputstream으로 파일 당겨서 close가 잘 안됨
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	/*------------------------------------관리자--------------------------------------------*/
	@RequestMapping(value="mgnNotice", method=RequestMethod.GET)
	public void mgnNoticePage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("---------- mgnNoticePage ----------");
		
		List<Notice> list = service.listNotice(cri);
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listNoticeCount()); //count에 cri없앴음. 에러뜨면 다시 넣어라
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="mgnInsert", method=RequestMethod.GET)
	public void mgnInsertGet() throws Exception {
		logger.info("---------- mgnInsertGet ----------");
	}
	
	@RequestMapping(value="mgnInsert", method=RequestMethod.POST)
	public String mgnInsertPost(Notice notice, List<MultipartFile> imgFiles) throws Exception {
		logger.info("---------- mgnInsertPost ----------");
		
		for(MultipartFile file : imgFiles) {
			logger.info("file name : " + file.getOriginalFilename());
			logger.info("file size : " + file.getSize());
			
			if(file.getSize() <= 0) {
				logger.info("이미지없음");
				notice.setNoWriter("a");
				service.insertNotice(notice);
				continue;
			}
			
			String savedName = UploadFileUtils.upladFile(uploadPath, file.getOriginalFilename(), file.getBytes()); //파일 업로드하고, 썸네일 파일까지 다 만들어줌
			notice.setNoImg(savedName);
			notice.setNoWriter("a");
			service.insertNotice(notice);
		}
		
		return "redirect:/notice/mgnNotice";
	}
	
	@ResponseBody
	@RequestMapping(value="mgnRead", method=RequestMethod.GET)
	public Notice mgnReadGet(int noNo) throws Exception {
		logger.info("---------- mgnReadGet ---------- & noNo : " + noNo);
		
		Notice notice = service.readNotice(noNo);
		
		return notice;
	}
}
