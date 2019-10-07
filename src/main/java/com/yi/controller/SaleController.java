package com.yi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String ticketingPost(Sale sale) throws Exception {
		logger.info("---------- ticketingPost ----------");
		logger.info("sale => " + sale.toString());
		
		sService.insertSale(sale);
		
		return "redirect:/sale/ticketing";
	}
	
	@RequestMapping(value="ticketing", method=RequestMethod.GET)
	public void ticketingGet() {
		logger.info("---------- ticketingGet ----------");
		
		/*select * from sale s join reservation r on s.sal_no = r.sal_no join train t on t.t_code = r.t_code left join train_time tt on tt.t_code = t.t_code join city_train ct on ct.nodeid = tt.nodeid;*/
	}
}
