<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); 
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
        margin:auto;
        margin-top: 50px;
    }
    .list-area{
        border: 1px solid white;
        text-align: center;
    }
    .list-area>tbody>tr:hover{
    	background-color: gray;
    	cursor:pointer
    }
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">공지사항</h2>
        <br>

        <!-- 현재 로그인한 사용자가 관리자일 경우(admin) 보여질 div -->
        <%if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
        <div align="right" style="width: 850;">
            <!-- <button onclick="location.href = '요청할 url'">글작성</button>  -->
            <a href = "<%= contextPath %>/enrollForm.no" class = "btn btn-sm btn-secondary">글작성</a>
            <br><br>
        </div>
        <%}%>
        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- case1. 공지글이 없을 경우 -->
                <%if(list.isEmpty()) { %>
	                <tr>
	                    <td colspan="5">존재하는 공지사항이 없습니다.</td>
	                </tr>
				<% }else { %>
                <!-- case2.  -->
                <!-- (tr>td*5)*3 -->
                <% for(Notice n :list) { %>
                <tr>
                    <td><%= n.getNoticeNo() %></td>
                    <td><%= n.getNoticeTitle() %></td>
                    <td><%= n.getNoticeWriter() %></td>
                    <td><%= n.getCount() %></td>
                    <td><%= n.getCreateDate() %></td>
                </tr>
                <% } %>
			<% } %>
           </tbody>
        </table>

    </div>
    
    <script>
    	$(function(){
    		$(".list-area>tbody>tr").click(function(){
    			const num = $(this).children().eq(0).text();
    			//console.log(num);
    			
    			//요청할 url?키=벨류&키=벨류
    			//요청시 전달값 (키=벨류) == 쿼리스트링
    			
    			// /jsp/detail.no?num=클릭한글번호
    			location.href = '<%= contextPath %>/detail.no?num=' + num;
    			
    		})
    	})
    </script>

</body>
</html>