<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${gameTitle} ����</title>
</head>
<body>
	<div class="body">
		<form action="/gameinfo/" method="get">
			<input type="submit" value="���ư���">
		</form>
		<form action="/review/reviewList/${gameNum}" method="get">
			<select name="listKind">
				<option value="" selected>���� ����</option>
				<option value="famous">�α� ��</option>
				<option value="new">�ֽ� ��</option>
			</select>
			<input type="submit" value="����">
		</form>
		<div id="review">
			<c:forEach var="review" items="${review}">
				<tr>
					<td>${review.cid}</td>
					<td>
						<c:choose>
							<c:when test="${review.grlike == 1}">��õ</c:when>
							<c:when test="${review.grlike == 0}">����õ</c:when>
						</c:choose>
					</td>
					<td>
						<a href="/review/reviewDetail/${review.grnum}">${review.grtitle}</a>
					</td>
					<td>${review.grcontent}</td>
					<td>${review.grrecommend}</td>
					<td>${review.grdate}</td>
				</tr>
				<hr/>
			</c:forEach>
		</div>
	</div>
</body>
</html>