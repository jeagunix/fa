<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
		.controles-right{
			display: grid;
			grid-template-columns: 100px 100px 100px;
		}
       html,body{
			height:100%;
			overflow-x: hidden;
			}
      	
      	.main-container{
         	height:calc(100% - 45px);
         	overflow-x: hidden;
      	}
      
      	.main-content{
         	overflow:auto;
      	}
      	
      	.page-content{
         	min-width:1280px;
      	}

		@media screen and (max-width: 920px) {
       .main-container{
          height:calc(100% - 84px);
       }
    }

</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">차량현황조회</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
						<div class="span6"><!-- 차변 -->
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">차량 코드</label>
									<div class="controls">
										<input type="text" id="id" name="id" placeholder="10자로 입력하세요" value='${vehicleVo.id}'/>
									</div>
								</div>
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">거래처 명</label>
									<div class="controls">
										<input type="text" id="customerName" name="customerName" placeholder="거래처명을 입력하세요" value='${vehicleVo.customerName}'/>
									</div>
								</div>
							
							
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">주소</label>
										<div class="controls">
											<input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
											<input class="span4" readonly type="text" id="wideAddress" name="wideAddress" placeholder="주소를 선택하면 입력됩니다." value='${vehicleVo.wideAddress}'>
											<input class="span5" readonly type="text" id="cityAddress" name="cityAddress" placeholder="주소를 선택하면 입력됩니다." value='${vehicleVo.cityAddress}'>
										</div>
								</div>
			
								<div class="control-group">
										<label style="text-align:left;" class="control-label" for="id-date-range-picker-1">매입일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											<input readonly class="id-date-range-picker-1" type="text" name="payDate" value="${vehicleVo.payDate }">
											
										</div>
									</div>
						
 	
					</div><!-- 차변 span -->
							
					<!-- 	<div class="span3">대변
					
					
						</div>대변 span -->
						
						<div class="span6"><!-- 차변 -->
						
								<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-select-1">차량 분류</label>
										<div class="controls">
											<select class="chosen-select" id="sectionNo" name="sectionNo" data-placeholder="전체">
												<c:forEach items="${sectionList }" var="sectionVo">
													<option></option>
													<option value="${sectionVo.code }">${sectionVo.classification }</option>
												</c:forEach>
											</select>
										</div>
									</div>
								
								
								<div class="control-group">
									<label style="text-align:left;" class="control-label" for="form-field-1">거래처 담당자</label>
									<div class="controls">
										<input type="text" id="managerName" name="managerName" placeholder="이름을 입력하세요" value='${vehicleVo.managerName}'/>
									</div>
								</div>
							
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="form-field-1">직급</label>
										<div class="controls">
											<select class="chosen-select" id="staffName" name="staffName" data-placeholder="전체">
												<option></option>
												<c:forEach items="${jikNameList}" var="StaffVo">
													<option value="${StaffVo.staffName }">${StaffVo.staffName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
							
								
									<div class="control-group">
										<label style="text-align:left;" class="control-label" for="id-date-range-picker-1">납부일자</label>
										<div class="controls">
											<div class="input-append">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											<input readonly class="id-date-range-picker-2" type="text" name="dueDate" value="${vehicleVo.dueDate }" >
							
										</div>
									</div>
								
								
								
				<%-- 			<div class="control-group">
                              <div class="controls controles-right"><!-- 여기서 css주면 됨 -->
                                    <label style=" display:inline;">
                                    	<c:choose>
                                 			<c:when test='${vehicleVo.flag eq ""}'>
                                       			<input name="flag" id="delete" value="" type="checkbox" checked="checked"class="ace">
                                         	 	<span class="lbl" style="width:72px; margin-right:190px">삭제포함</span>
                                          	</c:when>
                                          	<c:otherwise>
												<input name="flag" id="delete" value=""  type="checkbox" class="ace">
												<span class="lbl" style="width:72px; margin-right:190px">삭제포함</span>
											</c:otherwise>
										</c:choose>
                                    </label>
                                    <button class="btn btn-info btn-small" id="detailSearch" style="width:80px; display:inline; margin-right:150px">상세조회</button>
                                    <button class="btn btn-info btn-small" id="clear" style="width:80px; display:inline; margin-right:30px">초기화</button>
                                 </div>
                           </div> --%>
                           
                   			<div class="control-group" style="margin-bottom:0px;">
										<div class="span7" style="float: right; width: 230px">
											<c:choose>
												<c:when test='${vehicleVo.flag eq ""}'>
													<input name="flag" id="delete" value="" type="checkbox" checked="checked"class="ace">
												</c:when>
												<c:otherwise>
													<input name="flag" id="delete" value=""  type="checkbox" class="ace">
												</c:otherwise>
											</c:choose>
											<span class="lbl" style="margin-right: 15px; ">삭제포함</span>
											
											<button class="btn btn-info btn-small" id="detailSearch">조회</button>
												
											<button class="btn btn-default btn-small" id="clear"
													style="float: right;"  >초기화</button>
										</div>
									</div>
                           
                           
						</div>
					</form>
					</div>
						<div class="hr hr-18 dotted"></div>
						<!-- 차변 대변 나누기 위한 row-fluid -->
					
						<div class="row-fluid">
						<p>총 ${dataResult.pagination.totalCnt } 건</p>
								<div style="overflow-x: auto;">
									<table id="sample-table-1" class="table table-striped table-bordered table-hover" style="width: 2200px">
										<thead>
											<tr>
												<th>NO</th>
												<th>차량코드</th>
												<th>차량대분류</th>
												<th>차량배기량</th>
												<th>직급</th>
												<th>사용자</th>
												<th>주소(광역)</th>
												<th>주소(시/군/구)</th>
												<th>주소(상세)</th>
												<th>매입거래처코드</th>
												<th>매입거래처명</th>
												<th>매입거래처담당자</th>
												<th>매입일자</th>
												<th>출시가(원)</th>
												<th>취득세(원)</th>
												<th>부대비용(원)</th>
												<th>보증금(원)</th>
												<th hidden="hidden">보증금,월사용료 실제 납부일자</th>
												<th>보증금 예정일자</th>
												<th>월 사용료(원)</th>
												<th>월 사용료 납부일</th>
												<th>과세/영세</th>
												<th hidden="hidden">사용개월</th>
												<th hidden="hidden">월 사용료 납부금액</th>
												<th>세금계산서 번호</th>
												<th>삭제여부</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${dataResult.datas }" var="VehicleVo" varStatus="status">
												<tr>
													<td>${(page-1)*11 + status.count}</td>  <!-- 0 -->
													<td class="vehicle-id">${VehicleVo.id}</td>  <!-- 1 -->
													<td>${VehicleVo.sectionNo}</td>  <!-- 2 -->
													<td>${VehicleVo.classification}</td>  <!-- 3 -->
													<td>${VehicleVo.staffName}</td>  <!-- 4 -->
													<td>${VehicleVo.ownerName}</td>  <!-- 5 -->
													<td>${VehicleVo.wideAddress}</td>  <!-- 6 -->
													<td>${VehicleVo.cityAddress}</td>  <!-- 7 -->
													<td>${VehicleVo.detailAddress}</td>  <!-- 8 -->
													<td>${VehicleVo.customerNo}</td> <!-- 9 -->
													<td>${VehicleVo.customerName}</td> <!-- 10 -->
													<td>${VehicleVo.managerName}</td> <!-- 11 -->
													<td class="pay-date">${VehicleVo.payDate}</td> <!-- 12 -->
													<td style="text-align : right"><fmt:formatNumber value="${VehicleVo.publicValue}" pattern="#,###"></fmt:formatNumber></td> <!-- 13 -->
													<td style="text-align : right"><fmt:formatNumber value="${VehicleVo.acqTax}" pattern="#,###"></fmt:formatNumber></td> <!-- 14 -->
													<td style="text-align : right"><fmt:formatNumber value="${VehicleVo.etcCost}" pattern="#,###"></fmt:formatNumber></td> <!-- 15 -->
													<td style="text-align : right"><fmt:formatNumber value="${VehicleVo.deposit}" pattern="#,###"></fmt:formatNumber></td> <!-- 16 -->
													<td>${VehicleVo.dueDate}</td> <!-- 17 -->
													<td style="text-align : right" class="monthly-fee"><fmt:formatNumber value="${VehicleVo.monthlyFee}" pattern="#,###"></fmt:formatNumber></td> <!-- 18 -->
													<td>${VehicleVo.feeDate}</td> <!-- 19 -->
													<td>${VehicleVo.taxKind}</td> <!-- 20 -->
													<td hidden class="using-month"></td> <!-- 21 -->
													<td hidden class="month-cost"></td> <!-- 22 -->
													<td hidden>${VehicleVo.depositDate}</td> <!-- 보증금, 월사용료 실제 납부날짜 --> <!-- 23 -->
													<td class= "taxbillNo">${VehicleVo.taxbillNo}</td> <!-- 24 -->
													<c:choose>
														<c:when test="${VehicleVo.flag eq 's'}"><td>작성됨</td></c:when>
														<c:when test="${VehicleVo.flag eq 'o'}"><td>수정됨</td></c:when>
														<c:when test="${VehicleVo.flag eq 'd'}"><td>삭제됨</td></c:when>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
								<!-- PAGE CONTENT ENDS -->
							
									<div class="pagination">
										<ul>
											<c:choose>
												<c:when test="${dataResult.pagination.prev }">
													<li><a
														href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${dataResult.pagination.startPage - 1 }">
															<i class="icon-double-angle-left"></i>
													</a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="#"><i
															class="icon-double-angle-left"></i></a></li>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="${dataResult.pagination.startPage }"
												end="${dataResult.pagination.endPage }" var="pg">
												<c:choose>
													<c:when test="${pg eq dataResult.pagination.page }">
														<li class="active"><a
															href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${pg }">${pg }</a></li>
													</c:when>
													<c:otherwise>
														<li><a
															href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${pg}">${pg }</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
		
											<c:choose>
												<c:when test="${dataResult.pagination.next }">
													<li><a
														href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri }&page=${dataResult.pagination.endPage + 1 }">
															<i class="icon-double-angle-right"></i>
													</a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="#"> <i
															class="icon-double-angle-right"></i></a></li>
												</c:otherwise>
											</c:choose>
										</ul>
								
							<!-- 페이징 -->
						</div>					
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script>
$(function() {
   $(".chosen-select").chosen();
   $('.id-date-range-picker-1').daterangepicker({
      format : 'YYYY-MM-DD'
   }).prev().on(ace.click_event, function(){
      $(this).next().focus();
   });
});

$(function() {
   $(".chosen-select").chosen();
   $('.id-date-range-picker-2').daterangepicker({
      format : 'YYYY-MM-DD'
   }).prev().on(ace.click_event, function(){
      $(this).next().focus();
   });
   
   
	// 조회 버튼
/* 	$("#detailSearch").click(function() {
		     event.preventDefault();
		     
		     var sectionNo = "${param.sectionNo }";
		     var staffName = "${param.staffName }";
		     
		     $('#sectionNo').val(sectionNo).trigger('chosen:updated'); 
		     $('#staffName').val(staffName).trigger('chosen:updated'); 
		   }); */
	// 초기화 버튼
	$("#clear").click(function() {
		  
		     $('input[type=text]').val("");
		      $('#sectionNo').val("").trigger('chosen:updated');
		      $('#staffName').val("").trigger('chosen:updated');
		   });
	});


//주소
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullRoadAddr = data.roadAddress;
			console.log(data)
			$("#wideAddress").val(data.sido);
			$("#cityAddress").val(data.sigungu); 
			$("#detailAddress").val(data.roadname + " ");
			$("#detailAddress").focus(); 
		}
	}).open();
};

//엔터키 막기
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        $(this).next('.inputs').focus();
        event.preventDefault();
    }
}, true);

//select box 값 유지
 var sectionNo = "${param.sectionNo }";
var staffName = "${param.staffName }";

if(sectionNo != ''){
	$('#sectionNo').val(sectionNo).trigger('chosen:updated'); 
}

if(staffName != ''){
	$('#staffName').val(staffName).trigger('chosen:updated'); 
} 


</script>
</body>
</html>