import vermax.Barrio
import vermax.Rol
import vermax.TipoServicio

class BootStrap {

	def init = { servletContext ->
		createRol("ADMIN",  "Administracion")
		createRol("SUPER",  "Super Usuario")

		createBarrio("Los Platanos")
		createBarrio("Los Naranjos")
		createBarrio("Matienso")
		
		createTipoServicio("Canasto", 50, 25)
		createTipoServicio("Acolchado 1 pz", 70, 25)
		createTipoServicio("Acolchado 2 pz", 100, 40)
	}

	def createRol(nombre, descripcion) {
		def rol = Rol.findByNombre(nombre)
		if (!rol) {
			rol = new Rol(nombre: nombre, descripcion: descripcion)
			rol.save()
		}
	}

	def createBarrio(nombre) {
		def barrio = Barrio.findByNombre(nombre)
		if (!barrio) {
			barrio = new Barrio(nombre: nombre)
			barrio.save()
		}
	}

	def createTipoServicio(nombre, precioLavado, precioSecado) {
		def ts = TipoServicio.findByNombre(nombre)
		if (!ts) {
			ts = new TipoServicio(nombre: nombre,precioLavado: precioLavado, precioSecado: precioSecado)
			ts.save()
		}
	}

	def destroy = {
	}
}
