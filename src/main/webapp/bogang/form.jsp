<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
td{
	border: 1px solid grey;
}

th{
	border: 1px solid grey;
}

</style>
<body>
	<form action="form_process.jsp">
		<table class="table table-bordered">
			<tr>
				<th>아이디 </th>
				<td><input type="text" name="id" value=""></td>
			</tr>
			<tr>
				<th> 비번 </th>
				<td><input type="text" name="pw" value=""></td>
			</tr>
			<tr>
				<th>비번확인 </th>
				<td><input type="text" name="pw2" value=""></td>
			</tr>
			<tr>
				<th>이름 </th>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<th>생년월일 </th>
				<td><input type="date" name="bir" value=""></td>
			</tr>
			<tr>
				<th>이메일 </th>
				<td><input type="text" name="email" value=""> @
				<select name="domain">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;">
				<button type="submit">가입하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>