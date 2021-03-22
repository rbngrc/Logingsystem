package dam2.dii.p3;

import java.util.ArrayList;

public class Datos {
	
	public static ArrayList<Usuario> listaUsuarios = cargarDatos();

	public static ArrayList<Usuario> cargarDatos(){
		
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		Usuario newUser = new Usuario("admin", "admin");
		listaUsuarios.add(newUser);
		newUser = new Usuario("Pedro", "1234");
		listaUsuarios.add(newUser);
		newUser = new Usuario("Juan", "4321");
		listaUsuarios.add(newUser);
		
		return listaUsuarios;
	}
		
	public static void addUsuario(Usuario user) {
		listaUsuarios.add(user);
	}
	
	public static ArrayList<Usuario> delUsuario(int id) {
		listaUsuarios.remove(id);
		return listaUsuarios;
	}
	
	public static ArrayList<Usuario> modUsuario(int id, Usuario user){
		listaUsuarios.set(id, user);
		return listaUsuarios;
	}
	
	public static ArrayList<Usuario> getUsuarios() {
		return listaUsuarios;
	}
	
}
