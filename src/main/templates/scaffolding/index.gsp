<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}"
		 />
		 <g:set var="entityDescription" value="\${message(code: '${propertyName}.description.label', default: '')}"
		 />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	
	<body>
	    <!-- Content Header (Page header) -->
	    %{-- <g:render template="list"/> --}%

	    <section class="content-header">
	      <h1>\${entityName}
	        <small>\${entityDescriprion}</small>
	      </h1>
	      <ol class="breadcrumb">
	        <li><a class="home" href="\${createLink(uri: '/')}"><i class="fa fa-dashboard"></i> <g:message code="default.home.label"/></a></li>
	        <li class="active">\${entityName}</li>
	      </ol>
	    </section>
		<!-- Main content -->
        <section class="content">
        	<!-- Your Page Content Here -->
          	<div class="row">
          		<div class="col-sm-12 list-table">
          			<f:table collection="\${${propertyName}List}" />
          			
          			<div id="list">
						<div class="box box-primary">
							<div class="box-header">
								<g:set var="entityName" value="\${message(code: '${propertyName}.label', default: '${className}')}"/>
								<div class="row">
									<div class="col-md-3 text-left">
										<div class="form-group">
											<h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
										</div>
									</div>
									<div class="col-md-9 text-right text-xs-left">
										<div class="form-group">
											<label for="">
												<g:message code=" " default=" " />
											</label>
											<g:link action="create" update="create" class="btn btn-primary pull-right btn-labeled fa fa-plus" onSuccess="showCreate()">
												<g:message code="default.new.label" args="[entityName]" />
											</g:link>
										</div>
									</div>
								</div>
							</div><!-- /.box-header -->
						<g:if test="\${flash.message}">
							<g:javascript>
								new PNotify({
									title: '',
									text: '\${flash.message}',
									type: 'success'
								});
							</g:javascript>
						</g:if>
							<div class="box-body">
								<!-- Table list -->
								<div class="table-responsive table">
									<f:table collection="\${${propertyName}List}" />
									<table style="display:none" id="list-${propertyName}" class="table table-bordered table-hover">
										<thead>
										<tr class="text-nowrap">

										</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- page script -->
						<g:javascript>
							\$(function () {
								var table=\$('#list-${propertyName}');
								table.show();
								table.dataTable();
							});
						</g:javascript>

						%{--<g:render template="list"/>--}%

					</div>
          		</div>
          	
          		<div class="col-sm-4">
					<div id="create"></div>
				</div>
          	
          		<div class="col-sm-4">
	       			<div id="edit"></div>
	       		</div>
          	
          		<div class="col-sm-4">
	       			<div id="show"></div>
	       		</div>
          	</div>	


       	</section><!-- /.content -->
	 	

		<g:javascript>
			\$('#${packageName}Menu').addClass('active');\$('#${propertyName}Menu').addClass('active');

			function showEdit() {
 		       \$('#create').hide();
 		       \$('#show').hide();
 		       \$('#edit').show();
 		       \$().minList();
			}
			function showShow() {
 		       \$('#create').hide();
 		       \$('#show').show();
 		       \$('#edit').hide();
 		       \$('#timeline').hide();
 		       \$().minList();
			}
			function showCreate() {
			   \$().minList();
 		       \$('#create').show();
 		       \$('#show').hide();
 		       \$('#edit').hide();
			}

			function cancelAction() {
				\$('#create').hide();
				\$('#edit').hide();
				\$('#show').hide();
				\$().maxList();
			}

			\$().ready(function(){

			    \$.fn.minList = function(e) {
			    	\$('.list-table').removeClass('col-sm-12');
			    	\$('.list-table').addClass('col-sm-8');
			    };

			    \$.fn.maxList = function(e) {
			    	\$('.list-table').addClass('col-sm-12');
			    	\$('.list-table').removeClass('col-sm-8');
			    };

			});
		</g:javascript>
 		
	</body>
</html>
