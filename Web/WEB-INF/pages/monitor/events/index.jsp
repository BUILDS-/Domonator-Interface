<%@ page language="java" pageEncoding="UTF-8" %>
<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<s:form action="FilterEvents">
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="button" value="<s:text name="events.button.close" />" onclick="closurePopup.showBatch('historyIds', event)" />
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title">
				<s:text name="events.sectionTitle.events" />
			</div>
			<w:paging numRecords="numRecords" currentPage="page" limit="limit" action="PageEvents" />
		</td>
	</tr>
	<tr>
		<td class="filter">
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="events.label.severity" /></span><br/>
				<select id="severity" name="severity">
					<s:iterator value="severityOptions">
						<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>

			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="events.label.fromDate" /></span><br/>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td><input type="text" id="fromCalendar" name="fromDate" value="<s:property value="fromDate" />" size="8" /></td>
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
				<span class="inputLabelTitle"><s:text name="events.label.toDate" /></span><br/>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td><input type="text" id="toCalendar" name="toDate" value="<s:property value="toDate" />" size="8" /></td>
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
				<span class="inputLabelTitle"><s:text name="events.label.categories" /></span><br/>
				<select name="categoryId" onchange="updateRules(this)">
					<s:iterator value="categoryOptions">
						<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="events.label.rules" /></span><br/>
				<select name="ruleId" id="ruleSelectorFull" <s:if test="%{categoryId != null}"> style="display:none;" disabled="disabled"</s:if>>
					<!-- TODO: consider how to put the one option in even though it has no optgroup -->
					<option value="-1"><s:text name="events.option.rules.all" /></option>
					<s:iterator value="ruleOptionsFull">
						<optgroup label="<s:property value="label" />">
							<s:iterator value="options">
								<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
							</s:iterator>
						</optgroup>
					</s:iterator>
				</select>
		
				<select name="ruleId" id="ruleSelector" <s:if test="%{categoryId == null}"> style="display:none;" disabled="disabled"</s:if>>
					<s:if test="%{categoryId != null}">
						<s:iterator value="ruleOptionsFiltered">
							<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
						</s:iterator>
					</s:if>
				</select>
			</div>
			<script type="text/javascript" language="javascript">
			/* <![CDATA[ */
				var monitorOptions = new Array();
				//generate javascript model for advisor to rule mappings
				var categoryId;
				<s:iterator value="ruleOptionsFull">
					categoryId = "<s:property value="Id" />";
					monitorOptions[categoryId] = new Array();
					<s:iterator value="options">
						monitorOptions[categoryId]["<s:property value="value" />"] = "<s:property value="label" />";
					</s:iterator>
				</s:iterator>

				//update rule dropdown(s) based on advisor selection
				function updateRules(which) {
					var advisorID = which.value; //make sure this isn't the id
					var ruleSelector = returnObject('ruleSelector');
					var ruleSelectorFull = returnObject('ruleSelectorFull');
					//if all advisors has been selected - show all rules categorized by advisor
					if(which.value == "-1") {
						//hide the single advisor set of rules
						ruleSelector.style.display = 'none';
						ruleSelector.disabled = true;
						//show the catch-all seet of rules that categorizes in optgroups
						ruleSelectorFull.style.display = 'block';
						ruleSelectorFull.disabled = false;
						//try to set value - fails silently if current set does not contain this value
						ruleSelectorFull.value = "<s:property value="ruleId" />";
					//if single advisor selected, just show its rules
					} else {
						//clear options
						ruleSelector.options.length = 0;
						//add "all rules" option
						var defaultOption = new Option("<s:text name="events.option.rules.all" />", '-1');
						ruleSelector.options[ruleSelector.options.length] = defaultOption;
						//add each rule that belongs to selected advisor
						for(rule in monitorOptions[advisorID]) {
							var thisOption = new Option(monitorOptions[advisorID][rule], rule);
							ruleSelector.options[ruleSelector.options.length] = thisOption;
						}
						//try to set value - fails silently if current set does not contain this value
						ruleSelector.value = "<s:property value="ruleId" />";
						//show the signle advisor set of rules
						ruleSelector.style.display = 'block';
						ruleSelector.disabled = false;
						//hide the catch-all set of rules that categorizes in optgroups
						ruleSelectorFull.style.display = 'none';
						ruleSelectorFull.disabled = true;
					}
				}
			/* ]]> */
			</script>
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="events.label.status" /></span><br/>
				<select id="status" name="status">
				    <s:iterator value="statusOptions">
						<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>
			
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="events.label.limit" /></span><br/>
				<select id="limit" name="limit">
					<s:iterator value="limitOptions">
						<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>
			<div class="inputLabelWrap">
				<br/>
				<input type="submit" name="update" value="<s:text name="events.button.filter" />" />
				<input type="submit" name="reset" value="<s:text name="events.button.reset" />" />
			</div>
		</td>
	</tr>
	<tr>
		<td class="listBox">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr class="titleRow">
						<td><input id="checkAllEvents" type="checkbox" class="checkbox" onclick="updateCheckboxes(this)" /></td>
						<td><w:sortColumn action="SortEvents" column="severity" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.severity" /></w:sortColumn></td>
						<td><w:sortColumn action="SortEvents" column="server" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.server" /></w:sortColumn></td>
						<td><w:sortColumn action="SortEvents" column="category" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.category" /></w:sortColumn></td>
						<td><w:sortColumn action="SortEvents" column="rule" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.rule" /></w:sortColumn></td>
						<td><w:sortColumn action="SortEvents" column="time" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.time" /></w:sortColumn></td>
						<s:if test="!statusFilter">
							<td><w:sortColumn action="SortEvents" column="status" primarySort="primarySort" primarySortDesc="primarySortDesc"><s:text name="events.columnTitle.status" /></w:sortColumn></td>
						</s:if>
						<td class="linkColumn">&nbsp;</td>
					</tr>
					<s:if test="%{history.length < 1}">
						<tr class="listRow">
							<td colspan="8" class="noRecordsFound"><s:text name="events.text.noRecords" /></td>
						</tr>
					</s:if>
					<s:iterator value="history" status="row">
						<tr class="listRow<s:if test="#row.odd == true">Alt</s:if>">
							<td><span class="closeCheckbox"><input name="historyIds" type="checkbox"<s:if test="%{status != 'open'}"> disabled="disabled"</s:if> class="checkbox" value="<s:property value="historyId"/>" /></span></td>
							<td class="centered"><img src="<s:url value="/web/resources/images/" /><s:property value="severeAlarmLevel.levelName"/>Icon11.png" alt="<s:property value="severeAlarmLevel.levelName"/>" title="<s:property value="severeAlarmLevel.levelName"/>" /></td>
							<td><s:property value="serverObj.serverName"/></td>
							<td><s:property value="monitorObj.category.name"/></td>
							<td><a href="javascript://" onclick="historyInfoPopup.show({'historyId' : '<s:property value="historyId"/>'}, event)"><s:property value="monitorObj.name"/></a></td>
							<td title="<s:date name="getOffsetDate(severeAlarmTimestamp)" format="%{getText('struts.date.format.past')}" nice="true" />"><s:date name="getOffsetDate(severeAlarmTimestamp)" /></td>
							<s:if test="!statusFilter">
								<td><span class="eventStatus"><s:property value="capitalizeFirst(status)" /></span></td>
							</s:if>
							<td>
								<s:if test="%{status == 'open'}">
									<span class="closeLink"><span class="listLink"><a href="javascript://" onclick="historInfoCloseShow({'historyId' : '<s:property value="historyId"/>'}, event)"><img src="<s:url value="/web/resources/images/closeIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="events.link.close" />" /> <s:text name="events.link.close" /></a></span></span>
								</s:if>
								<span class="resolutionNotesLink"<s:if test="%{status == 'open'}"> style="display: none"</s:if>><span class="listLink"><a title="<s:property value="truncate(notes, 50)" />" href="javascript://" onclick="historInfoResolutionShow({'historyId' : '<s:property value="historyId"/>'}, event)"><img src="<s:url value="/web/resources/images/noteIcon11.png" />" border="0" width="11" height="11" alt="" /> <s:text name="events.link.notes" /></a></span></span>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td class="listBoxBottom">
           <w:paging numRecords="numRecords" currentPage="page" limit="limit" action="PageEvents" />
		</td>
	</tr>
	<tr>
		<td class="bottomButtonBar">
			<input type="button" value="<s:text name="events.button.close" />" onclick="closurePopup.showBatch('historyIds', event)" />
		</td>
	</tr>
</table>
</s:form>

<form action="#" onsubmit="return false">
<div id="closurePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupCloseTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="events.popup.close.tab.close" /></td>
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
				<div id="popupCloseBody" class="popupBody">
					<div class="itemLabelStandalone">Close <span id="eventsToClose">Error: no events found for closure</span></div>

					<div class="itemLabel"><s:text name="events.popup.label.timestamp" /></div>
					<div class="itemContents" id="closureTimestamp">Error: timestamp not set</div>
					
					<div class="itemLabel"><s:text name="events.popup.close.label.notes" /></div>
					<div class="itemContents"><textarea name="notes" rows="5" cols="50"></textarea></div>

					<div align="right">
						<input id="closeEvents" name="close" type="button" value="<s:text name="events.popup.close.button.close" />" />
						<input id="closureHide" name="cancel" type="button" value="<s:text name="events.popup.close.button.cancel" />" />
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

<script language="javascript" type="text/javascript">
/* <![CDATA[ */

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
	
	function formatEventDisplay(instanceData) {
		var serverName = instanceData.customArguments.serverName;
		var ruleName = instanceData.customArguments.ruleName;
		if(typeof(serverName) == 'undefined') {
			return instanceData.returnedData.eventIds.length + " events";
		} else {
			return ruleName + " on " + serverName;
		}
	}
	
	var closurePopup = new popup();
	//bind to html container
	closurePopup.bindToObject('closurePopup');
	//register a button for hiding the poup
	closurePopup.registerHide('closureHide');
	//set ajax call for update
	closurePopup.setUpdateAction("<s:url action="EventsInfoBatchClose" />");
	//set ajax call for submission
	closurePopup.setSubmitAction("<s:url action="CloseEvents" />");
	closurePopup.registerSubmit('closeEvents');
	//set the input item to focus on after popup load
	closurePopup.setFocus('notes');
	//assign a function to handle the page display after a successful submit
	closurePopup.setSubmitHandler(closurePageUpdate);
	//bind the data to the display
	closurePopup.bindData("closeTimestamp", "closureTimestamp");
	closurePopup.bindData(formatEventDisplay, "eventsToClose");
	closurePopup.setCleanupAction(cleanupNotes);
	//initialize popup
	closurePopup.init();
/* ]]> */
</script>
