<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<tiles:importAttribute name="titleKey" />

<%! private static final long serialVersionUID = 1L; %>
<%! @SuppressWarnings("unused") %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="<s:url value="/web/resources/css/default.css" />?B=<s:property value="version" />" />
		<link rel="stylesheet" type="text/css" href="<s:url value="/web/resources/css/tree.css" />?B=<s:property value="version" />" />
		<link rel="shortcut icon" href="<s:url value="/web/favicon.ico" />" />
		<script type="text/javascript" language="javascript">
		/* <![CDATA[ */
			//for use in javascript files that reference images
			var GLOBAL_baseImagePath = '<s:url value="/web/resources/images/" />';
			var GLOBAL_baseResourcePath = '<s:url value="/web/resources/" />';
		/* ]]> */
		</script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/default.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/tree.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/datePicker.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/popup.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/rowDisplayToggle.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/misc.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript" src="<s:url value="/web/resources/js/notice.js" />?B=<s:property value="version" />"></script>
		<script type="text/javascript" language="javascript">
		/* <![CDATA[ */
			var noticeFader = new noticeFade();
			noticeFader.setObject('fader');
			noticeFader.setMessageContainer('noticeMessages');
			noticeFader.registerClose('noticeClose');
			<s:if test="hasNotices">
				<s:iterator value="notices">
					noticeFader.addMessage("<s:property />");
				</s:iterator>
			</s:if>
			<s:if test="productInfo && productInfo.showExpiringNotice">
				noticeFader.addMessage("<s:text name="defaultLayout.notice.expiring"><s:param value="productInfo.accountStatus.daysRemaining" /></s:text>");
			</s:if>
			noticeFader.init();
		/* ]]> */
		</script>
		
		<title><s:if test="#attr['titleKey'] != ''"><s:text name="%{#attr['titleKey']}"/> : </s:if><s:text name="application.title"/></title>
	</head>
	<body>
		<div id="bodyTop" style="padding-top: 10px;">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr class="secondaryHeaderBG">
					<td><img src="<s:url value="/web/resources/images/secondaryTL.gif" />" width="8" height="7" alt=""/></td>
					<td class="right"><img src="<s:url value="/web/resources/images/secondaryTR.gif" />" width="8" height="7" alt=""/></td>
				</tr>
			</table>
		</div>
		<div id="bodyContentsWrapper">
			<div id="bodyContents">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<div id="bodyBottom">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr class="secondaryFooterBG">
					<td><img src="<s:url value="/web/resources/images/secondaryBL.gif" />" width="8" height="7" alt=""/></td>
					<td class="right"><img src="<s:url value="/web/resources/images/secondaryBR.gif" />" width="8" height="7" alt=""/></td>
				</tr>
			</table>
		</div>

		<table id="fader">
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="<s:url value="/web/resources/images/secondaryTL.png" />" width="8" height="7" alt="" /></td>
							<td class="secondaryHeaderSpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
							<td><img src="<s:url value="/web/resources/images/secondaryTR.png" />" width="8" height="7" alt="" /></td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="noticeBody">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td><s:text name="defaultLayout.popup.fader.label.notice" /></td>
										<td class="right"><img src="<s:url value="/web/resources/images/deleteIcon11.gif" />" id="noticeClose" width="11" height="11" alt="<s:text name="defaultLayout.popup.fader.alt.close" />" style="cursor: pointer;" /></td>
									</tr>
								</table>
								<ul id="noticeMessages">
								</ul>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="<s:url value="/web/resources/images/secondaryBL.png" />" width="8" height="7" alt="" /></td>
							<td class="secondaryFooterSpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
							<td><img src="<s:url value="/web/resources/images/secondaryBR.png" />" width="8" height="7" alt="" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>	
	</body>
</html>