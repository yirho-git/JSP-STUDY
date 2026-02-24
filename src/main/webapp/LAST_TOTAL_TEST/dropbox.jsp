<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>

<body>
	<%@ include file="/module/header2.jsp"%>
	
	<div class="services_section layout_padding">
		<div class="container">
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH17") %></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!-- 
						자료실 페이지입니다.
						1. 게시판에서 등록했던 게시글에 포함된 모든 파일들을 자료실에서 목록으로 출력해주세요.
						2. 파일 출력
							> 업로드 된 파일이 이미지 파일인경우, 이미지 썸네일을 [이미지]에 출력해주세요.
							> 이미지 파일이 아닌 일반 파일일경우, 확장자에 일치하는 아이콘으로 파일의 이미지를 출력해주세요.
						3. 다운로드를 클릭 하면 다운로드가 가능하게 해주세요. 
					 -->
						<h5 class="ddit_chapter">메뉴 박스</h5>
						<p class="ddit_text pt-3"></p>
					 	<button type="button" class="ddit_btn ddit_btn_outline_primary">게시판</button>
						<button type="button" class="ddit_btn ddit_btn_outline_danger">자료실</button>
						<button type="button" class="ddit_btn ddit_btn_outline_warning">로그아웃</button>						
						
						<p class="ddit_text pt-5"></p>
						
						<h5 class="ddit_chapter">자료실</h5>
						<p class="ddit_text pt-3"></p>

						<div class="row">
							<div class="col-md-2">
								<div class="card">
									<div class="card-header">
										[파일명을 출력해주세요.]
									</div>
									<div class="card-body">
										[썸네일 이미지 또는 확장자에 맞는 아이콘 이미지를 출력해주세요.]
										Size : [파일 크기를 출력해주세요.]
									</div>
									<div class="card-footer">
										<a href="">Download</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>