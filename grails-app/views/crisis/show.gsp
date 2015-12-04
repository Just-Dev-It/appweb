
<%@ page import="justdevit.Crisis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crisis.label', default: 'Crisis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-crisis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-crisis" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list crisis">
			
				<g:if test="${crisisInstance?.actuality}">
				<li class="fieldcontain">
					<span id="actuality-label" class="property-label"><g:message code="crisis.actuality.label" default="Actuality" /></span>
					
						<g:each in="${crisisInstance.actuality}" var="a">
						<span class="property-value" aria-labelledby="actuality-label"><g:link controller="actuality" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${crisisInstance?.facebook}">
				<li class="fieldcontain">
					<span id="facebook-label" class="property-label"><g:message code="crisis.facebook.label" default="Facebook" /></span>
					
						<span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${crisisInstance}" field="facebook"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crisisInstance?.hashtag}">
				<li class="fieldcontain">
					<span id="hashtag-label" class="property-label"><g:message code="crisis.hashtag.label" default="Hashtag" /></span>
					
						<span class="property-value" aria-labelledby="hashtag-label"><g:fieldValue bean="${crisisInstance}" field="hashtag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crisisInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="crisis.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${crisisInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crisisInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="crisis.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${crisisInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${crisisInstance?.products}">
				<li class="fieldcontain">
					<span id="products-label" class="property-label"><g:message code="crisis.products.label" default="Products" /></span>
					
						<g:each in="${crisisInstance.products}" var="p">
						<span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:crisisInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${crisisInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
