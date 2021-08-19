package kr.or.ddit.cus.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.CusVO;

public interface CusMapper {
	
	//고객 리스트
	List<CusVO> selectCusList(Map<String, Object> map);
	
	int insert(CusVO cusVo);
	
	CusVO detail(String cusNum);
	
	//고객정보 수정(이미지 변경 안함)
	int update(CusVO cusVo);

	//고객(CUS)정보 수정(고객의 이미지 포함)
	int updateWithImage(CusVO cusVo);
	

	//CUS테이블의 카디널리티
	int cusTotal(Map<String, Object> map); 
	
	
	//고객(CUS)정보 삭제 
	int delete(String cusNum);
	
	
	//특정 고객이 소유하고 있는 자동차 댓수 
	int selectCountCar(String cusNum);
	
}


