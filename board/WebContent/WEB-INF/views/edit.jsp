<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="nspr.model.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/css.css" />
	<title>공지사항</title>
</head>
<body>
	<%
		Post post = (Post) request.getAttribute("post");
	%>
    <div class="board_wrap">
        <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 전달해드립니다.</p>
      </div>
      <div class="board_write_wrap">
        <div class="board_write">
          <form action="${pageContext.request.contextPath}/put?no=<%= request.getParameter("no")%>" method="post" >
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd>
                  <input type="text" name="title" placeholder="제목 입력" value="<%= post.getPost_title() %>" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" />
                </dd>
              </dl>
            </div>
            <div class="info">
              <dl>
                <dt>글쓴이</dt>
                <dd>
                  <input type="text" name="writer" placeholder="글쓴이 입력" value="<%= post.getPost_writer() %>" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" readonly/>
                </dd>
              </dl>
              <dl>
                <dt>비밀번호</dt>
                <dd>
                  <input type="password" name="password" placeholder="비밀번호 입력" value="<%= post.getPost_password() %>" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" />
                </dd>
              </dl>
            </div>
            <div class="cont">
              <textarea name="cont" placeholder="내용 입력"><%= post.getPost_content().replace("<br>", "\n") %></textarea>
            </div>
            <div class="bt_wrap">
              <input type="submit" class="on" value="수정" />
              <a href="javascript:history.back();">취소</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>