package kr.co.itcen.fa.repository.menu11;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Repository
public class Menu47Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<STermDebtVo> getList(Map map) {
		System.out.println("startRow : " + map.get("startRow") + " endRow : " + map.get("endRow"));
		return sqlSession.selectList("menu47.getList", map);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("menu47.getTotalCount");
	}
}
