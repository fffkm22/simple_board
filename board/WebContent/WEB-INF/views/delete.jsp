<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시글 삭제</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/css.css">
<style type="text/css">
</style>

</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 전달해드립니다.</p>
		</div>
		<div style="border-top: 2px solid #000;"></div>

		<div class="password_box">
			<p class="text">비밀번호를 입력하세요.</p>
			<form name="password_box"
				action="${pageContext.request.contextPath}/delete?no=<%= request.getParameter("no")%>"
				method="post" onsubmit="return checkform()">
				<input class="password_input" type="password" id="password"
					name="password" />
				<div class="bt_wrap" style="margin-top: 10px;">
					<input type="submit" value="삭제" /> <a
						href="javascript:history.back();">취소</a>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	function checkform() {
		var ps = "${password}";
		var input = document.password_box.password.value;

		if (ps != input) {
			alert('비밀번호가 다릅니다.');
			return false
		} else if (ps == input) {
			if (confirm("삭제하면 복구 할 수 없습니다.\n삭제하시겠습니까?") == true) {
				return true;
			} else {
				return false
			}
		}

	}
</script>
</html>