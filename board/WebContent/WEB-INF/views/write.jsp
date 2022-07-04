<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resource/css/css.css"
    />
  </head>
  <body>
    <div class="board_wrap">
      <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 전달해드립니다.</p>
      </div>
      <div class="board_write_wrap">
        <div class="board_write">
          <form action="${pageContext.request.contextPath}/" method="post" >
            <div class="title">
              <dl>
                <dt>제목</dt>
                <dd>
                  <input type="text" name="title" placeholder="제목 입력" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" />
                </dd>
              </dl>
            </div>
            <div class="info">
              <dl>
                <dt>글쓴이</dt>
                <dd>
                  <input type="text" name="writer" placeholder="글쓴이 입력" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" />
                </dd>
              </dl>
              <dl>
                <dt>비밀번호</dt>
                <dd>
                  <input type="password" name="password" placeholder="비밀번호 입력" onkeypress="if(event.keyCode=='13'){event.preventDefault();}" />
                </dd>
              </dl>
            </div>
            <div class="cont">
              <textarea name="cont" placeholder="내용 입력"></textarea>
            </div>
            <div class="bt_wrap">
              <input type="submit" class="on" value="등록" />
              <a href="${pageContext.request.contextPath}">취소</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
