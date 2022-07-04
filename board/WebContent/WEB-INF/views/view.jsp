<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.List"%>	
<%@ page import="nspr.model.Post"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/css.css">
</head>
<body>
	<%
		Post post = (Post) request.getAttribute("post");
		DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yy-MM-dd HH:mm:ss");
	%>
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 전달해드립니다.</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <%= post.getPost_title() %>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%= post.getPost_number() %></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%= post.getPost_writer() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%= post.getPost_date().toLocalDateTime().format(formatter1) %></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><%= post.getPost_hits() %></dd>
                    </dl>
                </div>
                <div class="cont">
                <%= post.getPost_content() %>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="${pageContext.request.contextPath}/re" class="on">목록</a>
                <a href="edit?no=<%= post.getPost_number() %>">수정</a>
                <a href="delete?no=<%= post.getPost_number() %>">삭제</a>
            </div>
        </div>
    </div>
</body>
</html>