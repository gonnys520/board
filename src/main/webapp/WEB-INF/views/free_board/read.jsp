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
<<<<<<< HEAD
                    <div style="display:flex; width:100%; height:auto;">
                        <div class="white-box">
                            <h3 class="col-md-20">COMMENTS</h3>
                                  <button id="addReplyBtn" class="btn btn-success" style="position: absolute; right: 0;">댓글달기</button>
                                </br>
                           <div class="panel-body">     
                            <div class="message-center">
                              <ul class="chat">
                               <a href="">
                                 <li data-rno=''>
                                    
                                    <div class='mail-contnet' name='replyer'>
                                    	<h5></h5>
                                    <span class='mail-desc' name='reply'></span>
                                    <span class='time'></span> </div>
                                 </li>
                               </a>
                              </ul>
                             </div>
                            </div>
                            
  
                            <div class="panel-footer">
                            <div class="dataTables_paginate paging_simple_numbers"
    id="dataTables-example_paginate">        
                            </div>
                            </div>

                                
                                <!-- 페이징 Start -->
                
<!--     <div class="dataTables_paginate paging_simple_numbers"
    id="dataTables-example_paginate">
    <ul class='pagination'
      style="display: table; margin-left: auto; margin-right: auto">
      
        <li class='paginate_button previous'
          aria-controls="dataTables-example" tabindex="0"
          id="dataTables-example_previous"><a class='page-link' href=''>Previous</a></li>
          
        <li class='paginate_button' aria-controls="dataTables-example"
          aria-controls="dataTables-example" tabindex="0"><a
          class='page-link' href=''> </a></li>

    
        <li class='paginate_button next' aria-controls="dataTables-example"
          tabindex="0" id="dataTables-example_next"><a
          class='page-link' href=''>Next</a></li>

    </ul>
  </div> -->
    <!-- 페이징 End -->
    </br>
                                    <div>
=======
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
>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
                                <a href="/free_board/modify?bno=<c:out value="${board.bno}"/>">
                                  <button type="submit" class="btn btn-warning">수정 및 삭제</button>
                                </a>
                                <a href="/free_board/list">
                                  <button type="submit" class="btn btn-default">돌아가기</button>
                                </a>
    </div>


                                  
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            <!-- /.container-fluid -->
<<<<<<< HEAD
                    </div>
                </div>
                <!-- /.row -->
               </div>
               
                
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
      
			<div class="modal-body">
      
            <div class="form-group">
            <label>Reply</label>
            <input class="form-control" name='reply' value='New Reply!!!!'>
            </div>
            
            <div class="form-group">
            <label>Replyer</label>
            <input class="form-control" name='replyer' value='replyer'>
            </div>
            
            <div type='hidden' class="form-group">
            <label>Reply Date</label>
            <input class="form-control" name='replyDate' value=''>
            </div>
            
            </div>
            
            <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalWriteBtn' type="button" class="btn btn-primary">Write</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>

		<!-- /.modal-content -->
	 </div>
	<!-- /.modal-dialog -->
    </div>
  <!-- /.modal--->
  </div>
</div>
=======

                    </div>
                </div>
                <!-- /.row -->
                
>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
                
<%@include file="../includes/footer.jsp" %>
    
    <script type="text/javascript" src="/resources/js/reply.js"></script>
    
    <script>
    
    $(document).ready(function () {
    	
        var bnoValue = '<c:out value="${board.bno}"/>';
        var replyUL = $(".chat");
<<<<<<< HEAD
        var modal = $(".modal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalIntputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");
        
        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalWriteBtn = $("#modalWriteBtn");
        var modalCloseBtn = $("#modalCloseBtn");
        
        var pageNum = 1;
        var replyPageFooter =$(".panel-footer");

        showList(1);
                
                
        function showReplyPage(replyCnt){
        	
        	var endNum = Math.ceil( pageNum / 10.0) * 10;
        	var startNum = endNum - 9;
        	
        	var prev = startNum != 1;
        	var next = false;
        	
        	if(endNum * 10 >= replyCnt){
        		endNum = Math.ceil(replyCnt/10.0);
        	}
        	
        	if(endNum * 10 < replyCnt){
        		next = true;
        	}
        	
        	var str = "<ul class='pagination' style='display: table; margin-left: auto; margin-right: auto'>";
        	
        	if(prev){
        		str += "<li class='paginate_button previous' aria-controls='dataTables-example' tabindex='0' id='dataTables-example_previous'><a class='page-link' href='"+(startNum-1)+"'>Prev</a></li>";
        	}
        	
        	for(var i = startNum ; i <= endNum; i++){
        		
        		var active = pageNum == i? "active":"";
        		
        		str += "<li class='paginate_button "+active+"' aria-controls='dataTables-example' aria-controls='dataTables-example' tabindex='0'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
        		
        	}
        	
        	if(next){
        		str += "<li class='paginate_button next' aria-controls='dataTables-example' tabindex='0' id='dataTables-example_next'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
        		}
        	
        	str += "</ul></div>";
        	
        	console.log(str);
        	
        	replyPageFooter.html(str);
        	
        };
        
        
        function showList(page){
        	
        	replyService.getList({bno:bnoValue, page: page || 1},
        			function(replyCnt, list) {
        		
        		console.log("replyCnt:" + replyCnt);
        		console.log("list:" + list);
        		console.log(list);
        		
        		if(page == -1) {
        			pageNum = Math.ceil(replyCnt/10.0);
        			showList(pageNum);
        			return;
        		}
        		
                var str= "";
                
                
        		if(list == null || list.length == 0){
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
        	
        	showReplyPage(replyCnt);
        	
        	});
        };
        

       $("#addReplyBtn").on("click", function(e){
    	 
    	   modal.find("input").val("");
    	   modalInputReplyDate.closest("div").hide();
    	   modal.find("button[id !='modalCloseBtn']").hide();
    	   
    	   modalWriteBtn.show();
    	   
    	   $(".modal").modal("show");
    	   
       });
       
   
    $("#modalWriteBtn").on("click", function(e){
    	
    	var reply = {
    			reply: modalInputReply.val(),
    			replyer: modalIntputReplyer.val(),
    			bno: bnoValue
    	};
    	
     	replyService.add(reply, function(result) {
    		
    		alert(result);
    		
    		modal.find("input").val("");
    		modal.modal("hide");
    		
    		showList(-1);
    		
    	}); 	
    });
=======
        
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
>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
    
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
    
<<<<<<< HEAD
    $(".chat").on("click", "li", function(e){
    	
    	var rno = $(this).data("rno");
    	
    	replyService.read(rno, function(reply){
    		modalInputReply.val(reply.reply);
    		modalIntputReplyer.val(reply.replyer);
    		modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
    		.attr("readonly", "readonly");
    		modal.data("rno", reply.rno);
    		
    		modal.find("button[id !='modalCloseBtn']").hide();
    		modalModBtn.show();
    		modalRemoveBtn.show();
    		
    		$(".modal").modal("show");
    	});
    });
    
    $("#modalModBtn").on("click", function(e){
    	
    	var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
    	replyService.update(reply, function(result){
    		
    		alert(result);
    		modal.modal("hide");
    		showList(pageNum);
    	});
    	
    });
    
	
    $("#modalRemoveBtn").on("click", function(e){
    	
    	var rno = modal.data("rno");
    	replyService.remove(rno, function(result){
    	
    		alert(result);
    		modal.modal("hide");
    		showList(pageNum);
    	});
    });
    
    replyPageFooter.on("click", "li a", function(e){
    	e.preventDefault();
    	console.log("page click");
    	
    	var targetPageNum = $(this).attr("href");
    	
    	console.log("targetPageNum: " + targetPageNum);
    	
    	pageNum = targetPageNum;
    	
    	showList(pageNum);
    });
    
    
    $("#modalCloseBtn").on("click", function(e){
    		modal.modal("hide");
			
	});
    
});

    
/*     //reply List
    replyService.getList({bno:bnoValue, page:1}, function(list){
    	
    	for(var i = 0, len = list.length||0; i < len; i++){
    		console.log(list[i]);
    	}
    }); */
    
/*      //Remove
    replyService.remove(3, function(count){
    	
    	console.log(count);
    	
    	if(count === "success"){
    		alert("Removed");
    	}
    }, function(err) {
    	alert("ERROR....");
    }); */
    
=======
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
>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
    
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
<<<<<<< HEAD


=======
     
>>>>>>> branch 'master' of https://github.com/gonnys520/board.git
    </script>
    
    
    
    
    
    