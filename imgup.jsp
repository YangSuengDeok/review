 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String realFolder = "";

	String saveFolder = "/img";
	String encType = "utf-8";
	int maxSize = 5*1024*1024;
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	out.println("the realpath is : "+ realFolder +" <br>");
	
	try {
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value =  multi.getParameter(name);
			out.println(name + "=" + value +"<br>");
		}
		
		out.println("------------<br>");
		
		Enumeration<?> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			
			String original = multi.getOriginalFileName(name);
			
			File file = multi.getFile(name);
			
			out.println("�Ķ���� �̸� :" + name + "<br>");
			out.println("��¥ �����̸� :" + original + "<br>");
			
			if(file!=null){
				out.println("ũ�� :" + file.length());
				out.println("<br>");
			}
		}
	}catch(IOException ioe) {
		System.out.println(ioe);
	}catch(Exception ex) {
		System.out.println(ex);
	}
	
	//PrintWriter script = response.getWriter();
	//script.println("<script>");
	//script.println("location.href = 'main.jsp'");
	//script.println("</script>");
	
%>


<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<td>�ۼ���</td>
		<td>����</td>
	</tr>
</table>

</body>
</html>
