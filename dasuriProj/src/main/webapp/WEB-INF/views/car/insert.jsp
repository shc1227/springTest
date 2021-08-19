<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.form-control2 {
  width: 40%;
  height: calc(2.25rem + 2px);
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  box-shadow: inset 0 0 0 rgba(0, 0, 0, 0);
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>

<div id="body">
	
	<!-- Content Wrapper. Contains page content -->
  	<div class="content-wrapper">
		
		<!-- Content Header (Page header) -->
	    <div class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1 class="m-0">자동차 등록</h1>
	          </div><!-- /.col -->
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">자동차 목록</li>
	            </ol>
	          </div><!-- /.col -->
	        </div><!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </div>
	    <!-- /.content-header -->
		
		<!-- Main content -->
	    <section class="content">
	    	<div class="container-fluid">
				<div class="card card-primary">
	              <div class="card-header">
	                <h3 class="card-title">고객의 자동차를 등록합니다.</h3>
	              </div>
	              <!-- /.card-header -->
	              <!-- form start -->
	              <form action="/car/insert" method="post" id="carFrm">
	                <div class="card-body">
         		      	고객 번호
         		      	<input type="text" class="form-control" name="cusNum" id="cusNum" placeholder="고객번호를 입력하세요">
         		      	<br/><br/>
         		      	<div style="float: right; clear:both;width: 100%;">		              
				              <span style="cursor:pointer" id="adding">[추가]</span>&nbsp;
				              <span style="cursor:pointer" id="deleting">[삭제]</span><br/>
	              		</div>
	              		
<!-- 	              			<div style='float: left; clear: both; width: 100%;'> -->
<!-- 	              				<input type="text" name="carVo[0].cusNum" value="2" /> -->
<!-- 		              			자동차 번호<input type='text' class='form-control2' name='carVo[0].carNum' id='carNum' placeholder='자동차 번호를 입력하세요'> -->
<!-- 								제조사<input type='password' class='form-control2' name='carVo[0].mk' id='mk' placeholder='제조사를 입력하세요'><br/> -->
<!-- 								연식<input type='text' class='form-control2' name='carVo[0].py' id='py' placeholder='연식을 입력하세요'> -->
<!-- 								주행거리<input type='text' class='form-control2' name='carVo[0].driDist' id='driDist' placeholder='주행거리를 입력하세요'> -->
<!-- 							</div> -->
						<div id="divAdd">
						</div>
	                 

	                </div>
	                <!-- /.card-body -->
	                <div class="card-footer text-right">
	                  <button type="submit" class="btn btn-primary" id="btnSubmit">등록</button>
	                  <button type="button" class="btn btn-default" onclick="location.href='/cus/list'">취소</button>
	                </div>
	              </form>
	            </div>
			</div>
		</section>
	
	</div>
</div>
<script type="text/javascript">
	$(function() {
		
		
		
		//고객번호 삽입
		var oldVal = $("#cusNum").val();
		console.log("고객번호 >>>"+oldVal);
		var res= oldVal;
		
		$("#cusNum").on("change keyup paste",function(){
			 
			var currentVal = $(this).val();
		     
			 if(currentVal == oldVal) {
			        return;
		     }
			 oldVal = currentVal;
			 res = currentVal;
			 
			 $("input[name='carVo[0].cusNum']").val(currentVal);
// 			 $("#divAdd").find("input")[0].value
			 
		});
		
		

		
		
		
		
		
		var num = 0;
		//자동차 추가 클릭
		$("#adding").on("click",function(){
			
			var str ="<div style='float: left; clear: both; width: 100%;'>"
				+"<input type='text' name='carVo["+num+"].cusNum' id='cnum"+num+"' value='"+2+"' />"
				+"자동차 번호<input type='text' class='form-control2' name='carVo["+num+"].carNum' id='carNum' placeholder='자동차 번호를 입력하세요'>"
				+"제조사<input type='password' class='form-control2' name='carVo["+num+"].mk' id='mk' placeholder='제조사를 입력하세요'><br/>"
				+"연식<input type='text' class='form-control2' name='carVo["+num+"].py' id='py' placeholder='연식을 입력하세요'>"
				+"주행거리<input type='text' class='form-control2' name='carVo["+num+"].driDist' id='driDist' placeholder='주행거리를 입력하세요'>"
				+"</div>";
			$("#divAdd").append(str);	
			var a1 = $("#divAdd").find("input")[0].value;				
			num++;				
			if(num>5){
			alert('더이상 늘릴수 없습니다.');
			num=5;
			}
			
			
			console.log("결과");
			console.log("res>>"+a1);
		});
		
		//자동차 정보 삭제
		$("#deleting").on("click",function(){
			$("#divAdd > div:last").remove();
	
			num--;
			if(num<0){
			num =0;
			alert('삭제할 요소가 없습니다.');
			}
			console.log(num);
		});


			
	});
</script>