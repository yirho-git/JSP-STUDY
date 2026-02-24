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
							각 학생들의 자리를 서로 바꿔주세요. 첫번째 학생을 선택했을 때 선택된 영역을 확인할 수 있도록 배경색을 변경해주세요.<br/>
							두번째 학생을 선택했을 때 첫번째 학생과 자리를 변경 후, 선택된 학생들의 내역을 출력해주세요.
						</p>
						<caption>앞(SEM PC 자리)</caption>
						<table class="table table-bordered" style="text-align:center; font-size:24px;">
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
								<td>[본인의 이름으로 작성해주세요!]</td>
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
						
						<h5 class="ddit_chapter">History : <span id="process"></span></h5>
						<p class="ddit_text pt-3 pb-2"></p>
						<button type="button" class="ddit_btn ddit_btn_outline_primary" id="clickBtn">출력</button>
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
	let td = $("td");
	let html = "";
	let ele = null;
	let ele2 = null;
	let w1 = "";
	let w2 = "";
	let span = $("#process");
	
	let flag = true;
	td.on("click", function(){

		console.log("클릭됨");
		
		if(flag){
			ele = $(this);
			if(!ele.text()){
				ele.css("background-color", "red");
				return;
			}
			ele.css("background-color", "yellow");
			w1 = ele.text();
			flag = !flag;
		}
		else{
			ele2 = $(this);
			if(!ele2.text()){
				ele2.css("background-color", "red");
				return;
			}
			ele2.css("background-color", "yellow");
			w2 = ele2.text();
			let temp = w2;
			ele2.text(w1);
			ele.text(temp);
			
			ele.css("background-color", "white");
			ele2.css("background-color", "white");
			flag = !flag;
		}
		
	});
});

</script>
</html>