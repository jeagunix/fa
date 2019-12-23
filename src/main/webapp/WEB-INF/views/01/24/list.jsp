<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<c:import url="/WEB-INF/views/common/head.jsp" />

</head>

<body class="skin-3">



	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">




				<div class="page-header position-relative">
					<h1 class="pull-left">카드 현황조회</h1>
				</div>


				<div class="row-fluid">
					<form class="form-horizontal" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list" method="post">
						입력 기간

						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" name="inputperiodStart" value="${param.inputperiodStart }" readonly/> <span
								class="add-on" > <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" class="cl-date-picker" name="inputperiodEnd" value="${param.inputperiodEnd }" readonly/> <span
								class="add-on" > <i class="icon-calendar"></i>
							</span>
						</div>


						카드시작번호 : <input type="text" id="form-field-1" placeholder="시작번호" name = "cardStartNo" value="${param.cardStartNo }" /> 
						카드종료번호 : <input type="text" id="form-field-1" placeholder="종료번호" name = "cardEndNo" value="${param.cardEndNo }"  /> 
						
						삭제여부 : 
						<select class="chosen-select" id="form-field-select-1" name="deleteFlag" data-placeholder="상위메뉴 선택">
							<option value="">  </option>
							<c:choose>
								<c:when test="${param.deleteFlag eq 'Y' }">
									<option value="N">N</option>					
									<option value="Y" selected>Y</option>
								</c:when>
								<c:otherwise>
									<option value="N" selected>N</option>					
									<option value="Y">Y</option>
								</c:otherwise>
							</c:choose>
						</select>

						<button type="submit" class="btn btn-small btn-info" >조회</button>

					</form>
					<div class="hr hr-18 dotted"></div>
					<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 카드 ${dataResult.pagination.totalCnt } 건</p>
				</div>



				<div class="row-fluid">
					<div class="span12">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>카드번호</th>
									<th>유효기간</th>
									<th>CVC</th>
									<th>사용자</th>
									<th>카드발급자</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>비밀번호</th>
									<th>은행코드</th>
									<th>은행명</th>
									<th>카드사</th>
									<th>카드한도(만원)</th>
									<th>교통카드 유무</th>
									<th>해외사용 여부</th>
									<th>입력일자</th>
									<th>입력담당자</th>
									<th>수정일자</th>
									<th>수정담당자</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
									<tr>
										<td>${vo.cardNo }</td>
										<td>${vo.validity }</td>
										<td>${vo.cvc}</td>
										<td>${vo.user}</td>
										<td>${vo.issuer}</td>
										<td>${vo.depositNo }</td>
										<td>${vo.depositHost}</td>
										<td>${vo.password }</td>
										<td>${vo.bankCode }</td>
										<td>${vo.bankName }</td>
										<td>${vo.company }</td>
										<td>${vo.limitation }</td>
										<td>${vo.transportation }</td>
										<td>${vo.abroad }</td>
										<td>${vo.insertDay }</td>
										<td>${vo.insertUserId }</td>
										<td>${vo.updateDay }</td>
										<td>${vo.updateUserId }</td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

				<div class="pagination" id = "pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }
									&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
									&deleteFlag=${param.deleteFlag}">
										<i class="icon-double-angle-left"></i>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a><i
										class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${dataResult.pagination.startPage }"
							end="${dataResult.pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq dataResult.pagination.page }">
									<li class="active"><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }
										&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
									&deleteFlag=${param.deleteFlag}">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}
										&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
									&deleteFlag=${param.deleteFlag}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }
									&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
									&deleteFlag=${param.deleteFlag}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a><i
										class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
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
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>



<script>
	$(function() {
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
		
		
		$(".chosen-select").chosen();

		
	})
</script>


</html>