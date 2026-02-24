<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>
<style>
</style>
<body>
	<%@ include file="/module/header2.jsp"%>

	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital">SCRIPT TEST - Quest02</h1>
			<p class="services_text">스크립트 이벤트를 활용해 문제를 해결할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<h5 class="ddit_chapter">스크립트 두번째 문제!</h5>
						<p class="ddit_text pt-3 pb-2">
							각 학생들의 자리를 서로 바꿔주세요. 첫번째 학생을 선택했을 때 선택된 영역을 확인할 수 있도록 배경색을
							변경해주세요.<br /> 두번째 학생을 선택했을 때 첫번째 학생과 자리를 변경 후, 선택된 학생들의 내역을
							출력해주세요.
						</p>
						<caption>앞(SEM PC 자리)</caption>
						<table class="table table-bordered"
							style="text-align: center; font-size: 24px;">
							<tr height="80px">
								<td width="10%"></td>
								<td width="10%">정준하</td>
								<td width="10%">노홍철</td>
								<td width="10%">박나래</td>
								<td width="20%"></td>
								<td width="10%">전현무</td>
								<td width="10%">유재석</td>
								<td width="10%">길성준</td>
								<td width="10%">하하</td>
							</tr>
							<tr height="80px">
								<td>김연아</td>
								<td>김희선</td>
								<td>손연재</td>
								<td>박명수</td>
								<td></td>
								<td>아이유</td>
								<td>홍길동</td>
								<td>홍길순</td>
								<td>김철수</td>
							</tr>
							<tr height="80px">
								<td>데프콘</td>
								<td>강호동</td>
								<td>이승기</td>
								<td>박상민</td>
								<td></td>
								<td>김영철</td>
								<td>서장훈</td>
								<td>민경훈</td>
								<td></td>
							</tr>
							<tr height="80px">
								<td>짱구</td>
								<td>대장금</td>
								<td>홍해인</td>
								<td>백현우</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>

						<h5 class="ddit_chapter">
							History : <span id="process"></span>
						</h5>
						<p class="ddit_text pt-3 pb-2"></p>
						<button type="button" class="ddit_btn ddit_btn_outline_primary"
							id="clickBtn">출력</button>
						<div class="row pt-3">
							<h5 class="ddit_chapter">결과</h5>
							<div class="col-md-12 pt-3" id="output"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>

</body>

<script>
$(function(){
	let nameBox = "";		//이름을 담을 공간
 	let elementBox = null;	//선택된 Element를 담을 공간
 	let flag = false; 		//스위칭으로 사용할 flag(첫번째(false)눌렀는지? 두번째 (true) 눌렀는지?)
 	
 	// elements 설정
 	let td =$("td");
 	let process = $("#process"); //겨로가 내역을 출력하는 element
 	let output = $("#output");	//현재의 자리가 그대로 출력될 공간
 	let clickBtn = $("#clickBtn"); 	//출력 버튼
 	
 	//학생 자리 옮기기 위한 이벤트(td클릭시)
 	td.on("click", function(){
 		let tdt = $(this).text(); //현재 td를 누른 학생의 이름을 가져온다.
 	
 		if(tdt == null || tdt == ""){
 			process.html("빈 공간은 선택할 수 없습니다!").css("color","red");
 			return false;
 		}
 		
 		
 		if(flag){ //두번째 학생을 클릭했구나?
 			flag = false; //두번째 학생을 클릭한 상태
 			elementBox.html(tdt);  // 첫번째 학생에 이름을 두번째 td요소의 텍스트로 넣는다.
			
 			//내력 남기기
 			process.html(nameBox+ "님과" + tdt + "님을 변경합니다!").css("color", "black");
 			$(this).html(nameBox); // 두번째 학생의 td요소에 첫번째 학생의 이름을 넣는다.
 			
 			nameBox = "";
 			elementBox = null;
 			
 			td.css("background", "white"); //모든 td의 배경색 원상복구(하얀색)
 		}else{  //첫번째 학생을 클릭했구나?
 			flag =true; //첫번째 학생을 클릭한 상태
 			nameBox = tdt; //첫번째 학생의 이름을 담습니다.
 			elementBox = $(this); //첫번째 학생의 td element를 담습니다.
			$(this).css("background-color", "yellow"); //첫번째 학생 배경색 변경(노란색)
			
			process.html(tdt + "님과").css("color","black");
 		}
 	});
 	
 	// 출력 버튼 클릭시 (현재 앉은 자리 출력 위한 이벤트)
 	clickBtn.on("click",function(){
 		output.html("");
 		let tds = document.getElementsByTagName("td");
 		
 		let html = "<table class='table table=bordered' style='text-align:center; fond-size:24px;'><tr>";
 		
 		//index를 1부터 시작하므로, 길이만큼 같은 조건으로 반복문을 돌리고 td요소를 가져올 때는
 		//1부터 시작이므로 0부터 시작할 수 있는 index의 계산법(i-1)으로 한다.
 		for(let i = 1; i <= tds.length; i++){
 			if(tds[i-1].innerText == "짱구"){
 				html += "<td width='10%'><marquee><font color='blue'>" +
 						tds[i-1].innerText + "</font></marquee></td>";
 			}else{
				html += "<td width='10%'>"+ tds[i-1].innerText+"</td>";
 		}
 		
 		if(i % 9 == 0 && i< tds.length){
 			html += "</tr><tr>";
 		}
 		}
 		html += "</tr></table>";
 		output.html(html);
 	});
});

</script>
</html>