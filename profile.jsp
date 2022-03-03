<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="profil.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>������â</title>
    <style>
        img{
            height : 300px;
            dispLay : block;
            margin-top : 30px;
            margin-bottom : 30px;
        }
        .select{
            text-align: center;
            margin-bottom: 30px;
            margin-top : 30px;
            list-style: none;
            box-sizing: border-box;
            border: 1rem;
            
        }
        .font{
            font-size: medium;
            color: grey;
            text-align: center;
            list-style: none;
        }
    </style>
</head>
<body style="background-color: rgb(233, 223, 223);">
<input type="file" id="real-input" name="img" class="image_inputType_file" style="display: none;" accept="img/*" required multiple />
<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}else if (session.getAttribute("userID") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		User user = new UserDAO().getUser(userID);
	%>

<center>
	<div id="imagePreview">
    	<img id="img" src="profile.png">
	</div>
</center>
    <ul>
        <li class="select">
    <button type="button" class="browse-btn btn btn-outline-dark">�����ٲٱ�</button>
    <button type="button" class="btn btn-outline-dark">�����ʼ���</button>
    </li>
    </ul>
    <ul><li class="font"> �̸� : <%=user.getUserName()%> </li></ul>
    <ul><li class="font"> ���̵� : <%=user.getUserID()%> </li></ul>
    <ul><li class="font"> �̸��� : <%=user.getUserEmail()%> </li></ul>

<ul><li class="select"><div class="fw-bold"><a href="���ã��">���ã��<br></a></div></li></ul>
<ul><li class="select"><div class="fw-bold"><a href="ȯ�漳��">ȯ�漳��<br></a></div></li></ul>
<ul><li class="select"><div class="fw-bold"><a href="������">������<br></a></div></li></ul>

<script>
const browseBtn = document.querySelector('.browse-btn');
const realInput = document.querySelector('#real-input');
browseBtn.addEventListener('click', () => {
    realInput.click();
});
function readInputFile(e) {
    var sel_files = [];
    sel_files = [];
    $('#imagePreview').empty();
    var files = e.target.files;
    var fileArr = Array.prototype.slice.call(files);
    var index = 0;
    fileArr.forEach(function (f) {
        if (!f.type.match("image/.*")) {
            alert("�̹��� Ȯ���ڸ� ���ε� �����մϴ�.");
            return;
        };
        if (files.length < 11) {
            sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function (e) {
                var html =
                    `<a id=img_id_\${index}><img src=\${e.target.result} data-file=\${f.name} style="width:300px; height:300px;" /></a>`;
                $('#imagePreview').append(html);
                console.log(html);
                index++;
            };
            reader.readAsDataURL(f);
        }
    })
    if (files.length > 11) {
        alert("�ִ� 10����� ���ε� �� �� �ֽ��ϴ�.");
    }
}
$('#real-input').on('change', readInputFile);
</script>
</body>
</html>