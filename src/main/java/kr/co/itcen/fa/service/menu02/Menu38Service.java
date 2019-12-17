package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu38Repository;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillListVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 윤종진 매입세금계산서현황조회
 *
 */

@Service
public class Menu38Service {
	@Autowired
	private Menu38Repository menu38Repository;

	public List<BuyTaxbillVo> getAllBuyTaxbill() {
		List<BuyTaxbillVo> getAllBuyTaxbill = menu38Repository.getAllBuyTaxbill();
		return getAllBuyTaxbill;
	}

	public List<CustomerVo> getMatchTaxbillCustomerList() {
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Repository.getMatchTaxbillCustomerList();
		return getMatchTaxbillCustomerList;
	}

	public List<BuyTaxbillItemsVo> getMatchTaxbillItemsList() {
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Repository.getMatchTaxbillItemsList();
		return getMatchTaxbillItemsList;
	}

	public List<BuyTaxbillVo> getSelectedBuyTaxbillList(BuyTaxbillListVo buyTaxbillListVo) {
		List<BuyTaxbillVo> getSelectedBuyTaxbillList = menu38Repository.getSelectedBuyTaxbillList(buyTaxbillListVo);
		return getSelectedBuyTaxbillList;
	}

	public List<BuyTaxbillVo> getBuyTaxbillAll() {
		// TODO Auto-generated method stub
		return menu38Repository.getBuyTaxbillAll();
	}

	public List<BuyTaxbillVo> getBuyTaxbillList(int page_group) {
		page_group *= 55;
		return menu38Repository.getBuyTaxbillList(page_group);
	}

	public List<BuyTaxbillVo> getpageBuyTaxbillList(int page) {
		
		return menu38Repository.getpageBuyTaxbillList(page);
	}
}