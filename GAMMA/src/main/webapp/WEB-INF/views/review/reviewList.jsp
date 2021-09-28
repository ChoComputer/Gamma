<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<form action="/review/reviewList/review.gnum" method="get">
			<select name="reviewType">
				<option value="" selected>���� ����</option>
				<option value="famous">�α� ��</option>
				<option value="new">�ֽ� ��</option>
			</select>
			<input type="submit" value="����">
		</form>
		<c:forEach var="review" items="${review}">
			<tr>
				<td>${review.cid}</td>
				<td>
					<c:choose>
						<c:when test="${review.grlike == 1}">��õ</c:when>
						<c:when test="${review.grlike == 0}">����õ</c:when>
					</c:choose>
				</td>
				<td>${review.grtitle}</td>
				<td>${review.grcontent}</td>
				<td>${review.grdate}</td>
			</tr>
			<hr/>
		</c:forEach>
	</div>
</body>
</html>