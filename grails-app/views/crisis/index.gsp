
<%@ page import="justdevit.Crisis" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'crisis.label', default: 'Crisis')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div>
    <g:if test="${session["currentAdmin"] != null}">
        <a href="${createLink(controller:'user', action:'deconnection')}" >Déconnexion</a>
    </g:if>
    <g:else>
        <a href="${createLink(controller:'user', action:'loginUser')}" >Admin se connecter</a>
        <a href="${createLink(controller:'user', action:'create')}" >Admin inscription</a>
    </g:else>
</div>

<a href="#list-crisis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>


<div id="list-crisis" class="content scaffold-list" role="main">
    <div class="form-group">
        <g:form controller="crisis" action="doSearchCrisis" method="post">
            <input id="rechercher"  type="text" name="stringToSearch" placeholder="Filtrer par nom..." />
            <g:actionSubmit  controller="crisis" action="doSearchCrisis" value="Rechercher"/>
        </g:form>
    </div>
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
</div>
</body>
</html>