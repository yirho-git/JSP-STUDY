<%@page import="kr.or.ddit.ch17.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
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
							게시판 수정 페이지입니다.
							1. 수정 버튼 클릭 시, 게시글 수정을 진행하기 위해 boardUpdate.jsp로 이동 후 수정 처리를 진행해주세요.
							2. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
						-->
						<%
							Integer no = Integer.parseInt(request.getParameter("no"));						
							//out.print(no);	
							BoardRepository dao = BoardRepository.getInstance();
							BoardVO board = dao.getBoardById(no);
							String filename = "";
							
							if(board.getFileVO()!=null){
								String[] temp = board.getFileVO().getFileName().split("/");
								filename = temp[temp.length-1];													
							}
							//out.println("<p class='ddit_text'>"+ filename + "</p");
							pageContext.setAttribute("board", board);
							pageContext.setAttribute("filename", filename);							
						%>
					 	<h5 class="ddit_chapter">게시판 수정</h5>
						<form action="boardUpdate.jsp" method="post" id="udtForm">
							<input type="hidden" name="no" value="${board.no }"/>
							<table class="table table-bordered">
								<tr>
									<td>제목</td>
									<td><input type="text" class="form-control" name="title" id="title" value="${board.title }"/></td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
										<textarea class="form-control" rows="8" cols="30" id="content" name="content">${board.content }</textarea>
									</td>
								</tr>
								<tr>
									<td>파일</td>
									<td><input type="file" class="form-control" name="filename" value=""/></td>
								</tr>
								<tr>
									<td>첨부파일 내용</td>
									<td>
										${filename }
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-warning" id="udtBtn">수정</button>
										<button type="button" class="btn btn-primary" id="cancelBtn">취소</button>
									</td>
								</tr>
							</table>
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
const udtbtn = document.querySelector("#udtBtn");
const cancel = document.querySelector("#cancelBtn");
const user = "${sessionScope.SessionInfo[0]}";
const writer = "${board.writer}";

udtbtn.addEventListener("click",()=>{
	if(user == null || user != writer){
		alert("작성자가 아닙니다");
		return;
	}
	location.href = "boardUpdateForm.jsp?no=${param.no}";
});

cancel.addEventListener("click", ()=>{
	location.href = "boardView.jsp?no=${param.no}";
});

</script>
</html>