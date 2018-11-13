<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<style>
  .uploadResult{
  
  width:100%;
  background-color: white;
  }
  
  .uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
  }
  
  .uploadResult ul li{
  list-style: none;
  padding: 10px;
  }
  
  .uploadResult ul li img{
  width: 60px;
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
                                       <input type="file" class="form-control form-control-line" name='uploadFile' multiple>
                                       <!-- <span class="help-block">Input type file</span> -->
                                    </div>
                                    <div class='uploadResult'>
                                      <ul>
                                      
                                      </ul>
                                    </div>
                                </div>
                               
                                        <button id="submitBtn" type="submit" class="btn btn-warning">작성완료</button>
<!--                                          <a href="/free_board/list">
                                            <button class="btn btn-success">돌아가기</button>
                                            </a> -->
                                            </form>
                                  </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            <!-- /.container-fluid -->
          
    
    <%@include file="../includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous">
</script>
    
    
  
 <script>
      $(document).ready(function() {
    	  
    	  var formObj = $(".form-material");
    	  
    	  $("#submitBtn").on("click", function(e){
    		  e.preventDefault();
    		  console.log("submit clicked");
    		  
    		  var str = "";
    		  
    	  $(".uploadResult ul li").each(function(i, obj){
    		
    		  var jobj = $(obj);
    		  
    		  console.dir(jobj);
    	  
    		  str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
  			  str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
  			  str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
  			  str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
    		  
    	  });

    	  formObj.append(str).submit();
    	  
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
				url : '/free_board/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadResult(result);
					
				}

			}); //$.ajax
		});
		
		function showUploadResult(uploadResultArr){
			
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				console.log(obj.fileType);
				
				//image type
				if (obj.fileType){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
					
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-uuid='"+obj.uuid + "' data-filename='"+obj.fileName+"'data-type='"+obj.fileType+"'"
					str +  "><div>";
					str += "<span>"+obj.fileName+"</span>";
					str += "<button type ='button' data-file=\'"+fileCallPath+"\'data-type='image' class='btn btn-primary btn-circle'>X<i class='fa fa-items'></i></button><br>";
					str += "<img src='/free_board/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";

					}else{
						
  					var fileCallPath = encodeURIComponent ( obj.uploadPath+"/"+obj.uuid +"_"+obj.fileName);
  					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
  						
  					str += "<li "
  					str += "data-path='"+obj.uploadPath+"'data-uuid='" + obj.uuid+"'data-filename='"+obj.fileName+"'data-type='"+obj.fileType+"'><div>";
  					str += "<span>" + obj.fileName+"</span>";
  					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-primary btn-circle'>X<i class='fa fa-times'></i></button><br>";
  					str += "<img src='/resources/img/attach.png'></a>"
  					str += "</div>";
  					str +"</li>";
						
					}
			});
				
			uploadUL.append(str);
			}
		

		
		$(".uploadResult").on("click","button", function(e){

			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");

			
			$.ajax({
				url: '/free_board/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType:'text',
				type: 'POST',
				success: function(result){
						/* alert(result); */
						targetLi.remove();
					}
			});//$.ajax
		});
		
   });
      
</script>

    

    
    