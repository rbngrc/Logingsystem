package dam2.dii.p3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Usuario> listaUsuarios = Datos.getUsuarios();
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");

		boolean existe = compruebaUsuario(user, listaUsuarios);
		boolean correcto = compruebaContrasena(pass, listaUsuarios);

		if (existe) {
			if (correcto) {
				request.getSession().setAttribute("user", user);
				request.setAttribute("listado", listaUsuarios);
				if (user.equals("admin")){
					request.getRequestDispatcher("/admin.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("pass", pass);
					request.getRequestDispatcher("/home.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error", "Contraseña incorrecta, por favor vuelva a intentarlo");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
			
		} else {
			request.getRequestDispatcher("/alta.jsp").forward(request, response);
		}

	}

	private boolean compruebaUsuario(String user, ArrayList<Usuario> listaUsuarios) {
		boolean resultado = false;

		for (int i = 0; i < listaUsuarios.size(); i++) {
			Usuario usuario = listaUsuarios.get(i);
			String usuar = usuario.getUser();

			if (usuar.equals(user)) {
				resultado = true;
			}
		}

		return resultado;
	}
	
	private boolean compruebaContrasena(String pass, ArrayList<Usuario> listaUsuarios) {
		boolean resultado = false;
		
		for (int i = 0; i < listaUsuarios.size(); i++) {
			Usuario usuario = listaUsuarios.get(i);
			String password = usuario.getPass();

			if (password.equals(pass)) {
				resultado = true;
			}
		}
		
		return resultado;
	}
	
}
