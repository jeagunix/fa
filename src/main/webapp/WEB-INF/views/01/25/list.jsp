<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>

<script src="/fa/ace/assets/js/bootstrap.min.js"></script>
<link href="/fa/ace/assets/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>

<script type="text/javascript">
	jQuery(function($) {

		$("#datepicker").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});

		$("#datepicker2").datepicker({
			showOtherMonths : true,
			selectOtherMonths : false,
		});
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
					<h1 class="pull-left">계좌 관리</h1>
					<a class="btn btn-link pull-right"
						href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i
						class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
				</div>
				<!-- /.page-header -->

				<!-- PAGE CONTENT BEGINS -->
				<!-- PAGE CONTENT BEGINS -->

				<div class="row-fluid">
					<div class="span6">
						<div class="tabbable">
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="form-field-1">계좌 번호</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="계좌 번호" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">예 금 주</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="예금주 (이름)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">개설 일자</label>

									<div class="controls">
										<div class="input-append">
											<input type="text" id="datepicker" class="input-small" /> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
										&nbsp; &nbsp; 만기일자 &nbsp;
										<div class="input-append">
											<input type="text" id="datepicker2" class="input-small" /> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>

								<!-- 
								<div class="control-group">
									<label class="control-label" for="form-field-1">만기 일자</label>
									<div class="controls">
										<div class="input-append">
											<input type="text" id="datepicker2" class="input-small" /> <span
												class="add-on"> <i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								 -->

								<div class="control-group">
									<label class="control-label" for="form-field-1">예금 한도</label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="예금한도(만원)" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="form-field-1">이 율 </label>

									<div class="controls">
										<input type="text" id="form-field-1" placeholder="이율(%)" />
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /span -->

					<!-- 4조에서 데이터 가져오는 부분 -->
					<div class="span6">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행 코드 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">개설 지점 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행담당자 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="form-field-1">은행전화번호 </label>
								<div class="controls">
									<input type="text" id="form-field-1" placeholder="Username" />
								</div>
							</div>
						</form>
					</div><!-- /.span -->
				</div><!-- /row -->
			</div><!-- /.row-fluid -->


			<!-- buttons -->
			<div class="row-fluid">
				<div class="span12">
					<div class="form-actions">
						<button class="btn btn-info" type="button">
							<i class="icon-ok bigger-110"></i> 입 력
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="reset">
							<i class="icon-undo bigger-110"></i> 조 회
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="reset">
							<i class="icon-undo bigger-110"></i> 수 정
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn" type="reset">
							<i class="icon-undo bigger-110"></i> 삭 제
						</button>
					</div>
					<div class="hr"></div>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->


			<!-- Tables -->
			<div class="row-fluid">
			<div class="span12">
				<table id="sample-table-1"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center"><label> <input type="checkbox"
									class="ace" /> <span class="lbl"></span>
							</label></th>
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
							<td class="center"><label> <input type="checkbox"
									class="ace" /> <span class="lbl"></span>
							</label></td>

							
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
							<td class="center"><label> <input type="checkbox"
									class="ace" /> <span class="lbl"></span>
							</label></td>
							
							
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
		<!-- /row -->
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




	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>