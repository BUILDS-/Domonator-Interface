<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="titleBar">
			<div class="title">
				<s:text name="replication.monitoring.subTitle.monitoring" />
			</div>
		</td>
	</tr>
	<tr>
		<td class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr class="titleRow">
						<td><w:sortColumn action="SortReplicationNodes" column="name" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.servers" /></w:sortColumn></td>
						<td><s:text name="replication.monitoring.columnTitle.type" /></td>
						<td><w:sortColumn action="SortReplicationNodes" column="slaveIO" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.slaveIo" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="slaveSQL" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.slaveSql" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="secondsBehind" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.secondsBehind" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="binlog" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.binlog" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="binlogPos" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.binlogPosition" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="masterBinlog" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.masterBinlog" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="masterBinlobPos" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.masterBinlogPosition" /></w:sortColumn></td>
						<td><w:sortColumn action="SortReplicationNodes" column="lastError" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="replication.monitoring.columnTitle.lastError" /></w:sortColumn></td>
						<td class="linkColumn">&nbsp;</td>
					</tr>
					<s:if test="replicationGroups.size < 1">
						<tr class="listRowCategoryL1">
							<td colspan="11" class="noRecordsFound"><s:text name="replication.monitoring.text.noRecords" /></td>
						</tr>
					</s:if>
					<s:iterator value="replicationGroups">
						<s:set name="groupId" value="groupObject.groupId"/>
						<tr class="listRowCategoryL1" id="group<s:property value="#groupId" />">
							<td class="firstCellL1"><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" /> <s:property value="groupObject.groupName" /> (<s:property value="nodes.size" />)</td>
							<td><s:property value="type" /></td>
							<td>
								<span<s:if test="!stateKnown"> class="unknown"</s:if>>
									<s:if test="ioStatus != null">
										<s:if test="ioStatus == 'Yes'"><span class="good"><s:text name="replication.monitoring.text.ioRunning" /></span></s:if>
										<s:elseif test="ioStatus == 'No'"><span class="bad"><s:text name="replication.monitoring.text.ioNotRunning" /></span></s:elseif>
										<s:else><s:text name="replication.monitoring.text.ioUnknown" /></s:else>
									</s:if>
								</span>
							</td>
							<td>
								<span<s:if test="!stateKnown"> class="unknown"</s:if>>
									<s:if test="sqlStatus != null">
										<s:if test="sqlStatus == 'Yes'"><span class="good"><s:text name="replication.monitoring.text.sqlRunning" /></span></s:if>
										<s:elseif test="sqlStatus == 'No'"><span class="bad"><s:text name="replication.monitoring.text.sqlNotRunning" /></span></s:elseif>
										<s:else><s:text name="replication.monitoring.text.sqlUnknown" /></s:else>
									</s:if>
								</span>
							</td>
							<td>
								<span<s:if test="!stateKnown"> class="unknown"</s:if>>
									<span class="<s:if test="secondsBehindCritical">bad</s:if><s:else>good</s:else>">
										<s:if test="secondsBehind != null"><s:property value="secondsBehindInterval" /></s:if>
									</span>
								</span>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><s:property value="truncate(lastError, 50)" /><s:if test="lastError == null">&nbsp;</s:if></td>
							<td><span class="listLink"><a href="javascript://" onclick="renameGroupPopup.show({'groupId' : '<s:property value="#groupId" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" border="0" width="11" height="11" alt="" /> <s:text name="settings.servers.link.renameGroup" /></a></span></td>
						</tr>
						<s:iterator value="nodes" status="row">
							<tr class="listRow<s:if test="#row.odd == true">Alt</s:if>" id="group<s:property value="#groupId" />.-.server<s:property value="server.serverId" />">
								<td class="firstCellL2">
									<div style="padding-left: <s:property value="depth * 15" />px;">
										<span<s:if test="server.serverStatus.primaryState != ''"> class="<s:property value="server.serverStatus.primaryState" />"</s:if>>
											<s:if test="type == 'master'"><a href="javascript://" onclick="replicationInfoPopup.show({'serverId' : '<s:property value="server.serverId" />'}, event)"></s:if>
											<s:elseif test="type == 'slave'"><a href="javascript://" onclick="replicationInfoPopup.show({'serverId' : '<s:property value="server.serverId" />'}, event)"></s:elseif>
											<s:elseif test="type == 'master/slave'"><a href="javascript://" onclick="replicationInfoPopup.show({'serverId' : '<s:property value="server.serverId" />'}, event)"></s:elseif>
												<s:property value="server.serverName" />
											</a>
										</span>
									</div>
								</td>
								<td><s:property value="type" /></td>
								<td>
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:if test="ioStatus != null">
											<s:if test="ioStatus == 'Yes'"><span class="good"><s:text name="replication.monitoring.text.ioRunning" /></span></s:if>
											<s:elseif test="ioStatus == 'No'"><span class="bad"><s:text name="replication.monitoring.text.ioNotRunning" /></span></s:elseif>
											<s:else><s:text name="replication.monitoring.text.ioUnknown" /></s:else>
										</s:if>
										<s:else>&nbsp;</s:else>
									</span>
								</td>
								<td>
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:if test="sqlStatus != null">
											<s:if test="sqlStatus == 'Yes'"><span class="good"><s:text name="replication.monitoring.text.sqlRunning" /></span></s:if>
											<s:elseif test="sqlStatus == 'No'"><span class="bad"><s:text name="replication.monitoring.text.sqlNotRunning" /></span></s:elseif>
											<s:else><s:text name="replication.monitoring.text.sqlUnknown" /></s:else>
										</s:if>
										<s:else>&nbsp;</s:else>
									</span>
								</td>
								<td>
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<span class="<s:if test="secondsBehindCritical">bad</s:if><s:else>good</s:else>"><s:if test="secondsBehind != null"><s:property value="secondsBehindInterval" /></s:if></span>
										<s:if test="secondsBehind == '-1' || secondsBehind == null">&nbsp;</s:if>
									</span>
								</td>
								<td>
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:property value="binlog" /><s:if test="binlog == '' || binlog == null">&nbsp;</s:if>
									</span>
								</td>
								<td class="numeric">
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:if test="binlogPosition"><s:text name="format.number"><s:param value="binlogPosition" /></s:text></s:if><s:if test="binlogPosition == '' || binlogPosition == null">&nbsp;</s:if>
									</span>
								</td>
								<td>
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:property value="masterBinlog" /><s:if test="masterBinlog == '' || masterBinlog == null">&nbsp;</s:if>
									</span>
								</td>
								<td class="numeric">
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:if test="masterBinlogPosition"><s:text name="format.number"><s:param value="masterBinlogPosition" /></s:text></s:if><s:if test="masterBinlogPosition == '' || masterBinlogPosition == null">&nbsp;</s:if>
									</span>
								</td>
								<td title="<s:property value="lastError" />">
									<span<s:if test="server.serverStatus.primaryState != ''"> class="unknown"</s:if>>
										<s:property value="truncate(lastError, 50)" /><s:if test="lastError == '' || lastError == null">&nbsp;</s:if>
									</span>
								</td>
								<td>&nbsp;</td>
							</tr>
						</s:iterator>
					</s:iterator>
				</tbody>
			</table>
		</td>
	</tr>
</table>

<div id="replicationInfoPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupMasterInfoTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="replication.monitoring.popup.replicationInfo.tab.masterInfo" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupSlaveStatusTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="replication.monitoring.popup.replicationInfo.tab.slaveStatus" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupSlaveConfigurationTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="replication.monitoring.popup.replicationInfo.tab.slaveConfiguration" /></td>
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
				<div id="popupMasterInfoBody" class="popupBody">
					<div class="itemLabelStandalone" id="replicationInfoServerName1"></div>

					<table cellpadding="0" cellspacing="0">
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.slaves" /> (<span id="replicationInfoNumSlaves"></span>)</td>
							<td class="itemContents"><div><a href="javascript://"><span id="replicationInfoSlavesHideShow"></span></a></div><span id="replicationInfoSlaves" style="display: none"></span></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.file" /></td>
							<td class="itemContents" id="replicationInfoFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.position" /></td>
							<td class="itemContents" id="replicationInfoPosition"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.binlogDoDB" /></td>
							<td class="itemContents" id="replicationInfoBinlogDoDB"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.binlogIgnoreDB" /></td>
							<td class="itemContents" id="replicationInfoBinlogIgnoreDB"></td>
						</tr>
					</table>
				</div>
				<div id="popupSlaveStatusBody" class="popupBody">
					<div class="itemLabelStandalone" id="replicationInfoServerName2"></div>
					
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.master" /></td>
							<td class="itemContents" id="replicationInfoMaster"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.slaveIORunning" /></td>
							<td class="itemContents" id="replicationInfoSlaveIORunning"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.slaveSQLRunning" /></td>
							<td class="itemContents" id="replicationInfoSlaveSQLRunning"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.slaveIoState" /></td>
							<td class="itemContents" id="replicationInfoSlaveIOState"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.secondsBehindMaster" /></td>
							<td class="itemContents" id="replicationInfoSecondsBehindMaster"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterLogFile" /></td>
							<td class="itemContents" id="replicationInfoMasterLogFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.readMasterLogPos" /></td>
							<td class="itemContents" id="replicationInfoReadMasterLogPos"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.relayLogFile" /></td>
							<td class="itemContents" id="replicationInfoRelayLogFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.relayLogPos" /></td>
							<td class="itemContents" id="replicationInfoRelayLogPos"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.relayMasterLogFile" /></td>
							<td class="itemContents" id="replicationInfoRelayMasterLogFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.execMasterLogPos" /></td>
							<td class="itemContents" id="replicationInfoExecMasterLogPos"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.lastErrno" /></td>
							<td class="itemContents" id="replicationInfoLastErrno"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.lastError" /></td>
							<td class="itemContents" id="replicationInfoLastError"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.skipCounter" /></td>
							<td class="itemContents" id="replicationInfoSkipCounter"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.relayLogSpace" /></td>
							<td class="itemContents" id="replicationInfoRelayLogSpace"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.untilCondition" /></td>
							<td class="itemContents" id="replicationInfoUntilCondition"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.untilLogFile" /></td>
							<td class="itemContents" id="replicationInfoUntilLogFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.untilLogPos" /></td>
							<td class="itemContents" id="replicationInfoUntilLogPos"></td>
						</tr>
					</table>
				</div>
				<div id="popupSlaveConfigurationBody" class="popupBody">
					<div class="itemLabelStandalone" id="replicationInfoServerName3"></div>
					
					<table cellpadding="0" cellspacing="0">		
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterHost" /></td>
							<td class="itemContents" id="replicationInfoMasterHost"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterUser" /></td>
							<td class="itemContents" id="replicationInfoMasterUser"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterPort" /></td>
							<td class="itemContents" id="replicationInfoMasterPort"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.connectRetry" /></td>
							<td class="itemContents" id="replicationInfoConnectRetry"></td>
						</tr>
						
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateDoDB" /></td>
							<td class="itemContents" id="replicationInfoReplicateDoDB"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateIgnoreDB" /></td>
							<td class="itemContents" id="replicationInfoReplicateIgnoreDB"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateDoTable" /></td>
							<td class="itemContents" id="replicationInfoReplicateDoTable"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateIgnoreTable" /></td>
							<td class="itemContents" id="replicationInfoReplicateIgnoreTable"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateWildDoTable" /></td>
							<td class="itemContents" id="replicationInfoReplicateWildDoTable"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.replicateWildIgnoreTable" /></td>
							<td class="itemContents" id="replicationInfoReplicateWildIgnoreTable"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLAllowed" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLAllowed"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLCAFile" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLCAFile"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLCAPath" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLCAPath"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLCert" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLCert"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLCipher" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLCipher"></td>
						</tr>
						<tr>
							<td class="itemLabel"><s:text name="replication.monitoring.popup.replicationInfo.label.masterSSLKey" /></td>
							<td class="itemContents" id="replicationInfoMasterSSLKey"></td>
						</tr>
					</table>
				</div>
				<div align="right">
					<input id="replicationInfoHide" name="hide" type="button" value="<s:text name="generic.button.hide" />" />
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
	
<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */

	var showSlavesMessage = '<s:text name="replication.monitoring.text.showSlaves" />';
	var hideSlavesMessage = '<s:text name="replication.monitoring.text.hideSlaves" />';
	
	function hideSlaves(slavesObject, messageObject) {
		slavesObject.style.display = 'none';
		setInnerHTML(messageObject, showSlavesMessage);
	}
	
	function showSlaves(slavesObject, messageObject) {
		slavesObject.style.display = 'inline';
		setInnerHTML(messageObject, hideSlavesMessage);
	}
	
	function toggleSlaves(slavesObject, messageObject) {
		if(slavesObject.style.display == 'none') {
			showSlaves(slavesObject, messageObject);
		} else {
			hideSlaves(slavesObject, messageObject);
		}
	}
	
	function replicationInfoSetSlaves(instanceData) {
		var numSlaves = instanceData.returnedData.numSlaves
		var slaves = instanceData.returnedData.slaves;
		var hideShow = returnObject('replicationInfoSlavesHideShow');
		var slaveDisplay = returnObject('replicationInfoSlaves');
		if(numSlaves > 5) {
			hideSlaves(slaveDisplay, hideShow);
		} else {
			showSlaves(slaveDisplay, hideShow);
		}
		return slaves;
	}
	
	function initReplicationInfoPopup(instanceData) {
		// if slave, show slave tabs
		if(instanceData.returnedData.isSlave) {
			returnObject('popupSlaveStatusTab').style.display = 'block';
			returnObject('popupSlaveConfigurationTab').style.display = 'block';
		// hide slave tabs
		} else {
			returnObject('popupSlaveStatusTab').style.display = 'none';
			returnObject('popupSlaveConfigurationTab').style.display = 'none';
		}
		// if master show master info and set as default selected
		if(instanceData.returnedData.isMaster) {
			returnObject('popupMasterInfoTab').style.display = 'block';
			replicationInfoPopup.setTab(returnObject('popupMasterInfoTab'));
		// not a master, select slave status tab and hide master info
		} else {
			returnObject('popupMasterInfoTab').style.display = 'none';
			replicationInfoPopup.setTab(returnObject('popupSlaveStatusTab'));
		}
	}

	var replicationInfoPopup = new popup();
	replicationInfoPopup.bindToObject('replicationInfoPopup');
	replicationInfoPopup.setUpdateAction("<s:url action="ReplicationNodeInfo" />");
	replicationInfoPopup.registerHide('replicationInfoHide');
	replicationInfoPopup.createLoader("<s:text name="replication.monitoring.text.loadServerInfo" />");
	replicationInfoPopup.bindData(initReplicationInfoPopup);
	replicationInfoPopup.bindData('serverName', 'replicationInfoServerName1');
	replicationInfoPopup.bindData('serverName', 'replicationInfoServerName2');
	replicationInfoPopup.bindData('serverName', 'replicationInfoServerName3');
	replicationInfoPopup.bindData(replicationInfoSetSlaves, 'replicationInfoSlaves');
	replicationInfoPopup.bindData('numSlaves', 'replicationInfoNumSlaves');
	replicationInfoPopup.bindData('file', 'replicationInfoFile');
	replicationInfoPopup.bindData('position', 'replicationInfoPosition');
	replicationInfoPopup.bindData('binlogDoDB', 'replicationInfoBinlogDoDB');
	replicationInfoPopup.bindData('binlogIgnoreDB', 'replicationInfoBinlogIgnoreDB');
	replicationInfoPopup.bindData('master', 'replicationInfoMaster');
	replicationInfoPopup.bindData('connectRetry', 'replicationInfoConnectRetry');
	replicationInfoPopup.bindData('execMasterLogPos', 'replicationInfoExecMasterLogPos');
	replicationInfoPopup.bindData('lastErrno', 'replicationInfoLastErrno');
	replicationInfoPopup.bindData('lastError', 'replicationInfoLastError');
	replicationInfoPopup.bindData('masterHost', 'replicationInfoMasterHost');
	//replicationInfoPopup.bindData('masterIP', 'replicationInfoMasterIP');
	replicationInfoPopup.bindData('masterLogFile', 'replicationInfoMasterLogFile');
	replicationInfoPopup.bindData('masterPort', 'replicationInfoMasterPort');
	replicationInfoPopup.bindData('masterSSLAllowed', 'replicationInfoMasterSSLAllowed');
	replicationInfoPopup.bindData('masterSSLCAFile', 'replicationInfoMasterSSLCAFile');
	replicationInfoPopup.bindData('masterSSLCAPath', 'replicationInfoMasterSSLCAPath');
	replicationInfoPopup.bindData('masterSSLCert', 'replicationInfoMasterSSLCert');
	replicationInfoPopup.bindData('masterSSLCipher', 'replicationInfoMasterSSLCipher');
	replicationInfoPopup.bindData('masterSSLKey', 'replicationInfoMasterSSLKey');
	replicationInfoPopup.bindData('masterUser', 'replicationInfoMasterUser');
	replicationInfoPopup.bindData('readMasterLogPos', 'replicationInfoReadMasterLogPos');
	replicationInfoPopup.bindData('relayLogFile', 'replicationInfoRelayLogFile');
	replicationInfoPopup.bindData('relayLogPos', 'replicationInfoRelayLogPos');
	replicationInfoPopup.bindData('relayLogSpace', 'replicationInfoRelayLogSpace');
	replicationInfoPopup.bindData('relayMasterLogFile', 'replicationInfoRelayMasterLogFile');
	replicationInfoPopup.bindData('replicateDoDB', 'replicationInfoReplicateDoDB');
	replicationInfoPopup.bindData('replicateDoTable', 'replicationInfoReplicateDoTable');
	replicationInfoPopup.bindData('replicateIgnoreDB', 'replicationInfoReplicateIgnoreDB');
	replicationInfoPopup.bindData('replicateIgnoreTable', 'replicationInfoReplicateIgnoreTable');
	replicationInfoPopup.bindData('replicateWildDoTable', 'replicationInfoReplicateWildDoTable');
	replicationInfoPopup.bindData('replicateWildIgnoreTable', 'replicationInfoReplicateWildIgnoreTable');
	replicationInfoPopup.bindData('secondsBehindMaster', 'replicationInfoSecondsBehindMaster');
	replicationInfoPopup.bindData('skipCounter', 'replicationInfoSkipCounter');
	replicationInfoPopup.bindData('slaveIORunning', 'replicationInfoSlaveIORunning');
	replicationInfoPopup.bindData('untilCondition', 'replicationInfoUntilCondition');
	replicationInfoPopup.bindData('untilLogFile', 'replicationInfoUntilLogFile');
	replicationInfoPopup.bindData('untilLogPos', 'replicationInfoUntilLogPos');
	var replicationInfoHideShow = returnObject('replicationInfoSlavesHideShow');
	var replicationInfoSlaveDisplay = returnObject('replicationInfoSlaves');
	eventManager.registerListener(replicationInfoHideShow, 'click', function(){toggleSlaves(replicationInfoSlaveDisplay, replicationInfoHideShow)});
	replicationInfoPopup.init();
	
	var renameGroupPopup = new popup();
	renameGroupPopup.bindToObject('renameGroupPopup');
	renameGroupPopup.registerHide('renameGroupHide');
	renameGroupPopup.registerSubmit('renameGroupSubmit');
	renameGroupPopup.setFocus('newGroupName');
	renameGroupPopup.setUpdateAction("<s:url action="GetServerAndGroupDetails" />");
	renameGroupPopup.setSubmitAction("<s:url action="RenameServerGroup" />");
	renameGroupPopup.setSubmitHandler(reloadPage);
	renameGroupPopup.bindData("groupName", "newGroupName");

	//initialize popup
	renameGroupPopup.init();
	
	/* ]]> */
</script>