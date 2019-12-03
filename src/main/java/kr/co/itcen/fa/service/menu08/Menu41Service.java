package kr.co.itcen.fa.service.menu08;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu41Repository;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 *  @author 권영미
 *  차량관리
 */

@Service
public class Menu41Service {
	
	@Autowired
	private Menu41Repository menu41Repository;
	
	public void test() {
		menu41Repository.test();
	}
	
	//대분류 리스트 테스트
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu41Repository.getSection());
		return map;
	}
	
	//직급 리스트 테스트
	public Map<String, Object> getName() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jikNameList", menu41Repository.getJik());
		return map;
	}


	//리스트 등록
	public void insert(VehicleVo vehicleVo) {
		menu41Repository.insert(vehicleVo);
		
	}

	//리스트 출력
	public Map<String, Object> selectList(VehicleVo vehicleVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", menu41Repository.selectList(vehicleVo));
		return map;
		
	}
	
	//리스트 수정
	public void update(VehicleVo vehicleVo) {
		menu41Repository.update(vehicleVo);
	}

	//리스트 검색
	public void search(VehicleVo vehicleVo) {
		menu41Repository.search(vehicleVo);
		
	}

	//리스트 삭제
	public void delete(String id) {
		menu41Repository.delete(id);
		
	}


	
}
