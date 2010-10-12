<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="w" uri="/widget-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<s:form action="FilterLog">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td class="titleBar">
				<div class="title"><s:text name="settings.logs.title" /></div>
				<w:paging numRecords="totalCount" currentPage="currentPage" limit="limit" action="PageLog" />
			</td>
		</tr>
		<tr>
			<td class="listBox">
				<table cellpadding="0" cellspacing="0" width="100%">
	            	<tr>
	            		<td class="filter" colspan="100">
	            			<s:if test="showAllLogs">
	                			<div class="inputLabelWrap">
	                				<span class="inputLabelTitle"><s:text name="settings.logs.text.name" /></span><br/>
	                				<select name="filterName">
										<s:iterator value="filterNameOptions">
											<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
										</s:iterator>
	                				</select>
	                			</div>
	                		</s:if>
	                		<s:else>
								<input type="hidden" name="logName" value="<s:property value="logName" />" />
							</s:else>
	                			
	                			<div class="inputLabelWrap">
	                				<span class="inputLabelTitle"><s:text name="settings.logs.text.level" /></span><br/>
	                				<select name="logLevel">
										<s:iterator value="logLevelOptions">
											<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
										</s:iterator>
	                				</select>
	                			</div>
	                			
	                			<div class="inputLabelWrap">
	                				<span class="inputLabelTitle"><s:text name="settings.logs.text.from" /></span><br/>
	                				<table cellpadding="0" cellspacing="0">
	                					<tr>
	                						<td><input type="text" id="fromDate" name="fromDate" value="<s:property value="fromDate" />" size="10" /></td>
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
	                			<div class="inputLabelWrap">
	                				<span class="inputLabelTitle"><s:text name="settings.logs.text.to" /></span><br/>
	                				<table cellpadding="0" cellspacing="0">
	                					<tr>
	                						<td><input type="text" id="toDate" name="toDate" value="<s:property value="toDate" />" size="10" /></td>
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
	                			
	                			<div class="inputLabelWrap">
	                				<span class="inputLabelTitle"><s:text name="settings.logs.text.limit" /></span><br/>
	                				<select name="limit">
										<s:iterator value="limitOptions">
											<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
										</s:iterator>
	                				</select>
	                            </div>
	                            
	                			<div class="inputLabelWrap">
	                				<br/>
	                				<input type="submit" name="update" value="<s:text name="settings.logs.button.filter" />" />
	                				<input type="submit" name="reset" value="<s:text name="settings.logs.button.reset" />" />
	                			</div>
	        			</td>
	                </tr>
	                <tr class="titleRow">
						<s:if test="showAllLogs">
							<td><w:sortColumn action="SortLog" column="logName" primarySort="primarySortColumn" primarySortDesc="primarySortDescending"><s:text name="settings.logs.columnTitle.name" /></w:sortColumn></td>
						</s:if>
						<td><w:sortColumn action="SortLog" column="level" primarySort="primarySortColumn" primarySortDesc="primarySortDescending"><s:text name="settings.logs.columnTitle.level" /></w:sortColumn></td>
						<td><w:sortColumn action="SortLog" column="time" primarySort="primarySortColumn" primarySortDesc="primarySortDescending"><s:text name="settings.logs.columnTitle.time" /></w:sortColumn></td>
						<td><w:sortColumn action="SortLog" column="message" primarySort="primarySortColumn" primarySortDesc="primarySortDescending"><s:text name="settings.logs.columnTitle.message" /></w:sortColumn></td>
					</tr>
					<s:if test="logEntries.length < 1">
						<tr class="listRowCategoryL1">
							<td colspan="4" class="noRecordsFound"><s:text name="settings.logs.text.noLogsFound" /></td>
						</tr>
					</s:if>
	                <s:iterator value="logEntries" status="iteratorStatus">
	    				<tr class="listRow<s:if test="#iteratorStatus.odd">Alt</s:if>">
							<s:if test="showAllLogs">
	                    	    <td><s:property value="name" /></td>
							</s:if>
	                        <td><s:property value="getNiceLogLevel(getLevel())" /></td>
	                        <td><s:date name="getOffsetDate(convertUtc(getUtc()))" /></td>
	                        <td style="width: 100%; white-space: pre"><s:property value="msg"/></td>
	    				</tr>
	                </s:iterator>
				</table>
			</td>
		</tr>
		<tr>
			<td class="listBoxBottom">
				<w:paging numRecords="totalCount" currentPage="currentPage" limit="limit" action="PageLog" />
			</td>
		</tr>
	</table>
</s:form>
