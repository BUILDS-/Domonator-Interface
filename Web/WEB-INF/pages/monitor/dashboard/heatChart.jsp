<%@ page language="java" pageEncoding="UTF-8" %>
<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="popup" style="display: block; left: 0px; top: 0px; padding: 10px;">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTabOn">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="heatChart.tab.heatChart" /></td>
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
				<div class="popupBodyOn">
					<table cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td class="listBoxCollapsible">
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
													<td class="heatIndicatorUpDown"><s:if test="agentStatus == 'down'"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="agentStatus" />Dot.png" title="<s:property value="agentStatus" />" width="11" height="11" alt="<s:property value="agentStatus" />"/><s:if test="agentStatus == 'down'"></a></s:if></td>
													<td class="heatIndicatorUpDown"><s:if test="serverStatus == 'down'"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="serverStatus" />Dot.png" title="<s:property value="serverStatus" />" width="11" height="11" alt="<s:property value="serverStatus" />"/><s:if test="serverStatus == 'down'"></a></s:if></td>
													<s:iterator value="records">
														<td class="heatIndicator<s:property value="heatChartCategory" />"><s:if test="showLink"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=<s:property value="currentAlarmLevel" />&amp;ruleId=<s:property value="ruleId" />&amp;group=<s:property value="groupId" />')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="currentAlarmLevel" />Dot.png" title="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" width="11" height="11" alt="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" /><s:if test="showLink"></a></s:if></td>
													</s:iterator>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;group=<s:property value="groupId" />')"><s:if test="numCritical < maxCounterSize"><s:property value="numCritical" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowCritical.png" />" title="<s:property value="numCritical" />" width="11" height="11" alt="<s:property value="numCritical" />" /></s:else></a></td>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=warning&amp;group=<s:property value="groupId" />')"><s:if test="numWarning < maxCounterSize"><s:property value="numWarning" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowWarning.png" />" title="<s:property value="numWarning" />" width="11" height="11" alt="<s:property value="numWarning" />" /></s:else></a></td>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=info&amp;group=<s:property value="groupId" />')"><s:if test="numInfo < maxCounterSize"><s:property value="numInfo" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowInfo.png" />" title="<s:property value="numInfo" />" width="11" height="11" alt="<s:property value="numInfo" />" /></s:else></a></td>
												</tr>
											</s:if>
											<s:iterator value="serverRecords" status="recordsStatus">
												<tr class="listRowHeat" id="<s:if test="groupId">Group<s:property value="groupId" />.-.</s:if>Server<s:property value="serverId" />">
													<td class="firstCellHeatL2"><span<s:if test="primaryState != ''"> class="<s:property value="primaryState" />"</s:if>><s:property value="serverName" /></span></td>
													<td class="heatIndicatorUpDown"><s:if test="agentStatus == 'down'"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="agentStatus" />Dot.png" title="<s:property value="agentStatus" />" width="11" height="11" alt="<s:property value="agentStatus" />"/><s:if test="agentStatus == 'down'"></a></s:if></td>
													<td class="heatIndicatorUpDown"><s:if test="serverStatus == 'down'"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="serverStatus" />Dot.png" title="<s:property value="serverStatus" />" width="11" height="11" alt="<s:property value="serverStatus" />"/><s:if test="serverStatus == 'down'"></a></s:if></td>
													<s:iterator value="records">
														<td class="heatIndicator<s:property value="heatChartCategory" />"><s:if test="showLink"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=<s:property value="currentAlarmLevel" />&amp;ruleId=<s:property value="ruleId" />&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"></s:if><img src="<s:url value="/web/resources/images/" /><s:property value="currentAlarmLevel" />Dot.png" title="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" width="11" height="11" alt="&quot;<s:property value="currentAlarmLevel" />&quot;: <s:property value="ruleName" />" /><s:if test="showLink"></a></s:if></td>
													</s:iterator>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=critical&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"><s:if test="numCritical < maxCounterSize"><s:property value="numCritical" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowCritical.png" />" title="<s:property value="numCritical" />" width="11" height="11" alt="<s:property value="numCritical" />" /></s:else></a></td>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=warning&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"><s:if test="numWarning < maxCounterSize"><s:property value="numWarning" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowWarning.png" />" title="<s:property value="numWarning" />" width="11" height="11" alt="<s:property value="numWarning" />" /></s:else></a></td>
													<td class="heatIndicatorAlerts"><a href="javascript://" onclick="openParent('<s:url action="FilterEvents" />?severity=info&amp;server=<s:property value="serverId" /><s:if test="groupId">&amp;parentGroup=<s:property value="groupId" /></s:if>')"><s:if test="numInfo < maxCounterSize"><s:property value="numInfo" /></s:if><s:else><img src="<s:url value="/web/resources/images/counterOverflowInfo.png" />" title="<s:property value="numInfo" />" width="11" height="11" alt="<s:property value="numInfo" />" /></s:else></a></td>
												</tr>
											</s:iterator>
										</s:iterator>
									</tbody>
								</table>
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td align="left"><div class="itemLabel"><a href="javascript://" onclick="toggleLegend()" id="heatChartLegendLabel"><s:text name="heatChart.link.showLegend" /></a></div></td>
										<td align="right" style="padding-top: 4px;">
											<s:text name="refresh.label.refresh" />
											<select id="doRefresh">
												<s:iterator value="refreshOptions">
													<option value="<s:property value="value" />"><s:property value="label" /></option>
												</s:iterator>
											</select>
											
											<script type="text/javascript" language="javascript">
											/* <![CDATA[ */
												var refreshInstance = new refreshHandler();
												refreshInstance.bindToSelectbox('doRefresh');
												refreshInstance.init();
											/* ]]> */
											</script>
										</td>
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
		<tr>
			<td>
				<div id="footer">
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="<s:url value="/web/resources/images/primaryTL.gif" />" width="5" height="5" alt=""/></td>
							<td class="right"><img src="<s:url value="/web/resources/images/primaryTR.gif" />" width="5" height="5" alt=""/></td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td id="copyright"><s:text name="defaultLayout.text.copyright"><s:param><s:date name="now" format="yyyy" /></s:param></s:text></td>
										<td id="footerInfo">(<s:date name="now" />)</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="<s:url value="/web/resources/images/primaryBL.gif" />" width="5" height="5" alt=""/></td>
							<td class="right"><img src="<s:url value="/web/resources/images/primaryBR.gif" />" width="5" height="5" alt=""/></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript" language="javascript">
/* <![CDATA[ */
	addDOMLoadListener(initLegend);
/* ]]> */
</script>