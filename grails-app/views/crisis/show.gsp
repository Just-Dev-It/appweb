
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
			<h1>
				<g:if test="${crisisInstance?.name}"><g:fieldValue bean="${crisisInstance}" field="name"/></g:if>
				<g:if test="${crisisInstance?.location}"><g:fieldValue bean="${crisisInstance}" field="location"/></g:if>
				<span>
					<g:if test="${crisisInstance?.hashtag}"><g:fieldValue bean="${crisisInstance}" field="hashtag"/></g:if>
					<g:if test="${crisisInstance?.facebook}"><g:fieldValue bean="${crisisInstance}" field="facebook"/></g:if>
				</span>
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${actualities}">
				<div class="actuality">
					<g:each in="${actualities}" status="i" var="actuality">
						<ul>
							<li>${actuality.dateActuality}<span>${actuality.textActuality}</span></li>
						</ul>
					</g:each>
				</div>
			</g:if>
			<g:if test="${products}">
				<div class="products">

				</div>
			</g:if>

			<g:form url="[resource:crisisInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${crisisInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
