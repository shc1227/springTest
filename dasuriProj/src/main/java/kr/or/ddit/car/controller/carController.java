package kr.or.ddit.car.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.car.vo.CarVO;

//RestController : JSON용
@RequestMapping(value="/car/*")
@Controller
public class carController {
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list() {

		//forwarding
		return "car/list";
	}
	
	//자동차 등록 form
	@RequestMapping(value="/insert",method = RequestMethod.GET)
	public String inesrt() {
		
		//forwarding
		return "car/insert";
	}
	
	
	@RequestMapping(value="/insert",method = RequestMethod.POST)
	public String insertPost(@ModelAttribute CarVO carVo) {
		
		System.out.println("carVo : "+carVo.toString());
		
		List<CarVO> vo = carVo.getCarVo();
		
		for(CarVO row : vo) {
			System.out.print(row.getCarNum());
			System.out.print(row.getMk());
			System.out.print(row.getPy());
			System.out.print(row.getDriDist());
			System.out.println(row.getCusNum());
		}
		
		//forwarding
		return "car/insert";
	}
	
}
