
<%@ page import="justdevit.Crisis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'crisis.label', default: 'Crisis')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-crisis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
	<div class="form-group">
		<g:form controller="crisis" action="doSearchCrisis" method="post">
			<input id="rechercher"  type="text" class="form-control" name="stringToSearch" placeholder="Tapez votre recherche..." />
			<g:actionSubmit  controller="crisis" action="doSearchCrisis" value="Rechercher"/>
		</g:form>
	</div>
		<div id="list-crisis" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="name" title="${message(code: 'crisis.name.label', default: 'Name')}" />
						<g:sortableColumn property="location" title="${message(code: 'crisis.location.label', default: 'Location')}" />



					</tr>
				</thead>
				<tbody>
				<g:each in="${crisisInstanceList}" status="i" var="crisisInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${crisisInstance.id}">${fieldValue(bean: crisisInstance, field: "name")}</g:link></td>

						<td>${fieldValue(bean: crisisInstance, field: "location")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${crisisInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
