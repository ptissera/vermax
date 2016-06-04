<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">

<g:layoutHead />
</head>
<body>
	<g:javascript library="jquery" plugin="jquery" />
	
	<div id="grailsLogo" role="banner">
		<g:img file="grails_logo.png"/>
		<h1>Vermax</h1>
		
		</div>
		<header>
	<pulko:loginControl/>
	</header>
	<div id="wrapper">
		<g:layoutBody />
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>		
		<fieldset class="footerFill"></fieldset>
	</div>
</body>
</html>
