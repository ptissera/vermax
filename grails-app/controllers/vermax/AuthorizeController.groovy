package vermax

class AuthorizeController {

     def index() {[]}
	 
    
    def login = {    
		if (session.usuario) {
			redirect(uri:"/")
		}
    }
  
    def authenticate = {
		
        def usuario = Usuario.findByUserNameAndPassword(params.userName, params.password)
        if(usuario){
            session.usuario = usuario                  
            session.usuario.rol = usuario.rol                 
			flash.message = "Hello  ${params.userName}. "
        }else{
            flash.message = "Sorry, ${params.userName}. Try againt."     
        }
    }
  
    def logout = {
        flash.message = "Bye bye ${session.usuario} !!"
        session.usuario = null        
        redirect(action: "login")
    }  
}
