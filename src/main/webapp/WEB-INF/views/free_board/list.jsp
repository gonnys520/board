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
                                <table class="table">
                                    <thead>
                                        <tr class="font-weight:bold">
                                            <th>NO</th>
                                            <th>TITLE</th>
                                            <th>WRITER</th>
                                            <th>UPDATE TIME</th>
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
                                        <button type="submit" class="btn btn-success"
                                        onclick="location.href='/free_board/write'">글쓰기</button>
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
                
                
                
  <!-- form -->
<form id='actionForm'>
  <input type='hidden' name='page' id='page' value='${pageObj.page}'>
  <input type='hidden' name='display' id='display'
    value='${pageObj.display}'>
</form>
                
                    
            
            <%@include file="../includes/footer.jsp" %>
            
            
<script>
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
  
  }); 
  </script>
  
  
