<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch17.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
<%@page import="java.io.File"%>
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
			<h1 class="services_taital"><%=IndexRepository.getChapter("CH17") %></h1>
			<p class="services_text">각 쳅터별 내용을 확인할 수 있습니다.</p>
			<div class="services_section_2">
				<div class="row">
					<div class="col-md-12">
						<!-- 
							게시글 수정 처리를 진행할 페이지입니다.
							1. 게시글 수정을 처리해주세요.
								> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
								
							2. 게시글 수정 시, 등록과 같은 옵션 정보를 처리해주세요.
								> 등록과  옵션 정보 동일
						-->
						<%
							String no = (String)request.getParameter("no");
							String title = (String)request.getParameter("title");
					 		String content = (String)request.getParameter("content");
					 		String[] user = (String[])session.getAttribute("SessionInfo");
							if(user==null && user.length==0){
								out.println("<p class='ddit_text'>연결 끊김</p>");
								return;
							}
							
						 	Part part = request.getPart("filename");
						 	String path = request.getServletContext().getRealPath("/resources/images");
						 	File tempFile = new File(path);
						 	if(!tempFile.exists()) tempFile.mkdirs();
							
						 	BoardRepository dao = BoardRepository.getInstance();
							long maxSize = 1024*1024;
						 	boolean flag = true;
						 	BoardFileVO fvo = null;
						 	if(part!=null && part.getSubmittedFileName()!="" 
						 				&& !part.getSubmittedFileName().equals("")){
						 		if(part.getSize()>maxSize) {
						 			flag = false;
						 			out.println("<p class='ddit_text'>업로드 파일 크기를 초과하였습니다.</p>");
						 			return;
						 		}
						 		part.write(path + "/" + part.getSubmittedFileName());
						 		fvo = new BoardFileVO();
						 		
						 		fvo.setFileSize(part.getSize());
						 		fvo.setFileName(request.getContextPath() +
						 						"/resources/images/" + part.getSubmittedFileName());
						 		fvo.setContentType(fvo.getFileName().split("\\.")[1]);
								
						 	}
						 	BoardVO boardVO = dao.getBoardById(Integer.parseInt(no));
							boardVO.setTitle(title);
							boardVO.setContent(content);
							boardVO.setWriter(user[0]);

							boardVO.setFileVO(fvo);
							
							dao.updateBoard(boardVO);
							response.sendRedirect("boardView.jsp?no=" + no);
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/module/footer.jsp"%>
	<%@ include file="/module/footerPart.jsp"%>
	
</body>
</html>