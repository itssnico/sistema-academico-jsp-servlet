<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.unicid.model.Aluno"%>
<%@ page import="br.edu.unicid.controller.ServletAluno"%>


<!DOCTYPE html>
<html>
<head>
<title>Lista Alunos</title>
<link rel="icon" href="https://cdn3.iconfinder.com/data/icons/halloween-avatar-01/348/halloween_avatar-20-512.png" type="image/x-icon">
<!-- css do projeto -->
<link rel="stylesheet" type="text/css" href="css/styles.css" />

<!-- css bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<!-- js bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<style>
       body {
       background-image: url(https://getwallpapers.com/wallpaper/full/4/7/a/92676.jpg);
       background-size: cover;
      }
</style>
</head>

<body>	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" padding="auto">
	<a class="navbar-brand">
       <img src="https://cdn3.iconfinder.com/data/icons/halloween-avatar-01/348/halloween_avatar-20-512.png" width="60px" height="70px">         
     </a>
  <a class="navbar-brand">Lista de Alunos</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end" id="navbarNav" 	>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index.html">Página Inicial</a>
      </li>
      <li class="nav-item">
        <a class="nav-link">/</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="html\incluir.html">Incluir Aluno</a>
      </li>
      <li class="nav-item">
        <a class="nav-link">/</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.html">Voltar</a>
      </li>
    </ul>
  </div>
	</nav>
	
	<table width="60%" border="3" class="table table-hover table-dark table-striped">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Endereço</th>
			<th>E-mail</th>
			<th>Nascimento</th>
			<th>Periodo</th>
			<th class="centered" style="text-align:center">&nbsp;&nbsp;Status</th>
			<th></th>
		</tr>
		<%
		SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
		List<Aluno> lista = new ArrayList<Aluno>();
		lista = (ArrayList) request.getAttribute("alunosList");
		for (Aluno a : lista){
		%>
			<tr>
				<td><%=a.getRa()%></td>
				<td ><a class="nav-link" href="ServletAluno?cmd=consultar&txtRa=<%=a.getRa()%>"><%=a.getNome()%></a></td>
				<td><%=a.getEndereco()%></td>
				<td><%=a.getEmail()%></td>
				<td><%=data.format(a.getDataNascimento())%></td>
				<td><%=a.getPeriodo()%></td>
				<td><a href="ServletAluno?cmd=alte&txtRa=<%=a.getRa()%>"><img src="https://cdn.discordapp.com/attachments/1141445347516874822/1153130944388136960/icon-1970472_1280.png" width="30" height="30"></a></td>
				<td><a href="ServletAluno?cmd=excluir&txtRa=<%=a.getRa()%>"><img src="https://cdn1.iconfinder.com/data/icons/hawcons/32/699013-icon-27-trash-can-512.png" width="30" height="30"></a></td>
			</tr>
		
		<%
		}
		%>
	</table>
</body>
</html>