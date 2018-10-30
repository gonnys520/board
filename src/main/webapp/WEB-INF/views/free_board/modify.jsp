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
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-20">
                        <h4 class="page-title">자유게시판</h4> </div>
                        <ol class="breadcrumb">
                            <li><a href="#">FREE BOARD</a></li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                        <div class="white-box">
                            <h3 class="box-title">MODIFY/DELETE</h3>
                            <p class="text-muted">글을 수정 또는 삭제합니다.</p>
                            <div class="table-responsive">
                            
                    <div class="col-md-8 col-xs-20">
                        <div class="white-box">
                        
                               <form role="form" action="/free_board/modify" method="post">
                               <input type='hidden' name='bno' value='${board.bno}'>
                                <div class="form-group">
                                    <label class="col-md-20">TITLE</label>
                                    <div class="col-md-20">
                                        <input type="text" class="form-control form-control-line" name='title'
                                        value='<c:out value="${board.title}"/>'> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-20">WRITER</label>
                                    <div class="col-md-20">
                                        <input type="text" class="form-control form-control-line" name='writer'
                                        value='<c:out value="${board.writer}"/>' readonly="readonly"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-20">CONTENT</label>
                                    <div class="col-md-20">
                                        <textarea rows="20" class="form-control form-control-line" name='content'>
                                        <c:out value="${board.content}"/></textarea>
                                    </div>
                                </div>
                                  <button type="submit" data-oper='modify' class="btn btn-success">수정하기</button>
                                  </form>

                                  <form role="form" action="/free_board/remove" method="post">
                                  <input type='hidden' name='bno' value='${board.bno}'>
                                  <button type="submit" data-oper='remove' class="btn btn-success">삭제하기</button>
                                  </form>
                                
                                <form role="form" action="/free_board/read" method="get">
                                  <input type='hidden' name='bno' value='${board.bno}'>
                                  <button type="submit" data-oper='read' class="btn btn-success">돌아가기</button>
                                  </form>
                                 
                                  </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            <!-- /.container-fluid -->
          
    
    <%@include file="../includes/footer.jsp" %>
    
    
<!--   <script type="text/javascript">
 $(document).ready(function() {
	 
	 var formObj = $("form");
  
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/free_board/remove");
		}else if(operation === 'list'){
			self.location= "/free_board/list";
			return;
		}
		formObj.submit();

	});
 });
  -->
 </script>
              
    