<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="button" value="<s:text name="advisors.currentSchedule.button.unSchedule" />" onclick="deletePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.disable" />" onclick="disablePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.enable" />" onclick="enablePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.edit" />" onclick="editSchedulePopup.showBatch('scheduleIds', event)" />
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title"><s:text name="advisors.currentSchedule.sectionTitle.advisors" /></div>
		</td>
	</tr>
	<tr>
		<td class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr class="titleRow">
						<td><s:text name="advisors.currentSchedule.columnTitle.advisors" /></td>
						<td><s:text name="advisors.currentSchedule.columnTitle.frequency" /></td>
						<td><s:text name="advisors.currentSchedule.columnTitle.status" /></td>
						<td class="linkColumn">&nbsp;</td>
					</tr>
					<s:if test="%{categories.size < 1}">
						<tr class="listRowCategoryL1">
							<td colspan="4" class="noRecordsFound"><s:text name="advisors.currentSchedule.noRecords" /></td>
						</tr>
					</s:if>
					<s:iterator value="categories">
						<s:set name="categoryId" value="category.id"/>
						<tr class="listRowCategoryL1" id="category<s:property value="#categoryId" />">
							<td class="firstCellL1"><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" /> <input type="checkbox" class="checkbox" name="categoryId" onclick="updateCheckboxes(this)" /> <s:property value="category.name" /> (<s:property value="rules.size" />)</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<s:iterator value="rules">
							<s:set name="ruleId" value="rule.uuid"/>
							<tr class="listRowCategoryL2" id="category<s:property value="#categoryId" />.-.rule<s:property value="#ruleId" />">
								<td class="firstCellL2">
									<img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" />
									<input type="checkbox" class="checkbox" name="ruleIds" onclick="updateCheckboxes(this)" />
									<a href="javascript://" onclick="ruleInfoPopup.show({'ruleUuid' : '<s:property value="#ruleId" />'}, event)"><s:property value="rule.name" /></a>
									(<s:property value="schedules.size" />)
								</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<s:iterator value="schedules" status="scheduleStatus">
								<s:set name="scheduleId" value="id"/>
								<s:set name="enabled" value="enabled ? 'enabled' : 'disabled'"/>
								<tr class="listRow<s:if test="#scheduleStatus.odd == true">Alt</s:if>" id="category<s:property value="#categoryId" />.-.rule<s:property value="#ruleId" />.-.schedule<s:property value="#scheduleId" />">
									<td class="firstCellL3">
										<span class="individualRecord"><input name="scheduleIds" type="checkbox" class="checkbox" value="<s:property value="#scheduleId" />" id="schedule<s:property value="#scheduleId" />" /></span>
										<a href="javascript://" onclick="scheduleInfoPopup.show({'scheduleId' : <s:property value="#scheduleId" />}, event)"><s:property value="server.ServerName" /></a>
									</td>
									<td><span class="updateFrequency"><s:property value="stripSeconds(frequency)" /></span></td>
									<td><span class="<s:property value="#enabled" />" onclick="toggleStatus(this, '<s:property value="#scheduleId" />')"><s:property value="#enabled" /></span></td>
									<td>
										<span class="listLink"><a href="javascript://" onclick="deletePopup.show({'scheduleId' : '<s:property value="#scheduleId" />'}, event)"><img src="<s:url value="/web/resources/images/closeIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="advisors.currentSchedule.link.unschedule" />" /> <s:text name="advisors.currentSchedule.link.unschedule" /></a></span>
									</td>
								</tr>
							</s:iterator>
						</s:iterator>
					</s:iterator>	
				</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td class="bottomButtonBar">
			<input type="button" value="<s:text name="advisors.currentSchedule.button.unSchedule" />" onclick="deletePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.disable" />" onclick="disablePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.enable" />" onclick="enablePopup.showBatch('scheduleIds', event)" />
			<input type="button" value="<s:text name="advisors.currentSchedule.button.edit" />" onclick="editSchedulePopup.showBatch('scheduleIds', event)" />
		</td>
	</tr>
</table>

<!-- POPUP CONTAINERS -->
<div id="ruleInfoPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupRuleDetailsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="rule.popup.tab.details" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupRuleAdvancedTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="rule.popup.tab.advanced" /></td>
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
				<div id="popupRuleDetailsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="ruleInfoRuleName1">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="ruleInfoRuleVersion1">Error: Version not loaded</span> 
							<span id="ruleInfoRuleApproved1">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="rule.label.category" /></div>
					<div class="itemContents" id="ruleInfoParentAdvisor">Error: Advisor not loaded</div>
					
					<div class="itemLabel"><s:text name="rule.label.description" /></div>
					<div class="itemContents" id="ruleInfoMoreInfo">Error: Rule Problem Description not loaded</div>
					
					<div class="itemLabel"><s:text name="rule.label.advice" /></div>
					<div class="itemContents" id="ruleInfoAdvice">Error: Rule Advice not loaded</div>

					<div class="itemLabel"><s:text name="rule.label.action" /></div>
					<div class="itemContents" id="ruleInfoCommand">Error: Rule Recommended Action not loaded</div>
					
					<div class="itemLabel"><s:text name="rule.label.info" /></div>
					<div class="itemContents" id="ruleInfoFurtherInfo">Error: Rule links and further reading not loaded</div>
				</div>
				<div id="popupRuleAdvancedBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="ruleInfoRuleName2">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="ruleInfoRuleVersion2">Error: Version not loaded</span> 
							<span id="ruleInfoRuleApproved2">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="rule.label.thresholds" /></div>
					<div class="itemContents">
						<s:text name="rule.label.criticalAlert" /> = <span id="ruleInfoCriticalThreshold">Error: Rule critical threshold not loaded</span><br />
						<s:text name="rule.label.warningAlert" /> = <span id="ruleInfoWarningThreshold">Error: Rule warning threshold not loaded</span><br />
						<s:text name="rule.label.infoAlert" /> = <span id="ruleInfoInfoThreshold">Error: Rule info threshold not loaded</span>
					</div>
					
					<div class="itemLabel"><s:text name="rule.label.defaultFrequency" /></div>
					<div class="itemContents" id="ruleInfoFrequency">Error: Rule frequency not loaded</div>
					
					<div class="itemLabel"><s:text name="rule.label.expression" /></div>
					<div class="itemContents" id="ruleInfoExpression">Error: Rule expression not loaded</div>
				</div>
				<div align="right"><input type="button" name="hide" id="ruleInfoHide" value="<s:text name="rule.popup.button.hide" />" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="<s:url value="/web/resources/images/tertiaryOnBL.gif" />" width="8" height="7" /></td>
						<td class="tertiaryBC"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="<s:url value="/web/resources/images/tertiaryOnBR.gif" />" width="8" height="7" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

<form action="#" onsubmit="return false" id="scheduleInfoForm">
<div id="scheduleInfoPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupScheduleOverviewTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.schedule.tab.overview" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupScheduleSettingsTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.schedule.tab.settings" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupScheduleAdvancedTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.schedule.tab.advanced" /></td>
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
				<div id="popupScheduleOverviewBody" class="popupBody">
				    <div class="itemLabelStandalone">
						<span id="sheduleInfoRuleName1">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="scheduleInfoRuleVersion1">Error: Version not loaded</span> 
							<span id="scheduleInfoRuleApproved1">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="rule.label.category" /></div>
					<div class="itemContents" id="scheduleInfoParentAdvisor">Error: Advisor not loaded</div>
					
					<div class="itemLabel"><s:text name="rule.label.description" /></div>
					<div class="itemContents" id="scheduleInfoRuleDescription">Error: Rule Problem Description not loaded</div>

				    
					<div class="itemLabel"><s:text name="schedule.label.lastAlertTime" /></div>
					<div class="itemContents">
						<span id="scheduleInfoLastAlert">Error: Last Alert not loaded</span><span id="sheduleInfoHistoryWrap"> | <a href="<s:url action="Events" />" id="scheduleInfoHistory"><s:text name="schedule.link.history" /></a></span>
                    </div>
					<div align="right"><input type="button" name="hide" id="scheduleInfoHide1" value="<s:text name="schedule.button.hide" />" /></div>
				</div>
				
				<div id="popupScheduleSettingsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="sheduleInfoRuleName2">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="scheduleInfoRuleVersion2">Error: Version not loaded</span> 
							<span id="scheduleInfoRuleApproved2">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
    				<table cellpadding="0" cellspacing="0" width="100%">
    					<tr>
    						<td class="popupFormSubtitle"><s:text name="schedule.label.frequency" /></td>
    						<td class="popupFormContents" nowrap="nowrap">
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.hours" /></span><br/>
									<select name="hours" onchange="testValidSchedule(this)">										
										<s:iterator value="hourOptions">
											<option value="<s:property value="value" />"><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
								
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.minutes" /></span><br/>
									<select name="minutes" onchange="testValidSchedule(this)">
										<s:iterator value="minuteOptions">
											<option value="<s:property value="value" />"><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
    						</td>
    					</tr>
    					<tr>
    						<td class="popupFormSubtitle"><s:text name="schedule.label.notifications" /></td>
    						<td class="popupFormContents">
    							<select multiple="multiple" size="4" name="notifyTargets" id="scheduleInfoNotifyTargets">
									<s:iterator value="notificationOptions">
										<option value="<s:property value="value" />"><s:property value="label" /></option>
									</s:iterator>
								</select>
    						</td>
    					</tr>
						<tr>
    						<td class="popupFormSubtitle"><s:text name="schedule.label.useSnmp" /></td>
    						<td class="popupFormContents"><input type="checkbox" name="snmpEnabled" value="true" /></td>
    					</tr>
    					<tr>
    						<td class="popupFormSubtitle">&nbsp;</td>
    						<td class="popupFormButtonWrap">
    							 <input type="button" name="submit" id="scheduleInfoSave" value="<s:text name="schedule.button.save" />" disabled="disabled" />
								 <input type="button" name="hide" id="scheduleInfoHide2" value="<s:text name="schedule.button.hide" />" />
    						</td>
    					</tr>
    				</table>
				</div>
				<div id="popupScheduleAdvancedBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="sheduleInfoRuleName3">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="scheduleInfoRuleVersion3">Error: Version not loaded</span> 
							<span id="scheduleInfoRuleApproved3">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel"><s:text name="schedule.label.thresholds" /></div>
					<div class="itemContents">
						<s:text name="schedule.label.critical" /> = <span id="scheduleInfoCriticalThreshold">Error: Rule critical threshold not loaded</span><br />
						<s:text name="schedule.label.warning" /> = <span id="scheduleInfoWarningThreshold">Error: Rule warning threshold not loaded</span><br />
						<s:text name="schedule.label.info" /> = <span id="scheduleInfoInfoThreshold">Error: Rule info threshold not loaded</span>
					</div>
					
					<div class="itemLabel"><s:text name="schedule.label.frequency" /></div>
					<div class="itemContents" id="scheduleInfoFrequency">Error: Schedule frequency not loaded</div>
					
					<div class="itemLabel"><s:text name="schedule.label.expression" /></div>
					<div class="itemContents" id="scheduleInfoExpression">Error: Rule expression not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="scheduleInfoHide3" value="<s:text name="schedule.button.hide" />" /></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="<s:url value="/web/resources/images/tertiaryOnBL.gif" />" width="8" height="7" /></td>
						<td class="tertiaryBC"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="<s:url value="/web/resources/images/tertiaryOnBR.gif" />" width="8" height="7" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>


<form action="#" onsubmit="return false">
<div id="deletePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupDeleteTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.deleteSchedule.tab.unschedule" /></td>
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
				<div id="popupDeleteBody" class="popupBody">
					<div class="itemContents"><span id="advisorsToDelete">Error: no schedules found for unscheduling</span></div>

					<div align="right">
						<input id="deleteSchedules" name="submit" type="button" value="<s:text name="advisors.currentSchedule.popup.deleteSchedule.button.unschedule" />" />
						<input id="deleteHide" name="hide" type="button" value="<s:text name="advisors.currentSchedule.popup.deleteSchedule.button.cancel" />" />
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
<div id="disablePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupDisableTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.disableSchedules.tab.disable" /></td>
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
				<div id="popupDisableBody" class="popupBody">
					<div class="itemLabelStandalone"><s:text name="advisors.currentSchedule.popup.disableSchedules.text.disable" /> <span id="schedulesToDisable">Error: no schedules found for disabling</span></div>

					<div align="right">
						<input id="disableSchedules" name="submit" type="button" value="<s:text name="advisors.currentSchedule.popup.disableSchedules.button.disable" />" />
						<input id="disableHide" name="hide" type="button" value="<s:text name="advisors.currentSchedule.popup.disableSchedules.button.cancel" />" />
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
<div id="enablePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEnableTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.enableSchedules.tab.enable" /></td>
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
				<div id="popupEnableBody" class="popupBody">
					<div class="itemLabelStandalone"><s:text name="advisors.currentSchedule.popup.enableSchedules.text.enable" /> <span id="schedulesToEnable">Error: no schedules found for enabling</span></div>

					<div align="right">
						<input id="enableSchedules" name="submit" type="button" value="<s:text name="advisors.currentSchedule.popup.enableSchedules.button.enable" />" />
						<input id="enableHide" name="hide" type="button" value="<s:text name="advisors.currentSchedule.popup.enableSchedules.button.cancel" />" />
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

<form action="#" onsubmit="return false" id="editScheduleForm">
<div id="editSchedulePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEditScheduleTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.currentSchedule.popup.editSchedules.tab.editSchedules" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" alt="" width="1" height="1" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">
				<div id="popupEditScheduleBody" class="popupBody">
					<div class="itemLabelStandalone"><s:text name="advisors.currentSchedule.popup.editSchedules.label.edit" /> <span id="schedulesToUpdate">Error: no schedules found for update</span></div>

					<table cellpadding="0" cellspacing="0" width="100%">
						<tr style="display: none;" id="useDefaultRow">
							<td class="popupFormSubtitle"><s:text name="schedule.label.useDefaultFrequency" /></td>
							<td class="popupFormContents">
								<table>
									<tr>
										<td style="vertical-align: baseline;"><input name="useDefaultFrequency" id="useDefaultFrequency" type="checkbox" value="true" onclick="testValidSchedule(this)" /></td>
										<td style="vertical-align: top;"><s:text name="advisors.currentSchedule.popup.editSchedules.text.defaultFreqNote" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="popupFormSubtitle"><s:text name="schedule.label.frequency" /></td>
							<td class="popupFormContents" nowrap="nowrap">
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.hours" /></span><br/>
									<select name="hours" onchange="testValidSchedule(this)" id="editScheduleHours">										
										<s:iterator value="hourOptions">
											<option value="<s:property value="value" />"><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
								
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.minutes" /></span><br/>
									<select name="minutes" onchange="testValidSchedule(this)">
										<s:iterator value="minuteOptions">
											<option value="<s:property value="value" />"><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td class="popupFormSubtitle"><s:text name="schedule.label.notifications" /></td>
							<td class="popupFormContents">
							   <select multiple="multiple" size="4" name="notifyTargets">
									<s:iterator value="notificationOptions">
										<option value="<s:property value="value" />"><s:property value="label" /></option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
    						<td class="popupFormSubtitle"><s:text name="schedule.label.useSnmp" /></td>
    						<td class="popupFormContents"><input type="checkbox" name="snmpEnabled" value="true" checked="checked" /></td>
    					</tr>
					</table>

					<div align="right">	
						<input id="editScheduleSubmit" name="submit" type="button" value="<s:text name="advisors.currentSchedule.popup.editSchedules.button.update" />" disabled="disabled" />
						<input id="editScheduleHide" name="hide" type="button" value="<s:text name="advisors.currentSchedule.popup.editSchedules.button.cancel" />" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="<s:url value="/web/resources/images/tertiaryOnBL.gif" />" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="<s:url value="/web/resources/images/spacer.gif" />" alt="" width="1" height="1" /></td>
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

	//format the delete warning message
	function formatDeleteDisplay(instanceData) {
		var serverName = instanceData.returnedData.schedule.serverName;
		var ruleName = instanceData.returnedData.schedule.ruleName;
		//TODO: internationalize messages - will need javascript message handling OR move this into return from server
		if(typeof(serverName) == 'undefined') {
			return "This will purge all Event history for <strong>" + instanceData.returnedData.scheduleIds.length + "</strong> scheduled Rules. To stop these Rules from running but preserve Event history, use \"disable\" instead.";
		} else {
			return "Unscheduling will purge all Event history for <strong>" + ruleName + "</strong> on <strong>" + serverName + "</strong>. To stop the Rule from running but preserve Event history, use \"disable\" instead.";
		}
	}
	
	var deletePopup = new popup();
	//bind to html container
	deletePopup.bindToObject('deletePopup');
	//set ajax call for update
	deletePopup.setUpdateAction("<s:url action="DeleteScheduleInfo" />");
	//set ajax call for submission
	deletePopup.setSubmitAction("<s:url action="DeleteSchedule" />");
	deletePopup.registerSubmit('deleteSchedules');
	deletePopup.registerHide('deleteHide');
	//tell the popup to use a loading box and set the text to display
	deletePopup.createLoader("<s:text name="advisors.currentSchedule.popup.deleteSchedule.text.loading" />");
	//set handler for displaying results
	deletePopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deletePopup.bindData(formatDeleteDisplay, "advisorsToDelete");
	//initialize popup
	deletePopup.init();
	
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
	
	//function to set the last event time - used for the no-event case
	function returnLastEventTime(instanceData) {
		var lastEventTime = instanceData.returnedData.lastEvent.alarmTime;
		if(typeof(lastEventTime) == 'undefined') {
			lastEventTime = "never";
		}
		return lastEventTime;
	}
	
	//function to set the filters on the history link of a scheduled rule
	function setHistoryLink(instanceData) {
		var serverId = instanceData.returnedData.schedule.serverId;
		var ruleId = instanceData.returnedData.rule.id;
		var lastEventTime = instanceData.returnedData.lastEvent.alarmTime;
		var historyWrap = returnObject('sheduleInfoHistoryWrap');
		if(typeof(lastEventTime) == 'undefined') {
			historyWrap.style.visibility = 'hidden';
			return null;
		} else {
			historyWrap.style.visibility = 'visible';
			//javascript is double encoding &amp; when setting the href property must use '&' here
			var href = "<s:url action="FilterEvents" />?severity=alerts&server=" + serverId + "&ruleId=" + ruleId;
			return href;
		}
	}
	
	function initScheduleInfoPopup() {
		var form = returnObject('scheduleInfoForm');
		testValidSchedule(form['submit']);
	}
	
	var scheduleInfoPopup = new popup();
	//bind to html container
	scheduleInfoPopup.bindToObject('scheduleInfoPopup');
	//set ajax call for update
	scheduleInfoPopup.setUpdateAction("<s:url action="ScheduleInfo" />");
	//set ajax call for submission
	scheduleInfoPopup.setSubmitAction("<s:url action="EditSchedule" />");
	scheduleInfoPopup.registerSubmit('scheduleInfoSave');
	//assign a function to handle the page display after a successful submit
	scheduleInfoPopup.setSubmitHandler(reloadPage);
	scheduleInfoPopup.registerHide('scheduleInfoHide1');
	scheduleInfoPopup.registerHide('scheduleInfoHide2');
	scheduleInfoPopup.registerHide('scheduleInfoHide3');
	//tell the popup to use a loading box and set the text to display
	scheduleInfoPopup.createLoader("<s:text name="generic.text.loading" />");
	//bind the data to the display
	//TODO: address duplication of data setting if makes more performant and does not obfuscate
	scheduleInfoPopup.bindData('rule.name', 'sheduleInfoRuleName1');
	scheduleInfoPopup.bindData('rule.version', 'scheduleInfoRuleVersion1');
	scheduleInfoPopup.bindData(showCertified, 'scheduleInfoRuleApproved1');
	scheduleInfoPopup.bindData('rule.name', 'sheduleInfoRuleName2');
	scheduleInfoPopup.bindData('rule.version', 'scheduleInfoRuleVersion2');
	scheduleInfoPopup.bindData(showCertified, 'scheduleInfoRuleApproved2');
	scheduleInfoPopup.bindData('rule.name', 'sheduleInfoRuleName3');
	scheduleInfoPopup.bindData('rule.version', 'scheduleInfoRuleVersion3');
	scheduleInfoPopup.bindData(showCertified, 'scheduleInfoRuleApproved3');
	scheduleInfoPopup.bindData('rule.categoryName', 'scheduleInfoParentAdvisor');
	scheduleInfoPopup.bindData('rule.description', 'scheduleInfoRuleDescription');
	scheduleInfoPopup.bindData(returnLastEventTime, 'scheduleInfoLastAlert');
	scheduleInfoPopup.bindData(setHistoryLink, 'scheduleInfoHistory');
	scheduleInfoPopup.bindData('schedule.frequency.hours', 'hours');
	scheduleInfoPopup.bindData('schedule.frequency.minutes', 'minutes');
	scheduleInfoPopup.bindData('schedule.notifyTargets', 'notifyTargets');
	scheduleInfoPopup.bindData('schedule.snmpEnabled', 'snmpEnabled');
	scheduleInfoPopup.bindData('rule.thresholds.info', 'scheduleInfoInfoThreshold');
	scheduleInfoPopup.bindData('rule.thresholds.info', 'scheduleInfoWarningThreshold');
	scheduleInfoPopup.bindData('rule.thresholds.info', 'scheduleInfoCriticalThreshold');
	scheduleInfoPopup.bindData('schedule.frequencyString', 'scheduleInfoFrequency');
	scheduleInfoPopup.bindData('rule.expression', 'scheduleInfoExpression');
	//must be last element so that it can test the already set values
	scheduleInfoPopup.bindData(initScheduleInfoPopup);
	//initialize popup
	scheduleInfoPopup.init();
	
	//POPUP DEFINITION AND CUSTOM FUNCTIONS FOR RULE INFORMATION POPUP DISPLAY	
	var ruleInfoPopup = new popup();
	//bind to html container
	ruleInfoPopup.bindToObject('ruleInfoPopup');
	//set ajax call for update
	ruleInfoPopup.setUpdateAction("<s:url action="RuleInfo" />");
	ruleInfoPopup.registerHide('ruleInfoHide');
	//tell the popup to use a loading box and set the text to display
	ruleInfoPopup.createLoader("<s:text name="rule.text.loading" />");
	//bind the data to the display
	ruleInfoPopup.bindData('rule.expression', 'ruleInfoExpression');
	ruleInfoPopup.bindData('rule.name', 'ruleInfoRuleName1');
	ruleInfoPopup.bindData('rule.version', 'ruleInfoRuleVersion1');
	ruleInfoPopup.bindData(showCertified, 'ruleInfoRuleApproved1');
	ruleInfoPopup.bindData('rule.name', 'ruleInfoRuleName2');
	ruleInfoPopup.bindData('rule.version', 'ruleInfoRuleVersion2');
	ruleInfoPopup.bindData(showCertified, 'ruleInfoRuleApproved2');
	ruleInfoPopup.bindData('rule.categoryName', 'ruleInfoParentAdvisor');
	ruleInfoPopup.bindData('rule.description', 'ruleInfoMoreInfo');
	ruleInfoPopup.bindData('rule.advice', 'ruleInfoAdvice');
	ruleInfoPopup.bindData('rule.command', 'ruleInfoCommand')
	ruleInfoPopup.bindData('rule.info', 'ruleInfoFurtherInfo');
	ruleInfoPopup.bindData('rule.thresholds.info', 'ruleInfoInfoThreshold');
	ruleInfoPopup.bindData('rule.thresholds.warning', 'ruleInfoWarningThreshold');
	ruleInfoPopup.bindData('rule.thresholds.critical', 'ruleInfoCriticalThreshold');
	ruleInfoPopup.bindData('rule.defaultFrequencyString', 'ruleInfoFrequency');

	//initialize popup
	ruleInfoPopup.init();

	
	
	//TOGGLE ENABLED STATUS
	//TODO: shares characteristics with popup code - consider where you can refactor or make more generic versions of portions of the code
	function toggleStatus(which, id) {
		var _self = this;
		
		//ajax handler function for server return
		_self.handleToggleStatus = function(returnedData) {
			//server complained about request and returned a message
			if(returnedData.ret == false && returnedData.msg) {
				alert(returnedData.msg);
			//unformatted error
			} else if(returnedData.ret != true) {
				//strip html so it can be put in alert box
				alert(returnedData.toString().stripHTML());
			//update worked, change the page to reflect change
			} else {
				//update status class and display text
				if(which.className == 'enabled') {
					which.innerHTML = "disabled";
					which.className = 'disabled';
					noticeFader.addMessage("<s:text name="schedule.notice.disabled" />");
				} else {
					which.innerHTML = "enabled";
					which.className = 'enabled';
					noticeFader.addMessage("<s:text name="schedule.notice.enabled" />");
				}
			}
			//hide the indication that the server is busy
			hideWorking();
		}
		
		//indicate that the server is working
		showWorking();
		//set the collected data
		var collectedData = "scheduleId=" + escape(id);
		//create a new ajax post handler
		var newPost = new asynchronousRequest();
		//give the ajax request the collected data
		newPost.setParamString(collectedData);
		//set the submission URI
		newPost.setURL("<s:url action="ToggleEnabled" />");
		//set the handler function for returned data
		newPost.setHandlerFunction(_self.handleToggleStatus);
		//set the transfer method to post
		newPost.setTransferMethod('POST');
		//run the request
		newPost.run();
	}
	
	//format the disable warning message
	function formatEnableDisableDisplay(instanceData) {
		var numServers = instanceData.returnedData.scheduleIds.length;

		if(numServers > 1) {
			return numServers + " schedules";
		} else {
			return "1 schedule";
		}
	}

	var disablePopup = new popup();
	//bind to html container
	disablePopup.bindToObject('disablePopup');
	//set ajax call for update
	disablePopup.setUpdateAction("<s:url action="EnableDisableScheduleInfo" />");
	//set ajax call for submission
	disablePopup.setSubmitAction("<s:url action="BatchToggleEnabled" />?enable=false");
	disablePopup.registerSubmit('disableSchedules');
	disablePopup.registerHide('disableHide');
	//tell the popup to use a loading box and set the text to display
	disablePopup.createLoader("<s:text name="schedule.text.loading" />");
	//set handler for displaying results
	disablePopup.setSubmitHandler(enableDisablePageUpdate);
	//bind the data to the display
	disablePopup.bindData(formatEnableDisableDisplay, "schedulesToDisable");
	//initialize popup
	disablePopup.init();
	
	var enablePopup = new popup();
	//bind to html container
	enablePopup.bindToObject('enablePopup');
	//set ajax call for update
	enablePopup.setUpdateAction("<s:url action="EnableDisableScheduleInfo" />");
	//set ajax call for submission
	enablePopup.setSubmitAction("<s:url action="BatchToggleEnabled" />?enable=true");
	enablePopup.registerSubmit('enableSchedules');
	enablePopup.registerHide('enableHide');
	//tell the popup to use a loading box and set the text to display
	enablePopup.createLoader("<s:text name="schedule.text.loading" />");
	//set handler for displaying results
	enablePopup.setSubmitHandler(enableDisablePageUpdate);
	//bind the data to the display
	enablePopup.bindData(formatEnableDisableDisplay, "schedulesToEnable");
	//initialize popup
	enablePopup.init();
	
	function enableDisablePageUpdate(instanceData) {
		//determine if it was an enable or disable update
		var enable = instanceData.returnedData.enable;
		if(enable) {
			var oldState = "disabled";
			var newState = "enabled";
			var replacementText = "enabled";
		} else {
			var oldState = "enabled";
			var newState = "disabled";
			var replacementText = "disabled";
		}
		
		var removeRows = new Array();
		if(instanceData.batchErrors && instanceData.batchErrors.length > 0) {
			batchErrors = instanceData.batchErrors;
			var errorString = '';
			for(var i = 0; i < batchErrors.length; i++) {
				errorString += batchErrors[i]['msg'] + '\n';
				var checkbox = returnObject(batchErrors[i]['id']);
				if(typeof(checkbox) != 'undefined') {
					var parentRowID = getAncestorOfType(checkbox, 'tr').id;
					removeRows[parentRowID] = true;
				}
			}
			alert(errorString);
		}
		var disabledSchedules = new Array();
		//TODO: remove failed schedules from the affected rows
		if(instanceData.affectedRows.length > 0) {
			disabledSchedules = instanceData.affectedRows;
		} else {
			disabledSchedules.push(instanceData.row);
		}
		//update the page to clear the affected checkboxes
		for(var i = 0; i < disabledSchedules.length; i++) {
			var affectedSchedule = disabledSchedules[i].id;
			var show = true;
			if(!removeRows[affectedSchedule]) {
				var checkboxContainer = getElementsByClassName('individualRecord', disabledSchedules[i], 'span', false);
				if(checkboxContainer[0]) {
					var checkbox = checkboxContainer[0].getElementsByTagName('input')[0];
					checkbox.checked = false;
				}
				var stateContainer = getElementsByClassName(oldState, disabledSchedules[i], 'span', false);
				if(stateContainer[0]) {
					var state = stateContainer[0];
					state.innerHTML = replacementText;
					state.className = newState;
				}
			}
		}
		updateCheckedCheckboxes("ruleNames[]");
		updateCheckedCheckboxes("advisorNames[]");
		var numChanged = instanceData.affectedRows.length - removeRows.length;
		var plural = numChanged > 1 ? "s" : "";
		//TODO: internationalize text
		noticeFader.addMessage(numChanged + " schedule" + plural + " " + replacementText + ".");
		return true;
	}
	
	function testValidSchedule(which) {
		var form = which.form;
		var submitButton = form['submit'];
		var useDefaultFrequency = form['useDefaultFrequency'];
		if (useDefaultFrequency && useDefaultFrequency.checked) {
			submitButton.disabled = false;
		} else if ((parseInt(form['hours'].value, 10) + parseInt(form['minutes'].value, 10)) > 0) {
			submitButton.disabled = false;
		} else {
			submitButton.disabled = true;
		}
	}
	
	function formatEditScheduleDisplay(instanceData) {
		var numSchedules = instanceData.returnedData.numSchedules;
		var schedule = instanceData.returnedData.schedule;
		//TODO: Internationalize text
		if(typeof(schedule.ruleName) != 'undefined') {
			return "\"" + schedule.ruleName + "\" against \"" + schedule.serverName + "\"";
		} else if(numSchedules > 1) {
			//show the option for using defaults
			returnObject('useDefaultRow').style.display = tableRowDisplay;
			return numSchedules + " schedules.";
		} else {
			return numSchedules + " schedule.";
		}
	}
	
	function initEditSchedulePopup() {
		var form = returnObject('editScheduleForm');
		testValidSchedule(form['submit']);
	}
	
	var editSchedulePopup = new popup();
	//bind to html container
	editSchedulePopup.bindToObject('editSchedulePopup');
	//register a button for hiding the poup
	editSchedulePopup.registerHide('editScheduleHide');
	//set ajax call for update
	editSchedulePopup.setUpdateAction("<s:url action="EditSchedulesInfo" />");
	//set ajax call for submission
	editSchedulePopup.setSubmitAction("<s:url action="EditSchedules" />");
	editSchedulePopup.registerSubmit('editScheduleSubmit');
	//set the input item to focus on after popup load
	editSchedulePopup.setFocus('editScheduleHours');
	//assign a function to handle the page display after a successful submit
	editSchedulePopup.setSubmitHandler(reloadPage); //since you won't know the new frequency when default frequency checked, this needs to be a refresh to get the new data
	//bind the data to the display
	editSchedulePopup.bindData('schedule.frequency.hours', 'hours');
	editSchedulePopup.bindData('schedule.frequency.minutes', 'minutes');
	editSchedulePopup.bindData(formatEditScheduleDisplay, 'schedulesToUpdate');
	editSchedulePopup.bindData('schedule.notifyTargets', 'notifyTargets');
	//must be last element so that it can test the already set values
	editSchedulePopup.bindData(initEditSchedulePopup);
	//initialize popup
	editSchedulePopup.init();
	
/* ]]> */
</script>