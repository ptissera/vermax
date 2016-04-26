package vermax

import grails.artefact.Artefact

@Artefact("TagLibrary")
class ButtonMainMenuTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]
	
    def item = { attrs ->

        if (!attrs.name){
            throwTagError("Tag [item] is missing required attribute [name]")
        }
        String name = attrs.remove('name')
        
        if (!attrs.controller && !attrs.url){
            throwTagError("Tag [item] is missing required attribute [controller]")
        }
        String controller = attrs.remove('controller')
        
        if (!attrs.action && !attrs.url){
            throwTagError("Tag [item] is missing required attribute [action]")
        }

        String url = null
        url=attrs.remove('url')

        String action = attrs.remove('action')
        
        if (!attrs.image){
            throwTagError("Tag [item] is missing required attribute [image]")
        }
        String image = attrs.remove('image')
        
        def backgroundImage="style='background-image: url(${createLinkTo(dir: "images", file: image)});'"					
        def bodyButton = "<div ${backgroundImage}><h2>${name}</h2></div>"
        if(url==null){
            out << """${link(class: "mainOption", action: action, controller: controller){bodyButton}}"""
        }   else {
            out << """${link(class: "mainOption", url: url){bodyButton}}"""
        }
    }
}
