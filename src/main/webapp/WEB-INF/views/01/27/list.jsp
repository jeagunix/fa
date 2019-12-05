<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 다음 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
/*주소검색 api*/
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
};
</script>

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<script>
	$(function() {
		var a;
		$("#btn-create").click(function(){
			a = "create";
		});
		$("#btn-read").click(function(){
			a = "read";
		});
		$("#btn-update").click(function(){
			a = "update";
		});
		$("#btn-delete").click(function(){
			a = "delete";
		});
		
		$("#input-form").submit(function(event) {
	        event.preventDefault();
			var queryString = $("form[name=input-form]").serialize();
			if(a == "create") {
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/create",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.fail) {
				    		alert("다시 입력해주세요.");
				    	}
				    	if(result.success) {
				    		alert("거래처 등록이 완료되었습니다."); 
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		removeTable();
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    	}
				    },
				    error: function( err ){
				    	
				    }
				 })
			} else if(a == "read") {
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/read",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.success) {
				    		alert("거래처 조회가 완료되었습니다."); 
				    		removeTable();
				    		
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    	}
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else if(a == "update") {
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.success) {
				    		alert("거래처 수정이 완료되었습니다."); 
				    		removeTable();
				    		
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    	}
				    	if(result.fail) {
				    		alert("다시 입력해주세요.");
				    	}
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else if(a == "delete") {
				$.ajax({
				    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
				    type: "POST",
				    data: queryString,
				    dataType: "json",
				    success: function(result){
				    	if(result.success) {
				    		alert("거래처 삭제가 완료되었습니다."); 
				    		removeTable();
				    		$('#input-form').each(function(){
				    		    this.reset();
				    		});
				    		
				    		var customerList = result.customerList;
				    		createNewTable(customerList);
				    	}
				    },
				    error: function( err ){
				      	console.log(err)
				    }
				 })
			} else {
				alert("끝");
			}
		
	});

	function removeTable(){
		  // 원래 테이블 제거
		  $(".origin-tbody").remove();
		  // ajax로 추가했던 테이블 제거
		  $(".new-tbody").remove();
	}
	function createNewTable(customerList){
		  var $newTbody = $("<tbody class='new-tbody'>")
		  $("#simple-table-1").append($newTbody)
			
		  for(let customer in customerList){
			  $newTbody.append(
			   	"<tr>" +
		        "<td class='center'><label class='pos-rel'> <input name='RowCheck' type='checkbox' class='ace' /><span class='lbl'></span></label></td>" +
		        "<td>" + customerList[customer].no + "</td>" +
		        "<td>" + customerList[customer].name + "</td>" +
		        "<td>" + customerList[customer].ceo + "</td>" +
		        "<td>" + customerList[customer].address + " " + customerList[customer].detailAddress + "</td>" +
		        "<td>" + customerList[customer].conditions + "</td>" +
		        "<td>" + customerList[customer].item + "</td>" +
		        "<td>" + customerList[customer].jurisdictionOffice + "</td>" +	
		        "<td>" + customerList[customer].phone + "</td>" +
		        "<td>" + customerList[customer].managerName + "</td>" +
		        "<td>" + customerList[customer].managerEmail + "</td>" +
		        "<td>" + customerList[customer].bankCode + "</td>" +
		        "<td>" + customerList[customer].bankName + "</td>" +
		        "<td>" + customerList[customer].depositNo + "</td>" +
		        "<td>" + customerList[customer].depositHost + "</td>" +
		        "<td>" + customerList[customer].insertDay + "</td>" +
		        "<td>" + customerList[customer].insertUserid + "</td>" +
		        "<td>" + customerList[customer].updateDay + "</td>" +
		        "<td>" + customerList[customer].updateUserid + "</td>" +
		        "</tr>");
		  }
		  $newTbody.append("</tbody>");
		  $(".chosen-select").chosen();
	}
	
	$(document.body).delegate('#simple-table-1 tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=no]").val(td.eq(1).text());
		$("input[name=name]").val(td.eq(2).text());
		$("input[name=ceo]").val(td.eq(3).text());
		$("input[name=address]").val(td.eq(4).text());
		$("input[name=conditions]").val(td.eq(5).text());
		$("input[name=item]").val(td.eq(6).text());
		$("input[name=corporationNo]").val(td.eq(1).text());
		$("input[name=jurisdictionOffice]").val(td.eq(7).text());
		$("input[name=phone]").val(td.eq(8).text());
		$("input[name=managerEmail]").val(td.eq(10).text());
		$("input[name=bankName]").val(td.eq(12).text());
		$("input[name=bankCode]").val(td.eq(11).text());
		$("input[name=depositNo]").val(td.eq(13).text());
		$("input[name=managerName]").val(td.eq(9).text());
		$("input[name=depositHost]").val(td.eq(14).text());
		$("input[name=address]").prop("readonly", true);
		$("input[name='bankCode']").prop("readonly", true);
		$("input[name='bankName']").prop("readonly", true);
		$("input[name='depositHost']").prop("readonly", true);  
	});
	
	$(document.body).delegate('#selectAll', 'click', function() {
		if(this.checked) {
	        $(':checkbox').each(function() {
	            this.checked = true;                        
	        });
	    } else {
	        $(':checkbox').each(function() {
	            this.checked = false;                       
	        });
	    }
	});
	

	$(function() {
	      $("#dialog-message").dialog({
	         autoOpen : false
	      });

	      $("#a-bankaccountinfo-dialog").click(function() {
	         $("#dialog-message").dialog('open');
	         $("#dialog-message").dialog({
	            title: "계좌정보",
	            title_html: true,
	               resizable: false,
	             height: 500,
	             width: 400,
	             modal: true,
	             close: function() {
	                $('#tbody-bankacoountList tr').remove();
	             },
	             buttons: {
	             "닫기" : function() {
	                      $(this).dialog('close');
	                      $('#tbody-bankaccountList tr').remove();
	                 }
	             }
	         });
	      });
	  });
	
	
    $('#dialog-message-table').on('click', '#a-dialog-depositNo', function(event) {
       event.preventDefault();
       $("#tbody-bankaccountList").find("tr").remove();
       
       var depositNo = $("#input-dialog-depositNo").val();
       
       // ajax 통신
       $.ajax({
          url: "${pageContext.request.contextPath }/01/25/gets?depositNo=" + depositNo,
          contentType : "application/json; charset=utf-8",
          type: "get",
          dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
          data : "",
          statusCode: {
              404: function() {
                alert("page not found");
              }
          },
          success: function(data){
        	  if(data.success) {
        	  	$("#input-dialog-depositNo").val('');
        	  	var baccountList = data.bankAccountList;
        	  	console.log(data.bankAccountList);
        	  	for(let a in baccountList) {
        	  		$("#tbody-bankaccountList").append("<tr>" +
                          "<td class='center'>" + baccountList[a].depositNo + "</td>" +
                          "<td class='center'>" + baccountList[a].depositHost + "</td>" +
                          "<td class='center'>" + baccountList[a].bankCode + "</td>" +
                          "<td class='center'>" + baccountList[a].bankName + "</td>" +
                          "</tr>");

        	  	}
        	  }
          },
          error: function(xhr, error){
             console.error("error : " + error);
          }
       });
    });
    
    // 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
    $(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
       var tr = $(this);
       var td = tr.children();
       $("input[name=depositNo]").val(td.eq(0).text());
       $("input[name=depositHost]").val(td.eq(1).text());
       $("input[name=bankCode]").val(td.eq(2).text());
       $("input[name=bankName]").val(td.eq(3).text());
       $("#dialog-message").dialog('close');
    });
	
	$(".chosen-select").chosen();
});
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
					<h1 class="pull-left">거래처관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
						<i class="icon-plus-sign bigger-120 green"></i>
							팀 추가
					</a>
				</div>
				
				<!-- /.page-header -->
				<div class="row-fluid">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="input-form" name="input-form" method="post">
						<div class="row-fluid" style="float: left">
							<div class="span6">
								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										사업자 등록번호:&nbsp;
									</label>
									
									<input type="text" id="no" name="no" placeholder="사업자등록번호" class="col-xs-10 col-sm-5" />
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										상호명:&nbsp;
									</label>
									<input type="text" id="name" name="name" placeholder="상호명" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										대표자:&nbsp;
									</label>
									<input type="text" id="ceo" name="ceo" placeholder="대표자" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										주소:&nbsp;
									</label>
									<div class="input-append">
										<span class="btn btn-small btn-info">
											<a href="#" onclick="execDaumPostcode()">
												<i class="icon-search nav-search-icon"></i>
												<input type="text" id="address" name="address" placeholder="주소" class="col-xs-10 col-sm-5" readonly />
											</a>
										</span>
									</div>
									&nbsp; &nbsp; &nbsp; &nbsp; 상세주소:
									<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="col-xs-10 col-sm-5"/>
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										업태:&nbsp;
									</label>
									<input type="text" id="conditions" name="conditions" placeholder="업태" class="col-xs-10 col-sm-5" />
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										종목:&nbsp;
									</label>
									<input type="text" id="item" name="item" placeholder="종목" class="col-xs-10 col-sm-5" />
								</div>

								<br/>
								
								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										법인번호:&nbsp;
									</label>
									<input type="text" id="corporationNo" name="corporationNo" placeholder="법인번호" class="col-xs-10 col-sm-5" />
								</div>
								
								<div class="form-group">
									<label class="control-label" for="form-field-1">
										종류:&nbsp;&nbsp;
									</label> 
								
									<input name="assetsFlag" id="assetsFlag" type="radio" class="ace" value="a" checked /> 
									<span class="lbl">토지</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" class="ace" value="b" />
									<span class="lbl">건물</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" class="ace" value="c" />
									<span class="lbl">자산</span> 
									&nbsp;
									<input name="assetsFlag" id="assetsFlag" type="radio" class="ace" value="d" />
									<span class="lbl">무형자산</span>

								</div>
								
							</div><!-- /span6 -->

							<div class="span6">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										관할 영업소:&nbsp;
									</label>
									<input type="text" id="jurisdictionOffice" name="jurisdictionOffice" placeholder="관할 영업소" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										거래처 전화번호:&nbsp;
									</label>
									<input type="text" id="phone" name="phone" placeholder="거래처 전화번호" class="col-xs-10 col-sm-5" />
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										E-mail:&nbsp;
									</label>
									<input type="text" id="managerEmail" name="managerEmail" placeholder="E-mail" class="col-xs-10 col-sm-5" />
								</div>

								<br/>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										계좌번호:&nbsp;
									</label>
									<div class="input-append">
										<span class="btn btn-small btn-info"> <a href="#"
											id="a-bankaccountinfo-dialog"> <i
												class="icon-search nav-search-icon"></i> <input type="text"
												class="search-input-width-first" name="depositNo" />
										</a>
										</span>
									</div>
									&nbsp; &nbsp; &nbsp; &nbsp; 은행코드:
									<input type="text" id="bankCode" name="bankCode" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>

								<br/>

								<div class="form-group" style="float: left">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
									은행명:&nbsp;
									</label>
									<input type="text" id="bankName" name="bankName" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										예금주:&nbsp;
									</label>
									<input type="text" id="depositHost" name="depositHost" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
								</div>

			
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
								<div id="dialog-message" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>계좌번호</label> <input type="text"
												id="input-dialog-depositNo" style="width: 100px;" /> <a
												href="#" id="a-dialog-depositNo"> <span
													class="btn btn-small btn-info" style="margin-bottom: 10px;">
														<i class="icon-search nav-search-icon"></i>
												</span>
											</a></td>
										</tr>
									</table>
									<!-- 은행코드 및 은행명 데이터 리스트 -->
									<table id="modal-deposit-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">계좌번호</th>
												<th class="center">예금주</th>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
											</tr>
										</thead>
										<tbody id="tbody-bankaccountList">
											
										</tbody>
									</table>
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->

								<br/>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
										거래처 담당자 성명:&nbsp;
									</label>
									<input type="text" id="managerName" name="managerName" placeholder="거래처 담당자" class="col-xs-10 col-sm-5" />
								</div>

								<br/>
							</div><!-- ./span6 -->
						</div>
							<!-- span -->
						<div class="hr hr-18 dotted"></div>
						<div class="row-fluid">
							<div class="span8">
							<button class="btn btn-info btn-small" id="btn-read">조회</button>
							<button class="btn btn-danger btn-small" id="btn-delete">삭제</button>
							<button class="btn btn-warning btn-small" id="btn-update">수정</button>
							<button class="btn btn-primary btn-small" id="btn-create">입력</button>
							<button class="btn btn-default btn-small" id="btn-reset" type = "reset">취소</button>
						</div>	<!-- /.span -->
						
						</div>
						<div class="hr hr-18 dotted"></div>
						<br/>
					
						</form>



						<div class="row-fluid">
							<div class="span12">
								<div style="width: 100%; overflow-x: auto">
									<table id="simple-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label>
														<input type="checkbox" class="ace" id="selectAll" />
														<span class="lbl">
														</span>
													</label>
												</th>
												<th>사업자등록번호</th>
												<th>상호</th>
												<th>대표자</th>
												<th>주소</th>
												<th>업태</th>
												<th>종목</th>
												<th>관할영업소</th>
												<th>거래처 전화번호</th>
												<th>거래처 담당자 성명</th>
												<th>e-mail</th>
												<th>은행코드</th>
												<th>은행명</th>
												<th>계좌번호</th>
												<th>예금주</th>
												<th>입력일자</th>
												<th>입력담당자</th>
												<th>수정일자</th>
												<th>수정담당자</th>
											</tr>
										</thead>
										
										<tbody class = "origin-tbody">
											<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
												<tr>
													<td class="center">
														<label>
															<input type="checkbox" class="ace" />
															<span class="lbl">
															</span>
														</label>
													</td>
													<td>${vo.no }</td>
													<td>${vo.name }</td>
													<td>${vo.ceo }</td>
													<td>${vo.address } ${vo.detailAddress }</td>
													<td>${vo.conditions }</td>
													<td>${vo.item }</td>
													<td>${vo.jurisdictionOffice }</td>
													<td>${vo.phone }</td>
													<td>${vo.managerName }</td>
													<td>${vo.managerEmail }</td>
													<td>${vo.bankCode }</td>
													<td>${vo.bankName }</td><!-- 은행명 -->
													<td>${vo.depositNo }</td>
													<td>${vo.depositHost }</td><!-- 예금주 -->
													<td>${vo.insertDay }</td>
													<td>${vo.insertUserid }</td>
													<td>${vo.updateDay }</td>
													<td>${vo.updateUserid }</td>
												</tr>
											</c:forEach>
										</tbody>
	
									</table>
								</div>
								<!-- /span -->
							</div>
						</div>
					</div>


				<!-- /row -->
				<!-- PAGE CONTENT ENDS -->
				<!-- PAGE CONTENT ENDS -->
				</div>
			<!-- /.col -->
			</div>
			<!-- /.row -->
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
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
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a
									href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i
										class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i
										class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
		</div>
	<!-- /.page-content -->
	
	<!-- basic scripts -->
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</body>
</html>