<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td width="50%" valign="top">
		
		<div class="titleBar">
			<s:text name="settings.global.title.mail" />
		</div>
		
		<div class="basicBox">
			<s:form action="SaveEmailSettings">
				<div class="itemLabel">
					<input type="checkbox" name="enableNotifications" value="true"
						<s:if test="enableNotifications"> checked="checked"</s:if>
					/>
					<s:text name="settings.global.mail.checkbox.enableNotifications" />
				</div>
		
				<div class="itemContents"><s:text name="settings.global.mail.label.fromAddress" />
					<span class="itemLabelModifier"><s:text name="settings.global.mail.label.fromAddressExample" /></span>
				</div>
				<div class="itemContents">
					<input type="text" name="fromAddress" value="<s:property value="fromAddress"/>" size="40"
				/></div>
		
				<div class="itemLabel">
					<s:text name= "settings.global.mail.label.smtpServer" />
				</div>
				<div class="itemContents">
					<input type="text" name="smtpServer" value="<s:property value="smtpServer" />" size="35" />
				</div>
		
				<div class="itemLabel">
					<s:text name= "settings.global.mail.label.smtpLogin" />
				</div>
				<div class="itemContents">
					<input type="text" name="smtpLogin" value="<s:property value="smtpLogin" />" size="20" />
				</div>
		
				<div class="itemLabelStandalone">
					<input type="checkbox" onclick="togglePasswords()" name="smtpUpdatePassword" id="smtpUpdatePassword" value="true"<s:if test="smtpUpdatePassword" > checked="checked"</s:if> /><s:text name="settings.global.mail.label.smtpUpdatePassword" />
				</div>
				<div style="padding-left: 20px;">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-right: 20px;">
							<div class="itemLabel">
								<s:text name="settings.global.mail.label.smtpServerPassword" />
							</div>
							<div class="itemContents">
								<input type="password" name="smtpPassword" id="smtpPassword" size="20" disabled="disabled" value="<s:property value="smtpPassword" />" />
							</div>
						</td>
						<td>
							<div class="itemLabel">
								<s:text name="settings.global.mail.label.smtpConfirmPassword" />
							</div>
							<div class="itemContents">
								<input type="password" name="smtpPasswordConfirm" id="smtpPasswordConfirm" size="20" disabled="disabled" value="<s:property value="smtpPasswordConfirm" />"	/>
							</div>
						</td>
					</tr>
				</table>
				</div>
		
				<script language="JavaScript" type="text/javascript">
							/* <![CDATA[ */
								function togglePasswords() {
									var enabled=returnObject('smtpUpdatePassword').checked;
									returnObject('smtpPassword').disabled=!enabled;
									returnObject('smtpPasswordConfirm').disabled=!enabled;
								}
								togglePasswords();
							/* ]]> */
							</script>
		
				<div class="itemLabel">
					<s:text name="settings.global.mail.label.smtpSendTestEmail" />
					<span class="itemLabelModifier"><s:text name="generic.label.optional" /></span>
				</div>
				<div class="itemContents"><input type="text" name="testEmailAddress" size="20" value="<s:property value="testEmailAddress" />" /></div>		
				<s:submit key="generic.button.save" name="submit" />
			</s:form>
		</div>

		<div class="titleBar"><s:text name="settings.global.title.snmp" /></div>
		<div class="basicBox">
		<s:form action="SaveSnmpSettings">
		<div class="itemLabelStandalone"><input type="checkbox" name="snmpEnabled" value="true"<s:if test="snmpEnabled"> checked="checked"</s:if> /> <s:text name="settings.global.snmp.checkbox.snmpEnabled" /></div>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-right: 20px">
					<div class="itemLabel"><s:text name="settings.global.snmp.label.target" /></div>
					<div class="itemContents"><input type="text" name="snmpTarget" value="<s:property value="snmpTarget" />" size="40" /></div>
				</td>
				<td>
					<div class="itemLabel"><s:text name="settings.global.snmp.label.port" /></div>
					<div class="itemContents"><input type="text" name="snmpPort" value="<s:property value="snmpPort" />" size="10" /></div>
				</td>
			</tr>
		</table>

		<div class="itemLabel"><s:text name="settings.global.snmp.label.communityString" /></div>
		<div class="itemContents"><input type="text" name="snmpCommunityString" value="<s:property value="snmpCommunityString" />" size="40" /></div>
		<div class="itemLabel"><input type="checkbox" onclick="toggleSNMPTest()" name="snmpTest" id="snmpTest" value="true"<s:if test="snmpTest"> checked="checked"</s:if> /> <s:text name="settings.global.snmp.label.snmpTest" /><span class="itemLabelModifier"> <s:text name="generic.label.optional" /></span>
		</div>
		<div class="itemContents" style="padding-left: 20px; padding-top: 5px;">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<input type="checkbox" name="snmpTestUpDown" id="snmpTestUpDown" value="true"<s:if test="snmpTestUpDown"> checked="checked"</s:if> /> <label for="snmpTestUpDown"><s:text name="settings.global.snmp.label.snmpUpDown" /></label>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="snmpTestAdvisor" id="snmpTestAdvisor" value="true"<s:if test="snmpTestAdvisor"> checked="checked"</s:if> />
					<label for="snmpTestAdvisor"><s:text name="settings.global.snmp.checkbox.advisorEvent" /></label>
					<s:text name="settings.global.snmp.label.advisorEvent" />
					<select name="snmpTestAdvisorSeverity" id="snmpTestAdvisorSeverity">
						<s:iterator value="severityOptions">
							<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
						</s:iterator>
					</select></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="snmpTestInternalError"	id="snmpTestInternalError" value="true"<s:if test="snmpTestInternalError">	checked="checked"</s:if> />
					<label for="snmpTestInternalError"><s:text name="generic.label.application.error" /></label>
				</td>
			</tr>
		</table>
		<script language="JavaScript" type="text/javascript">
						/* <![CDATA[ */
							function toggleSNMPTest() {
								var enabled=returnObject('snmpTest').checked;
								returnObject('snmpTestUpDown').disabled=!enabled;
								returnObject('snmpTestAdvisor').disabled=!enabled;
								returnObject('snmpTestAdvisorSeverity').disabled=!enabled;
								returnObject('snmpTestInternalError').disabled=!enabled;
							}
							toggleSNMPTest();
						/* ]]> */
						</script></div>


		<s:submit key="generic.button.save" name="submit" />
		</s:form>
		</div>

		<div class="titleBar"><s:text name="settings.global.title.serverinfo" /></div>
		<div class="basicBox">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" style="padding-right: 25px;">
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.buildVersion" /></div>
					<div class="itemContents"><s:property value="appVersion" /></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.agentCount" /></div>
					<div class="itemContents"><s:text name="generic.label.info.agent"><s:param value="agentCount" /></s:text></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.remainingHeartBeats" /></div>
					<div class="itemContents"><s:text name="generic.label.info.heartBeats"><s:param value="applicationService.heartBeatsWaitingToBeProcessed" /></s:text></div>
				</td>
				<td valign="top" style="padding-right: 25px;">
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.upSince" /></div>
					<div class="itemContents"><s:date name="getOffsetDate(upSince)" format="%{getText('struts.date.format')}" nice="false" /></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.serverCount" /></div>
					<div class="itemContents"><s:text name="generic.label.info.server"><s:param value="serverCount" /></s:text></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.heartBeatCount" /></div>
					<div class="itemContents"><s:text name="generic.label.info.heartBeats"><s:param value="applicationService.heartBeatsProcessed" /></s:text></div>
				</td>
				<td valign="top" style="padding-right: 25px;">
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.status" /></div>
					<div class="itemContents"><s:property value="status" /></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.hostName" /></div>
					<div class="itemContents"><s:property value="hostName" /> (<s:property value="ip" />)</div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.jobQueueCount" /></div>
					<div class="itemContents"><s:text name="generic.label.info.heartBeats"><s:param value="applicationService.jobQueueSize" /></s:text></div>
				</td>
				<td valign="top" style="padding-right: 25px;">
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.jvmMax" /></div>
					<div class="itemContents"><s:property value="%{getNiceMemory(serverInfo.jvmMax)}" /></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.jvmTotal" /></div>
					<div class="itemContents"><s:property value="%{getNiceMemory(serverInfo.jvmTotal)}" /></div>
				</td>
				<td valign="top">
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.jvmAvailable" /></div>
					<div class="itemContents"><s:property value="%{getNiceMemory(serverInfo.jvmAvailable)}" /></div>
	
					<div class="itemLabel"><s:text name="settings.global.serverinfo.label.jvmUsed" /></div>
					<div class="itemContents"><s:property value="%{getNiceMemory(serverInfo.jvmUsed)}" /></div>
				</td>
			</tr>
		</table>
		</div>
		</td>
		<td width="50%" valign="top" style="border-left: 1px solid #666666">
		<div class="titleBar"><s:text name="settings.global.title.purgebehavior" /></div>
		<div class="basicBox">
			<s:form action="SavePurgeSettings">
				<div class="itemLabel"><s:text name="settings.global.purge.dataCollection" /></div>
				<div class="itemContents">
					<select name="dataLifeSpan">
						<s:iterator value="lifeSpanOptionsData">
						<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:text name="settings.global.text.lifeSpanOptions"><s:param value="label" /></s:text></option>
						</s:iterator>
					</select>
				</div>
				<div class="itemLabel"><s:text name="settings.global.purge.logs" /></div>
				<div class="itemContents">
					<select name="logsLifeSpan">
						<s:iterator value="lifeSpanOptionsLogs">
							<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:text name="settings.global.text.lifeSpanOptions"><s:param value="label" /></s:text></option>
						</s:iterator>
					</select>
				</div>
				<s:submit key="generic.button.save" name="submit" />
			</s:form>
		</div>

		<div class="titleBar"><s:text name="settings.global.title.schedule" /></div>
		<div class="basicBox">
			<s:form action="SaveReinventorySettings">
				<div class="itemLabel"><s:text name="settings.global.inventory.label" /></div>
				<div class="itemContents">
					<select name="reinventoryFrequency">
						<s:iterator value="reinventoryOptionsData">
							<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:text name="settings.global.text.reinventoryOptions"><s:param value="label" /></s:text></option>
						</s:iterator>
					</select> <br />
					<s:text name="settings.global.inventory.description" />
				</div>
		
				<s:submit key="generic.button.save" name="submit" />
			</s:form>
		</div>

		<s:if test="user.admin">
			<div class="titleBar"><s:text name="settings.global.title.credentials" /></div>
			<div class="basicBox">
				<s:form action="SaveMySQLNetworkCredentials">
					<div class="itemLabelStandalone"><s:text name="settings.global.credentials.description" /></div>
					<div class="itemLabel"><s:text name="settings.global.credentials.label.email" /><span class="itemLabelModifier"> <s:text name="settings.global.credentials.label.login" /></span></div>
					<div class="itemContents"><input type="text" name="networkCredentialsUsername" value="<s:property value="networkCredentialsUsername" />"	size="50" /></div>
					<div class="itemLabel"><s:text name="settings.global.credentials.label.password" /><span class="itemLabelModifier"> <s:text name="settings.global.credentials.label.password.addition" /></span></div>
					<div class="itemContents">
						<input type="password" name="networkCredentialsPassword" value="<s:property value="networkCredentialsPassword" />"	size="50" />
					</div>
					<div class="itemLabel"><s:text name="settings.global.credentials.label.password.confirm" /></div>
					<div class="itemContents">
						<input type="password" name="networkCredentialsPasswordConfirm" value="<s:property value="networkCredentialsPasswordConfirm" />"	size="50" />
					</div>
			
					<s:submit key="generic.button.save" name="submit" />
				</s:form>
			</div>
	
			<div class="titleBar"><s:text name="settings.global.title.productkey" /></div>
			<div class="basicBox">
				<s:form action="UploadProductKey" enctype="multipart/form-data" method="post">
					<div class="itemContents"><s:text name="settings.global.productkey.label.description" /></div>
					<div class="itemLabel"><s:text name="settings.global.productkey.label.key" /></div>
					<div class="itemContents"><input type="file" name="keyFile" /></div>
					<s:submit key="generic.button.save" name="submit" />
				</s:form>
			</div>
		</s:if>
		</td>
	</tr>
</table>
