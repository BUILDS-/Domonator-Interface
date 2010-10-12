<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="button" name="createGroup" value="<s:text name="settings.notification.button.createGroup" />" onclick="createGroupPopup.show(null, event)" />
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title"><s:text name="settings.notification.button.manageGroups" /></div>
		</td>
	</tr>
	
	<tr>
		<td class="listBox">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr class="titleRow">
					<td><s:text name="settings.notification.button.groupName" /></td>
					<td><s:text name="settings.notification.button.recipients" /></td>
					<td class="linkColumn">&nbsp;</td>
				</tr>
				<s:if test="targets.length < 1">
					<tr class="listRow">
						<td colspan="3" class="noRecordsFound"><s:text name="settings.notification.button.noNotificationGroupsFound" /></td>
					</tr>
				</s:if>
				<s:iterator value="targets" status="iteratorStatus"> 
					<tr class="listRow<s:if test="#iteratorStatus.odd">Alt</s:if>">
						<td><s:property value="name" /></td>
						<td><s:property value="recipients" /></td>
						<td>
							<!-- TODO combine edits into one edit page -->
							<span class="listLink"><a href="javascript://" onclick="editGroupPopup.show({'id' : '<s:property value="id" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.notification.link.edit" />" /> <s:text name="settings.notification.link.edit" /></a></span>
							<span class="listLink"><a href="javascript://" onclick="deleteGroupPopup.show({'id' : '<s:property value="id" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.notification.link.delete" />" /> <s:text name="settings.notification.link.delete" /></a></span>
						</td>
					</tr>
				</s:iterator>	
			</table>
		</td>
	</tr>
</table>

<form action="#" onsubmit="return false">
<div id="createGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="createGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.notification.tab.createGroup" /></td>
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
				<div id="createGroupBody" class="popupBody">		
					<div class="itemLabel"><s:text name="settings.notification.label.groupName" /></div>
					<div class="itemContents"><input type="text" size="50" name="name" /></div>
					
					<div class="itemLabel"><s:text name="settings.notification.label.recipients" /><span class="itemLabelModifier"> (<s:text name="settings.notification.label.furtherRecipientsInfo" />)</span></div>
					<div class="itemContents"><textarea name="recipients" rows="5" cols="50"></textarea></div>
					
					<div align="right">
						<input id="createGroupSubmit" name="submit" type="button" value="<s:text name="settings.notification.button.add" />" />
						<input id="createGroupHide" name="hide" type="button" value="<s:text name="settings.notification.button.cancel" />" />
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
<div id="editGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="editGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.notification.tab.editGroup" /></td>
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
				<div id="editGroupBody" class="popupBody">		
					<div class="itemLabel"><s:text name="settings.notification.button.groupName" /></div>
					<div class="itemContents" id="editGroupName"></div>
					
					<div class="itemLabel"><s:text name="settings.notification.button.recipients" /><span class="itemLabelModifier"> (<s:text name="settings.notification.label.furtherRecipientsInfo" />)</span></div>
					<div class="itemContents"><textarea name="recipients" rows="5" cols="50"></textarea></div>
					
					<div align="right">
						<input id="editGroupSubmit" name="submit" type="submit" value="<s:text name="settings.notification.button.update" />" />
						<input id="editGroupHide" name="hide" type="submit" value="<s:text name="settings.notification.button.cancel" />" />
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
<div id="deleteGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="deleteGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.notification.tab.deleteGroup" /></td>
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
				<div id="deleteGroupBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name= "settings.notification.label.confirmDeletion" /> <span id="deleteGroupName"></span></div>
					
					<div align="right">
						<input id="deleteGroupSubmit" name="submit" type="button" value="<s:text name="settings.notification.button.delete" />" />
						<input id="deleteGroupHide" name="hide" type="button" value="<s:text name="settings.notification.button.cancel" />" />
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
	var createGroupPopup = new popup();
	//bind to html container
	createGroupPopup.bindToObject('createGroupPopup');
	//register actionable buttons
	createGroupPopup.registerHide('createGroupHide');
	createGroupPopup.registerSubmit('createGroupSubmit');
	//set the input item to focus on after popup load
	createGroupPopup.setFocus('name');
	//set ajax call for submission
	createGroupPopup.setSubmitAction("<s:url action="AddNotification" />");
	//assign a function to handle the page display after a successful submit
	createGroupPopup.setSubmitHandler(reloadPage);
	//initialize popup
	createGroupPopup.init();
	
	//TODO: make this update the page instead of refreshing
	//TODO: add confirm message
	var editGroupPopup = new popup();
	//bind to html container
	editGroupPopup.bindToObject('editGroupPopup');
	//register actionable buttons
	editGroupPopup.registerHide('editGroupHide');
	editGroupPopup.registerSubmit('editGroupSubmit');
	//set the input item to focus on after popup load
	editGroupPopup.setFocus('recipients');
	//set ajax call for update
	editGroupPopup.setUpdateAction("<s:url action="GetNotification" />");
	//set ajax call for submission
	editGroupPopup.setSubmitAction("<s:url action="UpdateNotification" />");
	//assign a function to handle the page display after a successful submit
	editGroupPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	editGroupPopup.bindData("target.name", "editGroupName");
	editGroupPopup.bindData("target.recipients", "recipients");
	//initialize popup
	editGroupPopup.init();
	
	//todo make this update the page instead of refreshing
	var deleteGroupPopup = new popup();
	//bind to html container
	deleteGroupPopup.bindToObject('deleteGroupPopup');
	//register actionable buttons
	deleteGroupPopup.registerHide('deleteGroupHide');
	deleteGroupPopup.registerSubmit('deleteGroupSubmit');
	//set the input item to focus on after popup load
	deleteGroupPopup.setFocus('deleteGroupSubmit');
	//set ajax call for update
	deleteGroupPopup.setUpdateAction("<s:url action="GetNotification" />");
	//set ajax call for submission
	deleteGroupPopup.setSubmitAction("<s:url action="DeleteNotification" />");
	//assign a function to handle the page display after a successful submit
	deleteGroupPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteGroupPopup.bindData("target.name", "deleteGroupName");
	//initialize popup
	deleteGroupPopup.init();
/* ]]> */
</script>