import vermax.Barrio
import vermax.Cliente
import vermax.Equipo
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
		createBarrio("El Trebol")
		
		createTipoServicio("Canasto", 50, 25)
		createTipoServicio("Acolchado 1 pz", 70, 25)
		createTipoServicio("Acolchado 2 pz", 100, 40)
		createTipoServicio("Par Zapatilla", 75, 40)
		
		createEquipo("0231","Aurora","Titan",true,30)
		createEquipo("0233","Aurora","Titan",true,30)
		createEquipo("0244","Wirpool","Dry",false,20)
		createEquipo("0245","Wirpool","Dry",false,20)
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
			cliente = new Cliente(nombre: 'Francisco', apellido: 'Tissera', dNI: '93332772', sexo: 'M')
			cliente.save flush: true
		}
		def cliente2 = Cliente.findByDNI('8720133')
		if (!cliente2) {
			cliente2 = new Cliente(nombre: 'Luis', apellido: 'Leyes', dNI: '8720133', sexo: 'M')
			cliente2.save flush: true
		}
		def cliente3 = Cliente.findByDNI('42917308')
		if (!cliente3) {
			cliente3 = new Cliente(nombre: 'Rafael', apellido: 'Rios', dNI: '42917308', sexo: 'M')
			cliente3.save flush: true
		}
		def cliente4 = Cliente.findByDNI('32856147')
		if (!cliente4) {
			cliente4 = new Cliente(nombre: 'Sofia', apellido: 'Perez', dNI: '32856147', sexo: 'F')
			cliente4.save flush: true
		}
		
	}
	
	def createEquipo(codigo, marca, modelo, esLavadora, duracionCiclo){
		def equipo = Equipo.findByCodigo(codigo)
		if(!equipo){
			equipo= new Equipo(codigo: codigo, marca:marca, modelo: modelo, esLavadora:esLavadora, duracionCiclo:duracionCiclo)
			equipo.save()
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
