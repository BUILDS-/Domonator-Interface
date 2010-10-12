<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>
<s:form action="DoAuth">
	<table cellpadding="5" cellspacing="0" align="center">
		<tr>
			<td align="right"><s:text name="auth.usernameLabel"/></td>
			<td><s:textfield name="username" /></td>
		</tr>
		<tr>
			<td align="right"><s:text name="auth.passwordLabel"/></td>
			<td><s:password name="password" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" name="submit" value="<s:text name="auth.submitLabel"/>" /></td>
		</tr>
	</table>
</s:form>