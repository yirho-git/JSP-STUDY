<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>

<style>
#etcInput {
 display: inline-block;
}
</style>

</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH06") %></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<p class="ddit_text">
							[ 문제 ]<br/>
							1. 타입, 아이디, 비밀번호, 이름 , 핸드폰번호, 성별, 취미, 가입인사 입력 폼양식을 만들고 ch06_test_process.jsp로 결과를 전송해주세요.<br/>
							2. 항목별 설정 내용을 참고해서 작성해주세요.<br/>
							　- 타입 : 사용자(user) / 관리자(admin)을 선택할 수 있는 입력 양식을 만들어주세요.<br/>
							　- 아이디 : 아이디를 입력 받을 수 있는 양식으로 만들어주세요.<br/>
							　- 비밀번호 : 비밀번호를 입력 받을 수 있는 양식으로 만들어주세요.<br/>
							　- 이름 : 이름을 입력 받을 수 있는 양식으로 만들어주세요.<br/>
							　- 핸드폰번호 : 첫번째 자리는 010,011,016,017,019,070을 선택 할 수 있도록 입력 양식을 만들어주세요.<br/>
							　　　　　　　두번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.<br/>
							　　　　　　　세번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.<br/>
							　- 성별 : 남자(male), 여자(female)로 선택 할 수 있는 입력 양식을 만들어주세요.(value : male / female)<br/>
							　- 취미 : 개발(development), 독서(book), 영화감상(movie), 음악감상(music), 운동(sports), 기타(etc)<br/>
							　　　　기타 일 때는 직접 입력할 수 있는 입력 양식이 동적으로 생성되어 입력 양식이 나타나게 해주세요.<br/>
							　- 가입인사 : 가입인사를 문장으로 입력 할 수 있는 입력 양식으로 만들어주세요.<br/>
							3. 입력된 데이터를 ch06_test_process.jsp로 전송 후 결과를 출력해주세요.<br/>
						</p>
						<form action="ch06_test_process.jsp" name="member" method="post">
							타입 <select name="type">
									<option value="user" selected>사용자</option>
									<option value="admin" selected>관리자</option>
								</select><br>
							아이디 <input type="text" id="id" name="id"/><br>
							비밀번호 <input type="text" id="pw" name="pw"/><br>
							이름 <input type="text" id="name" name="name"/><br>
							연락처 <select name="phone1"> 
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
										<option value="070">070</option>
								  </select> - 
								  <input type="text" id="phone2" name="phone2" maxlength="4" size="4"/>
								  <input type="text" id="phone3" name="phone3" maxlength="4" size="4"/><br>
							성별 <input type="radio" name="gender" value="male" checked="checked"/>남자
								  <input type="radio" name="gender" value="female"/>여자<br>
							취미 <input type="checkbox" name="hobby" value="development"/>개발 
								<input type="checkbox" name="hobby" value="book"/>독서
								<input type="checkbox" name="hobby" value="sports"/>운동  
								<input type="checkbox" name="hobby" value="movie"/>영화감상	  
								<input type="checkbox" name="hobby" value="music"/>음악감상
								<input type="checkbox" name="hobby" id="checkEtc" value="etc"/> etc &nbsp;&nbsp; 
								<input type="text" id="etcInput" name="etcInput" style="display:none;" placeholder=" 기타 취미 입력"/><br>
								<!-- visibility: hidden, visible; 보다 display: none, block;을 더 많이 쓴다고 함 -->
							 <textarea rows="10" cols="100" name="comment" placeholder="가입 인사를 입력해주세요" wrap="hard"> </textarea><br>
							 <input type="submit" value="전송">
							 <input type="reset" value="리셋">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>

</body>
	
<script>

document.addEventListener("DOMContentLoaded", function(){
	const checkEtc = document.getElementById("checkEtc");
	const etcInput = document.getElementById("etcInput");
	
	checkEtc.addEventListener("change", function(){
		
		etcInput.style.display = checkEtc.checked? "inline-block" : "none";		
		
// 		if(checkEtc.checked) etcInput.style.display = "inline-block";
// 		else etcInput.style.display = "none";
	});
});

</script>
	
</html>