package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.CardVo;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */

@Repository
public class Menu05Repository {
	@Autowired
	private SqlSession sqlSession;

	public Map<String, Object> create(CardVo vo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		sqlSession.insert("menu05.create", vo);
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		
		map.put("cardList", sqlSession.selectList("menu05.list",s));
		return map;
	}
	

	public Map<String, Object> read(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setCardNo(vo.getCardNo()+"-0000");
		String[] card= vo.getCardNo().split("-");
		vo.setCardNo1(card[0]);
		vo.setCardNo2(card[1]);
		vo.setCardNo3(card[2]);
		vo.setCardNo4(card[3]);
		
		map.put("cardList", sqlSession.selectList("menu05.read", vo));

		return map;
	}
	
	public Map<String, Object> update(CardVo vo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu05.update", vo);
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		
		map.put("cardList", sqlSession.selectList("menu05.list",s));
		return map;
	}


	public Map<String, Object> delete(CardVo vo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu05.delete", vo);
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		
		map.put("cardList", sqlSession.selectList("menu05.list",s));
		return map;
	}

	public Boolean Nexist(CardVo vo) {
		int exist = sqlSession.selectOne("menu05.nexist", vo);
		
		return exist == 1;
	}
	
	public Boolean Yexist(CardVo vo) {
		int exist = sqlSession.selectOne("menu05.yexist", vo);
		
		return exist == 1;
	}

	public CardVo exist(CardVo vo) {
		return sqlSession.selectOne("menu05.exist",vo);
	}
	
	public boolean deleteAll(CardVo vo) {
		int count = sqlSession.delete("menu05.deleteAll", vo);
		
		return (count==1);
	}
	
	public List<CardVo> list(PaginationUtil pagination) {
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		System.out.println(pagination.getPageIndex());
		System.out.println(pagination.getListSize());
		
		List<CardVo> res = sqlSession.selectList("menu05.list",s);
		return res;
	}


	public int listCount() {
		int res = sqlSession.selectOne("menu05.getCount");
		return res;
	}


//	public Map<String, Object> gets(String cardNo) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		List<CardVo> s = sqlSession.selectList("menu25.gets", cardNo);
//		map.put("cardList", s);
//		
//		return map;
//	}


	public Map<String, Object> updateBankAccount(BankAccountVo bankAccountVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu05.updateBankAccount", bankAccountVo);
		return map;
	}

	public String getCardNo(String depositNo) {
		List<String> list = sqlSession.selectList("menu05.get", depositNo);
		if(list.size()==0) {
			return "-";
		}else {
			return list.get(0);
		}
	}
}
