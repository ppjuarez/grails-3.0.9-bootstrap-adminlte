
<div class="box box-primary">
   <div class="box-header">
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
            <h3 class="box-title"><g:message code="default.create.label" args="[entityName]" /></h3>
    </div><!-- /.box-header -->
    <!-- form start -->
    <div class="box-body">
    	<g:formRemote name="saveForm" url="[action: 'save']" update="[success: 'list', failure: 'error']" onSuccess="cancelAction()">
        	<div class="box-body">
              	<g:if test="\${flash.message}">
					<div class="message" role="status">\${flash.message}</div>
				</g:if>

                <g:hasErrors bean="\${${propertyName}}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="\${${propertyName}}" var="error">

                            <g:javascript>
                                new PNotify({
                                    title: '\${error.field}',
                                    text: '\${message(error: error)}',
                                    type: 'warning'
                                });
                            </g:javascript>
                            
                        </g:eachError>
                    </ul>
                </g:hasErrors>

				%{-- <g:hasErrors bean="\${${propertyName}}">
					<ul class="errors" role="alert">
						<g:eachError bean="\${${propertyName}}" var="error">
							<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors> --}%

                <fieldset class="form">
					<g:render template="form"/>
				</fieldset>

            </div><!-- /.box-body -->

            <div class="box-footer">
                <fieldset class="buttons">
                    <a class="btn btn-danger btn-md btn-labeled fa fa-close" onclick="cancelAction()">
                    \${message(code: 'default.button.cancel.label', default: 'Cancel')}
                    </a>
                	<button type="submit" class="btn btn-md btn-primary pull-right btn-labeled fa fa-save">
                    \${message(code: 'default.button.create.label', default: 'Create')}
                	</button> 
				</fieldset>
           	</div>
    	</g:formRemote>
    </div>
</div><!-- /.box -->