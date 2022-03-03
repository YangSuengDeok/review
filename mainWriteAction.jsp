<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="mainRiveiw.mainRiveiwDAO" %>
<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="mainRiveiw" class="mainRiveiw.mainRiveiw" scope="page" />
<jsp:setProperty name="mainRiveiw" property="reg_img" />
<jsp:setProperty name="mainRiveiw" property="kategori" />
<jsp:setProperty name="mainRiveiw" property="mainCentent" />
<jsp:setProperty name="mainRiveiw" property="bbsCount" />

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. upload 폴더 생성이 안되어 있으면 생성
	String saveDirectory = request.getSession().getServletContext().getRealPath("/upload");
	System.out.println(saveDirectory);

	File saveDir = new File(saveDirectory);
	if (!saveDir.exists())
		saveDir.mkdirs();

	// 2. 최대크기 설정
	int maxPostSize = 1024 * 1024 * 5; // 5MB  단위 byte

	//3. 인코딩 방식 설정
	String encoding = "UTF-8";

	//4. 파일정책, 파일이름 충동시 덮어씌어짐으로 파일이름 뒤에 인덱스를 붙인다.
  //a.txt
	//a1.txt 와 같은 형식으로 저장된다.
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mrequest 
	= new MultipartRequest(request //MultipartRequest를 만들기 위한 request
			, saveDirectory //저장 위치
			, maxPostSize //최대크기
			, encoding //인코딩 타입
			, policy); //파일 정책
	String Kategori = mrequest.getParameter("kategori");
	String MainCentent = mrequest.getParameter("mainCentent");
	
	File uploadFile = mrequest.getFile("reg_img");
  //input type="file" 태그의 name속성값을 이용해 파일객체를 생성
	long uploadFile_length = uploadFile.length();
	String originalFileName = mrequest.getOriginalFileName("reg_img"); //기존 이름
	String filesystemName = mrequest.getFilesystemName("reg_img"); //기존
	
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); // 자신에게 할당된 고유 아이디
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} 
	else {
		if (Kategori == null || MainCentent == null || uploadFile == null) 
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			mainRiveiwDAO main = new mainRiveiwDAO();
			int result = main.write(originalFileName, Kategori, MainCentent, userID, mainRiveiw.getBbsCount());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('리뷰 작성에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'newriveiw.jsp'");
				script.println("</script>");
			}
		}
	}	
	
%>