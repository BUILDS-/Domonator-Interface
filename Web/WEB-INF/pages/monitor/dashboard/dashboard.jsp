<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">

	<tr>
		<td valign="top" style="border-right: 1px solid #AAAAAA;">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<div class="titleBar"><s:text name="dashboard.sectionTitle.graphs" /></div>
						<div class="basicBox" style="padding: 5px;" align="center">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<s:if test="graphs.length > 0">
										<table cellpadding="5" cellspacing="0">
											<tr>
												<s:iterator value="graphs" status="graphStatus">
													<td style="text-align: center;">
														<div class="itemLabel"><s:property /></div>
														<table cellpadding="0" cellspacing="0">
															<tr>
																<td class="graphSurround"><a href="javascript://" onclick="fullGraphPopup.show({'graphName' : '<s:property />'}, event)"><img src="<s:url action="Thumb" />?graphName=<s:property />&amp;t=<s:property value="now.time" />" width="<s:property value="thumbWidth" />" height="<s:property value="thumbHeight" />" alt="<s:property />"/></a></td>
															</tr>
														</table>
													</td>
													<s:if test="!#graphStatus.last == true && #graphStatus.even == true">
														</tr><tr>
													</s:if>
												</s:iterator>
											</tr>
										</table>
										</s:if>
										<s:else>
											<div class="itemContents"><s:text name="dashboard.text.noFavorites" /></div>
										</s:else>
										<div class="itemContents">
											<span class="listLink"><a href="javascript://" onclick="editFavorites.show({}, event)"><img src="<s:url value="/web/resources/images/successIcon11.png" />" border="0" width="11" height="11" alt="" /> <s:text name="dashboard.link.editGraphFavorites" /></a></span>
											<span class="listLink"><a href="javascript://" onclick="editGraphDefaults.show({}, event)"><img src="<s:url value="/web/resources/images/confgIcon11.png" />" border="0" width="11" height="11" alt="" /> <s:text name="dashboard.link.configureGraphs" /></a></span>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="titleBar">
									<div class="title"><s:text name="dashboard.sectionTitle.events" /></div>
									<w:paging numRecords="numRecords" currentPage="page" limit="limit" action="PageDashboardEvents" />
								</td>
							</tr>
							<tr>
								<td class="listBox">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr class="titleRow">
												<td><s:text name="events.columnTitle.server" /></td>
												<td><s:text name="events.columnTitle.category" /></td>
												<td><s:text name="events.columnTitle.rule" /></td>
												<td><s:text name="events.columnTitle.time" /></td>
												<td style="border-right: none;">&nbsp;</td>
											</tr>
											<s:if test="%{history.length < 1}">
												<tr class="listRow">
													<td colspan="8" class="noRecordsFound" style="border-right: none;"><s:text name="events.text.noRecords" /></td>
												</tr>
											</s:if>
											<s:iterator value="history" status="row">
												<tr class="listRow<s:if test="#row.odd == true">Alt</s:if>">
													<td><s:property value="serverObj.serverName"/></td>
													<td><s:property value="monitorObj.category.name"/></td>
													<td style="white-space: normal;"><a href="javascript://" onclick="historyInfoPopup.show({'historyId' : '<s:property value="historyId"/>'}, event)"><s:property value="monitorObj.name"/></a></td>
													<td title="<s:date name="getOffsetDate(severeAlarmTimestamp)" format="%{getText('struts.date.format.past')}" nice="true" />"><s:date name="getOffsetDate(severeAlarmTimestamp)" /></td>
													<td style="border-right: none;">
														<span class="closeLink"><span class="listLink"><a href="javascript://" onclick="historInfoCloseShow({'historyId' : '<s:property value="historyId"/>'}, event)"><img src="<s:url value="/web/resources/images/closeIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="events.link.close" />" /> <s:text name="events.link.close" /></a></span></span>
														<span class="resolutionNotesLink" style="display: none"><span class="listLink"><a href="javascript://" onclick="historInfoResolutionShow({'historyId' : '<s:property value="historyId"/>'}, event)"><img src="<s:url value="/web/resources/images/noteIcon11.png" />" border="0" width="11" height="11" alt="" /> <s:text name="events.link.notes" /></a></span></span>
													</td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td style="background: #FFFFFF; border-bottom: 1px solid #C4C4C4;" valign="top">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="center">
						<div class="titleBar"><s:text name="dashboard.sectionTitle.heatChart" /></div>
						<div  style="padding: 12px 5px 3px 5px;">
						<table cellpadding="0" cellspacing="0" align="center">
							<tr>
								<td class="listBox<s:if test="groupView">Collapsible</s:if>">
									<table cellpadding="0" cellspacing="0" id="heatChart">
										<tbody>
											<tr class="heatChartHeader">
												<td align="right"><img src="<s:url value="/web/resources/images/heatChartHeaderLeft.png" />" width="92" height="92" alt="" class="decoration"/></td>
												<td colspan="<s:property value="numRules + 6" />" align="left"><img src="<s:url value="/web/resources/images/heatChartHeaderRight.png" />" width="280" height="92" alt="" class="decoration"/></td>
											</tr>
											<s:if test="%{heatChart.size < 1}">
												<tr class="listRowHeatCategoryL1">
													<td class="noRecordsFound" style="border-left: 1px solid #999999;" colspan="<s:property value="numRules + 6" />"><s:text name="dashboard.heatChart.noServers" /></td>
												</tr>
											</s:if>
											<s:iterator value="heatChart">
												<s:if test="records.size !=0">
													<tr class="listRowHeatCategoryL1" id="Group<s:property value="groupId" />">
														<td class="firstCellHeatL1"><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" /> <s:property value="groupName" /> (<s:property value="serverRecords.size" />)</td>
														<td class="heatIndicatorUpDown"><s:if test="agentStatus == 'down'"><a href="<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="agentStatus" />Dot.png" title="<s:property value="agentStatus" />" width="11" height="11" alt="<s:property value="agentStatus" />"/><s:if test="agentStatus == 'down'"></a></s:if></td>
														<td class="heatIndicatorUpDown"><s:if test="serverStatus == 'down'"><a href="<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="serverStatus" />Dot.png" title="<s:property value="serverStatus" />" width="11" height="11" alt="<s:property value="serverStatus" />"/><s:if test="serverStatus == 'down'"></a></s:if></td>
														<s:iterator value="records">
															<td class="heatIndicator<s:property value="heatChartCategory" />"><s:if test="showLink"><a href="<s:url action="FilterEvents" />?severity=<s:property value="currentAlarmLevel" />&amp;ruleId=<s:property value="ruleId" />&amp;group=<s:property value="groupId" />"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="currentAlarmLevel" />Dot.png" title="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" width="11" height="11" alt="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" /><s:if test="showLink"></a></s:if></td>
														</s:iterator>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />"><s:if test="numCritical < maxCounterSize"><s:property value="numCritical" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowCritical.png" />" title="<s:property value="numCritical" />" width="11" height="11" alt="<s:property value="numCritical" />" /></s:else></a></td>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=warning&amp;group=<s:property value="groupId" />"><s:if test="numWarning < maxCounterSize"><s:property value="numWarning" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowWarning.png" />" title="<s:property value="numWarning" />" width="11" height="11" alt="<s:property value="numWarning" />" /></s:else></a></td>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=info&amp;group=<s:property value="groupId" />"><s:if test="numInfo < maxCounterSize"><s:property value="numInfo" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowInfo.png" />" title="<s:property value="numInfo" />" width="11" height="11" alt="<s:property value="numInfo" />" /></s:else></a></td>
													</tr>
												</s:if>
												<s:iterator value="serverRecords" status="recordsStatus">
													<tr class="listRowHeat" id="<s:if test="groupId">Group<s:property value="groupId" />.-.</s:if>Server<s:property value="serverId" />">
														<td class="firstCellHeatL2"><span<s:if test="primaryState != ''"> class="<s:property value="primaryState" />"</s:if>><s:property value="serverName" /></span></td>
														<td class="heatIndicatorUpDown"><s:if test="agentStatus == 'down'"><a href="<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="agentStatus" />Dot.png" title="<s:property value="agentStatus" />" width="11" height="11" alt="<s:property value="agentStatus" />"/><s:if test="agentStatus == 'down'"></a></s:if></td>
														<td class="heatIndicatorUpDown"><s:if test="serverStatus == 'down'"><a href="<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="serverStatus" />Dot.png" title="<s:property value="serverStatus" />" width="11" height="11" alt="<s:property value="serverStatus" />"/><s:if test="serverStatus == 'down'"></a></s:if></td>
														<s:iterator value="records">
															<td class="heatIndicator<s:property value="heatChartCategory" />"><s:if test="showLink"><a href="<s:url action="FilterEvents" />?severity=<s:property value="currentAlarmLevel" />&amp;ruleId=<s:property value="ruleId" />&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="currentAlarmLevel" />Dot.png" title="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" width="11" height="11" alt="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" /><s:if test="showLink"></a></s:if></td>
														</s:iterator>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"><s:if test="numCritical < maxCounterSize"><s:property value="numCritical" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowCritical.png" />" title="<s:property value="numCritical" />" width="11" height="11" alt="<s:property value="numCritical" />" /></s:else></a></td>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=warning&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"><s:if test="numWarning < maxCounterSize"><s:property value="numWarning" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowWarning.png" />" title="<s:property value="numWarning" />" width="11" height="11" alt="<s:property value="numWarning" />" /></s:else></a></td>
														<td class="heatIndicatorAlerts"><a href="<s:url action="FilterEvents" />?severity=info&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>"><s:if test="numInfo < maxCounterSize"><s:property value="numInfo" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowInfo.png" />" title="<s:property value="numInfo" />" width="11" height="11" alt="<s:property value="numInfo" />" /></s:else></a></td>
													</tr>
												</s:iterator>
											</s:iterator>
										</tbody>
									</table>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td align="left"><div class="itemLabel"><a href="javascript://" onclick="toggleLegend()" id="heatChartLegendLabel"><s:text name="heatChart.link.showLegend" /></a></div></td>
											<td align="right"><div class="itemLabel"><a href="javascript://" onclick="openStandAloneHeatChart('<s:url action="HeatChart" />')"><s:text name="dashboard.link.showStandaloneHeatChart" /></a></div></td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" align="left" id="heatChartLegend" style="display: none;">
										<tr>
											<td style="border: 1px solid #AAAAAA; background: #FFFFEA; padding: 5px; text-align: left;">
												<table cellpadding="0" cellspacing="7">
													<tr>
														<td nowrap="nowrap" style="font-weight: bold; padding-right: 15px;"><s:text name="dashboard.legend.columnTitle.serverAgentIcons" /></td>
														<td  nowrap="nowrap" style="font-weight: bold;"><s:text name="dashboard.legend.columnTitle.eventIcons" /></td>
													</tr>
													<tr>
														<td><img src="<s:url value="/web/resources/images/upDot.png" />" title="<s:text name="server.status.up" />" width="11" height="11" alt="<s:text name="server.status.up" />" /> <s:text name="server.status.up" /></td>
														<td><img src="<s:url value="/web/resources/images/OKDot.png" />" title="<s:text name="event.status.ok" />" width="11" height="11" alt="<s:text name="event.status.ok" />" /> <s:text name="event.status.ok" /></td>
													</tr>
													<tr>
														<td><img src="<s:url value="/web/resources/images/downDot.png" />" title="<s:text name="server.status.down" />" width="11" height="11" alt="<s:text name="server.status.down" />" /> <s:text name="server.status.down" /></td>
														<td><img src="<s:url value="/web/resources/images/infoDot.png" />" title="<s:text name="event.status.info" />" width="11" height="11" alt="<s:text name="event.status.info" />" /> <s:text name="event.status.info" /></td>
													</tr>
													<tr>
														<td><img src="<s:url value="/web/resources/images/unknownDot.png" />" title="<s:text name="server.status.unknown" />" width="11" height="11" alt="<s:text name="server.status.unknown" />" /> <s:text name="server.status.unknown" /></td>
														<td><img src="<s:url value="/web/resources/images/warningDot.png" />" title="<s:text name="event.status.warning" />" width="11" height="11" alt="<s:text name="event.status.warning" />" /> <s:text name="event.status.warning" /></td>
													</tr>
													<tr>
														<td></td>
														<td><img src="<s:url value="/web/resources/images/criticalDot.png" />" title="<s:text name="event.status.critical" />" width="11" height="11" alt="<s:text name="event.status.critical" />" /> <s:text name="event.status.critical" /></td>
													</tr>
													<tr>
														<td></td>
														<td><img src="<s:url value="/web/resources/images/unknownDot.png" />" title="<s:text name="event.status.unknown" />" width="11" height="11" alt="<s:text name="event.status.unknown" />" /> <s:text name="event.status.unknown" /></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						</div>
					</td>
				</tr>
				<s:if test="serverMetaInfo">
					<tr>
						<td>
						<br/><br/>
							<div class="titleBar"><s:text name="dashboard.sectionTitle.metaInfo" /></div>
							<div class="basicBox">
								<table celppadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50%" valign="top">
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.host" /></td>
													<td class="metaContent"><s:property value="serverMetaInfo.host"/></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.mySqlVersion" /></td>
													<td class="metaContent"><s:property value="serverMetaInfo.serverVersion"/></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.agent" /></td>
													<td class="metaContent"><s:property value="serverMetaInfo.agentVersion"/><!-- isLocal whenRegistered--></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.rules" /></td>
													<td class="metaContent"><s:text name="dashboard.metaInfo.text.numRules"><s:param value="serverMetaInfo.numRules"/></s:text></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.lastMySqlContact" /></td>
													<td class="metaContent"><s:date name="getOffsetDate(serverMetaInfo.lastServerContact)"/></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.lastAgentContact" /></td>
													<td class="metaContent"><s:date name="getOffsetDate(serverMetaInfo.lastAgentContact)"/></td>
												</tr>
											</table>
										</td>
										<td width="50%" valign="top">
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.osInfo" /></td>
													<td class="metaContent"><s:property value="serverMetaInfo.osName"/> <s:property value="serverMetaInfo.osVersion"/></td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.cpuInfo" /></td>
													<td class="metaContent">
														<s:property value="serverMetaInfo.osCPU"/><br />
														<s:text name="dashboard.metaInfo.text.amountRam"><s:param value="serverMetaInfo.osMemory"/></s:text><br />
														<s:text name="dashboard.metaInfo.text.diskSpace"><s:param value="serverMetaInfo.osDisk"/></s:text>
													</td>
												</tr>
												<tr>
													<td class="metaLabel"><s:text name="dashboard.metaInfo.label.ipAddress" /></td>
													<td class="metaContent">
														<s:iterator value="serverMetaInfo.nicList">
															<s:property value="name" />: <s:property value="ipAddress" /><br>
														</s:iterator>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</s:if>
			</table>
		</td>
	</tr>
</table>

<!-- POPUP CONTAINERS -->
<form action="#" onsubmit="return false">
<div id="historyInfoPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryResultsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.history.tab.results" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryResolutionTab" style="display: none">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.history.tab.resolution" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryCloseTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.history.tab.close" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryDetailsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.history.tab.details" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryAdvancedTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.history.tab.advanced" /></td>
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
				<div id="popupHistoryResultsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType1">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName1">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion1">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved1">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.server" /></div>
					<div class="itemContents" id="historyInfoServerName1">Error: Server name not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.time" /></div>
					<div class="itemContents" id="historyInfoEventTime1">Error: Event time not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.status" /></div>
					<div class="itemContents" id="historyInfoStatus">Error: Status not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.advice" /></div>
					<div class="itemContents" id="historyInfoAdvice1">Error: Rule advice not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.action" /></div>
					<div class="itemContents" id="historyInfoCommand1">Error: Rule recommended action not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.notifications" /></div>
					<div class="itemContents" id="historyInfoNotifications">Error: Notifications not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide1" value="<s:text name="events.popup.history.button.hide" />" /></div>
				</div>
				<div id="popupHistoryResolutionBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType2">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName2">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion2">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved2">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabelStandalone">Closed by <!-- substitute strings in so that "Closed by" isn't in plain text --><span id="historyInfoClosedBy">Error: Closed by not loaded</span> at <!-- substitute strings in so that "at" isn't in plain text --> <span id="historyInfoClosedAt">Error: Closed time not loaded</span></div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.notes" /></div>
					<div class="itemContents" id="historyInfoResolutionNotes">Error: Resolution notes not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide2" value="<s:text name="events.popup.history.button.hide" />" /></div>
				</div>
				<div id="popupHistoryCloseBody" class="popupBody">
					<div class="itemLabelStandalone">Close <span id="ruleToClose">Error: no event found for closure</span> on <span id="serverToClose">Error: no server found for closure</span></div>

					<div class="itemLabel"><s:text name="events.popup.label.timestamp" /></div>
					<div class="itemContents" id="historyInfoTimestamp">Error: Timestamp no loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.notes" /></div>
					<div class="itemContents"><textarea name="notes" rows="5" cols="50"></textarea></div>

					<div align="right">
						<input id="historyInfoClose" name="submit" type="button" value="<s:text name="events.popup.history.button.close" />" />
						<input id="historyInfoHide3" name="hide" type="button" value="<s:text name="events.popup.history.button.hide" />" />
					</div>
				</div>
				<div id="popupHistoryDetailsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType3">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName3">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion3">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved3">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.server" /></div>
					<div class="itemContents" id="historyInfoServerName2">Error: Server name not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.time" /></div>
					<div class="itemContents" id="historyInfoEventTime2">Error: Event time not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.category" /></div>
					<div class="itemContents" id="historyInfoParentAdvisor">Error: Advisor not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.description" /></div>
					<div class="itemContents" id="historyInfoMoreInfo">Error: Rule problem description not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.advice" /></div>
					<div class="itemContents" id="historyInfoAdvice2">Error: Rule Advice not loaded</div>

					<div class="itemLabel"><s:text name="events.popup.history.label.action" /></div>
					<div class="itemContents" id="historyInfoCommand2">Error: Rule Recommended Action not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.furtherInfo" /></div>
					<div class="itemContents" id="historyInfoFurtherInfo">Error: Rule links and further reading not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide4" value="<s:text name="events.popup.history.button.hide" />" /></div>
				</div>
				<div id="popupHistoryAdvancedBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType4">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName4">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion4">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved4">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.thresholds" /></div>
					<div class="itemContents">
						<s:text name="events.popup.history.label.critical" /> = <span id="historyInfoCriticalThreshold">Error: Rule critical threshold not loaded</span><br />
						<s:text name="events.popup.history.label.warning" /> = <span id="historyInfoWarningThreshold">Error: Rule warning threshold not loaded</span><br />
						<s:text name="events.popup.history.label.info" /> = <span id="historyInfoInfoThreshold">Error: Rule info threshold not loaded</span>
					</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.frequency" /></div>
					<div class="itemContents" id="historyInfoFrequency">Error: Rule frequency not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.expression" /></div>
					<div class="itemContents" id="historyInfoExpression">Error: Rule expression not loaded</div>
					
					<div class="itemLabel"><s:text name="events.popup.history.label.evaluatedExpression" /></div>
					<div class="itemContents" id="historyInfoEvaluatedExpression">Error: Evaluated expression not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide5" value="<s:text name="events.popup.history.button.hide" />" /></div>
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
<div id="fullGraphPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupGraphTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="dashboard.popup.fullGraph.tab.display" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupGraphConfigTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="dashboard.popup.fullGraph.tab.configure" /></td>
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
				<div id="popupGraphBody" class="popupBody">
					<div class="itemLabel" align="center"><s:property value="serverContext" /> : <span id="graphTitle"></span></div>
					<div class="itemContents" align="center"><img src="<s:url value="/web/resources/images/spacer.gif" />" id="fullGraph" alt="" /></div>
					<div class="itemContents" align="right"><input type="button" name="hide" value="<s:text name="generic.button.hide" />" id="graphHide" /></div>
				</div>
				
				<div id="popupGraphConfigBody" class="popupBody">
					<div class="itemContents">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" style="padding-right: 10px;" valign="top" nowrap="nowrap"><input type="radio" name="graphType" value="interval" checked="checked" onclick="setGraphControls()" /> Interval:</td>
								<td valign="top" id="intervalContainer" nowrap="nowrap">
									<div class="inputLabelWrap">
										<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
										<select name="intervalHours">
											<s:iterator value="hourOptions">
												<option value="<s:property value="value" />"><s:property value="label" /></option>
											</s:iterator>
										</select>
									</div>
									
									<div class="inputLabelWrap">
										<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
										<select name="intervalMinutes">
											<s:iterator value="minuteOptions">
												<option value="<s:property value="value" />"><s:property value="label" /></option>
											</s:iterator>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="padding: 0px 10px 0px 20px;" valign="top" nowrap="nowrap"><input type="radio" name="graphType" value="fromTo" onclick="setGraphControls()" /> From/To:</td>
								<td valign="top" id="fromToContainer" nowrap="nowrap">
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td valign="top">
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="dashboard.popup.fullGraph.label.fromDate" /></span><br/>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td><input type="text" id="fromCalendar" name="fromDate" size="8" disabled="disabled"/></td>
															<td><img src="<s:url value="/web/resources/images/calendarIcon.jpg" />" id="fromCalendarButton" width="16" height="16" alt="" /></td>
														</tr>
													</table>
													<script type="text/javascript" language="javascript">
													/* <![CDATA[ */
														var fromCalendar = new calendar();
														fromCalendar.registerInput('fromCalendar');
														fromCalendar.registerToggle('fromCalendarButton');
														fromCalendar.setTimeOffset('<s:date name="now" format="%{getText('datePicker.initOffset')}" />');
														fromCalendar.init();
													/* ]]> */
													</script>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
													<select name="fromHours" disabled="disabled">
														<s:iterator value="hourOptions">
															<option value="<s:property value="value" />"><s:property value="label" /></option>
														</s:iterator>
													</select>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
													<select name="fromMinutes" disabled="disabled">
														<s:iterator value="minuteOptions">
															<option value="<s:property value="value" />"><s:property value="label" /></option>
														</s:iterator>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td valign="top">
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="dashboard.popup.fullGraph.label.toDate" /></span><br/>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td><input type="text" id="toCalendar" name="toDate" size="8" disabled="disabled" /></td>
															<td><img src="<s:url value="/web/resources/images/calendarIcon.jpg" />" id="toCalendarButton" width="16" height="16" alt="" /></td>
														</tr>
													</table>
													<script type="text/javascript" language="javascript">
													/* <![CDATA[ */
														var toCalendar = new calendar();
														toCalendar.registerInput('toCalendar');
														toCalendar.registerToggle('toCalendarButton');
														toCalendar.setTimeOffset('<s:date name="now" format="%{getText('datePicker.initOffset')}" />');
														toCalendar.init();
													/* ]]> */
													</script>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
													<select name="toHours" disabled="disabled">
														<s:iterator value="hourOptions">
															<option value="<s:property value="value" />"><s:property value="label" /></option>
														</s:iterator>
													</select>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
													<select name="toMinutes" disabled="disabled">
														<s:iterator value="minuteOptions">
															<option value="<s:property value="value" />"><s:property value="label" /></option>
														</s:iterator>
													</select>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>						
						</table>
					</div>
					
					<div class="itemContents"><s:text name="dashboard.popup.fullGraph.text.configureInfo" /></div>
					
					<div class="itemContents" align="right">
						<input type="button" name="update" value="<s:text name="generic.button.update" />" id="graphUpdate" />
						<input type="button" name="hide" value="<s:text name="generic.button.hide" />" id="graphHide2" />
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
<div id="editGraphDefaults" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEditGraphDefaultsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="dashboard.popup.graphDefaults.tab.display" /></td>
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
				<div id="popupEditGraphDefaultsBody" class="popupBody">
					<div class="itemContents">
						<div class="itemContents">
							<s:text name="dashboard.popup.graphDefaults.text.instructions" />
						</div>
						
						<div class="itemLabel"><s:text name="dashboard.popup.graphDefaults.label.interval" /></div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
											<select name="hours">
												<s:iterator value="hourOptions">
													<option value="<s:property value="value" />"><s:property value="label" /></option>
												</s:iterator>
											</select>
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
											<select name="minutes">
												<s:iterator value="minuteOptions">
													<option value="<s:property value="value" />"><s:property value="label" /></option>
												</s:iterator>
											</select>
										</div>
									</td>
								</tr>
							</table>
						</div>

						<div class="itemLabel"><s:text name="dashboard.popup.graphDefaults.label.thumbDimensions" /></div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.width" /></span><br/>
											<input type="text" name="thumbWidth" size="5" />
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.height" /></span><br/>
											<input type="text" name="thumbHeight" size="5" />
										</div>
									</td>
								</tr>
							</table>
						</div>
						
						<div class="itemLabel"><s:text name="dashboard.popup.graphDefaults.label.fullDimensions" /></div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.width" /></span><br/>
											<input type="text" name="width" size="5" />
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle"><s:text name="generic.label.height" /></span><br/>
											<input type="text" name="height" size="5" />
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="itemContents" align="right">
						<input type="button" name="save" value="<s:text name="generic.button.save" />" id="editGraphDefaultsSubmit" />
						<input type="button" name="cancel" value="<s:text name="generic.button.cancel" />" id="editGraphDefaultsHide" />
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
<div id="editFavorites" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEditFavoritesTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="dashboard.popup.editFavorites.tab.favorites" /></td>
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
				<div id="popupEditFavoritesBody" class="popupBody">
					<div class="itemContents">
						<div class="itemContents">
							<s:text name="dashboard.popup.editFavorites.text.instructions" />
						</div>
						
						<div class="itemLabel"><s:text name="dashboard.popup.editFavorites.label.favorites" /></div>
						<div class="itemContents">
							<select name="favorites" multiple="multiple" size="6">
								<s:iterator value="favoritesOptions">
									<option value="<s:property value="value" />"><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					
					<div class="itemContents" align="right">
						<input type="button" name="save" value="<s:text name="generic.button.save" />" id="editFavoritesSubmit" />
						<input type="button" name="cancel" value="<s:text name="generic.button.cancel" />" id="editFavoritesHide" />
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

<s:if test="firstRun">
	<form action="#" onsubmit="return false">
	<div id="firstRunPopup" class="popup">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0" class="popupTab" id="popupFirstRunTab">
												<tr>
													<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													<td class="tabBody"><s:text name="dashboard.popup.firstRun.tab.welcome" /></td>
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
					<div id="popupFirstRunBody" class="popupBody">
					
						<div class="itemLabelStandalone"><s:text name="dashboard.popup.firstRun.text.instructions" /></div>
	
						<div class="itemLabel"><s:text name="generic.label.timezone" /></div>
						<div class="itemContents">
						<select name="timezone">
							<s:iterator value="timeZoneOptions">
								<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
							</s:iterator>
						</select>
						</div>
	
						<div class="itemLabel"><s:text name="generic.label.locale" /></div>
						<div class="itemContents">
							<select name="localeName">
								<s:iterator value="localeOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
	
						<div align="right">
							<input id="setUserValues" name="save" type="button" value="<s:text name="dashboard.popup.firstRun.button.save" />" />
							<input id="cancelFirstRun" name="cancel" type="button" value="<s:text name="generic.button.cancel" />" />
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
</s:if>

<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */
	//disable controls based on which radio button is checked (applied to onchange handler of radio buttons) - A to B controls start disabled
	function setGraphControls() {
		//determine which type of graph was selected
		var graphType;
		var availableGraphs = document.getElementsByName('graphType');
		for (var i = 0; i < availableGraphs.length; i++) {
			if(availableGraphs[i].checked) {
				graphType = availableGraphs[i].value;
				break;
			}
		}
		
		//TODO: make a util function that retrievs all inputs in a container
		//get the collections of inputs associated with each radio button
		var intervalInputs = returnObject('intervalContainer').getElementsByTagName('select');
		var fromToInputs = new Array();
		var tmpFromToInputs = returnObject('fromToContainer').getElementsByTagName('select');
		for (var i = 0; i < tmpFromToInputs.length; i++) {
			fromToInputs.push(tmpFromToInputs[i]);
		}
		tmpFromToInputs = returnObject('fromToContainer').getElementsByTagName('input');
		for (var i = 0; i < tmpFromToInputs.length; i++) {
			fromToInputs.push(tmpFromToInputs[i]);
		}
		
		//define which collection of inputs to disable
		var disableCollection;
		var enableCollection;
		if(graphType == 'interval') {
			disableCollection = fromToInputs;
			enableCollection = intervalInputs;
		} else if(graphType == 'fromTo') {
			disableCollection = intervalInputs;
			enableCollection = fromToInputs;
		}
		
		//set disabled state based on graph selection
		for (var i = 0; i < disableCollection.length; i++) {
			disableCollection[i].disabled = true;
		}
		for (var i = 0; i < enableCollection.length; i++) {
			enableCollection[i].disabled = false;
		}
	}
	
	//function to use as submit handler
	function updateGraph(instanceData) {
		//get the graph image
		var fullGraph = returnObject('fullGraph');
		//apply the new image and make sure cache is defeated
		var src = instanceData.returnedData.graph.Uri;
		//set the soure to the new source
		fullGraph.src = src;
		//select graph tab
		fullGraphPopup.setFirstTab();
	}
	
	function setGraphTitle(instanceData) {
		//var sentData = instanceData.sentData;
		var name = instanceData.returnedData.graph.name;
		
		return name;
	}
	
	function cleanGraphDisplay() {
		setGraphControls();
		var fullGraph = returnObject('fullGraph');
		fullGraph.src = '<s:url value="/web/resources/images/spacer.gif" />';
	}
	
	var fullGraphPopup = new popup();
	//special update so that we recenter when a large image changes popup size
	//TODO: move this into a post load thing?
	var fullGraph = returnObject('fullGraph');
	eventManager.registerListener(fullGraph, 'load', function(){fullGraphPopup.rePosition()});
	//bind to html container
	fullGraphPopup.bindToObject('fullGraphPopup');
	//set ajax call for update
	fullGraphPopup.setUpdateAction("<s:url action="ShowFullGraph" />");
	//set ajax call for submission
	fullGraphPopup.setSubmitAction("<s:url action="UpdateFullGraph" />");
	fullGraphPopup.registerSubmit('graphUpdate');
	//assign a function to handle the page display after a successful submit
	fullGraphPopup.setSubmitHandler(updateGraph);
	fullGraphPopup.registerHide('graphHide');
	fullGraphPopup.registerHide('graphHide2');
	//tell the popup to use a loading box and set the text to display
	fullGraphPopup.createLoader("<s:text name="dashboard.text.loadFullGraph" />");
	//set function for doing special return to original state on close
	fullGraphPopup.setCleanupAction(cleanGraphDisplay);
	fullGraphPopup.bindData(setGraphControls);

	//bind the data to the display
	fullGraphPopup.bindData('graph.Uri', 'fullGraph');
	fullGraphPopup.bindData('graph.graphName', 'graphTitle');
	fullGraphPopup.init();
	
	//function to visually indicate whether the rule is certified
	function showCertified(instanceData) {
		var certified = instanceData.returnedData.rule.certified;
		var returnString = '';
		if(certified == 1) {
			//TODO: change to image reference to a certified image flag
			returnString = "*"; 
		} else {
			returnString = "";
		}
		return returnString;
	}
	
	function closurePageUpdate(instanceData) {
		var closedEvents = new Array();
		if(instanceData.affectedRows.length > 0) {
			closedEvents = instanceData.affectedRows;
		} else {
			closedEvents.push(instanceData.row);
		}
		for(var i = 0; i < closedEvents.length; i++) {
			var checkboxContainer = getElementsByClassName('closeCheckbox', closedEvents[i], 'span', false);
			if(checkboxContainer[0]) {
				var checkbox = checkboxContainer[0].getElementsByTagName('input')[0];
				checkbox.disabled = true;
				checkbox.checked = false;
			}
			var statusCell = getElementsByClassName('eventStatus', closedEvents[i], 'span', false);
			if(statusCell[0]) {
				//TODO: replace messages with reference to message keys
				statusCell[0].innerHTML = "Closed";
			}
			getElementsByClassName('closeLink', closedEvents[i], 'span', false)[0].style.display = 'none';
			getElementsByClassName('resolutionNotesLink', closedEvents[i], 'span', false)[0].style.display = 'inline';
		}
		var plurality = closedEvents.length > 1 ? "s" : "";
		noticeFader.addMessage("Closed " + closedEvents.length + " event" + plurality + ".");
		return true;
	}
	
	function cleanupNotes(){
		var textareas = document.getElementsByTagName('textarea');
		for(var i = 0; i < textareas.length; i++) {
			if(textareas[i].name == 'notes') {
				textareas[i].value = "";
			}
		}
	}
	
	function formatEventTime(instanceData) {
		var relativeTime = instanceData.returnedData.event.relativeAlarmTime;
		var formattedTime = instanceData.returnedData.event.formattedAlarmTime;
		return (formattedTime + " (" + relativeTime + ")");
	}
	
	function formatNotifyTargets(instanceData) {
		var notifyTargets = instanceData.returnedData.event.notifyTargets;
		if (notifyTargets.length < 1) {
			notifyTargets = "<s:text name="events.text.noNotifications" />";
		}
		return notifyTargets;
	}
	
	function isResolved(instanceData) {
		if(instanceData.returnedData.event.status.toLowerCase() == 'closed') {
			returnObject('popupHistoryResolutionTab').style.display = 'block';
			returnObject('popupHistoryCloseTab').style.display = 'none';
		}
	}
	
	function cleanResolutionDisplay() {
		returnObject('popupHistoryResolutionTab').style.display = 'none';
		returnObject('popupHistoryCloseTab').style.display = 'block';
		cleanupNotes();
	}
	
	//wrapper for showing of history info to show the resolution notes
	function historInfoResolutionShow(passthrough, event) {
		historyInfoPopup.show(passthrough, event);
		historyInfoPopup.setTab(returnObject('popupHistoryResolutionTab'));
	}
	
	//wrapper for showing of history info to show the resolution notes
	function historInfoCloseShow(passthrough, event) {
		historyInfoPopup.show(passthrough, event);
		historyInfoPopup.setTab(returnObject('popupHistoryCloseTab'));
	}
	
	var historyInfoPopup = new popup();
	//bind to html container
	historyInfoPopup.bindToObject('historyInfoPopup');
	//set ajax call for update
	historyInfoPopup.setUpdateAction("<s:url action="EventsInfo" />");
	//set ajax call for submission
	historyInfoPopup.setSubmitAction("<s:url action="CloseEvent" />");
	historyInfoPopup.registerSubmit('historyInfoClose');
	//assign a function to handle the page display after a successful submit
	historyInfoPopup.setSubmitHandler(closurePageUpdate);
	//bind the data to the display
	historyInfoPopup.bindData("closeTimestamp", "historyInfoTimestamp");
	historyInfoPopup.registerHide('historyInfoHide1');
	historyInfoPopup.registerHide('historyInfoHide2');
	historyInfoPopup.registerHide('historyInfoHide3');
	historyInfoPopup.registerHide('historyInfoHide4');
	historyInfoPopup.registerHide('historyInfoHide5');
	//tell the popup to use a loading box and set the text to display
	historyInfoPopup.createLoader("<s:text name="events.text.loadRule" />");
	//bind the data to the display
	historyInfoPopup.bindData('event.serverName', 'historyInfoServerName1');
	historyInfoPopup.bindData('event.serverName', 'historyInfoServerName2');
	historyInfoPopup.bindData('event.status', 'historyInfoStatus');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType1');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType2');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType3');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType4');
	historyInfoPopup.bindData('event.expression', 'historyInfoExpression');
	historyInfoPopup.bindData('event.realExpression', 'historyInfoEvaluatedExpression');
	historyInfoPopup.bindData(formatEventTime, 'historyInfoEventTime1');
	historyInfoPopup.bindData(formatEventTime, 'historyInfoEventTime2');
	historyInfoPopup.bindData(formatNotifyTargets, 'historyInfoNotifications');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName1');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName2');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName3');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName4');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion1');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion2');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion3');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion4');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved1');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved2');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved3');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved4');
	historyInfoPopup.bindData('rule.categoryName', 'historyInfoParentAdvisor');
	historyInfoPopup.bindData('rule.description', 'historyInfoMoreInfo');
	historyInfoPopup.bindData('event.advice', 'historyInfoAdvice1');
	historyInfoPopup.bindData('event.advice', 'historyInfoAdvice2');
	historyInfoPopup.bindData('event.command', 'historyInfoCommand1')
	historyInfoPopup.bindData('event.command', 'historyInfoCommand2');
	historyInfoPopup.bindData("rule.info", 'historyInfoFurtherInfo');
	historyInfoPopup.bindData('rule.thresholds.info', 'historyInfoInfoThreshold');
	historyInfoPopup.bindData('rule.thresholds.warning', 'historyInfoWarningThreshold');
	historyInfoPopup.bindData('rule.thresholds.critical', 'historyInfoCriticalThreshold');
	historyInfoPopup.bindData('rule.frequency', 'historyInfoFrequency');
	historyInfoPopup.bindData('event.fixedBy', 'historyInfoClosedBy');
	historyInfoPopup.bindData('event.formattedFixedTime', 'historyInfoClosedAt');
	historyInfoPopup.bindData('event.notes', 'historyInfoResolutionNotes');
	historyInfoPopup.bindData('event.rule', 'ruleToClose');
	historyInfoPopup.bindData('event.serverName', 'serverToClose');
	historyInfoPopup.bindData(isResolved);
	//set function for doing special return to original state on close
	historyInfoPopup.setCleanupAction(cleanResolutionDisplay);
	//initialize popup
	historyInfoPopup.init();
	
	<s:if test="firstRun">
		var firstRunPopup = new popup();
		//bind to html container
		firstRunPopup.bindToObject('firstRunPopup');
		//register a button for hiding the poup
		firstRunPopup.registerHide('cancelFirstRun');
		//set ajax call for submission
		firstRunPopup.setSubmitAction("<s:url action="FirstRunSave" />");
		firstRunPopup.registerSubmit('setUserValues');
		firstRunPopup.registerSubmit('cancelFirstRun');
		//assign a function to handle the page display after a successful submit
		firstRunPopup.setSubmitHandler(reloadPage);
		//initialize popup
		firstRunPopup.init();
		addDOMLoadListener(firstRunPopup.show);
	</s:if>
	
	var editGraphDefaults = new popup();
	//bind to html container
	editGraphDefaults.bindToObject('editGraphDefaults');
	//set ajax call for update
	editGraphDefaults.setUpdateAction("<s:url action="SetDashboardGraphDefaultsInfo" />");
	//set ajax call for submission
	editGraphDefaults.setSubmitAction("<s:url action="SetDashboardGraphDefaults" />");
	editGraphDefaults.registerSubmit('editGraphDefaultsSubmit');
	//assign a function to handle the page display after a successful submit
	editGraphDefaults.setSubmitHandler(reloadPage);
	editGraphDefaults.registerHide('editGraphDefaultsHide');

	//bind the data to the display
	editGraphDefaults.bindData('interval.hours', 'hours');
	editGraphDefaults.bindData('interval.minutes', 'minutes');
	editGraphDefaults.bindData('width', 'width');
	editGraphDefaults.bindData('height', 'height');
	editGraphDefaults.bindData('thumbWidth', 'thumbWidth');
	editGraphDefaults.bindData('thumbHeight', 'thumbHeight');
	editGraphDefaults.init();
	
	var editFavorites = new popup();
	//bind to html container
	editFavorites.bindToObject('editFavorites');
	//set ajax call for update
	editFavorites.setUpdateAction("<s:url action="SetGraphFavoritesInfo" />");
	//set ajax call for submission
	editFavorites.setSubmitAction("<s:url action="SetGraphFavorites" />");
	editFavorites.registerSubmit('editFavoritesSubmit');
	//assign a function to handle the page display after a successful submit
	editFavorites.setSubmitHandler(reloadPage);
	editFavorites.registerHide('editFavoritesHide');

	//bind the data to the display
	editFavorites.bindData('favorites', 'favorites');
	editFavorites.bindData('maxFavorites', 'maxFavorites');
	
	editFavorites.init();

	addDOMLoadListener(initLegend);
/* ]]> */
</script>
