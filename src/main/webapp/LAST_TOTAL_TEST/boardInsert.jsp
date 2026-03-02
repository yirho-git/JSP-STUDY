<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
<%@page import="kr.or.ddit.ch17.vo.BoardFileVO"%>
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
							게시글 등록 처리 페이지 입니다.
							게시글 등록 페이지에서 입력된 데이터를 전송하면 이곳으로 전달되어 옵니다.
							이곳에서 게시글 등록 처리를 진행하면 됩니다.
							1. 게시글 등록을 처리해주세요.
								> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
														
							2. 게시글 등록 시, 구현해야할 옵션 기능을 설정해주세요.
								# 파일업로드
								> 게시글 등록 시, 파일 크기는 1MB로 제한해주세요.
								> 파일크기 1MB를 넘는 파일을 업로드 시, '업로드 파일 크기를 초과하였습니다' 메세지를 출력해주세요.
								> 파일을 추가하지 않은 경우에는 일반 게시글이 등록될 수 있도록도 해주세요.(파일 없이도 게시글 등록이 가능하도록)
								
								# 작성자
								> 작성자는 로그인 당시에 설정한 회원 정보의 아이디를 작성자로 넣어주세요.					
						 -->
						 <%
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
						 	if(part!=null && part.getSubmittedFileName()!="" && !part.getSubmittedFileName().equals("")){
						 		if(part.getSize()>maxSize) {
						 			flag = false;
						 			out.println("<p class='ddit_text'>업로드 파일 크기를 초과하였습니다.</p>");
						 			return;
						 		}
						 		
						 		part.write(path + "/" + part.getSubmittedFileName());
						 		fvo = new BoardFileVO();
						 		
						 		fvo.setFileSize(part.getSize());
						 		fvo.setFileName(request.getContextPath() + "/resources/images/" + part.getSubmittedFileName());
								//out.println("<p class='ddit_text''>"+ fvo.getFileName() +"</p>");

						 		fvo.setContentType(fvo.getFileName().split("\\.")[1]);
								//out.println("<p class='ddit_text''>"+ fvo.getContentType() +"</p>");

						 	}
						 	
							BoardVO board = new BoardVO();
							board.setTitle(title);
							board.setContent(content);
							board.setWriter(user[0]);

							board.setFileVO(fvo);
							
							dao.addBoard(board);
							
						 	response.sendRedirect("boardView.jsp?no="+board.getNo());
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