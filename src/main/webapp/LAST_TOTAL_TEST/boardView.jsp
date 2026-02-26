<%@ page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@ page import="kr.or.ddit.ch17.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
							게시판 상세보기 페이지 입니다.
							1. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
							2. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
								> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제를 처리하기 위해 boardRemove.jsp로 이동하여 처리해주세요.
								> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
							3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
						-->
						<%
							String no = (String)request.getParameter("no");
							//out.print("<p>" + no + "</p>");
							BoardRepository dao = BoardRepository.getInstance();
							BoardVO boardVO = dao.getBoardById(Integer.parseInt(no));
							//out.print("<p>" + boardVO.getNo() + "</p>");
							
							String q = "boardUpdateForm.jsp?" + "no=" + no;  
							pageContext.setAttribute("q", q);
							pageContext.setAttribute("boardVO", boardVO);
						%>
						
						<h5 class="ddit_chapter">게시글 상세보기</h5>
						<p class="ddit_text pt-3"></p>
						<table class="table table-bordered">
							<tr>
								<td>제목</td>
								<td>${boardVO.getTitle()}</td>
							</tr>
							<tr>
								<td colspan="2">작성자 : ${boardVO.getWriter()} &nbsp;등록일 : ${boardVO.getRegDate()} 조회수 : ${boardVO.getHit() }</td>
							</tr>
							<tr>
								<td colspan="2" style="white-space: pre-wrap;">${boardVO.getContent()}</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td>
									${boardVO.getFileVO().getFileName().split("/")[3]}
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="button" class="ddit_btn ddit_btn_outline_warning" id="udtBtn">수정</button>
									<button type="button" class="ddit_btn ddit_btn_outline_danger" id="delBtn">삭제</button>
									<button type="button" class="ddit_btn ddit_btn_outline_primary" id="listBtn">목록</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
<script>
const udtbtn = document.querySelector("#udtBtn");
const delbtn = document.querySelector("#delBtn");
const listbtn = document.querySelector("#listBtn");

udtbtn.addEventListener("click",()=>{
	location.href = "${q}";
});

</script>
</html>