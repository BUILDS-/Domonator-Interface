<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<!-- TODO: format better, determine if missing info, and put hide/show on the stack trace -->
<div class="titleBar"><s:text name="errorPage.title" /></div>
<div class="basicBox">
	<div class="itemLabel"><s:text name="errorPage.label.errorMessage" /></div>
	<div class="itemContents"><s:property value="exception" /></div>
	
	<s:property value="exception.stacktrace.length" />
	<div class="itemLabel"><s:text name="errorPage.label.stackTrace" /></div>
	<div class="itemContents" style="padding-left: 40px;">
		<s:iterator value="exception.stackTrace">
			<s:property /><br>
		</s:iterator>
	</div>
</div>
			
