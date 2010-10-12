<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="button" value="<s:text name="advisors.addToSchedule.button.schedule" />" onclick="schedulePopup.showBatch('ruleUuids', event)" />
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title">
				<s:text name="advisors.addToSchedule.sectionTitle.advisors" />
			</div>
		</td>
	</tr>
	
	<tr>
		<td class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
				<tr class="titleRow">
					<td><s:text name="advisors.addToSchedule.columnTitle.advisors" /></td>
					<td><s:text name="advisors.addToSchedule.columnTitle.defaultFrequency" /></td>
					<td class="linkColumn">&nbsp;</td>
				</tr>
				<s:if test="%{categories.length < 1}">
					<tr class="listRowCategoryL1">
						<td colspan="3" class="noRecordsFound">
							<s:text name="advisors.addToSchedule.noRecords" />
						</td>
					</tr>
				</s:if>
				<s:iterator value="categories">
					<s:set name="categoryId" value="category.id"/>
					<tr class="listRowCategoryL1" id="category<s:property value="#categoryId" />">
						<td class="firstCellL1"><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" />       
							<input name="categoryIds" type="checkbox" class="checkbox" onclick="updateCheckboxes(this)"<s:if test="!hasUnscheduled"> disabled="disabled"</s:if> />
							<s:property value="category.name" /> (<s:property value="rules.size" />)
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<s:iterator value="rules" status="ruleStatus">
						<s:set name="ruleId" value="rule.uuid"/>
						<tr class="listRow<s:if test="#ruleStatus.odd == true">Alt</s:if>" id="category<s:property value="#categoryId" />.-.rule<s:property value="#ruleId" />">
							<td class="firstCellL2">
								<span class="scheduleCheckbox"><input name="ruleUuids" type="checkbox" class="checkbox" value="<s:property value="#ruleId" />"<s:if test="isScheduled"> disabled="disabled"</s:if> /></span>
								<a href="javascript://" onclick="ruleInfoPopup.show({'ruleUuid' : '<s:property value="#ruleId" />'}, event)"><s:property value="rule.name" /></a>
							</td>
							<td><span class="updateFrequency"><s:property value="stripSeconds(rule.defaultFrequency)" /></span></td>
							<td>
								<s:if test="!isScheduled">
									<span class="scheduleLink"><span class="listLink"><a href="javascript://" onclick="schedulePopup.show({'ruleUuid' : '<s:property value="#ruleId" />'}, event)"><img src="<s:url value="/web/resources/images/addIcon11.png" />" width="11" height="11" alt="<s:text name="advisors.addToSchedule.link.schedule" />" /> <s:text name="advisors.addToSchedule.link.schedule" /></a></span></span>
								</s:if>
								<span class="scheduledNote"<s:if test="!isScheduled"> style="display: none;"</s:if>><s:text name="advisors.addToSchedule.text.scheduled" /></span>
							</td>
						</tr>
					</s:iterator>
				</s:iterator>
				</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td class="bottomButtonBar">
			<input type="button" value="<s:text name="advisors.addToSchedule.button.schedule" />" onclick="schedulePopup.showBatch('ruleUuids', event)" />
		</td>
	</tr>
</table>

<form action="#" onsubmit="return false">
<div id="schedulePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupScheduleTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.addToSchedule.popup.schedule.tab.schedule" /></td>
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
				<div id="popupScheduleBody" class="popupBody">
					<div class="itemLabelStandalone"><s:text name="advisors.addToSchedule.popup.schedule.text.scheduleWhat" /></div>

					<table cellpadding="0" cellspacing="0" width="100%">
						<tr style="display: none;" id="useDefaultRow">
							<td class="popupFormSubtitle"><s:text name="schedule.label.useDefaultFrequency" /></td>
							<td class="popupFormContents">
								<table>
									<tr>
										<td style="vertical-align: baseline;"><input name="useDefaultFrequency" id="useDefaultFrequency" type="checkbox" value="true" onclick="testValidSchedule()" /></td>
										<td style="vertical-align: top;"><s:text name="schedule.text.useDefault" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="popupFormSubtitle"><s:text name="schedule.label.frequency" /></td>
							<td class="popupFormContents" nowrap="nowrap">
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.hours" /></span><br/>
									<select name="hours" onchange="testValidSchedule()" id="scheduleHours">										
										<s:iterator value="hourOptions">
											<option value="<s:property value="value" />"><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
								
								<div class="inputLabelWrap">
									<span class="inputLabelTitle"><s:text name="schedule.label.minutes" /></span><br/>
									<select name="minutes" onchange="testValidSchedule()" id="scheduleMinutes">
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
						<input id="scheduleSubmit" type="button" name="submit" value="<s:text name="schedule.button.schedule" />" disabled="disabled" />
						<input id="scheduleHide" type="button" name="hide" value="<s:text name="schedule.button.cancel" />" />
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

<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */
	//RUN NOW POPUP AND CUSTOM FUNCTIONS
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
	
	function showServer(instanceData) {
		var serverName = instanceData.customArguments.server;
		return serverName;
	}
	

	//POPUP DEFINITION AND CUSTOM FUNCTIONS FOR RULE SCHEDULING
	function schedulePageUpdate(instanceData) {
		var removeRows = new Array();
		if(instanceData.batchErrors && instanceData.batchErrors.length > 0) {
			batchErrors = instanceData.batchErrors;
			var errorString = '';
			for(var i = 0; i < batchErrors.length; i++) {
				errorString += batchErrors[i]['msg'] + '\n';
				removeRows['rule' + batchErrors[i]['id']] = true;
			}
			alert(errorString);
		}
		var scheduledRules = new Array();
		//TODO: remove failed schedules from the affected rows
		if(instanceData.affectedRows.length > 0) {
			scheduledRules = instanceData.affectedRows;
		} else {
			scheduledRules.push(instanceData.row);
		}
		//update the page to disable scheduled item's checkboxes and remove the schedule link
		//TODO: attempt to determine if all child checkboxes are disabled, if so, disable the parent
		for(var i = 0; i < scheduledRules.length; i++) {
			var affectedRule = scheduledRules[i].id.split('.-.');
			affectedRule = affectedRule[affectedRule.length - 1];
			var show = true;
			
			if(!removeRows[affectedRule]) {
				var checkboxContainer = getElementsByClassName('scheduleCheckbox', scheduledRules[i], 'span', false);
				if(checkboxContainer[0]) {
					var checkbox = checkboxContainer[0].getElementsByTagName('input')[0];
					checkbox.disabled = true;
					checkbox.checked = false;
				}
				getElementsByClassName('scheduleLink', scheduledRules[i], 'span', false)[0].style.display = 'none';
				getElementsByClassName('scheduledNote', scheduledRules[i], 'span', false)[0].style.display = 'inline';
			}
		}
		//update all of the categories so that they get disabled if all children are disabled following this update
		updateDisabledCheckboxes("categoryIds");
		var numServers = instanceData.returnedData.numServers;
		var numRulesChanged = (scheduledRules.length * numServers)  - instanceData.batchErrors.length;
		var rulesPlural = numRulesChanged == 1 ? "" : "s";
		var serversPlural = numServers == 1 ? "" : "s";
		//TODO: create a javascript function that does message substitution like the java message utilis levereged in getTxt
		noticeFader.addMessage(numRulesChanged + " rule" + rulesPlural + " scheduled against " + numServers + " server" + serversPlural + ".");
		return true;
	}

	function formatScheduleDisplay(instanceData) {
		var ruleName = instanceData.returnedData.rule.name;
		var numRules = instanceData.returnedData.numRules;
		var serverName = instanceData.returnedData.serverName;
		var numServers = instanceData.returnedData.numServers;
		var serverDisplay = '';
		if(typeof(serverName) != 'undefined') {
			serverDisplay = serverName;
		} else {
			serverDisplay = numServers + " servers"
		}
		if(typeof(numRules) != 'undefined') {
			//show the option for using defaults
			returnObject('useDefaultRow').style.display = tableRowDisplay;
			
			return instanceData.returnedData.numRules + " rules against " + serverDisplay;
		} else {
			return ruleName + " against " + serverDisplay;
		}
	}
	
	function cleanupScheduleDisplay() {
		returnObject('useDefaultRow').style.display = 'none';
		returnObject('scheduleSubmit').disabled = true;
	}
	
	
	function testValidSchedule() {
		var scheduleSubmit = returnObject('scheduleSubmit');
		var container = returnObject('popupScheduleBody');
		var useDefaultFrequency = returnObject('useDefaultFrequency');
		if (useDefaultFrequency && useDefaultFrequency.checked) {
			scheduleSubmit.disabled = false;
		} else if (parseInt(returnObject('scheduleHours').value, 10) + parseInt(returnObject('scheduleMinutes').value, 10) > 0) {
			scheduleSubmit.disabled = false;
		} else {
			scheduleSubmit.disabled = true;
		}
	}
	
	var schedulePopup = new popup();
	//bind to html container
	schedulePopup.bindToObject('schedulePopup');
	//register a button for hiding the poup
	schedulePopup.registerHide('scheduleHide');
	//set ajax call for update
	schedulePopup.setUpdateAction("<s:url action="DoScheduleInfo" />");
	//set ajax call for submission
	schedulePopup.setSubmitAction("<s:url action="DoSchedule" />");
	schedulePopup.registerSubmit('scheduleSubmit');
	//assign a function to handle the page display after a successful submit
	schedulePopup.setSubmitHandler(schedulePageUpdate);
	//bind the data to the display
	schedulePopup.bindData("rule.defaultFrequency.hours", "hours");
	schedulePopup.bindData("rule.defaultFrequency.minutes", "minutes");
	schedulePopup.setCleanupAction(cleanupScheduleDisplay);
	schedulePopup.setPostPopulationAction(testValidSchedule);
	schedulePopup.bindData(formatScheduleDisplay, "rulesToSchedule");
	//initialize popup
	schedulePopup.init();
	
	var ruleInfoPopup = new popup();
	//bind to html container
	ruleInfoPopup.bindToObject('ruleInfoPopup');
	//set ajax call for update
	ruleInfoPopup.setUpdateAction("<s:url action="RuleInfo" />");
	ruleInfoPopup.registerHide('ruleInfoHide');
	//tell the popup to use a loading box and set the text to display
	ruleInfoPopup.createLoader("Loading Rule Information");
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
/* ]]> */
</script>