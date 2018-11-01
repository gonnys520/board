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
                            <h3 class="box-title">READ</h3>
                            <p class="text-muted">글 내용을 보여줍니다.</p>
                            <div class="table-responsive">
                            
                    <div class="col-md-8 col-xs-20">
                        <div class="white-box">
                                <div class="form-group">
                                    <label class="col-md-20">TITLE</label>
                                    <div class="col-md-20">
                                        <input type="text" class="form-control form-control-line" name='title'
                                        value='<c:out value="${board.title}"/>' readonly="readonly"> </div>
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
                                        <textarea rows="20" class="form-control form-control-line" name='content' readonly="readonly">
                                        <c:out value="${board.content}"/></textarea>
                                    </div>
                                </div>
                                
                                    <!-- row -->
                    <div class="col-lg-6 col-md-12 col-sm-20">
                        <div class="white-box">
                            <h3 class="box-title">COMMENTS</h3>
                               <a href="/free_board/list">
                                  <button id="addReplyBtn" class="btn btn-success" style="position: absolute; right: 0;">댓글달기</button>
                                </a></br>
                            <div class="message-center">
                            
                                
                               <ul class="chat">
                               <a href="#">
                                 <li data-rno='9'>
                                    <div class="user-img"> <img src="../resources/plugins/images/users/gonnys.jpg" alt="user" class="img-circle"></div>
                                    <div class='mail-contnet' name='replyer'>
                                    	<h5></h5>
                                    <span class='mail-desc' name='reply'></span>
                                    <span class='time'></span> </div>
                                 </li>
                               </a>
                               	</ul>

                               
                            </div>
                        </div>
                         
                                <div>
                                <a href="/free_board/modify?bno=<c:out value="${board.bno}"/>">
                                  <button type="submit" class="btn btn-success">수정 및 삭제</button>
                                </a>
                                <a href="/free_board/list">
                                  <button type="submit" class="btn btn-success">돌아가기</button>
                                </a>
                                  </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            <!-- /.container-fluid -->

                    </div>
                </div>
                <!-- /.row -->
                
                
<%@include file="../includes/footer.jsp" %>
    
    <script type="text/javascript" src="/resources/js/reply.js"></script>
    
    <script>
    
    $(document).ready(function () {
    	
        var bnoValue = '<c:out value="${board.bno}"/>';
        var replyUL = $(".chat");
        
        showList(1);
        
        function showList(page){
        	
        	replyService.getList({bno:bnoValue, page: page || 1}, function(list) {
        		
        		var str= "";
        	if(list == null || list.length == 0){
        		replyUL.html("");
        		
        		return; 
        	}
        	for (var i = 0, len = list.length || 0; i < len; i++){
        		str +="<li data-rno="+list[i].rno+">";
/*          		str +="<div class="user-img"><img src="../resources/plugins/images/users/gonnys.jpg" alt="user" class="img-circle"></div>";  */
        		str +="<div class='mail-contnet' name='replyer'><h5>"+list[i].replyer+"</h5>"
        		str +="<span class='mail-desc' name='reply'>"+list[i].reply+"</span>"
        		str +="<span class='time'>"+replyService.displayTime(list[i].replyDate)+"</span>"
        	}
        	replyUL.html(str);
        	
        	});
        }
    });
    
    console.log("===============");
    console.log("JS TEST");
    

    
/*     //reply List
    replyService.getList({bno:bnoValue, page:1}, function(list){
    	
    	for(var i = 0, len = list.length||0; i < len; i++){
    		console.log(list[i]);
    	}
    }); */
    
/*     //Remove
    replyService.remove(2, function(count){
    	
    	console.log(count);
    	
    	if(count === "success"){
    		alert("Removed");
    	}
    }, function(err) {
    	alert("ERROR....");
    }); */
    
/*     //Update
    replyService.update({
    	rno: 9,
    	bno: bnoValue,
    	reply: "리플수정중!"
    }, function(result){
    	alert("수정 완료!");
    }); */
    
    
/*     //Read
    replyService.read(9, function(data){
    	console.log(data);
    }); */
    
    
/*     //for replyService add test
    replyService.add(
    		{reply:"JS Test", replyer:"tester", bno:bnoValue}
    		,
    		function(result){
    			alert("RESULT: " + result);
    		}
    	);
     */
     
    </script>
    
    
    
    
    
    