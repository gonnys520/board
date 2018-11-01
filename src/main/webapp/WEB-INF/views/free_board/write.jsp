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
                            <h3 class="box-title">WRITE</h3>
                            <p class="text-muted">작성하실 글을 입력해주세요.</p>
                            <div class="table-responsive">
                            
                            
                    <div class="col-md-8 col-xs-20">
                        <div class="white-box">
                            <form class="form-horizontal form-material" action="/free_board/write" method="post">
                                <div class="form-group">
                                    <label class="col-md-20">TITLE</label>
                                    <div class="col-md-20">
                                        <input type="text" placeholder="제목" class="form-control form-control-line" name='title'> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-20">WRITER</label>
                                    <div class="col-md-20">
                                        <input type="text" placeholder="작성자" class="form-control form-control-line" name='writer'> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-20">CONTENT</label>
                                    <div class="col-md-20">
                                        <textarea rows="20" placeholder="내용" class="form-control form-control-line" name='content'></textarea>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <label class="col-md-20">FILE UPLOAD</label>
                                    <div class="col-md-20 upload">
                                       <input type="file" class="form-control form-control-line" name='uploadFile' multiple> </div>
                                    <div class='uploadResult'>
                                      <ul>
                                      </ul>
                                    </div>
                                </div>
                               
                                        <button type="submit" class="btn btn-success">작성완료</button>
                                        </form>
                                         <a href="/free_board/list">
                                            <button class="btn btn-success">돌아가기</button>
                                            </a>
                                  </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            <!-- /.container-fluid -->
          
    
    <%@include file="../includes/footer.jsp" %>
    
    
  
<!-- <script>
      $(document).ready(function() {
    	  
    	  var formObj = $("form[role='form']");
    	  
    	  $("button[type='submit']").on("click", function(e){
    		  e.preventDefault();
    		  console.log("submit clicked");
    	  });
      });
      
      
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize){
			
			if(fileSize >= maxSize){
				alert("파일 사이즈가 초과되었습니다.");
				return false;
			}
		
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
				}
			return true;
			}
		
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
				
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
				$.ajax({
				url : '/free_board/uploadAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					
					//showUploadedFile(result);
					
				}

			}); //$.ajax
			
			function showIploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){return;}
				
				var uploadUL = $(".uploadResult ul");
				
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					
					//image type
					if (obj.FileType){
						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
						str += "<li><div>";
						str += "<span>"+obj.fileName+"</span>";
						str += "<button type ='button'><i></i></button></br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					}
					else{
						var fileCallPath = encodeURIComponent ( obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><div>";
						str += "<span>" + obj.fileName+"</span>";
						str += "<button type='button'><i></i></button><br>";
						str += "<img src='/resources/img/upload.png'></a>"
						str += "</div>";
						str +"</li>";
					}
					});
					
				uploadUL.appen(str);
				}
		});
      
</script>
     -->
    

    
    