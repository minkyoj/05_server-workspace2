<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="../common/menubar.jsp"/>
    
        <div class="outer" align="center">
            <br>
            <h2 align="center">공지사항 상세보기</h2>
            <br>
            
            <table id="detail-area" border="1">
                <tr>
                    <th width="70">제목</th>
                    <td colspan="3" width="430">${n.noticeTitle }</td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${n.noticeWriter }</td>
                    <th>작성일</th>
                    <td>${n.createDate }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <p style="height: 150px">${n.noticeContent }</p>
                    </td>
                </tr>
            </table>
            <br><br>

            <div>
                <a href="list.no" class="btn btn-sm btn-secondary">목록가기</a>

                <c:if test="${not empty loginUser and n.noticeWriter eq loginUser.userId}">
                    <a href="updateForm.no?num=${n.noticeNo }" class="btn btn-sm btn-warning">수정하기</a>
                    <a href="delete.no?num=${n.noticeNo }" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">삭제하기</a>
                </c:if>
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
              
              <form action="delete.no?num=${n.noticeNo }" method="post">
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