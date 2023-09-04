package br.edu.unicid.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.unicid.dao.AlunoDAO;
import br.edu.unicid.model.Aluno;

/**
 * Servlet implementation class ServletAluno
 */
@WebServlet("/ServletAluno")
public class ServletAluno extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	// metodo para conversao de String para data
    private Date strToDate(String data) throws Exception {
        if (data == null) {
            return null;
        }
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date dataF = formato.parse(data);
        return dataF;
    }
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cmd = request.getParameter("cmd");
        AlunoDAO dao;
        Aluno aluno = new Aluno();
        if (cmd != null) {
            try {
           		aluno.setRa(Integer.parseInt(request.getParameter("txtRa")));
           		aluno.setNome(request.getParameter("txtNome"));
                aluno.setEmail(request.getParameter("txtEmail"));
                aluno.setEndereco(request.getParameter("txtEndereco"));
                aluno.setDataNascimento(strToDate(request.getParameter("txtData")));
                aluno.setPeriodo(request.getParameter("cmbPeriodo"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            try {
            	// direciona para uma nova página
                RequestDispatcher rd = null;
                dao = new AlunoDAO();
                if (cmd.equalsIgnoreCase("salvar")) { 
                    dao.salvar(aluno);
                    rd = request.getRequestDispatcher("ServletAluno?cmd=listar");
                }
                else if (cmd.equalsIgnoreCase("listar")) {
                    List alunosList = dao.todosAlunos();
                    request.setAttribute("alunosList", alunosList);
                    rd = request.getRequestDispatcher("jsp/mostrarAlunos.jsp");

                }
                else if (cmd.equalsIgnoreCase("consultar")) {
                	aluno = dao.procurarAluno(aluno.getRa());
                	HttpSession session = request.getSession(true);
                	session.setAttribute("aluno", aluno);
                	rd = request.getRequestDispatcher("jsp/consultarAluno.jsp");
                }
                else if (cmd.equals("excluir")) {
                	dao.excluir(aluno);
                	rd = request.getRequestDispatcher("ServletAluno?cmd=listar");
                }else if (cmd.equalsIgnoreCase("alte")) {
                	aluno = dao.procurarAluno(aluno.getRa());
                	HttpSession session = request.getSession(true);
                	session.setAttribute("aluno", aluno);
                	rd = request.getRequestDispatcher("jsp/alterarAluno.jsp");
                }else if (cmd.equals("alterar")) {
                	dao.alterar(aluno);   
                	rd = request.getRequestDispatcher("ServletAluno?cmd=listar");
                }
                // executa a ação de direcionar para a página JSP
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                throw new ServletException(e);
            }
        }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}