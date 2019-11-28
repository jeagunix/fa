<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<style>
.chosen-search {
	display: none;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />



	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>


<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		$(".chosen-select").chosen();
	})
</script>

	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			today: "Today",
			clear: "Clear",
			format: "yyyy-mm-dd",
			titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart: 0
			};
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode: 4,
				minViewMode: 1,
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		})
	</script>
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">거래처 현황조회 [28]</h1>
				
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<div class="row-fluid">
					<form class="form-horizontal">
					거래처 구분 : &nbsp;<select class="chosen-select" id="form-field-select-1" name="customer_kind" data-placeholder="거래처 종류" style="width:70px">
							<option value="All">전체</option>
							<option value="Purchase">매입</option>
							<option value="Sale">매출</option>
							<option value="Assets">자산</option>

						</select>
						&nbsp; &nbsp;&nbsp;&nbsp;조회 기간 :&nbsp;
						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker"  style="width:100px"/> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" class="cl-date-picker"  style="width:100px"/> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp;&nbsp; &nbsp;사업자등록번호 :&nbsp; 
						
						<input type="text" id="form-field-1" placeholder="사업자등록번호" size=4 style="width:150px"/>
						
						&nbsp; &nbsp;&nbsp; &nbsp;삭제여부 : &nbsp;
						<select class="chosen-select" id="form-field-select-1" name="delete_flag" data-placeholder="삭제여부" style="width:50px">
							<option value="false">N</option>
							<option value="true">Y</option>
						</select>
						<button class="btn btn-small btn-info">조회</button>



					</form>
					<div class="hr hr-18 dotted"></div>
				</div><!-- /.row-fluid -->
				<div class="row-fluid">
						<div class="span12">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">
											<label class="pos-rel">
											<input type="checkbox" class="ace" />
											<span class="lbl"></span>
											</label>
										</th>
										<th>사업자등록번호</th>
										<th>상호</th>
										<th>대표자</th>
										<th>주소</th>
										<th>업태/종목</th>
										<th>관할영업소</th>
										<th>거래처 전화번호</th>
										<th>거래처 담당자 성명</th>
										<th>e-mail</th>
										<th>은행명</th>
										<th>계좌번호</th>
										<th>예금주</th>
										<th>입력일자</th>
										<th>수정일자</th>
										<th>입력담당자</th>
										<th>수정담당자</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td class="center">
												<label class="pos-rel">
													<input type="checkbox" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td>120-86-81451</td>
											<td>아이티센</td>
											<td>박진국</td>
											<td>서울특별시 서초구 반포대로 13</td>
											<td>컴퓨터시스템 통합 자문 및 구축 서비스업</td>
											<td>본사</td>
											<td>02-3497-8300</td>
											<td>이종윤</td>
											<td>leejy3653@naver.com</td>
											<td>국민은행</td>
											<td>367802-01-110999</td>
											<td>이종윤</td>
											<td>2019-11-27</td>
											<td>-</td>
											<td>yoon3653</td>
											<td>-</td>
										</tr>
								</tbody>
							</table>
						</div><!-- /span -->
					</div>
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>