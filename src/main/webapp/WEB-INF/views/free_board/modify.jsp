<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<div class='bigPictureWrapper'>
  <div class='bigPicture'></div>
</div>
<style>
.uploadResult {
  width: 100%;
  background-color: white;
}

.uploadResult ul {
  display: flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}

.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}

.uploadResult ul li img {
  width: 100px;
}

.uploadResult ul li span {
  color: gray;
}

.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top: 0%;
  width: 100%;
  height: 100%;
  background-color: white;
  z-index: 100;
  background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width: 100%;
}
</style>
<!-- Page Content -->
<div id="page-wrapper">
  <div class="container-fluid">
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-20">
        <h4 class="page-title">자유게시판</h4>
      </div>
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
          <form class="myForm" action="/free_board/modify" method="post">
            <input type='hidden' name='bno' value='${board.bno}'>
            <div class="form-group">
              <label class="col-md-20">TITLE</label>
              <div class="col-md-20">
                <input type="text" class="form-control form-control-line" name='title' value='<c:out value="${board.title}"/>'>
              </div>
            </div>
            <div class="form-group">
              <label class="col-md-20">WRITER</label>
              <div class="col-md-20">
                <input type="text" class="form-control form-control-line" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
              </div>
            </div>
            <div class="form-group">
              <label class="col-md-12">CONTENT</label>
              <div class="col-md-12">
                <textarea rows="12" class="form-control form-control-line" name='content'>
                                        <c:out value="${board.content}" /></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-md-20">FILES</label>
              <div class="col-md-20">
                <div class="form-control form-control-line">
                  <input type="file" class="fileinput btn-primary" name="uploadFile" id="filename" title="Browse file" multiple />
                  <div class='uploadResult'>
                    <ul>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <button id="modifyBtn" type="submit" data-oper='modify' class="btn btn-success">수정하기</button>
          </form>
          <!-- div class="white-box" end -->
        </div>
        <!-- div class="col-md-8 col-xs-20" end -->
      </div>
      <!-- table-responsive end -->
    </div>

    <form role="form" action="/free_board/remove" method="post">
      <input type='hidden' name='bno' value='${board.bno}'>
      <button type="submit" data-oper='remove' class="btn btn-warning">삭제하기</button>
    </form>
    <form role="form" action="/free_board/read" method="get">
      <input type='hidden' name='bno' value='${board.bno}'>
      <button type="submit" data-oper='read' class="btn btn-danger">돌아가기</button>
    </form>
  </div>
</div>
<!-- /.row -->
<!-- /.container-fluid -->
<%@include file="../includes/footer.jsp"%>

<script>
$(document).ready(function(){
	
	var formObj = $(".myForm");
	
	$("#modifyBtn").on("click", function(e){
			e.preventDefault();
		
		console.log("modify clicked");
		
		var str ="";
		
		$(".uploadResult ul li").each(function(i,obj){
			
			var jobj = $(obj);
			
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		
		
		formObj.append(str).submit();
	});
	
	
	var bno = '<c:out value="${pageObj.bno}"/>';
	
	$.getJSON("/free_board/getAttachList", {bno: bno}, function(arr){
		console.log(arr);
		
		var str ="";
		
		$(arr).each(function(i,attach){
			
			//image type
			if(attach.fileType){
				var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+ attach.uuid + "_" + attach.fileName);
				var fileCallPathOrigin = encodeURIComponent(attach.uploadPath+ "/"+ attach.uuid + "_" + attach.fileName);
				
				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				str += "<span><font color='black'> "+ attach.fileName+ "</font></a></span><br/>";
				str += "<a href='#' data-file=\'"+fileCallPath+"\'data-type='image' class='panel-remove'><span class='fa fa-times'></span></a><br>";
				str += "<img src='/free_board/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				
				str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
				str += "<span><font color='black'> "+ attach.fileName+ "</font></span><br/>";
				str += "<a href='#' data-file=\'"+fileCallPath+"\'data-type='image' class='panel-remove'><span class='fa fa-times'></span></a><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}
		});
		
		$(".uploadResult ul").html(str);
	}); //end getjson
	
});
	$(".uploadResult").on("click","a", function(e){
		console.log("delete file");
	
		if(confirm("Remove this file?")){
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/free_board/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType:'text',
				type: 'POST',
					success: function(result){
						alert(result);
						targetLi.remove();
					}
		});
	};


	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
	
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
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
		formData.append("uploadFile",files[i]);
	}
	
	$.ajax({
		url: '/free_board/uploadAjaxAction',
		processData: false,
		contentType: false,
		data: formData,
		dataType:'json',
		success: function(result){
			console.log(result);
			
		showUploadResult(result);
		}
	});
});
	
	function showUploadResult(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0){return; }
	
	var uploadUL = $(".uploadResult ul");
	var str="";
	
	
	$(uploadResultArr).each(function(i,obj){
		
		if(obj.fileType){
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			
			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid + "' data-filename='"+obj.fileName+"'data-type='"+obj.fileType+"'"
			str +  "><div>";
			str += "<span>" + obj.fileName + "</span>";
			str += "<a href='#' data-file=\'"+fileCallPath+"\'data-type='image' class='panel-remove'><span class='fa fa-times'></span></a><br>";
			str += "<img src='/free_board/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str += "</li>";
		}else{
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			
			str += "<li "
			str += "data-path='"+obj.uploadPath+"'data-uuid='" + obj.uuid+"'data-filename='"+obj.fileName+"'data-type='"+obj.fileType+"'><div>";
			str += "<span>" + obj.fileName + "</span>";
			str += "<a href='#' data-file=\'"+fileCallPath+"\'data-type='file' class='panel-remove'><span class='fa fa-times'></span></a><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str += "</li>";
			
		}
	});
		uploadUL.append(str);
	};
	
	});
</script>