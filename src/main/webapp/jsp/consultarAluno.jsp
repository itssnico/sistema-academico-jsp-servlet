<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="style" href="css/style.css">
<title>Sistema Academico</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="icon" href="https://cdn3.iconfinder.com/data/icons/halloween-avatar-01/348/halloween_avatar-20-512.png" type="image/x-icon">
<style>
       body {
       background-image: url(imgs/background.jpg);
       background-size: cover;
      }
</style>
</head>
    <head>
        <title>Consulta Aluno</title>
    </head>
   <body>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark" padding="auto">
	<a class="navbar-brand">
       <img src="https://cdn3.iconfinder.com/data/icons/halloween-avatar-01/348/halloween_avatar-20-512.png" width="60px" height="70px">         
     </a>
  <a class="navbar-brand">Consulta de Aluno</a>
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
        <a class="nav-link" href="ServletAluno?cmd=listar">Voltar</a>
      </li>
    </ul>
  </div>
</nav>
        <jsp:useBean id="aluno" scope="session" class="br.edu.unicid.model.Aluno" />
		<% SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy"); %>
        <form>
            <center>
            <table>
                <tr>
                    <td style="color: white;">RA:</td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtRa" 
                            value="<%=aluno.getRa()%>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td style="color: white;">Nome:</td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtNome" 
                        value="<%=aluno.getNome()%>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td style="color: white;">E-mail:</td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtEmail" 
					value="<%=aluno.getEmail()%>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td style="color: white;">Nascimento (dd/mm/aaaa):</td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtData"
                            value="<%=data.format(aluno.getDataNascimento())%>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td style="color: white;">Endereço:</td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtEndereco" 
						value="<%=aluno.getEndereco()%>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td style="color: white;">Período: </td>
                    <td>
                        <input class="bg-dark text-secondary" type="text" maxlength="60"  size = "60" name="txtIdade" 
							value="<%=aluno.getPeriodo()%>" readonly="readonly" />
                    </td>
                </tr>           
             </table>
             <a href="ServletAluno?cmd=alte&txtRa=<%=aluno.getRa()%>"><input class="bg-dark text-secondary" type="button" value="Alterar"/></a>
            </center>
        </form>
    </body>
</html>