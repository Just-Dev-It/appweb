<%@ page import="justdevit.Crisis" %>



<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'actuality', 'error')} ">
	<label for="actuality">
		<g:message code="crisis.actuality.label" default="Actuality" />
		
	</label>
	<g:select name="actuality" from="${justdevit.Actuality.list()}" multiple="multiple" optionKey="id" size="5" value="${crisisInstance?.actuality*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'facebook', 'error')} required">
	<label for="facebook">
		<g:message code="crisis.facebook.label" default="Facebook" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="facebook" required="" value="${crisisInstance?.facebook}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'hashtag', 'error')} required">
	<label for="hashtag">
		<g:message code="crisis.hashtag.label" default="Hashtag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hashtag" required="" value="${crisisInstance?.hashtag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="crisis.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${crisisInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="crisis.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${crisisInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: crisisInstance, field: 'products', 'error')} ">
	<label for="products">
		<g:message code="crisis.products.label" default="Products" />
		
	</label>
	<g:select name="products" from="${justdevit.Product.list()}" multiple="multiple" optionKey="id" size="5" value="${crisisInstance?.products*.id}" class="many-to-many"/>

</div>

