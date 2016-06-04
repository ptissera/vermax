import vermax.Barrio
import vermax.Cliente
import vermax.Rol
import vermax.TipoServicio
import vermax.Usuario

class BootStrap {

	def init = { servletContext ->
		initRolesAndUsers()
		
		initClientes()

		createBarrio("Los Platanos")
		createBarrio("Los Naranjos")
		createBarrio("Matienso")
		
		createTipoServicio("Canasto", 50, 25)
		createTipoServicio("Acolchado 1 pz", 70, 25)
		createTipoServicio("Acolchado 2 pz", 100, 40)
	}
	
	def initRolesAndUsers() {
		
				def role_super = Rol.findByNombre('ROLE_SUPER_USER')
				if (!role_super) {
					role_super = new Rol(nombre: 'ROLE_SUPER_USER', descripcion: 'Super User')
					role_super.save(flush: true)
				}
		
				def role_admin = Rol.findByNombre('ROLE_ADMIN_USER')
				if (!role_admin) {
					role_admin = new Rol(nombre: 'ROLE_ADMIN_USER', descripcion: 'Administrador General y Profesores')
					role_admin.save(flush: true)
				}
		
				def role_general = Rol.findByNombre('ROLE_SOCIOL_USER')
				if (!role_general) {
					role_general = new Rol(nombre: 'ROLE_SOCIO_USER', descripcion: 'Socio de Siurana')
					role_general.save(flush: true)
				}
		
				def pablo = Usuario.findByUserName('ptissera')
				if (!pablo) {
					pablo = new Usuario(userName: 'ptissera', nombre: 'Pablo', apellido: 'Tissera' ,password: '123', deleted: false)
					pablo.setRol(role_super)
					pablo.save flush: true
				}
				
				def fran = Usuario.findByUserName('mnavarrete')
				if (!fran) {
					fran = new Usuario(userName: 'mnavarrete', nombre: 'Maira', apellido: 'Navarrete' ,password: '123', deleted: false)
					fran.setRol(role_super)
					fran.save flush: true
				}
			}
	
	def initClientes() {
		def cliente = Cliente.findByDNI('93332772')
		if (!cliente) {
			cliente = new Cliente(nombre: 'Pablo', apellido: 'Tissera', dNI: '93332772', sexo: 'M')
			cliente.save flush: true
		}
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
