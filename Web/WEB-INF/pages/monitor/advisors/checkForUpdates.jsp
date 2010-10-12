<%@ page language="java" pageEncoding="UTF-8" %>
<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<div class="titleBar"><s:text name="advisors.checkForUpdates.sectionTitle.updateFromNetwork" /></div>
<div class="basicBox">
	<form action="<s:url action="UpdateBundleFromNetwork" />" method="POST" enctype="multipart/form-data">
		<div class="itemLabel"><s:text name="advisors.checkForUpdates.label.updateFromNetwork" /></div>
    	<div class="itemContents"><s:text name="advisors.checkForUpdates.text.networkUpdateInstructions" /></div>
    	
    	<div class="itemLabelStandalone"><input type="submit" name="update" value="<s:text name="generic.button.update" />" /></div>
    </form>
</div>

<div class="titleBar"><s:text name="advisors.checkForUpdates.sectionTitle.importFromFile" /></div>
<div class="basicBox">
    <form action="<s:url action="UpdateBundleFromFile" />" method="POST" enctype="multipart/form-data">
		<div class="itemLabel"><s:text name="advisors.checkForUpdates.label.importFromFile" /></div>
		<div class="itemContents"><input name="advisorsJar" type="file" accept="application/java-archive" /> <input type="submit" name="submit" value="<s:text name="generic.button.import" />" /></div>
		
    	<input type="hidden" name="src" value="file" />
		<input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
	</form>
</div>

<div class="titleBar"><s:text name="advisors.checkForUpdates.sectionTitle.version" /></div>
<div class="basicBox">
	<div class="itemLabel"><s:text name="advisorBundle.label.version" /></div>
	<div class="itemContents"><s:property value="version" /></div>

	<div class="itemLabel"><s:text name="advisorBundle.label.numRules" /></div>
	<div class="itemContents"><s:property value="numRules" /></div>

	<div class="itemLabel"><s:text name="advisorBundle.label.numGraphs" /></div>
	<div class="itemContents"><s:property value="numGraphs" /></div>

	<s:if test="readme.length != 0">
		<div class="itemLabel"><s:text name="advisorBundle.label.readme" /></div>
		<div class="itemContents"><s:property value="readme" escape="false" /></div>
	</s:if>
</div>