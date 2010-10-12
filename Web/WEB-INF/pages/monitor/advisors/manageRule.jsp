<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<s:form action="SaveRule">
	<div class="titleBar"><s:text name="advisors.manageRule.sectionTitle.ruleDefinition" /></div>
	<div class="basicBox">
		<s:if test="certified">
			<div class="itemLabelStandalone">
				<s:text name="advisors.manageRule.text.certifiedWarning" />
			</div>
		</s:if>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
				   <div class="itemLabel"><s:text name="rule.label.ruleName" /></div>
				   <div class="itemContents">
						<s:if test="certified">
							<s:property value="name" />
						</s:if>
						<s:else>
							<input type="text" name="name" id="name" size="70" value="<s:property value="name" />" />
						</s:else>
					</div>
				</td>
				<td style="padding-left: 10px;">
					<div class="itemLabel"><s:text name="rule.label.category" /></div>
					<div class="itemContents">
						<select name="categoryId"<s:if test="certified"> disabled="disabled"</s:if> onchange="showNewAdvisor()" id="categoryName">
							<s:iterator value="categoryOptions">
								<option value="<s:property value="value" />"<s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
							</s:iterator>
						</select>
					</div>
				</td>
				<td style="padding-left: 10px;" id="newCategoryNameContainer">
					<div class="itemLabel"><s:text name="advisors.manageRule.label.newCategory" /></div>
					<div class="itemContents">
						<input type="text" id="newCategoryName" name="categoryName" disabled="disabled" value="<s:property value="categoryName" />"/>
					</div>
				</td>
				<script language="JavaScript" type="text/javascript">
				/* <![CDATA[ */
					function showNewAdvisor() {
						var categoryName = returnObject('categoryName');
						if(categoryName.value == '-1') {
							returnObject('newCategoryNameContainer').style.display = tableCellDisplay;
							returnObject('newCategoryName').disabled = false;
						} else {
							returnObject('newCategoryNameContainer').style.display = 'none';
							returnObject('newCategoryName').disabled = true;
						}
					}
					showNewAdvisor();
				/* ]]> */
				</script>
				<td style="padding-left: 10px;">
					<div class="itemLabel"><s:text name="rule.label.version" /></div>
					<div class="itemContents">
						<input type="text" name="version" size="20" value="<s:property value="version" />"<s:if test="certified"> disabled="disabled"</s:if> />
					</div>
				</td>
			</tr>
		</table>
	
		<div class="itemLabel"><s:text name="rule.label.expression" /></div>
		<div class="itemContents">
			<textarea name="expression" rows="5" cols="120"<s:if test="certified"> disabled="disabled"</s:if>><s:property value="expression" /></textarea>
		</div>
		
		<div class="itemLabel"><s:text name="rule.label.thresholds" /></div>
		<div class="itemContents">
			<table>
				<tr>
					<td><s:text name="rule.label.criticalAlert" /></td>
					<td><input type="text" size="5" name="criticalThreshold" value="<s:property value="criticalThreshold" />" /></td>
				</tr>
				<tr>
					<td><s:text name="rule.label.warningAlert" /></td>
					<td><input type="text" size="5" name="warningThreshold" value="<s:property value="warningThreshold" />" /></td>
				</tr>
				<tr>
					<td><s:text name="rule.label.infoAlert" /></td>
					<td><input type="text" size="5" name="infoThreshold" value="<s:property value="infoThreshold" />" /></td>
				</tr>
			</table>
		</div>
		<div class="itemLabel"><s:text name="advisors.manageRule.label.variableAssignment" /></div>
		<div class="itemContents">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td style="border: 1px solid #aaaaaa; background: #eaeaea; padding: 5px;">
						<table id="testTable">
							<tbody>
								<tr>
									<td><s:text name="advisors.manageRule.label.variable" /></td>
									<td><s:text name="advisors.manageRule.label.dataItem" /></td>
									<td><s:text name="advisors.manageRule.label.instance" /></td>
								</tr>
								<s:iterator value="collectInfoList" status="collectStatus">
									<tr>
										<td><input type="text" name="variableName[<s:property value="#collectStatus.index" />]" value="<s:property value="variableName" />" <s:if test="certified"> disabled="disabled"</s:if>/></td>
										<td>
											<select name="itemId[<s:property value="#collectStatus.index" />]"<s:if test="certified"> disabled="disabled"</s:if>>
												<s:iterator value="itemOptions"><option value="<s:property value="value" />"<s:if test="value == itemId"> selected="selected"</s:if>><s:property value="label" /></option></s:iterator>
											</select>
										</td>
										<td><input type="text" name="instance[<s:property value="#collectStatus.index" />]" value="<s:property value="instance" />" <s:if test="certified"> disabled="disabled"</s:if>/></td>
										<td><input type="button" name="delete" value="<s:text name="generic.button.delete" />" onclick="deleteCollectRow(this)"<s:if test="certified"> disabled="disabled"</s:if>/></td>
									</tr>
								</s:iterator>
							</tbody>
						</table><br/>
						<div class="itemContents"><input type="button" name="addRow" value="<s:text name="advisors.manageRule.button.addRow" />" onclick="addCollectRow()"<s:if test="certified"> disabled="disabled"</s:if>/></div>
					</td>
				</tr>
			</table>
			<script type="text/javascript" language="javascript">
			/* <![CDATA[ */
				//functionality to clone the last row of the variables and update the input names accordingly
				function addCollectRow() {
					var sampleTable = returnObject('testTable');
					var numRows = sampleTable.rows.length - 1;
					var sampleRow = sampleTable.rows[numRows];
					var tempNode = sampleRow.cloneNode(true);
					//nasty code below - quick and dirty renaming and resetting of inputs
					var textInputs = tempNode.getElementsByTagName('input');
					textInputs[0].value = '';
					textInputs[0].name = 'variableName['+ numRows +']';
					textInputs[1].value = '';
					textInputs[1].name = 'instance['+ numRows +']';
					var itemsSelect = tempNode.getElementsByTagName('select')[0];
					itemsSelect.selectedIndex = 0;
					itemsSelect.name = 'itemId['+ numRows +']';
					sampleTable.tBodies[0].appendChild(tempNode);
				}
				
				//remove a given row
				function deleteCollectRow(which) {
					var parentRow = getAncestorOfType(which, 'tr');
					var sampleTable = returnObject('testTable');
					if(sampleTable.rows.length > 2) {
						sampleTable.tBodies[0].removeChild(parentRow);
					} else {
						alert("<s:text name="advisors.manageRule.error.tooFewRows" />");
					}
				}
			/* ]]> */
			</script>
		</div>
	
		<div class="itemLabel"><s:text name="rule.label.defaultFrequency" /></div>
		<div class="itemContents">
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="rule.label.hours" /></span><br/>
				<select name="defaultFrequencyHours">
					<s:iterator value="hourOptions">
						<option value="<s:property value="value" />"<s:if test="defaultFrequencyHours == value"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>
			
			<div class="inputLabelWrap">
				<span class="inputLabelTitle"><s:text name="rule.label.minutes" /></span><br/>
				<select name="defaultFrequencyMinutes">
					<s:iterator value="minuteOptions">
						<option value="<s:property value="value" />"<s:if test="defaultFrequencyMinutes == value"> selected="selected"</s:if>><s:property value="label" /></option>
					</s:iterator>
				</select>
			</div>
		</div>
	</div>
	
	<div class="titleBar"><s:text name="advisors.manageRule.sectionTitle.ruleInfo" /></div>
	<div class="basicBox">
		<div class="itemLabel"><s:text name="rule.label.description" /></div>
		<div class="itemContents">
			<textarea name="description" rows="8" cols="100"<s:if test="certified"> disabled="disabled"</s:if>><s:property value="description" /></textarea>
		</div>
		
		<div class="itemLabel"><s:text name="rule.label.advice" /></div>
		<div class="itemContents">
			<textarea name="advice" rows="8" cols="100"<s:if test="certified"> disabled="disabled"</s:if>><s:property value="advice" /></textarea>
		</div>
	
		<div class="itemLabel"><s:text name="rule.label.action" /></div>
		<div class="itemContents">
			<textarea name="command" rows="8" cols="100"<s:if test="certified"> disabled="disabled"</s:if>><s:property value="command" /></textarea>
		</div>
		
		<div class="itemLabel"><s:text name="rule.label.info" /></div>
		<div class="itemContents">
			<textarea name="info" rows="8" cols="100"<s:if test="certified"> disabled="disabled"</s:if>><s:property value="info" /></textarea>
		</div>
		
		<input type="submit" name="save" value="<s:text name="generic.button.save" />" />
		<input type="submit" name="cancel" value="<s:text name="generic.button.cancel" />" />
	</div>
	<s:if test="ruleUuid != null">
		<input type="hidden" name="ruleUuid" value="<s:property value="ruleUuid" />" />
	</s:if>
	<input type="hidden" name="sourceAction" value="<s:property value="sourceAction" />" />
	<input type="hidden" name="sourceActionUrl" value="<s:property value="sourceActionUrl" />" />
</s:form>

<s:if test="sourceAction == 'create' || sourceAction == 'copy'">
<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */
	returnObject('name').focus();
/* ]]> */
</script>
</s:if>