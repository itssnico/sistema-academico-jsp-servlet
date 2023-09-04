<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.model.Aluno" %>
    
<!DOCTYPE html>
<html>
<head>
<title>Lista Alunos</title>
</head>
<body>
	<center>
	<table width= "100%" border="1" cellpadding="2" cellspacing="0">
			<tr>
				<th colspan="6"><h3>Lista de Alunos</h3></th>
			</tr>
			<tr>
				<th>ID - <a href="html/alterar.html">Alterar</a></th>
				<th>Nome</th>
				<th>Endereço</th>
				<th>E-mail</th>
				<th>Nascimento</th>
				<th>Periodo</th>
			</tr>
          	<%
          		SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
                List <Aluno> lista = new ArrayList<Aluno>();
                lista = (ArrayList)request.getAttribute("alunosList");
                for(Aluno a: lista ){
              %>
			<tr>
				<td><%=a.getRa()%></td>
				<td><%=a.getNome()%></td>
				<td><%=a.getEndereco()%></td>
				<td><%=a.getEmail()%></td>
				<td><%=data.format(a.getDataNascimento())%></td>
				<td><%=a.getPeriodo()%></td>
			</tr>
            <%
                }
          %>
		<tr>
			<td colspan="6" align="center"><a href="index.html">Página Principal</a></td>
		</tr>	
	</table>
	</center>
</body>
</html>