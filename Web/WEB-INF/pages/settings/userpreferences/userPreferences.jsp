<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td valign="top">
			<div class="titleBar"><s:text name="settings.userpreferences.title" /></div>
			<div class="basicBox">
				<s:form action="SaveUserPreferences">
					<div class="itemLabel"><s:text name="generic.label.userName" /></div>
					<div class="itemContents"><input type="text" name="userName" value="<s:property value="userName" />" /></div>
		
					<div class="itemLabel"><s:text name="generic.label.role" /></div>
					<s:if test="admin">
						<div class="itemContents">
							<select name="userRole">
								<s:iterator value="rolesOptions">
									<option value="<s:property value="value" />" <s:if test="selected"> selected="selected"</s:if>><s:property	value="label" /></option>
								</s:iterator>
							</select>
						</div>
					</s:if>
					<s:else>
						<div class="itemContents"><s:property value="userRole" /><input type="hidden" name="userRole" value="<s:property value="userRole" />" /></div>
					</s:else>
		
					<div class="itemLabel"><s:text name="generic.label.password" /> <span class="itemLabelModifier">(<s:text name="settings.userpreferences.label.leaveEmptyPassword" />)</span></div>
					<div class="itemContents"><input type="password" name="passwordUpdate" value="<s:property value="passwordUpdate" />" /></div>
		
					<div class="itemLabel"><s:text name="generic.label.passwordConfirm" /></div>
					<div class="itemContents"><input type="password" name="passwordUpdateConfirm" value="<s:property value="passwordUpdateConfirm" />" /></div>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td style="padding-right: 10px;" valign="top">
								<div class="itemLabel"><s:text name="generic.label.timezone" /></div>
								<div class="itemContents">
									<select name="timeZone">
										<s:iterator value="timeZoneOptions">
											<option value="<s:property value="value" />" <s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
							</td>
							<td valign="top">
								<div class="itemLabel"><s:text name="generic.label.locale" /></div>
								<div class="itemContents">
									<select name="localeName">
										<s:iterator value="localeOptions">
											<option value="<s:property value="value" />" <s:if test="selected"> selected="selected"</s:if>><s:property value="label" /></option>
										</s:iterator>
									</select>
								</div>
							</td>
						</tr>
					</table>
					<input type="submit" name="save" value="<s:text name="settings.userperferences.savePreferences" />" />
				</s:form>
			</div>
		</td>
	</tr>
</table>