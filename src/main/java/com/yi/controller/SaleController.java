package com.yi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yi.domain.Member;
import com.yi.domain.Reservation;
import com.yi.domain.Sale;
import com.yi.service.SaleService;

@Controller
@RequestMapping("/sale/*")
public class SaleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SaleController.class);
	
	@Autowired
	SaleService sService;
	
	@RequestMapping(value="sale", method=RequestMethod.GET)
	public void saleGet(String totalPrice, String tName, String tCode, String ttNo, String nomemPhone, Model model) {
		logger.info("---------- saleGet ----------");
		logger.info("totalPrice : " + totalPrice);
		logger.info("tName : " + tName);
		logger.info("tCode : " + tCode);
		logger.info("ttNo : " + ttNo);
		logger.info("nomemPhone : " + nomemPhone);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("tName", tName);
		model.addAttribute("tCode", tCode);
		model.addAttribute("ttNo", ttNo);
		model.addAttribute("nomemPhone", nomemPhone);
	}
	
	
	@RequestMapping(value="ticketing", method=RequestMethod.POST)
	public String ticketingPost(Sale sale, String tName, Member member, String tCode, String ttNo, String nomemPhone, RedirectAttributes rattr) throws Exception {
		logger.info("---------- ticketingPost ----------");
		logger.info("sale => " + sale.toString());
		logger.info("tName : " + tName);
		logger.info("tCode : " + tCode);
		logger.info("ttNo : " + ttNo);
		logger.info("member => " + member.toString());
		
		int updatemileage = (int) (sale.getSalPrice()*0.1);
		logger.info("////////"+updatemileage+"/////////"+sale.getSalPrice()+"///////////"+sale.getSalDiscount());
		
		logger.info("nomemPhone : " + nomemPhone);
		
		int lastsalNo = 0;
		if(nomemPhone.equals("sale")) {
			lastsalNo = sService.lastSalNo();
			logger.info(member.getMemPhone()+"  "+sService.lastSalNo()+"  9999999999999999999999999999999999");
		}else {
			nomemPhone = "m";
		}
		
		if(member.getMemId() == "") {
			sService.insertSale(sale, updatemileage, sale.getSalDiscount(), "noMem", member.getMemPhone(),lastsalNo);
		}else {
			sService.insertSale(sale, updatemileage, sale.getSalDiscount(), member.getMemId(), member.getMemPhone(),lastsalNo);
		}
		
		int s = sService.selectSalelately();
		int resClaNum = sService.selectResClaNum();
		
		rattr.addAttribute("salNo", s);
		rattr.addAttribute("tName", tName);
		rattr.addAttribute("tCode", tCode);
		rattr.addAttribute("ttNo", ttNo);
		rattr.addAttribute("resClaNum", resClaNum);
		
		return "redirect:/sale/ticketing";
	}
	
	@RequestMapping(value="ticketing", method=RequestMethod.GET)
	public void ticketingGet(String salNo, String tName, String tCode, String ttNo, String resClaNum, Model model) throws Exception {
		logger.info("---------- ticketingGet ----------");
		logger.info("salNo : " + salNo);
		logger.info("tName : " + tName);
		logger.info("ttNo : " + ttNo);
		logger.info("tCode : " + tCode);
		
		List<Sale> saleList = sService.resultSale(Integer.parseInt(salNo));
		List<Reservation> resList = sService.selecResBySalNo(Integer.parseInt(salNo),tName,Integer.parseInt(ttNo),tCode,Integer.parseInt(resClaNum));
		
		logger.info("saleList ===> " + saleList);
		for(Sale s : saleList) {
			logger.info(s.toString());
		}
		logger.info("resList ===> " + resList);
		for(Reservation r : resList) {
			logger.info(r.toString());
		}
		
		model.addAttribute("resList", resList);
		model.addAttribute("saleList", saleList);
	}
}
