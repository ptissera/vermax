package vermax
import grails.artefact.Artefact;

@Artefact("TagLibrary")
class MainMenuTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]
	
	def subMenuContent = []
	def subMenuContentAux = ""
	
	def menu = { attrs, body ->
		if(session.usuario){
		buildingMenuSuperUser()
		}	
		}
	
	def buildingMenuSuperUser(){
		startMenu()
		startMainMenu()
		buildingItemMenu([tittle: "Inicio", url: "/"])
		buildingItemMenu([tittle: "Administracion", submenu: [[
			[tittle: "Usuarios", action: "index", controller:"usuario"],
			[tittle: "Cliente", action: "index", controller:"cliente"]
			],[
			[tittle: "Roles", action: "index", controller:"rol"],
			[tittle: "Equipos", action: "index", controller:"equipo"],
			[tittle: "Servicios", action: "index", controller:"tipoServicio"],
			[tittle: "Rubros", action: "index", controller:"rubro"]
			]]])
		buildingItemMenu([tittle: "Finanzas", submenu: [[
			[tittle: "Ingresos", action: "index", controller:"cobro"],
			[tittle: "Gastos", action: "index", controller:"egreso"]
			],[
			[tittle: "Rubros", action: "index", controller:"rubro"],
			[tittle: "Sub Rubros", action: "index", controller:"subRubro"]
			]]])
		buildingItemMenu([tittle: "Reportes", submenu: [[
			[tittle: "Cobros por mes", action: "index", controller:"reportesCobrosXPeriodo"],
			[tittle: "Ganancia", action: "index", controller:"reportesGanancias"]
			]]])
		endMainMenu()
		subMenuContent.each { submenucontent ->
			out << submenucontent
		}
		endMenu()
	}


	def startMenu() {
		out << "<nav>"
	}
	def startMainMenu() {
		out << "<ul>"
	}
	
	def endMainMenu() {
		out << "</ul>"
	}
	
	def endMenu() {
		out << "</nav>"
	}
	
	def startSubMenu() {
		def idSubMenu = subMenuContent.size()
		return "<div id='submenu_${idSubMenu}'>"
	}
	
	def endSubMenu() {
		return "</div>"
	}
	
	def buildingItemMenu(item){
		out << "<li>"
		if(!item.submenu){
			if(!item.url){
				out << """${link(action:item.action, controller:item.controller){item.tittle}}"""
			} else{
				out << """${link(url: createLink(uri: item.url)){item.tittle}}"""
			}
		}else{
			def idSubMenu = subMenuContent.size()
			out << "<span name='submenu_${idSubMenu}'>${item.tittle}</span>"
			buildingSubMenu(item.submenu)
		}
		out << "</li>"
	}
	
	def buildingSubMenu(submenusrow){
		subMenuContentAux = startSubMenu()
		submenusrow.each {submenus ->
			buildingSubMenuRow(submenus)
		}
		subMenuContentAux += endSubMenu()
		subMenuContent << subMenuContentAux
	}
	
	def buildingSubMenuRow(submenus){
		subMenuContentAux += "<ul>"
		submenus.each { submenu ->
			subMenuContentAux += "<li>"
			if(!submenu.url){
				subMenuContentAux += """${link(action:submenu.action, controller:submenu.controller){submenu.tittle}}"""
			} else{
				subMenuContentAux += """${link(url: createLink(uri: item.url)){submenu.tittle}}"""
			}
			subMenuContentAux += "</li>"
		}
		subMenuContentAux += "</ul>"
	}
}
