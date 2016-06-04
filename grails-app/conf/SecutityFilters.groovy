

class SecutityFilters {

	def filters = {
		all(controller:'*', action:'*') {
			before = {
				if (!session.usuario && !actionName.equals('login')) {
					redirect(uri: "/authorize/login")
				}
			}
			after = { Map model ->
			}
			afterView = { Exception e ->
			}
		}
	}
}
