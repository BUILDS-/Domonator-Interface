<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<s:form action="CreateRule">
				<input type="submit" name="submit" value="<s:text name="advisors.manageRules.button.createRule" />" />
				<input type="button" value="<s:text name="advisors.manageRules.button.createCategory" />" onclick="createCategoryPopup.show(null, event)" />
			</s:form>
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<s:text name="advisors.manageRules.sectionTitle.advisors" />
		</td>
	</tr>
	<tr>
		<td class="listBoxCollapsible">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
				<tr class="titleRow">
					<td><s:text name="advisors.manageRules.columnTitle.advisors" /></td>
					<td><s:text name="advisors.manageRules.columnTitle.defaultFrequency" /></td>
					<td class="linkColumn">&nbsp;</td>
				</tr>
				<s:if test="%{categories.size < 1}">
					<tr class="listRowCategoryL1">
						<td colspan="3" class="noRecordsFound">
							<s:text name="advisors.manageRules.noRecords"><s:param><s:url action="CheckForUpdates" /></s:param><s:param><s:url action="CreateRule" /></s:param></s:text>
						</td>
					</tr>
				</s:if>
				<s:iterator value="categories">
					<s:set name="categoryId" value="category.id"/>
					<tr class="listRowCategoryL1" id="category<s:property value="#categoryId" />">
						<td class="firstCellL1"><img src="<s:url value="/web/resources/images/expandPlus.gif" />" class="expandTransformer" width="11" height="11" alt="" />
							<s:property value="category.name" /> (<s:property value="rules.size" />)
						</td>
						<td>&nbsp;</td>
						<td>
							<s:if test="!category.readOnly">
								<s:if test="rules.size == 0">
									<span class="listLink"><a href="javascript://" onclick="deleteCategoryPopup.show({'categoryId' : '<s:property value="#categoryId" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" width="11" height="11" alt="<s:text name="advisors.manageRules.link.deleteCategory" />" /> <s:text name="advisors.manageRules.link.deleteCategory" /></a></span>
								</s:if>
								<span class="listLink"><a href="javascript://" onclick="renameCategoryPopup.show({'categoryId' : '<s:property value="#categoryId" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" width="11" height="11" alt="<s:text name="advisors.manageRules.link.renameCategory" />" /> <s:text name="advisors.manageRules.link.renameCategory" /></a></span>
							</s:if>
						</td>
					</tr>
					<s:iterator value="rules" status="ruleStatus">
						<s:set name="ruleId" value="rule.uuid"/>
						<tr class="listRow<s:if test="#ruleStatus.odd == true">Alt</s:if>" id="category<s:property value="#categoryId" />.-.rule<s:property value="#ruleId" />">
							<td class="firstCellL2">
								<a href="javascript://" onclick="ruleInfoPopup.show({'ruleUuid' : '<s:property value="#ruleId" />'}, event)"><s:property value="rule.name" /></a>
							</td>
							<td><s:property value="stripSeconds(rule.defaultFrequency)" /></td>
							<td>
								<span class="listLink"><a href="<s:url action="CopyRule"><s:param name="ruleUuid" value="#ruleId" /></s:url>"><img src="<s:url value="/web/resources/images/copyIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="advisors.manageRules.link.copy" />" /> <s:text name="advisors.manageRules.link.copyRule" /></a></span>
								<span class="listLink"><a href="<s:url action="EditRule"><s:param name="ruleUuid" value="#ruleId" /></s:url>"><img src="<s:url value="/web/resources/images/editIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="advisors.manageRules.link.edit" />"/> <s:text name="advisors.manageRules.link.editRule" /></a></span>
								<s:if test="!rule.certified">
									<span class="listLink"><a href="javascript://" onclick="deleteRulePopup.show({'ruleUuid' : '<s:property value="#ruleId" />'}, event)"><img src="<s:url value="/web/resources/images/deleteIcon11.png" />" width="11" height="11" alt="<s:text name="advisors.manageRules.link.delete" />" /> <s:text name="advisors.manageRules.link.deleteRule" /></a></span>
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</s:iterator>
				</tbody>
			</table>
		</td>
	</tr>
</table>

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

<form action="#" onsubmit="return false">
<div id="deleteRulePopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="deleteRuleTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.manageRules.popup.deleteRule.tab.delete" /></td>
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
				<div id="deleteRuleBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="advisors.manageRules.popup.deleteRule.text.confirm" /></div>
					
					<div align="right">
						<input id="deleteRuleSubmit" type="submit" name="submit" value="<s:text name="generic.button.delete" />" />
						<input id="deleteRuleHide" type="submit" name="hide" value="<s:text name="generic.button.cancel" />" />
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
<div id="createCategoryPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="createCategoryTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.manageRules.popup.createCategory.tab.create" /></td>
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
				<div id="createCategoryBody" class="popupBody">		
					<div class="itemLabel"><s:text name="advisors.manageRules.popup.createCategory.label.advisorName" /></div>
					<div class="itemContents"><input type="text" size="50" name="name" /></div>
					<div align="right">
						<input id="createCategorySubmit" name="submit" type="button" value="<s:text name="advisors.manageRules.popup.createCategory.button.add" />" />
						<input id="createCategoryHide" name="hide" type="button" value="<s:text name="advisors.manageRules.popup.createCategory.button.cancel" />" />
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
<div id="deleteCategoryPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="deleteCategoryTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.manageRules.popup.deleteCategory.tab.delete" /></td>
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
				<div id="deleteCategoryBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="advisors.manageRules.popup.deleteCategory.text.confirm" /></div>
					
					<div align="right">
						<input id="deleteCategorySubmit" name="submit" type="button" value="<s:text name="advisors.manageRules.popup.deleteCategory.button.delete" />" />
						<input id="deleteCategoryHide" name="hide" type="button" value="<s:text name="advisors.manageRules.popup.deleteCategory.button.cancel" />" />
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
<div id="renameCategoryPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="renameCategoryTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="advisors.manageRules.popup.renameCategory.tab.rename" /></td>
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
				<div id="renameCategoryBody" class="popupBody">		
					<div class="itemLabelStandalone"><s:text name="advisors.manageRules.popup.renameCategory.text.confirm" /></div>
					
					<div class="itemLabel"><s:text name="advisors.manageRules.popup.renameCategory.label.name" /></div>
					<div class="itemContents"><input type="text" size="50" name="name" /></div>
					
					<div align="right">
						<input id="renameCategorySubmit" name="submit" type="button" value="<s:text name="advisors.manageRules.popup.renameCategory.button.save" />" />
						<input id="renameCategoryHide" name="hide" type="button" value="<s:text name="advisors.manageRules.popup.renameCategory.button.cancel" />" />
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

<script language="javascript" type="text/javascript">
/* <![CDATA[ */
	//POPUP DEFINITION AND CUSTOM FUNCTIONS FOR RULE INFORMATION POPUP DISPLAY
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

	var deleteRulePopup = new popup();
	//bind to html container
	deleteRulePopup.bindToObject('deleteRulePopup');
	//register actionable buttons
	deleteRulePopup.registerHide('deleteRuleHide');
	deleteRulePopup.registerSubmit('deleteRuleSubmit');
	//set ajax call for update
	deleteRulePopup.setUpdateAction("<s:url action="DeleteRuleInfo" />");
	//set ajax call for submission
	deleteRulePopup.setSubmitAction("<s:url action="DeleteRule" />");
	//assign a function to handle the page display after a successful submit
	deleteRulePopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteRulePopup.bindData("rule.name", "deleteRuleName");
	//initialize popup
	deleteRulePopup.init();

	var createCategoryPopup = new popup();
	//bind to html container
	createCategoryPopup.bindToObject('createCategoryPopup');
	//register actionable buttons
	createCategoryPopup.registerHide('createCategoryHide');
	createCategoryPopup.registerSubmit('createCategorySubmit');
	//set the input item to focus on after popup load
	createCategoryPopup.setFocus('name');
	//set ajax call for submission
	createCategoryPopup.setSubmitAction("<s:url action="CreateCategory" />");
	//assign a function to handle the page display after a successful submit
	createCategoryPopup.setSubmitHandler(reloadPage);
	//initialize popup
	createCategoryPopup.init();
	
	var deleteCategoryPopup = new popup();
	//bind to html container
	deleteCategoryPopup.bindToObject('deleteCategoryPopup');
	//register actionable buttons
	deleteCategoryPopup.registerHide('deleteCategoryHide');
	deleteCategoryPopup.registerSubmit('deleteCategorySubmit');
	//set the input item to focus on after popup load
	deleteCategoryPopup.setFocus('deleteCategorySubmit');
	//set ajax call for update
	deleteCategoryPopup.setUpdateAction("<s:url action="DeleteCategoryInfo" />");
	//set ajax call for submission
	deleteCategoryPopup.setSubmitAction("<s:url action="DeleteCategory" />");
	//assign a function to handle the page display after a successful submit
	deleteCategoryPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteCategoryPopup.bindData("category.name", "deleteCategoryName");
	//initialize popup
	deleteCategoryPopup.init();
	
	var renameCategoryPopup = new popup();
	//bind to html container
	renameCategoryPopup.bindToObject('renameCategoryPopup');
	//register actionable buttons
	renameCategoryPopup.registerHide('renameCategoryHide');
	renameCategoryPopup.registerSubmit('renameCategorySubmit');
	//set the input item to focus on after popup load
	renameCategoryPopup.setFocus('renameCategorySubmit');
	//set ajax call for update
	renameCategoryPopup.setUpdateAction("<s:url action="RenameCategoryInfo" />");
	//set ajax call for submission
	renameCategoryPopup.setSubmitAction("<s:url action="RenameCategory" />");
	//assign a function to handle the page display after a successful submit
	renameCategoryPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	renameCategoryPopup.bindData("category.name", "renameCategoryName");
	renameCategoryPopup.bindData("category.name", "name");
	//initialize popup
	renameCategoryPopup.init();
/* ]]> */
</script>