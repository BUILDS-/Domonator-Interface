<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="web/resources/css/default.css?B=1.2.0.6769" />
		<link rel="stylesheet" type="text/css" href="web/resources/css/tree.css?B=1.2.0.6769" />
		<link rel="shortcut icon" href="web/swganh.ico" />
		<script type="text/javascript" language="javascript">
		/* <![CDATA[ */
			//for use in javascript files that reference images
			var GLOBAL_baseImagePath = 'web/resources/images/';
			var GLOBAL_baseResourcePath = 'web/resources/';
		/* ]]> */
		</script>
		<script type="text/javascript" language="javascript" src="web/resources/js/default.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/tree.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/datePicker.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/popup.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/rowDisplayToggle.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/misc.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript" src="web/resources/js/notice.js?B=1.2.0.6769"></script>
		<script type="text/javascript" language="javascript">
		/* <![CDATA[ */
			var noticeFader = new noticeFade();
			noticeFader.setObject('fader');
			noticeFader.setMessageContainer('noticeMessages');
			noticeFader.registerClose('noticeClose');
			
				
					noticeFader.addMessage("");
				
			
			
			
		/* ]]> */
		</script>
		<title><?php echo $title ?></title>
		<?php echo $head; ?>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>
					<div id="headerWrapper">
						<div id="header">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td><img src="web/resources/images/primaryTL.gif" width="5" height="5" alt="" /></td>
									<td class="right"><img src="web/resources/images/primaryTR.gif" width="5" height="5" alt="" /></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td id="logo"><img src="images/logo.gif"  class="decoration"/></td>
									<td id="logo">
									<font size="7" color="#FFFFFF">SWGANH: 
											Dashboard</font></td></tr>
								</table>
											<table cellpadding="0" cellspacing="0" width="100%">											
									<td width="100%" id="headerLinks">
										
											
										
											<table cellpadding="0" cellspacing="0" align="right">
												<tr>
													
													<td>
														Refresh:
														<select id="doRefresh">
															
																<option value="-1">Off</option>
															
																<option value="15">Every 15 Seconds</option>
															
																<option value="30">Every 30 Seconds</option>
															
																<option value="45">Every 45 Seconds</option>
															
																<option value="60">Every Minute</option>
															
																<option value="120">Every 2 Minutes</option>
															
																<option value="300">Every 3 Minutes</option>
															
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
													
													<td>
														<a href="Help.action" target="_blank"><img src="web/resources/images/helpIcon.png" width="12" alt="" border="0" /> Help</a>
														&nbsp;
														<a href="logout.php"><img src="web/resources/images/logOutIcon.png" width="12" alt="" border="0" /> Log Out</a>
													</td>
												</tr>
											</table>
										
									</td>
										</tr>
								
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td><img src="..web/resources/images/primaryBL.gif" width="5" height="5" alt="" /></td>
									<td class="right"><img src="..web/resources/images/primaryBR.gif" width="5" height="5" alt="" /></td>
								</tr>
							</table>
						</div>
					</div>
					<noscript>
						<div id="javascriptEnabledBar">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="secondaryHeaderBG">
									<td><img src="..web/resources/images/secondaryTL.gif" width="8" height="7" alt="" /></td>
									<td class="right"><img src="..web/resources/images/secondaryTR.gif" width="8" height="7" alt="" /></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="noticeBody">
										<span class="error" style="font-weight: bold;">This site requires JavaScript to function properly. Please enable JavaScript before continuing.</span>
									</td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" width="100%">
								<tr class="secondaryFooterBG">
									<td><img src="..web/resources/images/secondaryBL.gif" width="8" height="7" alt="" /></td>
									<td class="right"><img src="..web/resources/images/secondaryBR.gif" width="8" height="7" alt="" /></td>
								</tr>
							</table>
						</div>
					</noscript>
					<div id="bodyWrapper">
											<table cellpadding="0" cellspacing="0" width="100%">
							
							<tr>
								
									<td>
										<table cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td class="treeTab">
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td class="tabLeft"><img src="..web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
															<td class="tabBody"><img src="..web/resources/images/serverIcon11.png" width="9" height="11" alt="" /> Servers</td>
															<td class="tabRight"><img src="..web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
														</tr>
													</table>
												</td>
												<td class="treeTabSpacer"><img src="..web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
											</tr>
										</table>
									</td>
									<td class="treeToBodySpacer"><img src="..web/resources/images/spacer.gif" width="10" height="1" alt="" /></td>
								
								<td>

