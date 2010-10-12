<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="titleBar">
			<div class="title">
				<s:text name="settings.logs.title" />
			</div>
		</td>
	</tr>
	<tr>
		<td class="listBox">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
	                <tr class="titleRow">
						<td><s:text name="settings.logs.caption.logName" /></td>
						<td><s:text name="settings.logs.caption.threshold" /></td>
						<td><s:text name="settings.logs.caption.lastModified" /></td>
						<td><s:text name="settings.logs.caption.entries" /></td>
						<td class="linkColumn">&nbsp;</td>
					</tr>
					<s:if test="logInfo.length < 1">
						<tr class="listRowCategoryL1">
							<td colspan="5" class="noRecordsFound"><s:text name= "settings.logs.text.noLogsFound" /></td>
						</tr>
					</s:if><s:else>
						<tr class="listRow">
							<td><a href="<s:url action="ShowLog" />?logName=All" target="_blank"><s:text name="settings.logs.caption.all" /></a></td>
							<td><s:text name="settings.logs.text.notApplicable" /></td>
							<td><s:if test="lastModified == null"><s:text name="settings.logs.text.notApplicable" /></s:if><s:else><s:date name="getOffsetDate(lastModified)" format="%{getText('struts.date.format')}" nice="false" /></s:else></td>
							<td><s:property value="totalCount" /></td>
							<td>
								<span class="listLink"><a href="javascript://" onclick="clearLogsPopup.show({}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.logs.link.clearAllLogs" />" /> <s:text name="settings.logs.link.clearAllLogs" /></a></span>
							</td>
						</tr>
						<s:iterator value="logs" status="iteratorStatus">
							<tr class="listRow<s:if test="#iteratorStatus.odd">Alt</s:if>">
								<td><a href="<s:url action="ShowLog" ><s:param name="logName" value="name" /></s:url>" target="_blank"><s:property value="name" /></a></td>
								<td><s:property value="%{getPlainTextLogLevel(threshold)}" /></td>
								<td><s:if test="lastModified == null"><s:text name="settings.logs.text.notApplicable" /></s:if><s:else><s:date name="getOffsetDate(lastModified)" format="%{getText('struts.date.format')}" nice="false" /></s:else></td>
								<td><s:property value="entries" /></td>
								<td>
									<span class="listLink"><a href="javascript://" onclick="clearLogsPopup.show({'name' : '<s:property value="name" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.logs.link.clearLog" />" /> <s:text name="settings.logs.link.clearLog" /></a></span>
									<span class="listLink"><a href="javascript://" onclick="editThresholdPopup.show({'name' : '<s:property value="name" />', 'threshold' : '<s:property value="threshold.logLevel" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.logs.link.editLogLevel" />" /> <s:text name="settings.logs.link.editLogLevel" /></a></span>
								</td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</td>
	</tr>
</table>

<form action="#" onsubmit="return false">
<div id="editThresholdPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="editThresholdTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.logs.tab.editLogLevel" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">
				<div id="editThresholdBody" class="popupBody">		
					<div class="itemLabel"><s:text name="settings.logs.label.logName" /></div>
					<div class="itemContents" id="editThresholdLogName">Error: Log name not loaded</div>
					
					<div class="itemLabel"><s:text name="settings.logs.label.logLevel" /><span class="itemLabelModifier"> (<s:text name="settings.logs.label.logLevelFurtherInfo" />)</span></div>
					<div class="itemContents">
						<select name="thresholdSelect">
							<s:iterator value="logLevelOptions">
								<option value="<s:property value="value" />"><s:property value="label" /></option>
							</s:iterator>
						</select>
					</div>
					
					<div align="right">
						<input id="editThresholdSubmit" name="submit" type="button" value="<s:text name="generic.button.save" />" />
						<input id="editThresholdHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="<s:url value="/web/resources/images/tertiaryOnBL.gif" />" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="<s:url value="/web/resources/images/tertiaryOnBR.gif" />" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>

<form action="#" onsubmit="return false">
<div id="clearLogsPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="clearLogsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.logs.page.clearLog" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">
				<div id="clearLogsBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="settings.logs.text.confirmClearingOfLog" /> <span id="clearLogsName"></span></div>
					
					<div align="right">
						<input id="clearLogsSubmit" name="submit" type="button" value="<s:text name="settings.logs.button.clear" />" />
						<input id="clearLogsHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="<s:url value="/web/resources/images/tertiaryOnBL.gif" />" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="<s:url value="/web/resources/images/tertiaryOnBR.gif" />" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>


<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */
	var editThresholdPopup = new popup();
	//bind to html container
	editThresholdPopup.bindToObject('editThresholdPopup');
	//register actionable buttons
	editThresholdPopup.registerHide('editThresholdHide');
	editThresholdPopup.registerSubmit('editThresholdSubmit');
	//set the input item to focus on after popup load
	editThresholdPopup.setFocus('threshold');
	//set ajax call for update
	editThresholdPopup.setUpdateAction("<s:url action="GetThresholdInfo" />");
	//set ajax call for submission
	editThresholdPopup.setSubmitAction("<s:url action="UpdateThreshold" />");
	//assign a function to handle the page display after a successful submit
	editThresholdPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	editThresholdPopup.bindData('name', "editThresholdLogName");
	editThresholdPopup.bindData('threshold', "thresholdSelect");
	//initialize popup
	editThresholdPopup.init();
	
	function getLogName(instanceData) {
		if(typeof(instanceData.customArguments.name) != 'undefined') {
			return instanceData.customArguments.name;
		} else {
			return '<s:text name="settings.logs.caption.all" />';
		}
	}
	
	var clearLogsPopup = new popup();
	//bind to html container
	clearLogsPopup.bindToObject('clearLogsPopup');
	//register actionable buttons
	clearLogsPopup.registerHide('clearLogsHide');
	clearLogsPopup.registerSubmit('clearLogsSubmit');
	//set the input item to focus on after popup load
	editThresholdPopup.setFocus('clearLogsSubmit');
	//set ajax call for submission
	clearLogsPopup.setSubmitAction("<s:url action="ClearLogs" />");
	//assign a function to handle the page display after a successful submit
	clearLogsPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	clearLogsPopup.bindData(getLogName, "clearLogsName");
	//initialize popup
	clearLogsPopup.init();
/* ]]> */
</script>
