<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
    <c:import url="/WEB-INF/views/common/head.jsp" />
    <style>
        #sample-table-1 tr td {
            padding: 0;
        }

        #sample-table-1 tr td p {
            padding: 8px;
            margin: 0;
        }

        #sample-table-1 tr td input {
            padding: 8px;
            margin: 0;
            width: 94%;
            border: 0
        }

        .form-horizontal .control-label {
            text-align: left
        }

        .controls input[type=text] {
            width: 50%;
            min-width: 200px
        }
    </style>
    <script>
        cnt = 2;
        ctg_cnt = 3;

        function add_row() {
            var table = document.getElementById("sample-table-1");
            var row = table.insertRow(table.rows.length); // 하단에 추가       
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            cell1.innerHTML = '<td><p>' + cnt + '</p></td>';
            cell2.innerHTML = '<td><input type="text" id="" placeholder="품목코드"></td>';
            cell3.innerHTML = '<td><input type="text" id="" placeholder="품목명"></td>';
            cell4.innerHTML = '<td><input type="text" id="" placeholder="수량"></td>';
            cell5.innerHTML = '<td><input type="text" id="" placeholder="공급가액"></td>';
            cell6.innerHTML = '<td><input type="text" id="" placeholder="부가세"></td>';
            cnt++;
        }

        function delete_row() {
            var table = document.getElementById('sample-table-1');
            if (table.rows.length < 3) {
                return;
            } else {
                cnt--
                table.deleteRow(table.rows.length - 1); // 하단부터 삭제
            }
        }
    </script>
</head>

<body class="skin-3">
    <c:import url="/WEB-INF/views/common/navbar.jsp" />
    <div class="main-container container-fluid" style="height:100%">
        <c:import url="/WEB-INF/views/common/sidebar.jsp" />
        <div class="main-content" style="overflow-x:auto;height:calc(100% - 80px);">
            <div class="page-content" style="min-width:1280px;">


                <div class="page-header position-relative">
                    <h1 class="pull-left">매출관리</h1>
                </div>
                <!-- /.page-header -->



                <!-- PAGE CONTENT BEGINS -->

                <form class="form-horizontal" method="post" action="test">
                    <div class="row-fluid">
                        <div class="span12">

                            <!-- left -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="salesNo">매출관리</label>
                                    <div class="controls">
                                        <input type="text" id="salesNo" placeholder="매출관리" name="salesNo">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerCode">거래처코드</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="customerCode" name="role" data-placeholder="거래처코드" name="customerCode">
                                            <option value="">&nbsp;</option>
                                            <option value="1234567890">1234567890</option>
                                            <option value="4567890123">4567890123</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="empManager">거래처담당자</label>
                                    <div class="controls">
                                        <input type="text" id="empManager" name="empManager" placeholder="거래처담당자">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="cl-total-date-picker">출고일</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <input class="cl-date-picker" id="cl-total-date-picker" type="text" data-date-format="yyyy-mm-dd" name="releaseDate"> <span class="add-on"> <i class="icon-calendar"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalQuantity">수량합계</label>
                                    <div class="controls">
                                        <input type="text" id="totalQuantity" name="totalQuantity" placeholder="수량합계">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalTax">부가세합계</label>
                                    <div class="controls">
                                        <input type="text" id="totalTax" placeholder="부가세합계">
                                    </div>
                                </div>
                            </div>
                            <!-- right -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="salesNo">매출번호</label>
                                    <div class="controls">
                                        <input type="text" id="salesNo" name="salesNo" placeholder="매출번호">
                                        <div class="btn-group">
                                            <button class="btn btn-info btn-small">조회</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerName">거래처명</label>
                                    <div class="controls">
                                        <input type="text" id="customerName" name="customerName" placeholder="거래처명">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="customerName">거래처연락처</label>
                                    <div class="controls">
                                        <input type="text" id="customerName" name="customerPhone" placeholder="거래처연락처">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="taxbillNo">세금계산서번호</label>
                                    <div class="controls">
                                        <input type="text" id="taxbillNo" name="taxbillNo" placeholder="세금계산서번호">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="totalSupplyValue">공급가액합계</label>
                                    <div class="controls">
                                        <input type="text" id="totalSupplyValue" placeholder="공급가액합계">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="hr hr-10 dotted"></div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="btn-group">
                                <button class="btn btn-success btn-small">입력</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-info btn-small">수정</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-danger btn-small">삭제</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-small" onclick="add_row();">행추가</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-small" onclick="delete_row();">행삭제</button>
                            </div>
                        </div>
                    </div>
                    <div class="hr hr-10 dotted"></div>
                    <div class="row-fluid">
                        <div class="span12">

                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th>순번</th>
                                    <th>품목코드</th>
                                    <th>품목명</th>
                                    <th>수량</th>
                                    <th>공급가액</th>
                                    <th>부가세</th>
                                </tr>
                                <tr>
                                    <td>
                                        <p>1</p>
                                    </td>
                                    <td><input type="text" id="itemCode" name="itemCode" placeholder="품목코드"></td>
                                    <td><input type="text" id="itemName" name="itemName" placeholder="품목명"></td>
                                    <td><input type="text" id="quantity" name="quantity" placeholder="수량"></td>
                                    <td><input type="text" id="supplyValue" name="supplyValue" placeholder="공급가액"></td>
                                    <td><input type="text" id="taxVale" name="taxVale" placeholder="부가세"></td>
                                </tr>
                            </table>


                            <!-- PAGE CONTENT ENDS -->
                        </div>

                    </div>
                </form>
                <!-- /.span -->

                <!-- /.row-fluid -->
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
    </div>
    <!-- /.main-container -->
    <!-- basic scripts -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
    <script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
    <script>
        $(function() {
            $(".chosen-select").chosen();

            $.fn.datepicker.dates['ko'] = {
                days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                daysShort: ["일", "월", "화", "수", "목", "금", "토"],
                daysMin: ["일", "월", "화", "수", "목", "금", "토"],
                months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                today: "Today",
                clear: "Clear",
                format: "yyyy-mm-dd",
                titleFormat: "yyyy MM",
                /* Leverages same syntax as 'format' */
                weekStart: 0
            };

            $('#cl-ym-date-picker').datepicker({
                maxViewMode: 4,
                minViewMode: 1,
                language: 'ko'
            }).next().on(ace.click_event, function() {
                $(this).prev().focus();
            });

            $('.cl-date-picker').datepicker({
                language: 'ko'
            }).next().on(ace.click_event, function() {
                $(this).prev().focus();
            });

        })
    </script>
</body>

</html>