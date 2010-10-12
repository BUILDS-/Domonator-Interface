<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="topButtonBar">
			<input type="button" name="submit" value="<s:text name="settings.users.button.createUser" />" onclick="createUserPopup.show({}, event)" />
		</td>
	</tr>
	<tr>
		<td class="titleBar">
			<div class="title"><s:text name="settings.users.sectionTitle" /></div>
		</td>
	</tr>
	<tr>
		<td class="listBox">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr class="titleRow">
					<td><s:text name="settings.users.label.userName" /></td>
					<td><s:text name="settings.users.label.role" /></td>
					<td class="linkColumn">&nbsp;</td>
				</tr>
				<s:if test="users.size == 0" >
					<tr class="listRow">
						<td colspan="5" class="noRecordsFound"><s:text name="settings.users.text.noUsersFound" /></td>
					</tr>
				</s:if>
				<s:iterator value="users" status="iteratorStatus">
					<tr class="listRow<s:if test="#iteratorStatus.odd">Alt</s:if>">
						<td><s:property value="userName" /></td>
						<td><s:property value="userRole" /></td>
						<td>
							<span class="listLink"><a href="javascript://" onclick="editUserPopup.show({'userId' : '<s:property value="userId" />'}, event)"><img src="<s:url value="/web/resources/images/editIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="settings.users.link.editUser" />" /> <s:text name="settings.users.link.editUser" /></a></span>
							<s:if test="(agent && showDeleteAgent) || (Admin && showDeleteAdmin) || (!admin && !agent)">
								<span class="listLink"><a href="javascript://" onclick="deleteUserPopup.show({'userId' : '<s:property value="userId" />'}, event)"><img src="<s:url value="/web/resources/images/closeIcon11.png" />" border="0" width="11" height="11" alt="<s:text name="generic.link.delete" />" /> <s:text name="generic.link.delete" /></a></span>
							</s:if>
						</td>
					</tr>
				</s:iterator>	
			</table>
		</td>
	</tr>
</table>

<form action="#" onsubmit="return false">
<div id="createUserPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="createUserTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.users.tab.createUser" /></td>
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
				<div id="createUserBody" class="popupBody">	
					<div class="itemLabel"><s:text name="settings.users.label.enterNewUserName" /></div>
					<div class="itemContents"><input type="text" name="userName" id="userName" /></div>
					<div class="itemLabel"><s:text name="settings.users.label.role" /></div>
					<div class="itemContents">
						<select name="role">
							<s:iterator value="rolesOptions">
								<option value="<s:property value="value" />"><s:property value="label" /></option>
							</s:iterator>
						</select>
					</div>
					<div class="itemLabel"><s:text name="settings.users.label.password" /></div>
					<div class="itemContents"><input type="password" name="password" /></div>
					
					<div class="itemLabel"><s:text name="settings.users.label.passwordConfirm" /></div>
					<div class="itemContents"><input type="password" name="passwordConfirm" /></div>
					<div align="right">
						<input id="createUserSubmit" name="submit" type="button" value="<s:text name="generic.button.create" />" />
						<input id="createUserHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="editUserPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="editUserTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.users.tab.editUser" /></td>
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
				<div id="editUserBody" class="popupBody">	
					<div class="itemLabel"><s:text name="settings.users.label.userName" /></div>
					<div class="itemContents"><input type="text" name="userName" id="userName" /></div>
					<div class="itemLabel"><s:text name="settings.users.label.role" /></div>
					<div class="itemContents">
						<select name="role">
							<s:iterator value="rolesOptions">
								<option value="<s:property value="value" />"><s:property value="label" /></option>
							</s:iterator>
						</select>
					</div>
					<div class="itemLabel"><s:text name="settings.users.label.password" /> <span class="itemLabelModifier">(<s:text name="settings.users.label.leaveEmptyPassword" />)</span></div>
					<div class="itemContents"><input type="password" name="password" /></div>
					
					<div class="itemLabel"><s:text name="settings.users.label.passwordConfirm" /></div>
					<div class="itemContents"><input type="password" name="passwordConfirm" /></div>
					<div align="right">
						<input id="editUserSubmit" name="submit" type="button" value="<s:text name="settings.users.button.saveChanges" />" />
						<input id="editUserHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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
<div id="deleteUserPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="deleteUserTab">
											<tr>
												<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
												<td class="tabBody"><s:text name="settings.users.button.deleteUser" /></td>
												<td class="tabRight"><img src="<s:url value="/web/resource/images/spacer.gif" />" width="8" height="7" alt="" /></td>
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
				<div id="deleteUserBody" class="popupBody">		
					<div class="itemLabel"><s:text name="settings.users.text.confirmUserDelete" /></div>
					<div class="itemContents"><span id="editUserName" >Error: User name not set</span></div>
					
					<div align="right">
						<input id="deleteUserSubmit" name="submit" type="button" value="<s:text name="generic.button.delete" />" />
						<input id="deleteUserHide" name="hide" type="button" value="<s:text name="generic.button.cancel" />" />
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

<script type="text/javascript" language="javascript">
/* <![CDATA[ */

	var createUserPopup = new popup();
	//bind to html container
	createUserPopup.bindToObject('createUserPopup');
	//register actionable buttons
	createUserPopup.registerHide('createUserHide');
	createUserPopup.registerSubmit('createUserSubmit');
	//set the input item to focus on after popup load
	createUserPopup.setFocus('newUserName');
	//set ajax calls for update and submission
	createUserPopup.setSubmitAction("<s:url action="CreateUser" />");
	//assign a function to handle the page display after a successful submit
	createUserPopup.setSubmitHandler(reloadPage);

	//initialize popup
	createUserPopup.init();

	
	var editUserPopup = new popup();
	//bind to html container
	editUserPopup.bindToObject('editUserPopup');
	//register actionable buttons
	editUserPopup.registerHide('editUserHide');
	editUserPopup.registerSubmit('editUserSubmit');
	//set the input item to focus on after popup load
	editUserPopup.setFocus('userName');
	//set ajax calls for update and submission
	editUserPopup.setUpdateAction("<s:url action="GetUserDetails" />");
	editUserPopup.setSubmitAction("<s:url action="EditUser" />");
	//assign a function to handle the page display after a successful submit
	editUserPopup.setSubmitHandler(reloadPage);
	editUserPopup.bindData("name", "userName");
	editUserPopup.bindData("role", "role");
	
	//initialize popup
	editUserPopup.init();

	
	var deleteUserPopup = new popup();
	//bind to html container
	deleteUserPopup.bindToObject('deleteUserPopup');
	//register actionable buttons
	deleteUserPopup.registerHide('deleteUserHide');
	deleteUserPopup.registerSubmit('deleteUserSubmit');
	//set the input item to focus on after popup load
	deleteUserPopup.setFocus('deleteUserSubmit');
	//set ajax call for update and submission
	deleteUserPopup.setUpdateAction("<s:url action="GetUserDetails" />");
	deleteUserPopup.setSubmitAction("<s:url action="DeleteUser" />");
	//assign a function to handle the page display after a successful submit
	deleteUserPopup.setSubmitHandler(reloadPage);
	//bind the data to the display
	deleteUserPopup.bindData("name", "editUserName");
	//initialize popup
	deleteUserPopup.init();
/* ]]> */
</script>
