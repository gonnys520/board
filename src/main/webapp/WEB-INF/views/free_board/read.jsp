<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>

<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult{
  width:100%;
  background-color:white;
  }
.uploadResult ul{
  display:flex;
  flex-flow:row;
  justify-content:center;
  align-items:center;
} 
.uploadResult ul li{
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width:100px;
}
.uploadResult ul li span{
  color:white;
}
.bigPictureWrapper{
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top: 0%;
  width: 100%;
  height: 100%;
  background-color: white;
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture{
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}
.bigPicture img{
  width: 600px; 
}
.comment ul{
list-style:none;
padding-left:0px;
}
.content {
  white-space: pre-wrap;
}
</style>

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
                <!-- Form start -->
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
                                  <div class="form-group">
                                    <label class="col-md-20">FILES</label>
                                    <div class="col-md-20">
                                        <div class="form-control form-control-line">
                                        <div class='uploadResult'>
                                        <ul>
                                        
                                        </ul>
                                       </div>
                                    </div>
                                </div>
                              </div>
                           </div>
                          </div>
                               
                                    <!-- 댓글 start -->
                    <div style="display:flex; width:100%; height:auto;">
                        <div class="white-box">
                            <label class="col-md-20">COMMENTS</label>
                                  <button id="addReplyBtn" class="btn btn-success" style="position: absolute; right: 32%;">댓글달기</button>
                                </br>
                           <div class="panel-body">     
                            <div class="message-center">
                              <ul class="chat">
                                 <li data-rno='' href="">
                                    <div class='mail-contnet' name='replyer'>
                                    	<h5></h5>
                                    <span class='mail-desc' name='reply'></span>
                                    <span class='time'></span> </div>
                                 </li>
                              </ul>
                             </div>
                            </div>
                            <div class="panel-footer">
                            <div class="dataTables_paginate paging_simple_numbers"
                                    id="dataTables-example_paginate">        
                            </div>
                            </div>
                         </div>
                       </div>
                       <!-- 댓글 end -->
                         
                       <!-- 버튼 start -->  
                <div>
                <form role="form" action="/free_board/modify" method='get'>
                <input type='hidden' name='page' value="${pageObj.page}">
                <input type='hidden' name='bno' value="${pageObj.bno}">
                <button type="submit" class="btn btn-warning">수정 및 삭제</button>
                </form>
                
                <form role="form" action="/free_board/list" method='get'>
                <input type='hidden' name='page' value="${pageObj.page}">
                <button type="submit" class="btn btn-default">돌아가기</button>
                </form>
                </div>
                       <!-- 버튼 end --> 
                        </div>
                    </div>
               <!-- Form end -->


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name='reply' value='new reply'>
					</div>
					<div class="form-group">
					<label>Replyer</label>
					<input type="text" class="form-control"  name='replyer'>
					</div>
					
						<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name='replydate'>
					</div>	
				
				</div>
				<div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalWriteBtn' type="button" class="btn btn-primary">Write</button>
            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>


                
<%@include file="../includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
    
<script>
    
    $(document).ready(function () {
    	
    	var bno = '<c:out value="${board.bno}"/>';
        var replyUL = $(".chat");


        showList(1);
                
                
        function showList(page){
        	
        	replyService.getList({bno:bno, page: page || 1}, function(replyCnt, list) {
        		
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
          		str +="<div class='user-img'></div>";
/*           	<img src="../resources/plugins/images/users/gonnys.jpg" alt="user" class="img-circle"> */
        		str +="<div class='mail-contnet' name='replyer'><h5>"+list[i].replyer+"</h5>"
        		str +="<span class='mail-desc' name='reply'>"+list[i].reply+"</span>"
        		str +="<span class='time'>"+replyService.displayTime(list[i].replyDate)+"</span>"
        	}
        	replyUL.html(str);
        	
        	showReplyPage(replyCnt);
        	
        	});
        };
        
        
       	var pageNum = 1;
     	var replyPageFooter =$(".panel-footer");
        
     		
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
        	
        }
        
        replyPageFooter.on("click", "li a", function(e){
        	e.preventDefault();
        	console.log("page click");
        	
        	var targetPageNum = $(this).attr("href");
        	
        	console.log("targetPageNum: " + targetPageNum);
        	
        	pageNum = targetPageNum;
        	
        	showList(pageNum);
        });
     
        
        var modal = $("#myModal");
        var modalInputReply = modal.find("input[name='reply']");
        var modalIntputReplyer = modal.find("input[name='replyer']");
        var modalInputReplyDate = modal.find("input[name='replyDate']");
       
        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalWriteBtn = $("#modalWriteBtn");
        var modalCloseBtn = $("#modalCloseBtn");  
        
        var replyer = null;
    
    $("#addReplyBtn").on("click", function(e){
   	 
    modal.find("input[name='reply']").val('');
	   modal.find("input[name='replyer']").val(replyer);
 	   modalInputReplyDate.closest("div").hide();
 	   modal.find("button[id !='modalCloseBtn']").hide();
 	   
 	   modalWriteBtn.show();
 	   
 	   console.log("click addReplyBtn")
 	   
 	  $("#myModal").show();
 	   
    })
    

	 $("#modalWriteBtn").on("click", function(e){
 	
 		var reply = {
 			reply: modalInputReply.val(),
 			replyer: modalIntputReplyer.val(),
 			bno: bno
 	};
 	
  		replyService.add(reply, function(result) {
 		
 		alert(result);
 		
 		modal.find("input").val("");
 		modal.hide();
 		
 		showList(-1);
 		
 	}); 	
 });


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
    		
    		$("#myModal").show();
    	});
    });
    
  	  $("#modalModBtn").on("click", function(e){
    	
    	var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
    	replyService.update(reply, function(result){
    		
    		alert(result);
    		$("#myModal").hide();
    		showList(pageNum);
    	});
    	
    });
    
	
    $("#modalRemoveBtn").on("click", function(e){
    	
    	var rno = modal.data("rno");
    	replyService.remove(rno, function(result){
    	
    		alert(result);
    		$("#myModal").hide();
    		showList(pageNum);
    	});
    });
    
    
    $("#modalCloseBtn").on("click", function(e){
    	 $("#myModal").hide();
			
	});
    
    
    $.getJSON("/free_board/getAttachList", {bno:bno}, function(arr) {
		console.log(arr);
		
		var str = "";
		
		$(arr).each(function(i, attach){
			
			//image type
			if(attach.fileType){
				var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+ attach.uuid + "_" + attach.fileName);
				var fileCallPathOrigin = encodeURIComponent(attach.uploadPath+ "/"+ attach.uuid + "_" + attach.fileName);
				
				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				str += "<span><a href='/board/download?fileName="+fileCallPathOrigin+"'><font color='black'> "+ attach.fileName+ "</font></a></span><br/>";
				str += "<img src='/free_board/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				
				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
				str += "<span><font color='black'> "+ attach.fileName+ "</font></span><br/>";
				str += "<img src='/resources/img/filetree/file.png'></a>";
				str += "</div>";
				str +"</li>";
			}
		});
		
		$(".uploadResult ul").html(str);
	}); //end getjson
	
	
	$(".uploadResult").on("click", "li", function(e){
		console.log("view image");

		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			//download
			self.location ="/board/download?fileName="+path
		}
	});
		function showImage(fileCallPath){
			
			$(".bigPictureWrapper").css("display","flex").show();
			$(".bigPicture")
			.html("<img src='/free_board/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%', height:'100%'}, 1000);
		}
		
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			},1000);
		});
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 1000);
		})
});

</script>

    