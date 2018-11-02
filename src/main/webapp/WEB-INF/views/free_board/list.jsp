<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<%@include file="../includes/header.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">자유게시판</h4> </div>
                        <ol class="breadcrumb">
                            <li><a href="#">FREE BOARD</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">FREE BOARD</h3>
                            <p class="text-muted">이곳은 자유 게시판 입니다.</p>
                            <div class="table-responsive">
                            <div>
                            <select id="select">
                            <option value="10" ${pageObj.display == 10? "selected":""}>10</option>
                            <option value="20" ${pageObj.display == 20? "selected":""}>20</option>
                            <option value="50" ${pageObj.display == 50? "selected":""}>50</option>
                            <option value="100" ${pageObj.display == 100? "selected":""}>100</option>
                            </select> 개씩 보기
                            </div>
                                <table class="table">
                                    <thead>
                                        <tr class="font-weight:bold">
                                            <th>NO</th>
                                            <th>TITLE</th>
                                            <th>WRITER</th>
                                            <th>REGDATE</th>
                                        </tr>
                                    </thead>
                                    
                                    
                                    <c:forEach items="${list}" var="board">

                                    <tbody>
                                        <tr>

                                            <td><c:out value="${board.bno}"/></td>
                                            <td>
                                             
                                             <a href='/free_board/read?bno=<c:out value="${board.bno}"/>'>                                            
                                             <c:out value='${board.del.equals("X")?board.title:"삭제된 글입니다."}'/></a>
                                             
                                             </td>
                                            <td><c:out value="${board.writer}"/></td>
                                            
                                            <c:choose>
                                            <c:when test="${empty board.update_time}">
                                            <td>
                                            <fmt:formatDate value="${board.date_time}"
											pattern="yyyy-MM-dd HH:mm:ss" />
                                            </td>
                                            </c:when>
                                            <c:when test="${!empty board.update_time}">
                                            <td>
                                            <fmt:formatDate value="${board.update_time}"
											pattern="yyyy-MM-dd HH:mm:ss" />
                                            </td>
                                            </c:when>

                                            
                                          </c:choose>

                                          
                                        </tr>
                                    </tbody>
                                    </c:forEach>
                                    
 

                                </table>
                <div class="center p-20">
                    <button type="submit" onclick="location.href='/free_board/write'"
                    class="btn btn-danger btn-block btn-rounded waves-effect waves-light">글쓰기</button>
                </div>
                            
                <div>
                <select name ="type">
                  <option <c:out value="${pageObj.type == null?'selected':''}"/>>--</option>
                  <option value="t"
                    <c:out value="${pageObj.type == 't'?'selected':''}"/>>제목</option>
                  <option value="c"
                    <c:out value="${pageObj.type == 'c'?'selected':''}"/>>내용</option>
                  <option value="w"
                    <c:out value="${pageObj.type == 'w'?'selected':''}"/>>작성자</option>
                  <option value="tc"
                    <c:out value="${pageObj.type == 'tc'?'selected':''}"/>>제목+내용</option>
                  <option value="tcw"
                    <c:out value="${pgaeObj.type == 'tcw'?'selected':''}"/>>제목+내용+작성자</option>
               
                </select>
                
                   <div role="search" class="app-search">
                   <input type="text" name="keyword" value="${pageObj.keyword}" placeholder="Search..." class="form-control">
                   <i id="searchBtn" class="fa fa-search"></i>
                   </div>

                </div>        
 
                                    
                                    
                                    
    <div class="dataTables_paginate paging_simple_numbers"
    id="dataTables-example_paginate">
    <ul class="pagination"
      style="display: table; margin-left: auto; margin-right: auto">
      <c:if test="${pageObj.prev}">
        <li class="paginate_button previous"
          aria-controls="dataTables-example" tabindex="0"
          id="dataTables-example_previous"><a href="${pageObj.start -1}">Previous</a></li>
      </c:if>
      <c:forEach begin="${pageObj.start}" end="${pageObj.end}" var="num">
        <li class="paginate_button" data-page='${num}'
          aria-controls="dataTables-example" tabindex="0"><a
          href="${num}"><c:out value="${num}" /></a></li>
      </c:forEach>
      <c:if test="${pageObj.next}">
        <li class="paginate_button next" aria-controls="dataTables-example"
          tabindex="0" id="dataTables-example_next"><a
          href="${pageObj.end +1}">Next</a></li>
      </c:if>
    </ul>
    <br /> <br />
  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- /.row -->
                </div>
                
                
  <!-- form -->
<form id='actionForm'>
  <input type='hidden' name='page' id='page' value='${pageObj.page}'>
  <input type='hidden' name='display' id='display' value='${pageObj.display}'>
  <input type='hidden' name='type' id='type' value='${pageObj.type}'>
  <input type='hidden' name='keyword' id='keyword' value='${pageObj.keyword}'>
</form>
  
                
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">COMMENT</h4>
      </div>
      <div class="modal-body">처리가 완료되었습니다.</div>
      <div class="modal-footer">
            <button type="button" class="btn btn-warning" data-dismiss="modal">확인</button>
    <!-- /.modal-content -->
   </div>
  <!-- /.modal-dialog -->
    </div>
  <!-- /.modal--->
  </div>
</div>
       
                    
            
<%@include file="../includes/footer.jsp" %>
            
            
<script type="text/javascript">
  $(document).ready(
  function() {

  var actionForm = $("#actionForm");
  var pageNum = ${pageObj.page};
  

	//버튼 활성화
	$('.pagination li[data-page='+ pageNum + ']').addClass("active");

	//버튼 클릭
	$('.pagination li a').on("click",function(e)
			{e.preventDefault();
			
	var target = $(this).attr("href");
	console.log(target);
	$("#page").val(target);
	actionForm.attr("action","/free_board/list")
	.attr("method","get").submit();
	});
	
	
	//select
	$('#select').change(function(e) {
		e.preventDefault();
		
		var display = $(this).val();
		$("#display").val(display);
		actionForm.attr("action", "/free_board/list")
		.attr("method", "get").submit();
	});
	
	
	//search
	$('#searchBtn').on("click", function(e){
		
		var searchTypeValue = $("select[name='type'] option:selected").val();
		
		var searchKeyword = $("input[name='keyword']").val();
		

		if(searchKeyword.trim().length == 0){
			alert("입력된 검색어가 없습니다. 다시 확인하세요.");
			return;
		}
		
		if(searchTypeValue == "--"){
            alert("카테고리가 없습니다. 다시 확인하세요.");
            return;
         }
		
 
		
		actionForm.attr("action","/free_board/list");
		actionForm.find("input[name='type']").val(searchTypeValue);
		actionForm.find("input[name='keyword']").val(searchKeyword);
		$("#page").val(1);
		
		actionForm.submit();
	});

	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	function checkModal(result){
		
		console.log(result);
		
		if (result === ''){
			
			return;
		}
		
		if (result > 0) {
			
			$(".modal-body").html("게시글이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
});
	
	
 
  </script>
  
  
