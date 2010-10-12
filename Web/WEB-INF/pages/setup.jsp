<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<!--
<?
$_SESSION['cookiesEnabled'] = true;
?>
-->

<div class="basicBox">
	<s:if test="setupInfo.expiredTrial">
		<div class="itemLabel"><s:text name="setup.label.expiredTrial" /></div>
		<div class="itemContents"><s:text name="setup.text.expiredTrial" /></div>
	</s:if>
	<s:else>
		<div class="itemLabel"><s:text name="setup.label.welcome" /></div>
		<div class="itemContents"><s:text name="setup.text.instructions" /></div>
	</s:else>
</div>
<form action="<s:url action="DoSetup" />" method="POST" enctype="multipart/form-data">
	<s:if test="setupInfo.expiredTrial || !setupInfo.valid">
		<div class="titleBar"><s:text name="setup.sectionTitle.credentials" /></div>
		<div class="basicBox">
			<div class="itemLabelStandalone"><s:text name="setup.text.credentialsInstructions" /></div>
	
			<div class="itemContents"><s:text name="setup.text.credentialsExplination" /></div>
	
			<div class="itemLabel"><s:text name="setup.label.credentialsUsername" /></div>
			<div class="itemContents"><input type="text" name="credentialsUsername" size="50" value="<s:property value="credentialsUsername" />" /></div>
			
			<div class="itemLabel"><s:text name="setup.label.credentialsPassword" /></div>
			<div class="itemContents"><input type="password" name="credentialsPassword" value="<s:property value="credentialsPassword" />" /></div>
			
			<div class="itemLabel"><s:text name="setup.label.credentialsPasswordConfirm" /></div>
			<div class="itemContents"><input type="password" name="credentialsPasswordConfirm" value="<s:property value="credentialsPasswordConfirm" />" /></div>
			
			<div class="itemLabelStandalone"><s:text name="setup.text.or" /></div>
			
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div class="itemLabel"><s:text name="setup.label.productKey" /></div>
						<div class="itemContents"><input type="file" name="credentialsLicense" size="35" /></div>
					</td>
					<s:if test="!setupInfo.hasAdvisors">
						<td style="padding-left: 20px;">
							<div class="itemLabel"><s:text name="setup.label.advisors" /></div>
							<div class="itemContents"><input type="file" name="advisorsJar" size="35" /></div>
						</td>
					</s:if>
				</tr>
			</table>
		</div>
	</s:if>
	<s:elseif test="!setupInfo.hasAdvisors">
		<div class="titleBar"><s:text name="setup.sectionTitle.advisors" /></div>
		<div class="basicBox">
			<div class="itemLabel"><s:text name="setup.label.advisors" /></div>
			<div class="itemContents"><input type="file" name="advisorsJar" size="35" /></div>
		</div>
	</s:elseif>
	
	<s:if test="!setupInfo.hasAdmin || !setupInfo.hasAgent">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<s:if test="!setupInfo.hasAdmin">
					<td width="50%" valign="top"<s:if test="!setupInfo.hasAgent"> style="border-right: 1px solid #999999;"</s:if>>
						<div class="titleBar"><s:text name="setup.sectionTitle.createAdmin" /></div>
						<div class="basicBox">
							<div class="itemLabel"><s:text name="setup.label.adminUsername" /></div>
							<div class="itemContents"><input type="text" name="adminUsername" value="<s:property value="adminUsername" />" /></div>
							
							<div class="itemLabel"><s:text name="setup.label.adminPassword" /></div>
							<div class="itemContents"><input type="password" name="adminPassword" value="<s:property value="adminPassword" />" /></div>
							
							<div class="itemLabel"><s:text name="setup.label.adminPasswordConfirm" /></div>
							<div class="itemContents"><input type="password" name="adminPasswordConfirm" value="<s:property value="adminPasswordConfirm" />" /></div>
						</div>
					</td>
				</s:if>
		
				<s:if test="!setupInfo.hasAgent">
					<td width="50%" valign="top">
						<div class="titleBar"><s:text name="setup.sectionTitle.createAgent" /></div>
						<div class="basicBox">
							<div class="itemLabel"><s:text name="setup.label.agentUsername" /></div>
							<div class="itemContents"><input type="text" name="agentUsername" value="<s:property value="agentUsername" />" /></div>
							
							<div class="itemLabel"><s:text name="setup.label.agentPassword" /></div>
							<div class="itemContents"><input type="password" name="agentPassword" value="<s:property value="agentPassword" />" /></div>
							
							<div class="itemLabel"><s:text name="setup.label.agentPasswordConfirm" /></div>
							<div class="itemContents"><input type="password" name="agentPasswordConfirm" value="<s:property value="agentPasswordConfirm" />" /></div>
						</div>
					</td>
				</s:if>
			</tr>
		</table>
	</s:if>
	
	<div class="basicBox">
		<input type="submit" name="save" value="<s:text name="setup.button.complete" />" />
	</div>
</form>
