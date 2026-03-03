<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch17.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<html lang="en">

<head>
<%@ include file="/module/headPart.jsp"%>
</head>
<style>
.ellipsis {
    white-space: nowrap;        
    overflow: hidden;           
    text-overflow: ellipsis;  
}

img{
	width: 100px;
	height : 110px;
}
</style>
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
					 	<%
					 		BoardRepository dao = BoardRepository.getInstance();
					 		List<BoardFileVO> files = new ArrayList<BoardFileVO>();
					 		List<BoardVO> bList = dao.selectBoardList();
					 		
					 		for(BoardVO b : bList){
					 			if(b.getFileVO()!=null){
					 				files.add(b.getFileVO());
					 			}
					 		}
					 		int lastIdx = 0;
					 		if(files!=null && !files.isEmpty()){
					 			String tmp[] = files.get(0).getFileName().split("/");
					 			lastIdx = tmp.length-1;
					 		}
					 		
					 		pageContext.setAttribute("lastIdx", lastIdx);
					 		pageContext.setAttribute("files", files);
					 	%>

						<h5 class="ddit_chapter">메뉴 박스</h5>
						<p class="ddit_text pt-3"></p>
					 	<button type="button" id="boardBtn" class="ddit_btn ddit_btn_outline_primary">게시판</button>
						<button type="button" id="dbxBtn" class="ddit_btn ddit_btn_outline_danger">자료실</button>
						<button type="button" id="logoutBtn" class="ddit_btn ddit_btn_outline_warning">로그아웃</button>						
						
						<p class="ddit_text pt-5"></p>
						
						<h5 class="ddit_chapter">자료실</h5>
						<p class="ddit_text pt-3"></p>

						<div class="row">
							<c:forEach var="f" items="${files }">
								<div class="col-md-2">
									<div class="card">
										<div class="card-header ellipsis">
											${f.getFileName().split("/")[lastIdx] }
										</div>
										<c:choose>
											<c:when test="${fn:substringAfter(f.getFileName(),'.') ne 'jpg'}">
												<div class="card-body">
												<img src="/resources/images/fileIcon/${fn:substringAfter(f.getFileName(),'.') }.jpg" alt="${f.getFileName() }">
												Size : ${f.getFileSize() }byte
												</div>
											</c:when>
								
											<c:otherwise>
												<div class="card-body">
												<img src="${f.getFileName() }" alt="${f.getFileName() }">
												Size : ${f.getFileSize() }byte
												</div>
											</c:otherwise>
										</c:choose>
										<div class="card-footer">
											<a href="${f.getFileName() }" download="${f.getFileName().split("/")[lastIdx] }">Download</a>
										</div>
									</div>
								</div>
							</c:forEach>
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
const dbxbtn = document.querySelector("#dbxBtn");
const logoutbtn = document.querySelector("#logoutBtn");
const boardbtn = document.querySelector("#boardBtn");

dbxbtn.addEventListener("click", ()=>{
	location.href = "dropbox.jsp";
});

boardbtn.addEventListener("click", ()=>{
	location.href = "boardList.jsp";
});

logoutbtn.addEventListener("click", ()=>{
	location.href = "logout.jsp";
});

</script>
</html>