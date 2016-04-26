package vermax

import grails.artefact.Artefact;

@Artefact("TagLibrary")
class LoginTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]
	
	def loginControl = { attrs, body ->
		out << "<div id='login'>"
		if(session.usuario){			
            out << "<label>"
			out << " ${session.usuario} "                        
			out << "</label>"
			out << """${link(action:"logout", controller:"authorize"){"<b>Logout</b>"}}"""
			out << "</div>"
		} else{
			out << """${link(action:"openSearch", controller:"asistencia"){"<b>Asistencia</b>"}}"""
			out << """${link(action:"login", controller:"authorize"){"<b>Login</b>"}}"""			
		} 		
		out << "</div>"
		
	}
}
