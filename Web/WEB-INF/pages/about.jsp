<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="titleBar"><s:text name="about.sectionTitle" /></div>
<div class="basicBox">
	<p><s:text name="about.text.aboutInfo" /></p>
	<blockquote>
		<table>
			<tr>
				<td style="text-align: right; padding-right: 5px;"><s:text name="about.text.usaNumber" /></td>
				<td><s:text name="about.label.usaNumber" /></td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 5px;"><s:text name="about.text.worldNumber" /></td>
				<td><s:text name="about.label.worldNumber" /></td>
			</tr>
		</table>
	</blockquote>
	<p><s:text name="about.text.copyright"><s:param><s:date name="now" format="yyyy" /></s:param></s:text></p>
</div>