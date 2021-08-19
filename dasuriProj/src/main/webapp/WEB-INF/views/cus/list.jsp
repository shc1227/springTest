<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.form-control2 {
  width: 100%;
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
	            <h1 class="m-0">다수리 고객 목록</h1>
	          </div><!-- /.col -->
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">Dashboard v1</li>
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
                <h3 class="card-title">고객 목록을 출력합니다.</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
						<div id="example2_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12 col-md-6"></div>
								<div class="col-sm-12 col-md-6"></div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="row" style="float: right;">
									<form method="get" action="/cus/list" name="frmSearch" id="frmSearch">
										<input type="hidden" name="currentPage" value="1"/>
										<select id="selSearch" name="selSearch" class="form-control2" style="width:100px;">
											<option value="">전체</option>
											<option value="">-----</option>
											<option value="cusNm" 
												<c:if test="${param.selSearch=='cusNm'}">selected="selected"</c:if>
											>고객명</option>
											<option value="addr"
												<c:if test="${param.selSearch=='addr'}">selected="selected"</c:if>
											>주소</option>
											<option value="pne"
												<c:if test="${param.selSearch=='pne'}">selected="selected"</c:if>
											>연락처</option>
										</select>&nbsp;
										<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요." value="${param.keyword }" class="form-control2"/ style="width:200px;">
										&nbsp;
										<button type="submit" class="btn btn-primary">검색</button>
									</form>
									
									</div>
									<br/><br/>
									<table id="example2" class="table table-bordered table-hover dataTable dtr-inline" role="grid" aria-describedby="example2_info">
										<thead>
											<tr role="row">
												<th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">고객
													번호
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
													이름
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
													우편번호
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
													주소
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
													상세주소
												</th>
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
													연락처
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cus" items="${cusList}" varStatus="status">
												<tr class="even" style="cursor: pointer;"
												<c:if test="${sessionScope.adminYn == 'Y'}">onclick="javascript:location.href='/cus/detail?cusNum=${cus.cusNum}'"</c:if>
												>
													<td class="dtr-control sorting_1" tabindex="0">
														${cus.cusNum}
													</td>
													<td>
													${cus.cusNm}
<%-- 														<a href="/cus/detail?cusNum=${cus.cusNum}"></a> --%>
													</td>
													<td>
														${cus.zipcode} 
													</td>
													<td>
														${cus.addr1}  
													</td>
													<td>
														${cus.addr2} 
													</td>
													<td>
														${cus.pne}
													</td>
												</tr>
											</c:forEach>
											<c:if test="${cusList==null || cusList==''}">
												<tr>
													<td colspan="4">목록이 비어있습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
										Showing ${entriesMap.startNum} to ${entriesMap.endNum} of ${entriesMap.totalNum} entries
									</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous <c:if test="${paging.startPage==1}">disabled</c:if>" id="example2_previous">
												<a href="/cus/list?currentPage=${paging.startPage - 5}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">
													<i class="fas fa-angle-left"></i>
												</a>
											</li>
											<!-- (param.currentPage==null && pNo==1) ==> parma.currentPage==null일때 1페이지 활성화 -->
											<c:forEach var="pNo" begin="${paging.startPage}" end="${paging.endPage}" varStatus="stat">
												<li class="paginate_button page-item <c:if test="${param.currentPage==pNo || ((param.currentPage==null || param.currentPage=='') && pNo==1)}">active</c:if>">
													<a href="/cus/list?currentPage=${pNo}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="${pNo}" tabindex="0" class="page-link">
														${pNo}
													</a>
												</li>
											</c:forEach>
											<li class="paginate_button page-item next <c:if test="${paging.endPage==paging.totalPages}">disabled</c:if>" id="example2_next">
												<a href="/cus/list?currentPage=${paging.startPage + 5}&selSearch=${param.selSearch}&keyword=${param.keyword}" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">
													<i class="fas fa-angle-right"></i>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
              <!-- /.card-body -->
              <div class="card-footer text-right">
	          	<button type="button" class="btn btn-primary" onclick="location.href='/cus/insert'">고객 등록</button>
              </div>
            </div>
			</div>
		</section>
	
	</div>
	
</div>