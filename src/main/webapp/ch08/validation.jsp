<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH08") %></h1>
			<p class="services_text">각 챕터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<h5 class="ddit_chapter2">유효성 검사를 위한 스크립트 이벤트</h5>
						
						<p class="ddit_text pt-3 pb-1">무작정 테스트해보기</p>
						<form action="validation_process.jsp" id="testForm" method="post">
							아이디 : <input type="text" name="id" id="testId"/><br>
							비밀번호 : <input type="text" name="pw" id="testPw"/><br>
							<input type="submit" id="testBtn" value="전송"/><br>
						</form>
						
						<p class="ddit_text pt-3 pb-1">자바스크립트 onsubmit</p>
						<form action="validation_process.jsp" id="loginForm" name="loginForm"
								 method="post" onsubmit="return submitEvent()">
						 <!-- return없이 submitEvent()만 쓰면 결과값 상관없이 무조건 전송함, return을 써서 submitEvent()가 유효성 검사후 리턴을 하면(false or true) 그 때 전송 결정 -->
							아이디 : <input type="text" name="id" /><br>
							비밀번호 : <input type="text" name="pw" /><br>
							<input type="submit" value="전송"/><br>
						</form>

						<p class="ddit_text pt-3 pb-1">JQuery Form을 이용한 submit</p>
						<form action="validation_process.jsp" id="loginForm2" method="post">
							아이디 : <input type="text" name="id2" id="id2"/><br>
							비밀번호 : <input type="text" name="pw2" id="pw2" /><br>
							<input type="submit" value="전송"/><br>
						</form>
						
						<p class="ddit_text pt-3 pb-1">JQuery button을 이용한 click</p>
						<form action="validation_process.jsp" id="loginForm3" method="post">
							아이디 : <input type="text" name="id2" id="id3"/><br>
							비밀번호 : <input type="text" name="pw2" id="pw3" /><br>
							<input type="button" id="sendBtn" value="전송"/><br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
<script type="text/javascript">
// 자바스크립트 onsubmit이벤트
function submitEvent(){
	console.log("자바스크립트 이벤트 핸들러 실행...!");
	
	// document안에 구성된 name속성을 이용해 값 가져오기(id, pw)
	let id = document.loginForm.id.value;
	let pw = document.loginForm.pw.value;
	
	if(id==null || id==""){
		alert("아이디가 누락되었습니다!");
		return false;
	}
	if(pw==null || pw==""){
		alert("비밀번호가 누락되었습니다!");
		return false;
	}
	// 현재 동작시킨 이벤트는 submit 이벤트를 포함하고 있는 이벤트입니다.
	// 그렇기 때문에 Form 태그를 활용한 이벤트를 별도로 줄 필요가 없습니다.
}

// 제이쿼리 ready function은 document가 전부 읽히고 나서 이후에 실행될 영역이다.
$(function(){
	// 버튼 태그를 testBtn변수에 담는다
	let testBtn = $("#testBtn");
	
	// jquery form태그를 이용한 submit --------
	let loginForm2 =$("#loginForm2");
	
	// jquery button태그를 이용한 click
	let sendBtn = $("#sendBtn");
	let loginForm3 = $("#loginForm3");
	
	// 변수로 설정된 태그 객체를 Click 이벤트 핸들러 생성
	// 무작정 테스트해보기
	testBtn.on("click",function(){
		let testId = $("#testId").val();	// 아이디 값
		let testPw = $("#testPw").val();	// 비밀번호 값
		
		// 유효성 검사
		// 조건문 작성법은 다양한 방법으로 작성할 수 있습니다.
		// 아이디가 입력되었는지 입력되지 않았는지를 체크하기 위해서 null과 공백 체크에 대한 조건문 작성은
		// if(testId == null || testId == "") or if(!testId)와 같은 방법으로 작성할 수 있습니다.
		// 두 작성법에 속도차이는 미미합니다. 단지, 가독성에 차이 말고는 없는것이죠.
		// 하지만, 내가 비교할 때 조건의 대상을 명시적으로 작성하고자 한다면 전자의 방법으로 작성해야 합니다.
		// if(!testId)는 null, 공백, undifined, NaN 등등을 체크합니다.	
		if(!testId){
			alert("아이디를 입력해주세요");
			// 이와 같은 return; 문은 boolean 타입의 true, false값 중 default에 해당하는 false를
			// 리턴하는것처럼 보이지만, 실제로는 'undefined'를 리턴합니다.
			// 그렇기 떄문에 해당함수를 종료하기 위한 false를 명확하게 리턴합니다.
			return false;
		}
		
		if(!testPw){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		$("#testForm").submit();
	});
	
	// Jquery form을 이용한 submit
	loginForm2.submit(function(event){
		console.log("loginForm2.submint 이벤트 실행");

		// 해당 이벤트가 곧 submit이벤트이기 때문에 해당 이벤트를 block한다.
		
		// 우리가 submit이벤트 자체를 핸들링하기 위해서 submit이벤트를 작성합니다.
		// 이때, submit이벤트 자체를 block하기 위해 preventDefault() 구분을 작성합니다.
		// 순수한 마음에서 block하지만, 여기서부터 크나큰 오루가 발생합니다.
		// submit이벤트를 죽이긴 했지만, 아래 loginForm2.submit() 이벤트가 다시 살아나면서
		// 현재 만들어둔 이벤트를 재실행하는 효과를 불러옵니다.
		// 그렇게되면, stack정보에 내가 만든 submit 이벤트를 또 부르게 되는 현상이 발생합니다.
		// 메모리에 stack하나하나가 쌓이면서 stack 공간을 채우다 결국은 서버가 터져버립니다.
		// 그래서 submit이벤트 자체를 핸들링 할거라면 block 이벤트가 아닌 return false와 같은
		// 이벤트로 상황에 맞게 이벤트를 구성할 수 있어야합니다.
		
		//event.preventDefault();
		
		let id = $("#id2").val();
		let pw = $("#pw2").val();
		
		if(id==null || id==""){
			alert("아이디가 누락되었습니다!");
			return false;
		}
		if(pw==null || pw==""){
			alert("비밀번호가 누락되었습니다!");
			return false;
		}
		loginForm2.submit();	
	});
	
	// jquery button을 이용한 click
	// .on("click", function()) 내부에서 발생하는 return false;는 단순히 함수 종료를 넘어 브라우저의
	// 기본 동작 및 버블링을 막습니다.
	// 버블링 : 자식 요소를 클릭 시, 해당 클릭 이벤트가 부모요소, 그 위의 조상 요소들까지 차례대로 전달되는 과정을 이야기합니다.
	sendBtn.on("click",function(){
		console.log("sendBtn 이벤트 실행");

		let id = $("#id3").val();
		let pw = $("#pw3").val();
		
		if(id == null || id == "" ){
			alert("아이디가 누락되었습니다!");
			return false;
		}
		if(pw == null || pw == "" ){
			alert("비밀번호가 누락되었습니다!");
			return false;
		}
		loginForm3.submit();	// 수동으로 이벤트 처리할 수 있도록 작성
	})
});

</script>
</html>