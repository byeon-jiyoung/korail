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
	public void saleGet(String totalPrice, Model model) {
		logger.info("---------- saleGet ----------");
		logger.info("totalPrice : " + totalPrice);
		
		model.addAttribute("totalPrice", totalPrice);
	}
	
	@RequestMapping(value="ticketing", method=RequestMethod.POST)
	public String ticketingPost(Sale sale, RedirectAttributes rattr) throws Exception {
		logger.info("---------- ticketingPost ----------");
		logger.info("sale => " + sale.toString());
		
		sService.insertSale(sale);
		
		int s = sService.selectSalelately();
		rattr.addAttribute("salNo", s);
		
		return "redirect:/sale/ticketing";
	}
	
	@RequestMapping(value="ticketing", method=RequestMethod.GET)
	public void ticketingGet(String salNo, Model model) throws Exception {
		logger.info("---------- ticketingGet ----------");
		logger.info("salNo : " + salNo);
		
		Sale sale = sService.resultSale(Integer.parseInt(salNo));
		List<Reservation> resList = sService.selecResBySalNo(Integer.parseInt(salNo));
		
		logger.info("----------------------" + sale.toString());
		for(Reservation r : resList) {
			logger.info(r.toString());
		}
		
		model.addAttribute("resList", resList);
		model.addAttribute("sale", sale);
		
		/*
		 select * from TrainCityTrain tct join SaleReservation sr where sal_no = 1;


select * from SaleReservation where sal_no = 1;
		 * 
		 * */
	}
}
