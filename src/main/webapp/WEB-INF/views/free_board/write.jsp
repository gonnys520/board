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
                                        <button type="submit" class="btn btn-success">작성완료</button>
                                        </form>
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
          
    
    <%@include file="../includes/footer.jsp" %>