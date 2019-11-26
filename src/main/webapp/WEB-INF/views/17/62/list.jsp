<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">




			<div class="page-header position-relative">
				<h1 class="pull-left">합계잔액시산표조회[62]</h1>
			</div><!-- /.page-header -->

			<div class="row-fluid">
				<div class="span12">
					<h1 class="center">합계잔액시산표</h1>
				</div>
			</div>

			<%-- 결산일 선택 --%>
			<div class="row-fluid">
				<div class="span6">
					<form class="form-horizontal">
						<%-- 년 월 select --%>
						<div class="control-group">
							<label class="control-label" for="year-month" style="text-align:left;width:60px;">년 월:</label>
							<div class="controls" style="margin-left:60px;">
								<select class="chosen-select" id="year-month" name="yearMonth" data-placeholder="년 월 선택">
									<option value="2019-12">2019-12</option>
									<option value="2019-12">2019-11</option>
									<option value="2019-12">2019-10</option>
									<option value="2019-12">2019-9</option>
									<option value="2019-12">2019-8</option>
									<option value="2019-12">2019-7</option>
									<option value="2019-12">2019-6</option>
									<option value="2019-12">2019-5</option>
									<option value="2019-12">2019-4</option>
									<option value="2019-12">2019-3</option>
								</select>

								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info">조회</button>
							</div>
						</div>
					</form>
				</div><!-- /.span -->
				<%-- 단위 표시 --%>
				<div class="span6">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label" for="year-month" style="float:right;">(단위: 원)</label>
						</div>
					</form>
				</div>
			</div><!-- /.row-fluid -->

			<%-- 시산표 데이터 테이블 --%>
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" colspan="3">차변</th>
								<th class="center" rowspan="2">계정과목</th>
								<th class="center" colspan="3">대변</th>
							</tr>
							<tr>
								<th class="center">당월</th>
								<th class="center">합계</th>
								<th class="center">잔액</th>
								<th class="center">잔액</th>
								<th class="center">합계</th>
								<th class="center">당월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align:right;">80,000,000</td>
								<td style="text-align:right;">350,000,000</td>
								<td style="text-align:right;">150,000,000</td>
								<td class="center">자산</td>
								<td style="text-align:right;"></td>
								<td style="text-align:right;">200,000,000</td>
								<td style="text-align:right;">70,000,000</td>
							</tr>
							<tr>
								<td style="text-align:right;">80,000,000</td>
								<td style="text-align:right;">320,000,000</td>
								<td style="text-align:right;">120,000,000</td>
								<td class="center">유동자산</td>
								<td style="text-align:right;"></td>
								<td style="text-align:right;">200,000,000</td>
								<td style="text-align:right;">60,000,000</td>
							</tr>
							<tr>
								<td style="text-align:right;">100,200,000</td>
								<td style="text-align:right;">413,230,000</td>
								<td style="text-align:right;">376,450,000</td>
								<td class="center">합계</td>
								<td style="text-align:right;">376,450,000</td>
								<td style="text-align:right;">413,230,000</td>
								<td style="text-align:right;">100,200,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>



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
</body>
</html>
