import vermax.Rol

class BootStrap {

    def init = { servletContext ->
		
		def rol_admin = Rol.findByNombre("ADMIN")
		if (!rol_admin) {
			rol_admin = new Rol(nombre: "ADMIN", descripcion: "Administracion")
			rol_admin.save()
		}
		
		def rol_super = Rol.findByNombre("SUPER")
		if (!rol_super) {
			rol_super = new Rol(nombre: "SUPER", descripcion: "Super Usuario")
			rol_super.save()
		}
    }

	    def destroy = {
    }
}
