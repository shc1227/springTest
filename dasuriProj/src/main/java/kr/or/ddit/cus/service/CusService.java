package kr.or.ddit.cus.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cus.vo.CusVO;

public interface CusService {

	//고객 등록
	public int insert(CusVO cusVo) throws Exception;
	
	//고객 상세정보
	public CusVO detail(String cusNum)throws Exception;

	//고객정보 수정(이미지변경안함)
	public int update(CusVO cusVo)throws Exception;
	
	//고객(CUS)정보 수정(고객의 이미지 포함)
	public int updateWithImage(CusVO cusVo) throws Exception;

	
	//고객 리스트
	public List<CusVO> selectCusList(Map<String, Object> map)throws Exception;
	
	//CUS테이블의 카디널리티
	public int cusTotal(Map<String, Object> map) throws Exception;

	//고객(CUS)정보 삭제 
	public int delete(String cusNum);
	
	//특정 고객이 소유하고 있는 자동차 댓수 
	public int selectCountCar(String cusNum);
	

}
