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
			if(session.usuario.isSuperUser()){
				buildingMenuSuperUser()
			} else if(session.usuario.isAdminUser()){
				buildingMenuAdminUser()
			}
		}
	}
	
	def buildingMenuSuperUser(){
		startMenu()
		startMainMenu()
		buildingItemMenu([tittle: "Inicio", url: "/"])
		buildingItemMenu([tittle: "Administracion", submenu: [[
			[tittle: "Usuarios", action: "index", controller:"usuario"],
			[tittle: "Socios", action: "index", controller:"socio"],
			[tittle: "Perfiles", action: "index", controller:"perfil"]
			],[
			[tittle: "Roles", action: "index", controller:"rol"],
			[tittle: "Asistencias", action: "index", controller:"asistencia"],
			[tittle: "Perfil de socio", action: "index", controller:"perfilDeSocio"]
			]]])
		buildingItemMenu([tittle: "Finanzas", submenu: [[
			[tittle: "Cobros Por Mes", action: "index", controller:"cobro"],
			[tittle: "Cobros Por Dia", action: "index", controller:"cobroPorDia"],
			[tittle: "Movimientos Contables", action: "index", controller:"movimientoContable"]
			],[
			[tittle: "Rubros", action: "index", controller:"rubro"],
			[tittle: "Sub Rubros", action: "index", controller:"subRubro"]
			]]])
		buildingItemMenu([tittle: "Reportes", submenu: [[
			[tittle: "Cobros por mes", action: "index", controller:"reporteCobrosPorMes"],
			[tittle: "Listado de socios morosos", action: "index", controller:"reporteSociosMorosos"],
			[tittle: "Reporte Movimientos Contables", action: "index", controller:"reporteMovimientosContables"],
			[tittle: "Reporte Asistencias", action: "index", controller:"reporteAsistencias"]
			]]])
		buildingItemMenu([tittle: "Herramientas", submenu: [[
			[tittle: "Carga masiva", action: "upload", controller:"cargarDeSociosDesdeExcel"],
			[tittle: "Carga masiva menores", action: "upload", controller:"cargarDeSociosMenoresDesdeExcel"]
			],[
			[tittle: "Exportar Socios", action: "report", controller:"exportarSociosAExcel"],
			[tittle: "Exportar Socios Menores", action: "report", controller:"exportarSociosMenoresAExcel"]
			]]])
		endMainMenu()
		subMenuContent.each { submenucontent ->
			out << submenucontent
		}
		endMenu()
	}
	
	def buildingMenuAdminUser(){
		startMenu()
		startMainMenu()
		buildingItemMenu([tittle: "Inicio", url: "/"])
		buildingItemMenu([tittle: "Socios", action: "index", controller:"socio"])			
		buildingItemMenu([tittle: "Asistencias", action: "index", controller:"asistencia"])
		buildingItemMenu([tittle: "Cobros Pale", action: "index", controller:"cobro"])
		buildingItemMenu([tittle: "Cobros Por Dia", action: "index", controller:"cobroPorDia"])
		
		endMainMenu()		
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
