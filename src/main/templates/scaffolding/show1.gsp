<% import grails.persistence.Event %>
<div class="box box-primary">
    <div class="box-header">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
      <h3 class="box-title"><g:message code="default.show.label" args="[entityName]" /></h3>
    </div><!-- /.box-header -->
    <div class="box-body">


		%{-- <g:if test="\${flash.message}">
		<div class="message" role="status">\${flash.message}</div>
		</g:if> --}%
		<ol style="list-style: square;" class="property-list ${domainClass.propertyName}">
		<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
			allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
			props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
			Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
			props.each { p -> %>
			<g:if test="\${${propertyName}?.${p.name}}">
			<li class="fieldcontain">
				<Label id="${p.name}-label" class="property-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></Label>
				<%  if (p.isEnum()) { %>
					<span class="property-value" aria-labelledby="${p.name}-label">
					<g:textField name="${p.name}" required="" value="\${${propertyName}?.${p.name}}" class="form-control" readonly="true"/>
					%{-- <g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>--}%</span> 
				<%  } else if (p.oneToMany || p.manyToMany) { %>
					<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
					<span class="property-value" aria-labelledby="${p.name}-label">
					<g:textField name="${p.name}" required="" value="\${${propertyName}?.${p.name}}" class="form-control" readonly="true"/>
					%{-- <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link> --}%</span>
					</g:each>
				<%  } else if (p.manyToOne || p.oneToOne) { %>
					<span class="property-value" aria-labelledby="${p.name}-label">
					<g:textField name="${p.name}" required="" value="\${${propertyName}?.${p.name}}" class="form-control" readonly="true"/>
					%{-- <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link> --}%</span>
				<%  } else if (p.type == Boolean || p.type == boolean) { %>
					<span class="property-value" aria-labelledby="${p.name}-label">
					<g:textField name="${p.name}" required="" value="\${${propertyName}?.${p.name}}" class="form-control" readonly="true"/>
					%{-- <g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /> --}%</span>
				<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
					<span class="property-value" aria-labelledby="${p.name}-label">
					<div class="input-group">
					<div class="input-group-addon">
					<i class="fa fa-calendar"></i></div>
					<g:textField name="${p.name}" required="" value="\${formatDate(format:"dd-MMMMM-yyyy", date:${propertyName}?.${p.name})}" class="form-control" readonly="true"/></div>
					%{-- <g:formatDate date="\${${propertyName}?.${p.name}}" /> --}%</span>
				<%  } else if (!p.type.isArray()) { %>
					<span class="property-value" aria-labelledby="${p.name}-label">
					<g:textField name="${p.name}" required="" value="\${${propertyName}?.${p.name}}" class="form-control" readonly="true"/>
						%{-- <g:fieldValue bean="\${${propertyName}}" field="${p.name}"/> --}%</span>
				<%  } %>
			</li>
			</g:if>
		<%  } %>
		</ol>
	</div><!-- /.box-body -->

	<div class="box-footer">
		<g:formRemote name="deleteForm" url="[resource:${propertyName}, action: 'delete']" method="DELETE" update="[success: 'list', failure: 'error']" onSuccess="jQuery('#show').hide()">
    	
			<fieldset class="buttons">

				<g:remoteLink action="edit" update="edit" resource="\${${propertyName}}" class="btn btn-md btn-primary pull-right btn-labeled fa fa-edit" onSuccess="showEdit()" ><g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>

				<button type="submit" class="btn btn-danger  btn-md btn-labeled fa fa-trash" action="delete" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
				\${message(code: 'default.button.delete.label', default: 'Delete')}
				</button>	
		</g:formRemote>  

    </div>

</div><!-- /.box -->
	        	
