package kr.or.ddit.cus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.cus.mapper.CusMapper;
import kr.or.ddit.cus.service.CusService;
import kr.or.ddit.cus.vo.CusVO;

@Service
public class CusServiceImpl implements CusService {
	
	@Autowired
	private CusMapper cusMapper;
	
	@Override
	public int insert(CusVO cusVo) throws Exception {
		int affectedRowCnt = this.cusMapper.insert(cusVo);
		if(affectedRowCnt > 0) {//insert 성공
			return cusVo.getCusNum();	//고객 번호를 리턴
		}else {//insert 실패시 0리턴
			return 0;
		}
	}
	
	//고객 상세 정보 페이지(cusNum : 고객 번호)
	@Override
	public CusVO detail(String cusNum) throws Exception {
		return this.cusMapper.detail(cusNum);
	}
	
	//고객정보 수정(이미지 변경 안함)
	@Override
	public int update(CusVO cusVo) {
		return this.cusMapper.update(cusVo);
	};
	
	//고객(CUS)정보 수정(고객의 이미지 포함)
	@Override
	public int updateWithImage(CusVO cusVo) throws Exception{
		return this.cusMapper.updateWithImage(cusVo);
	}

	@Override
	public List<CusVO> selectCusList(Map<String, Object> map) {
		return this.cusMapper.selectCusList(map);
	}
	
	
	//CUS테이블의 카디널리티
	@Override
	public int cusTotal(Map<String, Object> map) {
		return this.cusMapper.cusTotal(map);
	}

	//고객(CUS)정보 삭제 
	@Override
	public int delete(String cusNum) {
		return this.cusMapper.delete(cusNum);
	}
	
	//특정 고객이 소유하고 있는 자동차 댓수 
	@Override
	public int selectCountCar(String cusNum) {
		return this.cusMapper.selectCountCar(cusNum);	
	}
	
	
	
	
}
