<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<tiles:importAttribute name="titleKey" />
<tiles:importAttribute name="autoRefresh" />
<tiles:importAttribute name="section" />
<tiles:importAttribute name="subSection" />
<tiles:importAttribute name="usesTree" />

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
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>
					<div id="headerWrapper">
						<div id="header">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td><img src="<s:url value="/web/resources/images/primaryTL.gif" />" width="5" height="5" alt="" /></td>
									<td class="right"><img src="<s:url value="/web/resources/images/primaryTR.gif" />" width="5" height="5" alt="" /></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td id="logo"><a target="_blank" href="http://network.mysql.com"><img src="<s:url value="/web/resources/images/logo.jpg" />" width="75" height="29" alt="<s:text name="defaultLayout.alt.logo" />" class="decoration"/></a></td>
									<td id="productName"><img src="<s:url value="/web/resources/images/productName.jpg" />" width="75" height="26" alt="<s:text name="defaultLayout.alt.productName" />" class="decoration" /></td>
									<td width="100%" id="headerLinks">
										<s:if test="authenticated">
											<table cellpadding="0" cellspacing="0" align="right">
												<tr>
													<s:if test="%{#attr['autoRefresh'] != 'false'}">
													<td>
														<s:text name="refresh.label.refresh" />
														<select id="doRefresh">
															<s:iterator value="refreshOptions">
																<option value="<s:property value="value" />"><s:property value="label" /></option>
															</s:iterator>
														</select>
														<script type="text/javascript" language="javascript">
														/* <![CDATA[ */
															var refreshInstance = new refreshHandler();
															refreshInstance.bindToSelectbox('doRefresh');
															refreshInstance.init();
														/* ]]> */
														</script>
														&nbsp;&nbsp;
													</td>
													</s:if>
													<td>
														<a href="<s:url action="Help" />" target="_blank"><img src="<s:url value="/web/resources/images/helpIcon.png" />" width="12" height="12" alt="" border="0" /> <s:text name="defaultLayout.link.help" /></a>
														&nbsp;
														<a href="<s:url action="Logout" />"><img src="<s:url value="/web/resources/images/logOutIcon.png" />" width="12" height="12" alt="" border="0" /> <s:text name="defaultLayout.link.logout" /></a>
													</td>
												</tr>
											</table>
										</s:if>
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td><img src="<s:url value="/web/resources/images/primaryBL.gif" />" width="5" height="5" alt="" /></td>
									<td class="right"><img src="<s:url value="/web/resources/images/primaryBR.gif" />" width="5" height="5" alt="" /></td>
								</tr>
							</table>
						</div>
					</div>
					<noscript>
						<div id="javascriptEnabledBar">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="secondaryHeaderBG">
									<td><img src="<s:url value="/web/resources/images/secondaryTL.gif" />" width="8" height="7" alt="" /></td>
									<td class="right"><img src="<s:url value="/web/resources/images/secondaryTR.gif" />" width="8" height="7" alt="" /></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="noticeBody">
										<span class="error" style="font-weight: bold;"><s:text name="defaultLayout.text.javascriptNeeded" /></span>
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="secondaryFooterBG">
									<td><img src="<s:url value="/web/resources/images/secondaryBL.gif" />" width="8" height="7" alt="" /></td>
									<td class="right"><img src="<s:url value="/web/resources/images/secondaryBR.gif" />" width="8" height="7" alt="" /></td>
								</tr>
							</table>
						</div>
					</noscript>
					<s:if test="hasErrors">
					<div id="noticeBar">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr class="secondaryHeaderBG">
								<td><img src="<s:url value="/web/resources/images/secondaryTL.gif" />" width="8" height="7" alt="" /></td>
								<td class="right"><img src="<s:url value="/web/resources/images/secondaryTR.gif" />" width="8" height="7" alt="" /></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="noticeBody">
									<div class="itemLabelStandalone"><s:text name="defaultLayout.title.error" /></div>
									<ul>
										<s:iterator value="actionErrors">
											<li><s:property /></li>
										</s:iterator>
									</ul>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr class="secondaryFooterBG">
								<td><img src="<s:url value="/web/resources/images/secondaryBL.gif" />" width="8" height="7" alt="" /></td>
								<td class="right"><img src="<s:url value="/web/resources/images/secondaryBR.gif" />" width="8" height="7" alt="" /></td>
							</tr>
						</table>
					</div>
					</s:if>

					<div id="bodyWrapper">
						<table cellpadding="0" cellspacing="0" width="100%">
							<s:if test="authenticated">
							<tr>
								<s:if test="#attr['usesTree'] == 'true'">
									<td>
										<table cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td class="treeTab">
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
															<td class="tabBody"><img src="<s:url value="/web/resources/images/serverIcon11.png" />" width="9" height="11" alt="" /> <s:text name="defaultLayout.tab.servers" /></td>
															<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														</tr>
													</table>
												</td>
												<td class="treeTabSpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></td>
											</tr>
										</table>
									</td>
									<td class="treeToBodySpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="10" height="1" alt="" /></td>
								</s:if>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%" id="tabBar">
										<tr>
											<td class="tab<s:if test="#attr['section'] == 'dashboard'">On</s:if>">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gi" />f" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<s:text name="defaultLayout.alt.dashboard" />" href="<s:url action="Monitor" />"><img src="<s:url value="/web/resources/images/homeIcon11.png" />" width="11" height="11" alt="<s:text name="defaultLayout.alt.dashboard" />" /> <s:text name="defaultLayout.tab.dashboard" /></a></td>
														<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<td class="tab<s:if test="#attr['section'] == 'advisors'">On</s:if>">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<s:text name="defaultLayout.alt.advisors" />" href="<s:url action="CurrentSchedule" />"><img src="<s:url value="/web/resources/images/securityIcon11.png" />" width="9" height="11" alt="<s:text name="defaultLayout.alt.advisors" />" /> <s:text name="defaultLayout.tab.advisors" /></a></td>
														<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<td class="tab<s:if test="#attr['section'] == 'events'">On</s:if>">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<s:text name="defaultLayout.alt.events" />" href="<s:url action="Events" />"><img src="<s:url value="/web/resources/images/alarmIcon11.png" />" width="11" height="11" alt="<s:text name="defaultLayout.alt.events" />"/> <s:text name="defaultLayout.tab.events" /></a></td>
														<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<td class="tab<s:if test="#attr['section'] == 'graphs'">On</s:if>">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<s:text name="defaultLayout.alt.graphs" />" href="<s:url action="Graphs" />"><img src="<s:url value="/web/resources/images/chartIcon11.png" />" width="11" height="11" alt="<s:text name="defaultLayout.alt.graphs" />"/> <s:text name="defaultLayout.tab.graphs" /></a></td>
														<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<s:if test="productInfo.replicationAllowed">
												<td class="tab<s:if test="#attr['section'] == 'replication'">On</s:if>">
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
															<td class="tabBody"><a title="<s:text name="defaultLayout.alt.replication" />" href="<s:url action="Replication" />"><img src="<s:url value="/web/resources/images/relationshipIcon11.png" />" width="11" height="11" alt="<s:text name="defaultLayout.alt.replication" />"/> <s:text name="defaultLayout.tab.replication" /></a></td>
															<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														</tr>
													</table>
												</td>
											</s:if>
											<td class="tab<s:if test="#attr['section']== 'settings'">On</s:if>" id="settingsTab">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<s:text name="defaultLayout.alt.settings" />" href="<s:url action="GlobalSettings" />"><img src="<s:url value="/web/resources/images/confgIcon11.png" />" width="11" height="11" alt="<s:text name="defaultLayout.alt.settings" />"/> <s:text name="defaultLayout.tab.settings" /></a></td>
														<td class="tabRight"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							</s:if>
							<s:else>
								<tr>
									<td>
										<div id="bodyTop">
											<table cellpadding="0" cellspacing="0" width="100%">
												<tr class="secondaryHeaderBG">
													<td><img src="<s:url value="/web/resources/images/secondaryTL.gif" />" width="8" height="7" alt=""/></td>
													<td class="right"><img src="<s:url value="/web/resources/images/secondaryTR.gif" />" width="8" height="7" alt=""/></td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</s:else>
							<tr>
								<s:if test="#attr['usesTree'] == 'true'">
									<td id="treeBody" class="secondaryBody" height="100%" valign="top">
										<!-- using table to deal with overflow rendering issue in firefox -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<div class="treeWidgetNodeList" id="navTree">
														<s:iterator value="tree">
															<div class="treeWidgetNode"><span class="nodeSelector" id="treeGroup<s:property value="groupId"/>Toggle"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="19" height="11" alt="" />&nbsp;</span><span class="nodeLabel" id="treeGroup<s:property value="groupId"/>"><span><s:property value="groupName"/> (<s:property value="servers.length"/>)</span></span><span class="nodeModifier"></span>
																<div class="treeWidgetNodeList">
																	<s:iterator value="servers">
																		<div class="treeWidgetNode"><span class="nodeSelector"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="19" height="11" alt="" />&nbsp;</span><span class="nodeLabel" id="treeServer<s:property value="serverId"/>.-.Group<s:property value="groupId"/>"><span<s:if test="serverStatus.primaryState != ''"> class="<s:property value="serverStatus.primaryState" />"</s:if>><s:property value="serverName"/></span></span><span class="nodeModifier"></span></div>
																	</s:iterator>
																</div>
															</div>
														</s:iterator>
													</div>
												</td>
											</tr>
										</table>
										<script type="text/javascript" language="javascript">
										/* <![CDATA[ */
											//TODO: push this into the tree.js file but pass in the location and param structures
											function handleTreeSelection(which) {
												var locationString = "<s:url action="SelectServers" />?retAction=<s:property value="currentAction" />&";
												var serverMatch = which.match('treeServer([0-9]+)\.-\.Group([0-9]+)');
												if(serverMatch) {
													var serverId = serverMatch[1];
													var parentGroupId = serverMatch[2];
													locationString += "server=" + serverId + "&parentGroup=" + parentGroupId;
												} else {
													var groupMatch = which.match('treeGroup([0-9]+)');
													var groupId = groupMatch[1];
													locationString += "group=" + groupId;
												}
												document.location = locationString;
											}
											
											//create a new tree
											var treeInstance = new tree();
											//set a function for handling node selection
											treeInstance.setTree("navTree");
											treeInstance.setSelectedID("<s:property value="selectedNode" />");
											treeInstance.setSelectionHandler(handleTreeSelection);
											//initialize tree
											treeInstance.init();
										/* ]]> */
										</script>
									</td>
									<td class="treeToBodySpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="10" height="1" alt="" /></td>
								</s:if>
								<td id="bodyContentsWrapper" width="100%">
									<s:if test="authenticated">
										<s:if test="#attr['section'] == 'advisors'">
											<div id="secondaryNav">
												<a href="<s:url action="CurrentSchedule" />"<s:if test="#attr['subSection'] == 'currentSchedule'"> class="current"</s:if>><s:text name="defaultLayout.subSection.currentSchedule" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="AddToSchedule" />"<s:if test="#attr['subSection'] == 'addToSchedule'"> class="current"</s:if>><s:text name="defaultLayout.subSection.addToSchedule" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="ManageRules" />"<s:if test="#attr['subSection'] == 'manageRules'"> class="current"</s:if>><s:text name="defaultLayout.subSection.manageRules" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="CheckForUpdates" />"<s:if test="#attr['subSection'] == 'checkForUpdates'"> class="current"</s:if>><s:text name="defaultLayout.subSection.checkForUpdates" /></a>
											</div>
										</s:if>
										<s:elseif test="#attr['section'] == 'settings'">
											<div id="secondaryNav">
												<a href="<s:url action="GlobalSettings" />"<s:if test="#attr['subSection'] == 'globalSettings'"> class="current"</s:if>><s:text name="defaultLayout.subsection.global" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="UserPreferences" />"<s:if test="#attr['subSection'] == 'userPreferences'"> class="current"</s:if>><s:text name="defaultLayout.subsection.userpreferences" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="ManageServers" />"<s:if test="#attr['subSection'] == 'servers'"> class="current"</s:if>><s:text name="defaultLayout.subsection.servers" /></a>
												&nbsp;|&nbsp;
												<s:if test="user.admin">
													<a href="<s:url action="ManageUsers" />"<s:if test="#attr['subSection'] == 'users'"> class="current"</s:if>><s:text name="defaultLayout.subsection.users" /></a>
													&nbsp;|&nbsp;
												</s:if>
												<a href="<s:url action="Notification" />"<s:if test="#attr['subSection'] == 'notification'"> class="current"</s:if>><s:text name="defaultLayout.subsection.notification" /></a>
												&nbsp;|&nbsp;
												<a href="<s:url action="Logs" />"<s:if test="#attr['subSection'] == 'logs'"> class="current"</s:if>><s:text name="defaultLayout.subsection.logs" /></a>
											</div>
										</s:elseif>
										<s:elseif test="#attr['section'] == 'graphs'">
											<div id="secondaryNav">
												<a href="<s:url action="CheckForUpdates" />"><s:text name="defaultLayout.subSection.checkForUpdates" /></a>
											</div>
										</s:elseif>
										<s:else>
											<div id="secondaryNav"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="1" height="1" alt="" /></div>
										</s:else>
									</s:if>

									<div id="bodyContents">
										<tiles:insertAttribute name="body" />
									</div>
								</td>
							</tr>
							<tr>
								<s:if test="#attr['usesTree'] == 'true'">		
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr class="secondaryFooterBG">
											<td><img src="<s:url value="/web/resources/images/secondaryBL.gif" />" width="8" height="7" alt="" /></td>
											<td class="right"><img src="<s:url value="/web/resources/images/secondaryBR.gif" />" width="8" height="7" alt="" /></td>
										</tr>
									</table>
								</td>
								<td class="treeToBodySpacer"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="10" height="1" alt="" /></td>
								</s:if>
								<td id="bodyBottom">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr class="secondaryFooterBG">
											<td><img src="<s:url value="/web/resources/images/secondaryBL.gif" />" width="8" height="7" alt=""/></td>
											<td class="right"><img src="<s:url value="/web/resources/images/secondaryBR.gif" />" width="8" height="7" alt=""/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div id="footer">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td><img src="<s:url value="/web/resources/images/primaryTL.gif" />" width="5" height="5" alt=""/></td>
								<td class="right"><img src="<s:url value="/web/resources/images/primaryTR.gif" />" width="5" height="5" alt=""/></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td id="copyright"><s:text name="defaultLayout.text.copyright"><s:param><s:date name="now" format="yyyy" /></s:param></s:text></td>
											<td id="footerLinks"><a href="https://enterprise.mysql.com/software" target="_blank"><s:text name="defaultLayout.link.enterpriseSoftware" /></a> | <a href="https://enterprise.mysql.com/updates/index.php" target="_blank"><s:text name="defaultLayout.link.updateService" /></a> | <a href="https://kb.mysql.com/index.php" target="_blank"><s:text name="defaultLayout.link.knowledgeBase" /></a> | <a href="https://support.mysql.com/" target="_blank"><s:text name="defaultLayout.link.technicalSupport" /></a>  | <a href="<s:url action="About" />" target="_blank"><s:text name="defaultLayout.link.About" /></a></td>
											<td id="footerInfo"><s:if test="user"><s:text name="defaultLayout.text.loggedInAs"><s:param value="user.userName" /></s:text></s:if> (<s:date name="now" />)</td>
										</tr>
									</table>
								</td>
								
							</tr>
							<tr>
								<td id="license">
									<s:if test="numHosts">
										<s:if test="numHosts > productInfo.accountStatus.licenseCount">
											<s:text name="defaultLayout.text.monitoringExceeded"><s:param value="numHosts" /><s:param value="%{numHosts - productInfo.accountStatus.licenseCount}" /></s:text>
											<a href="http://www.mysql.com/buy-mysql/" target="_blank" style="font-weight: bold; text-decoration: underline;"><s:text name="defaultLayout.link.updateNow" /></a>
										</s:if>
										<s:elseif test="productInfo">
											<s:text name="defaultLayout.text.monitoring"><s:param value="numHosts" /><s:param value="productInfo.accountStatus.licenseCount" /><s:param value="productInfo.subscriptionLevels" /></s:text>
										</s:elseif>
									</s:if>
									<s:if test="productInfo">
										<span<s:if test="productInfo.accountStatus.expired"> id="expired"</s:if>>
											<s:if test="productInfo.accountStatus.expired">
												<s:text name="defaultLayout.text.expirationPast">
													<s:param value="productInfo.expiredSubscriptionLevels" />
													<s:param value="productInfo.accountStatus.expiredSubscriptionLevels.length" />
													<s:param><s:date name="getOffsetDate(productInfo.accountStatus.expiration)" format="%{getText('date.shortFormat')}" /></s:param>
												</s:text>
											</s:if>
											<s:else>
												<s:text name="defaultLayout.text.expirationFuture">
													<s:param value="productInfo.expiredSubscriptionLevels" />
													<s:param value="productInfo.accountStatus.expiredSubscriptionLevels.length" />
													<s:param><s:date name="getOffsetDate(productInfo.accountStatus.expiration)" format="%{getText('date.shortFormat')}" /></s:param>
												</s:text>
											</s:else>
											<s:if test="productInfo.showTimeRemaining">
												<s:if test="productInfo.accountStatus.daysRemaining > 0">
													<s:text name="defaultLayout.text.daysRemaining"><s:param value="productInfo.accountStatus.daysRemaining" /></s:text>
												</s:if>
												<s:else>
													<s:text name="defaultLayout.text.hoursRemaining"><s:param value="productInfo.accountStatus.hoursRemaining" /></s:text>
												</s:else>
											</s:if>
											<s:if test="productInfo.accountStatus.expired">
												<a href="<s:url action="GlobalSettings" />" style="text-decoration: underline;"><s:text name="defaultLayout.link.updateSubscription" /></a>
											</s:if>
										</span>
									</s:if>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td><img src="<s:url value="/web/resources/images/primaryBL.gif" />" width="5" height="5" alt=""/></td>
								<td class="right"><img src="<s:url value="/web/resources/images/primaryBR.gif" />" width="5" height="5" alt=""/></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		
		<s:if test="productInfo && productInfo.showTrialExpireWarning">
			<form action="#" onSubmit="return false">
			<div id="trialExpireWarningPopup" class="popup">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<table cellpadding="0" cellspacing="0" class="popupTab" id="popupTrialWarningTab">
														<tr>
															<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
															<td class="tabBody"><s:text name="defaultLayout.popup.trialExpiring.tab.expiring" /></td>
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
							<div id="popupTrialWarningBody" class="popupBody">
								<div class="itemContents"><s:text name="defaultLayout.popup.trialExpiring.text.trialExpirationWarning"><s:param value="productInfo.accountStatus.daysRemaining" /></s:text></div>
		
								<div class="itemContents"><s:text name="defaultLayout.popup.trialExpiring.text.instructions"><s:param><s:url action="AcknowledgeTrialExpireWarning" />?redirect=true</s:param></s:text></div>
	
								<div align="right">
									<input id="trialExpireWarningAcknowledge" name="submit" type="button" value="<s:text name="generic.button.acknowledge" />" />
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
				var trialExpireWarningPopup = new popup();
				//bind to html container
				trialExpireWarningPopup.bindToObject('trialExpireWarningPopup');
				trialExpireWarningPopup.setSubmitAction("<s:url action="AcknowledgeTrialExpireWarning" />");
				trialExpireWarningPopup.registerSubmit('trialExpireWarningAcknowledge');
				//initialize popup
				trialExpireWarningPopup.init();
				if(typeof(firstRunPopup) != 'undefined') {
					firstRunPopup.setCleanupAction(trialExpireWarningPopup.show);
				} else {
					addDOMLoadListener(trialExpireWarningPopup.show);
				}
				/* ]]> */
			</script>
		</s:if>
		
		<s:if test="productInfo && productInfo.showExpiredNotice">
		<form action="#" onSubmit="return false">
		<div id="validExpiredNoticePopup" class="popup">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" class="popupTab" id="popupValidExpiredTab">
													<tr>
														<td class="tabLeft"><img src="<s:url value="/web/resources/images/spacer.gif" />" width="8" height="7" alt="" /></td>
														<td class="tabBody"><s:text name="defaultLayout.popup.expiredNotice.tab.expired" /></td>
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
						<div id="popupValidExpiredBody" class="popupBody">
							<div class="itemContents"><s:text name="defaultLayout.popup.expiredNotice.text.expiredNotice"><s:param value="productInfo.accountStatus.daysLapsed" /><s:param><s:url action="AcknowledgeExpiredNotice" />?redirect=true</s:param></s:text></div>
							
							<div class="itemContents"><a href="<s:url action="AcknowledgeExpiredNotice" />?redirect=true"><s:text name="defaultLayout.popup.expiredNotice.link.prefs" /></a></div>
							
							<div align="right">
								<input id="validExpiredAcknowledge" name="submit" type="button" value="<s:text name="generic.button.acknowledge" />" />
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
			var validExpiredNoticePopup = new popup();
			//bind to html container
			validExpiredNoticePopup.bindToObject('validExpiredNoticePopup');
			validExpiredNoticePopup.setSubmitAction("<s:url action="AcknowledgeExpiredNotice" />");
			validExpiredNoticePopup.registerSubmit('validExpiredAcknowledge');
			//initialize popup
			validExpiredNoticePopup.init();
			if(typeof(firstRunPopup) != 'undefined') {
				firstRunPopup.setCleanupAction(validExpiredNoticePopup.show);
			} else {
				addDOMLoadListener(validExpiredNoticePopup.show);
			}
			/* ]]> */
		</script>
		</s:if>
		
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
