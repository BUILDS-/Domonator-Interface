<%@ page language="java" pageEncoding="UTF-8" %>
<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<input type="button" value="<s:text name="generic.button.expandAll" />" onclick="tableExpandCollapseHandler.toggleAll('graphs', this)" />
					</td>
					<td align="right">
						<div class="itemContents"><span class="listLink"><a href="javascript://" onclick="editGraphDefaults.show({}, event)"><img src="<s:url value="/web/resources/images/confgIcon11.png" />" border="0" width="11" height="11" /> <s:text name="graphs.link.configure" /></a></span></div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title"><s:text name="graphs.sectionTitle.events" /></div>
		</td>
	</tr>
	<tr>
		<td class="filter">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td valign="top">
						<form action="<s:url action="UpdateGraphs" />" method="POST">
						<div class="inputLabelWrap" style="padding-right: 20px;">
							<span class="inputLabelTitle"><s:text name="graphs.label.timeDisplay" /></span><br/>
							<select id="timeDisplay" name="timeDisplay" onchange="updateTimeSelection(this)">
								<s:iterator value="timeDisplayOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="intervalHoursWrap"<s:if test="timeDisplay != 'interval'"> style="display: none;"</s:if>>
							<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
							<select id="intervalHours" name="intervalHours"<s:if test="timeDisplay != 'interval'"> disabled="disabled"</s:if>>
								<s:iterator value="intervalHourOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="intervalMinutesWrap"<s:if test="timeDisplay != 'interval'"> style="display: none; padding-right: 20px;"</s:if><s:else> style="padding-right: 20px;"</s:else>>
							<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
							<select id="intervalMinutes" name="intervalMinutes"<s:if test="timeDisplay != 'interval'"> disabled="disabled"</s:if>>
								<s:iterator value="intervalMinuteOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="fromDateWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none;"</s:if>>
							<span class="inputLabelTitle"><s:text name="graphs.label.fromTime" /></span><br/>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td><input type="text" id="fromDate" name="fromDate" value="<s:property value="fromDate" />" size="8" <s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>/></td>
									<td><img src="<s:url value="/web/resources/images/calendarIcon.jpg" />" id="fromDateButton" width="16" height="16" alt="" /></td>
								</tr>
							</table>
							<script type="text/javascript" language="javascript">
							/* <![CDATA[ */
								var fromCalendar = new calendar();
								fromCalendar.registerInput('fromDate');
								fromCalendar.registerToggle('fromDateButton');
								fromCalendar.setTimeOffset('<s:date name="now" format="%{getText('datePicker.initOffset')}" />');
								fromCalendar.init();
							/* ]]> */
							</script>
						</div>
						<div class="inputLabelWrap" id="fromHoursWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none;"</s:if>>
							<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
							<select id="fromHours" name="fromHours"<s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>>
								<s:iterator value="fromHourOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="fromMinutesWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none; padding-right: 20px;"</s:if><s:else> style="padding-right: 20px;"</s:else>>
							<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
							<select id="fromMinutes" name="fromMinutes"<s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>>
								<s:iterator value="fromMinuteOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="toDateWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none;"</s:if>>
							<span class="inputLabelTitle"><s:text name="graphs.label.toTime" /></span><br/>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td><input type="text" id="toDate" name="toDate" value="<s:property value="toDate" />" size="8" <s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>/></td>
									<td><img src="<s:url value="/web/resources/images/calendarIcon.jpg" />" id="toDateButton" width="16" height="16" alt="" /></td>
								</tr>
							</table>
							<script type="text/javascript" language="javascript">
							/* <![CDATA[ */
								var toCalendar = new calendar();
								toCalendar.registerInput('toDate');
								toCalendar.registerToggle('toDateButton');
								toCalendar.setTimeOffset('<s:date name="now" format="%{getText('datePicker.initOffset')}" />');
								toCalendar.init();
							/* ]]> */
							</script>
						</div>	
						<div class="inputLabelWrap" id="toHoursWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none;"</s:if>>
							<span class="inputLabelTitle"><s:text name="generic.label.hours" /></span><br/>
							<select id="toHours" name="toHours"<s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>>
								<s:iterator value="toHourOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap" id="toMinutesWrap"<s:if test="timeDisplay != 'fromTo'"> style="display: none; padding-right: 20px;"</s:if><s:else> style="padding-right: 20px;"</s:else>>
							<span class="inputLabelTitle"><s:text name="generic.label.minutes" /></span><br/>
							<select id="toMinutes" name="toMinutes"<s:if test="timeDisplay != 'fromTo'"> disabled="disabled"</s:if>>
								<s:iterator value="toMinuteOptions">
									<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
								</s:iterator>
							</select>
						</div>
						<div class="inputLabelWrap">
							<span class="inputLabelTitle"><s:text name="generic.label.width" /></span><br/>
							<input type="text" name="width" size="5" value="<s:property value="width" />" />
						</div>
						<div class="inputLabelWrap">
							<span class="inputLabelTitle"><s:text name="generic.label.height" /></span><br/>
							<input type="text" name="height" size="5" value="<s:property value="height" />" />
						</div>		
						<div class="inputLabelWrap">
							<br/>
							<input type="submit" name="update" value="<s:text name="generic.button.update" />" />
							<input type="submit" name="reset" value="<s:text name="generic.button.reset" />" />
						</div>
						</form>
						<script type="text/javascript" language="javascript">
						/* <![CDATA[ */
							function updateTimeSelection() {
								var timeDisplay = returnObject('timeDisplay').value;
								if(timeDisplay == 'interval') {
									returnObject('intervalHours').disabled = false;
									returnObject('intervalHoursWrap').style.display = "block";
									returnObject('intervalMinutes').disabled = false;
									returnObject('intervalMinutesWrap').style.display = "block";
									
									returnObject('fromDate').disabled = true;
									returnObject('fromDateWrap').style.display = "none";
									returnObject('fromHours').disabled = true;
									returnObject('fromHoursWrap').style.display = "none";
									returnObject('fromMinutes').disabled = true;
									returnObject('fromMinutesWrap').style.display = "none";
									returnObject('toDate').disabled = true;
									returnObject('toDateWrap').style.display = "none";
									returnObject('toHours').disabled = true;
									returnObject('toHoursWrap').style.display = "none";
									returnObject('toMinutes').disabled = true;
									returnObject('toMinutesWrap').style.display = "none";
								} else if(timeDisplay == 'fromTo') {
									returnObject('intervalHours').disabled = true;
									returnObject('intervalHoursWrap').style.display = "none";
									returnObject('intervalMinutes').disabled = true;
									returnObject('intervalMinutesWrap').style.display = "none";
									
									returnObject('fromDate').disabled = false;
									returnObject('fromDateWrap').style.display = "block";
									returnObject('fromHours').disabled = false;
									returnObject('fromHoursWrap').style.display = "block";
									returnObject('fromMinutes').disabled = false;
									returnObject('fromMinutesWrap').style.display = "block";
									returnObject('toDate').disabled = false;
									returnObject('toDateWrap').style.display = "block";
									returnObject('toHours').disabled = false;
									returnObject('toHoursWrap').style.display = "block";
									returnObject('toMinutes').disabled = false;
									returnObject('toMinutesWrap').style.display = "block";
								}
							}
							addDOMLoadListener(updateTimeSelection);
						/* ]]> */
						</script>
					</td>
					<td align="right">
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="background: #FFFFFF; padding: 10px 3px 5px 4px;" class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0">
				<tbody>
					<s:iterator value="graphs">
						<tr class="graphTitle" id="graphs.-.graph<s:property value="id" />">
							<td><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" /> <s:property value="name" /></td>
						</tr>
						<tr class="graphContainer" id="graphs.-.graph<s:property value="id" />.-.image" style="display: none;">
							<td align="right">
								<div class="basicBox">
									<div class="itemContents"><img id="graphs.-.graph<s:property value="id" />.-.image.-.object" src="<s:url value="/web/resources/images/spacer.gif" />" alt="<s:property value="name" />" /></div>
									<input type="hidden" name="graphs.-.graph<s:property value="id" />.-.image.-.src" id="graphs.-.graph<s:property value="id" />.-.image.-.src" value="<s:url action="Graph" />?graphName=<s:property value="name" />&amp;t=<s:property value="now.time" />" />
								</div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript" language="javascript">
/* <![CDATA[ */
	// custom function picked up by rowDisplayToggle.js - used to set graph image srs only when expanded for performance reasons
	var ROW_DISPLAY_TOGGLE_CUSTOM_FUNCTION = function(row, expansion) {
		if(expansion) {
			var image = returnObject(row.id + ".-.object");
			var srcContainer = returnObject(row.id + ".-.src");
			if(image && srcContainer) {
				image.src = srcContainer.value;
			}
		}
	}
/* ]]> */
</script>
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
												<td class="tabBody"><s:text name="graphs.popup.graphDefaults.tab.display" /></td>
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
						<div class="itemContents"><s:text name="graphs.popup.graphDefaults.text.instructions" /></div>
						
						<div class="itemLabel"><s:text name="graphs.popup.graphDefaults.label.defaultInterval" /></div>
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

						<div class="itemLabel"><s:text name="graphs.popup.graphDefaults.label.dimensions" /></div>
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
						<input type="button" name="submit" value="<s:text name="generic.button.save" />" id="editGraphDefaultsSubmit" />
						<input type="button" name="hide" value="<s:text name="generic.button.cancel" />" id="editGraphDefaultsHide" />
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

	var editGraphDefaults = new popup();
	//bind to html container
	editGraphDefaults.bindToObject('editGraphDefaults');
	//set ajax call for update
	editGraphDefaults.setUpdateAction("<s:url action="SetGraphDefaultsInfo" />");
	//set ajax call for submission
	editGraphDefaults.setSubmitAction("<s:url action="SetGraphDefaults" />");
	editGraphDefaults.registerSubmit('editGraphDefaultsSubmit');
	//assign a function to handle the page display after a successful submit
	editGraphDefaults.setSubmitHandler(reloadPage);
	editGraphDefaults.registerHide('editGraphDefaultsHide');

	//bind the data to the display
	editGraphDefaults.bindData('interval.hours', 'hours');
	editGraphDefaults.bindData('interval.minutes', 'minutes');
	editGraphDefaults.bindData('width', 'width');
	editGraphDefaults.bindData('height', 'height');
	editGraphDefaults.init();
	
	/* ]]> */
</script>
