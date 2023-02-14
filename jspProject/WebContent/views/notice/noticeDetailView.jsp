<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
	// 글번호, 제목, 내용, 작성자 아이디, 작성일
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
        background-color: black;
        color: white;
        width: 1000px;
        height: 500px;
        margin: auto;
        margin-top: 50px;
    }
</style>
</head>
<body>
    <body>
        <%@ include file = "../common/menubar.jsp" %>
    
        <div class="outer" align="center">
            <br>
            <h2 align="center">공지사항 상세보기</h2>
            <br>
            
            <table id="detail-area" border="1">
                <tr>
                    <th width="70">제목</th>
                    <td colspan="3" width="430"><%= n.getNoticeTitle() %></td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%= n.getNoticeWriter() %></td>
                    <th>작성일</th>
                    <td><%= n.getCreateDate() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <p style="height: 150px"><%= n.getNoticeContent() %></p>
                    </td>
                </tr>
            </table>
            <br><br>

            <div>
                <a href="<%= contextPath %>/list.no" class="btn btn-sm btn-secondary">목록가기</a>

                <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우 -->
                <%if(loginUser != null && n.getNoticeWriter().equals(loginUser.getUserId())){ %>
                    <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-warning">수정하기</a>
                    <a href="<%= contextPath %>/delete.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">삭제하기</a>
                <%} %>
            </div>
        </div>
        
        <!-- 공지사항 삭제 Modal -->
		<div class="modal" id="deleteModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">공지사항 삭제</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
              
              <form action="<%= contextPath %>/delete.no?num=<%= n.getNoticeNo() %>" method="post">
                <b>삭제 후 복구가 불가능 합니다. <br> 정말로 삭제하시겠습니까?</b><br><br>
                <button class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
				<button type="submit" class="btn btn-sm btn-danger">삭제</button>                
              </form>
            
            </div>
      
          </div>
        </div>
      </div>
        
</body>
</html>