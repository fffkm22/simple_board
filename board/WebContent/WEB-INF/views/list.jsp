<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.util.List"%>	
<%@ page import="nspr.model.Post"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/css.css" />
<title>게시판</title>
</head>
<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong><a href="${pageContext.request.contextPath}">공지사항</a></strong>
            <p>공지사항을 전달해드립니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                
                <%
					List<Post> list = (List) request.getAttribute("list");
                	DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yy-MM-dd");
                	DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm:ss");
                	String id = request.getParameter("id");
                
					for (Post a : list) {
						if (a.getPost_date().toLocalDateTime().format(formatter1).equals((LocalDateTime.now().format(formatter1)))) {
				%>
                <div>
                    <div class="num"><%= a.getPost_number() %></div>
                    <div class="title"><a href="view?no=<%= a.getPost_number() %>"><%= a.getPost_title() %></a></div>
                    
                    <div class="writer"><%= a.getPost_writer() %></div>
                    <div class="date"><%= a.getPost_date().toLocalDateTime().format(formatter2) %></div>
                    <div class="count"><%= a.getPost_hits() %></div>
                </div>
                <%
						} else {
				%>
				<div>
                    <div class="num"><%= a.getPost_number() %></div>
                    <div class="title"><a href="view?no=<%= a.getPost_number() %>"><%= a.getPost_title() %></a></div>
                    <div class="writer"><%= a.getPost_writer() %></div>
                    <div class="date"><%= a.getPost_date().toLocalDateTime().format(formatter1) %></div>
                    <div class="count"><%= a.getPost_hits() %></div>
                </div>
                 <%
						} 
					}
				%>
            </div>
            	<% 
					int pageN = (int) request.getAttribute("lastP");            	
            		int curPage = 1;
            		
            		try {
            			curPage = Integer.valueOf(request.getParameter("page"));
            		} catch (NullPointerException e){
            			
            		} catch (NumberFormatException e2) {
            			
            		}
            		
            		int result = curPage / 5;
            		int remain = curPage % 5;
            		
            		if (remain == 0) {
            			result--;
            		}
            	%>
            <div class="board_page">
               	<a href="${pageContext.request.contextPath}?page=1" class="bt first"><<</a>
               	<%
               		if(curPage > 5) { 
               	%>
                <a href="${pageContext.request.contextPath}?page=<%= curPage - 5 %>" class="bt prev"><</a>
                <%
               		} else {
               	%>
               	<a href="${pageContext.request.contextPath}?page=1" class="bt prev"><</a>
               	<%
               		}
               	%>
                
                <%
                	for (int i = (5 * result) + 1; i <= 5 * (result + 1); i++) { 
                		if (i <= pageN) {
                			if (i == curPage) {
                %>
                				<a href="${pageContext.request.contextPath}?page=<%= i %>" class="num on"><%= i %></a>
                <%		
                			} else { 
                %>	
                				<a href="${pageContext.request.contextPath}?page=<%= i %>" class="num"><%= i %></a>
                <%
                			}
                		} 
                	}
                %>
                 <%
                	if (curPage + 5 <= pageN) {
                %>	
               		 <a href="${pageContext.request.contextPath}?page=<%= curPage +5 %>" class="bt last">></a>
                <%	
                	} else {
                %>
               		 <a href="${pageContext.request.contextPath}?page=<%= pageN %>" class="bt last">></a>	
                <%		
                	}
                %>
                <a href="${pageContext.request.contextPath}?page=<%= pageN %>" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="${pageContext.request.contextPath}/write" class="on">등록</a>
            </div>
        </div>
    </div>
</body>
</html>
