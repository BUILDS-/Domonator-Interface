<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="submit" name="submit" value="<s:text name="settings.servers.button.createGroup" />" onclick="createGroupPopup.show({}, event)"/>
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title"><s:text name="settings.servers.sectionTitle" /></div>
		</td>
	</tr>
	
	<tr>
		<td class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
				<tr class="titleRow">
					<td><s:text name="settings.servers.caption.server" /></td>
					<td><s:text name="settings.servers.caption.version" /></td>
					<td><s:text name="settings.servers.caption.hostname" /></td>
					<td class="linkColumn">&nbsp;</td>
				</tr>
				<s:if test="groups.size < 1">
					<tr class="listRowCategoryL1">
						<td colspan="4" class="noRecordsFound"><s:text name="settings.servers.label.noGroupsFound" /></td>
					</tr>
				</s:if>
				<s:set name="serverInfo" value="serviceMgr.serverInfo"/>
				<s:iterator value="groups">
					<tr class="listRowCategoryL1" id="Group<s:property value="group.groupId" />">
						<td class="firstCellL1">
							<img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" />
							<s:property value="group.groupName" /> (<s:property value="servers.size" />)
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><s:if test="group.defaultGroup" >&nbsp;</s:if>
							<s:else>
								<span class="listLink"><a href="javascript://" onclick="deleteGroupPopup.show({'groupId' : '<s:property value="group.groupId" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" width="11" height="11" alt="<s:text name="settings.servers.link.removeAllFromGroup" />" /> <s:text name="settings.servers.link.removeAllFromGroup" /></a></span>
								<span class="listLink"><a href="javascript://" onclick="renameGroupPopup.show({'groupId' : '<s:property value="group.groupId" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" width="11" height="11" alt="<s:text name="settings.servers.link.renameGroup" />" /> <s:text name="settings.servers.link.renameGroup" /></a></span>
								<s:if test="serverInfo.serverCount > servers.size && !group.replication">
									<span class="listLink"><a href="javascript://" onclick="addToGroupPopup.show({'groupId' : '<s:property value="group.groupId" />'}, event)"><img src="<s:url value="/web/resources/images/addIcon11.png" />" width="11" height="11" alt="<s:text name="settings.servers.link.addToGroup" />" /> <s:text name="settings.servers.link.addToGroup" /></a></span>
								</s:if>
							</s:else>
						</td>
					</tr>
					<s:iterator value="servers" status="serverStatus">
						<tr class="listRow<s:if test="#serverStatus.odd == true">Alt</s:if>" id="Group<s:property value="group.groupId" />.-.<s:property value="server.serverId" />">
							<td class="firstCellL2"><span<s:if test="server.serverStatus.primaryState != ''"> class="<s:property value="server.serverStatus.primaryState" />"</s:if>><s:property value="server.serverName" /></span><s:if test="group.defaultGroup && ungrouped"> (<span class="problem" title="<s:text name="settings.servers.text.serverNotInAGroup" />"><s:text name="settings.servers.text.serverUngrouped" /></span>)</s:if></td>
							<td><s:property value="server.version" /></td>
							<td><s:property value="server.hostName" /></td>
							<td>
								<s:if test="!group.defaultGroup">
									<span class="listLink"><a href="javascript://" onclick="removeFromGroupPopup.show({'groupId' : '<s:property value="group.groupId" />', 'serverId' : '<s:property value="server.serverId" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.servers.link.removeFromGroup" />" /> <s:text name="settings.servers.link.removeFromGroup" /></a></span>
								</s:if>
								<s:if test="!status.agentUp">
									<span class="listLink"><a href="javascript://" onclick="deleteServerPopup.show({'serverId' : '<s:property value="server.serverId" />'}, event)"><img src="<s:url value="/web/resources/images/closeIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="generic.link.delete" />" /> <s:text name="generic.link.delete" /></a></span>
								</s:if>
								<img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" />
							</td>
						</tr>
					</s:iterator>
				</s:iterator>
				</tbody>
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
												<td class="tabBody"><s:text name="settings.servers.tab.createGroup" /></td>
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
					<div class="itemLabel"><s:text name="settings.servers.label.enterNewGroupName" /></div>
					<div class="itemContents"><input type="text" name="newGroupName" id="newGroupName" /></div>
					<div align="right">
						<input id="createGroupSubmit" name="submit" type="button" value="<s:text name="generic.button.create" />" />
						<input id="createGroupHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="renameGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="renameGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.servers.tab.renameGroup" /></td>
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
				<div id="renameGroupBody" class="popupBody">	
					<div class="itemLabel"><s:text name="settings.servers.label.enterNewGroupName" /></div>
					<div class="itemContents"><input type="text" name="newGroupName" id="newGroupName" /></div>
					<div align="right">
						<input id="renameGroupSubmit" name="submit" type="button" value="<s:text name="generic.button.rename" />" />
						<input id="renameGroupHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
												<td class="tabBody"><s:text name="settings.servers.link.removeAllFromGroup" /></td>
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
					<div class="itemLabelStandalone"><s:text name="settings.servers.link.confirmRemovalOfAllServersInGroup" /></div>
					<div align="right">
						<input id="deleteGroupSubmit" name="submit" type="button" value="<s:text name="generic.button.remove" />" />
						<input id="deleteGroupHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="deleteServerPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="deleteServerTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.servers.link.deleteServer" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" /> width="8" height="7" alt="" /></td>
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
				<div id="deleteServerBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="settings.servers.link.confirmDeletionOfServer" /></div>
					
					<div align="right">
						<input id="deleteServerSubmit" name="submit" type="button" value="<s:text name="generic.button.delete" />" />
						<input id="deleteServerHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="removeFromGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="removeFromGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.servers.tab.removeFromGroup" /></td>
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
				<div id="removeFromGroupBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="settings.servers.link.confirmRemovalOfServer" /></div>
					
					<div align="right">
						<input id="removeFromGroupSubmit" name="submit" type="button" value="<s:text name="generic.button.remove" />" />
						<input id="removeFromGroupHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="addToGroupPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="addToGroupTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.servers.titel.addServersToGroup" /></td>
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
				<div id="addToGroupBody" class="popupBody">		
					<div class="itemLabel"><s:text name="settings.servers.label.selectServersToAdd" /></div>
					<div class="itemContents">
						<select name="serverList" multiple="multiple" size="4" id="serverList">
						</select>
					</div>
					<div align="right">
						<input id="addToGroupSubmit" name="submit" type="button" value="<s:text name="generic.button.submit" />" />
						<input id="addToGroupHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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

<script type="text/javascript" language="javascript">
/* <![CDATA[ */

	function fillServerList(instanceData) {
		var servers = instanceData.returnedData.servers;
		var serverList = returnObject("serverList");
		serverList.length = 0;

		// Set visible option count to at least 4 but not more than 12.
		serverList.size = Math.min(Math.max(servers.length, 4), 12);
		
		for (var i = 0; i < servers.length; i++) {
			var option = new Option(servers[i], servers[i]);
			serverList.options[serverList.options.length] = option;
		}

		// Select first value if it is the only one.
		if (servers.length == 1) {
			serverList[0].selected = true;
		}
	}

	var deleteGroupPopup = new popup();
	//bind to html container
	deleteGroupPopup.bindToObject('deleteGroupPopup');
	//register actionable buttons
	deleteGroupPopup.registerHide('deleteGroupHide');
	deleteGroupPopup.registerSubmit('deleteGroupSubmit');
	//set the input item to focus on after popup load
	deleteGroupPopup.setFocus('deleteGroupSubmit');
	//set ajax call for submission
	deleteGroupPopup.setUpdateAction("<s:url action="GetServerAndGroupDetails" />");
	deleteGroupPopup.setSubmitAction("<s:url action="DeleteServerGroup" />");
	//assign a function to handle the page display after a successful submit
	deleteGroupPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteGroupPopup.bindData("groupName", "deleteGroupName");
	//initialize popup
	deleteGroupPopup.init();
	
	var deleteServerPopup = new popup();
	//bind to html container
	deleteServerPopup.bindToObject('deleteServerPopup');
	//register actionable buttons
	deleteServerPopup.registerHide('deleteServerHide');
	deleteServerPopup.registerSubmit('deleteServerSubmit');
	//set the input item to focus on after popup load
	deleteServerPopup.setFocus('deleteServerSubmit');
	//set ajax call for submission
	deleteServerPopup.setUpdateAction("<s:url action="GetServerAndGroupDetails" />");
	deleteServerPopup.setSubmitAction("<s:url action="DeleteServer" />");
	//assign a function to handle the page display after a successful submit
	deleteServerPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteServerPopup.bindData("serverName", "deleteServerName");
	//initialize popup
	deleteServerPopup.init();
	
	var removeFromGroupPopup = new popup();
	//bind to html container
	removeFromGroupPopup.bindToObject('removeFromGroupPopup');
	//register actionable buttons
	removeFromGroupPopup.registerHide('removeFromGroupHide');
	removeFromGroupPopup.registerSubmit('removeFromGroupSubmit');
	//set the input item to focus on after popup load
	removeFromGroupPopup.setFocus('removeFromGroupSubmit');
	//set ajax calls for update and submission
	removeFromGroupPopup.setUpdateAction("<s:url action="GetServerAndGroupDetails" />");
	removeFromGroupPopup.setSubmitAction("<s:url action="RemoveFromServerGroup" />");
	//assign a function to handle the page display after a successful submit
	removeFromGroupPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	removeFromGroupPopup.bindData("serverName", "removeFromGroupServerName");
	removeFromGroupPopup.bindData("groupName", "removeFromGroupGroupName");

	//initialize popup
	removeFromGroupPopup.init();
	
	
	var createGroupPopup = new popup();
	//bind to html container
	createGroupPopup.bindToObject('createGroupPopup');
	//register actionable buttons
	createGroupPopup.registerHide('createGroupHide');
	createGroupPopup.registerSubmit('createGroupSubmit');
	//set the input item to focus on after popup load
	createGroupPopup.setFocus('newGroupName');
	//set ajax calls for update and submission
	createGroupPopup.setSubmitAction("<s:url action="CreateServerGroup" />");
	//assign a function to handle the page display after a successful submit
	createGroupPopup.setSubmitHandler(reloadPage);

	//initialize popup
	createGroupPopup.init();

	
	var renameGroupPopup = new popup();
	//bind to html container
	renameGroupPopup.bindToObject('renameGroupPopup');
	//register actionable buttons
	renameGroupPopup.registerHide('renameGroupHide');
	renameGroupPopup.registerSubmit('renameGroupSubmit');
	//set the input item to focus on after popup load
	renameGroupPopup.setFocus('newGroupName');
	//set ajax calls for update and submission
	renameGroupPopup.setUpdateAction("<s:url action="GetServerAndGroupDetails" />");
	renameGroupPopup.setSubmitAction("<s:url action="RenameServerGroup" />");
	//assign a function to handle the page display after a successful submit
	renameGroupPopup.setSubmitHandler(reloadPage);
	renameGroupPopup.bindData("groupName", "newGroupName");

	//initialize popup
	renameGroupPopup.init();
	
	
	var addToGroupPopup = new popup();
	//bind to html container
	addToGroupPopup.bindToObject('addToGroupPopup');
	//register actionable buttons
	addToGroupPopup.registerHide('addToGroupHide');
	addToGroupPopup.registerSubmit('addToGroupSubmit');
	addToGroupPopup.bindData(fillServerList);
	//set ajax calls for update and submission
	addToGroupPopup.setUpdateAction("<s:url action="PrepareServerList" />");
	addToGroupPopup.setSubmitAction("<s:url action="AddToServerGroup" />");
	//assign a function to handle the page display after a successful submit
	addToGroupPopup.setSubmitHandler(reloadPage);

	//initialize popup
	addToGroupPopup.init();
	
/* ]]> */
</script>
