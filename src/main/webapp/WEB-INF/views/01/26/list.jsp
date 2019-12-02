<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<script	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<script>
	$(function() {
		$(".chosen-select").chosen();
		
		$.fn.datepicker.dates['ko'] = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			today : "Today",
			clear : "Clear",
			format : "yyyy-mm-dd",
			titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart : 0
		};

		$('#cl-ym-date-picker').datepicker({
			maxViewMode : 4,
			minViewMode : 1,
			language : 'ko'
		}).next().on(ace.click_event, function() {
			$(this).prev().focus();
		});

		$('.cl-date-picker').datepicker({
			language : 'ko'
		}).next().on(ace.click_event, function() {
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
					<h1 class="pull-left">계좌 현황조회</h1>
				</div>


				<div class="row-fluid">
					<form class="form-horizontal">
						입력 기간
						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" /> <span
								class="add-on"> <i class="icon-calendar"></i>
							</span>
						</div>

						계좌시작번호 : 
						<input type="text" id="form-field-1" placeholder="계좌번호" />							
						삭제여부 : <select class="chosen-select"
							id="form-field-select-1" name="parentNo"
							data-placeholder="상위메뉴 선택">
							<option value="false">N</option>
							<option value="true">Y</option>

						</select>
						<button class="btn btn-small btn-info">조회</button>


					</form>
					<div class="hr hr-18 dotted"></div>
				</div>



				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>계좌번호</th>
									<th>은행번호</th>
									<th>예금주</th>
									<th>개설일자</th>
									<th>만기일자</th>
									<th>예금한도(만원)</th>
									<th>이율(%)</th>
									<th>개설지점</th>
									<th>은행</th>
									<th>담당자</th>
									<th>은행전화번호</th>
									<th>입력일자</th>
									<th>입력담당자</th>
									<th>수정일자</th>
									<th>수정담당자</th>
								</tr>
							</thead>

							<tbody>
								<tr>

									<td>201911150001</td>
									<td>1234567</td>
									<td>이고니</td>
									<td>2018-01-12</td>
									<td>2023-01-11</td>
									<td>5,000</td>
									<td>0.09</td>
									<td>가로수길</td>
									<td>국민</td>
									<td>김길동</td>
									<td>02)442-2213</td>
									<td>20119-11-12</td>
									<td>신동주</td>
									<td>-</td>
									<td>-</td>


								</tr>
								<tr>

									<td>201911150001</td>
									<td>1234567</td>
									<td>곽철용</td>
									<td>20189-05-11</td>
									<td>2024-05-10</td>
									<td>10,000</td>
									<td>0.05</td>
									<td>강남(서)</td>
									<td>우리</td>
									<td>잔나비</td>
									<td>02)4512-5532</td>
									<td>20119-11-12</td>
									<td>신동주</td>
									<td>-</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

				<div class="pagination no-margin">
				<ul>
					<li class="prev disabled"><a href="#"> <i
							class="icon-double-angle-left"></i>
					</a></li>

					<li class="active"><a href="#">1</a></li>

					<li><a href="#">2</a></li>

					<li><a href="#">3</a></li>

					<li class="next"><a href="#"> <i
							class="icon-double-angle-right"></i>
					</a></li>
				</ul>
			</div>
			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>