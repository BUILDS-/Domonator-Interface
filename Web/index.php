<?php
include ('custom_functions.php');
include ('config.php');
$head = "";
$title = "Domonator";
$name = "Domonator";
include ('header_refresh.php');

$username = "broglek@bu.edu";
?>
									<table cellpadding="0" cellspacing="0" width="100%" id="tabBar">
										<tr>
											<td class="tabOn">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="<?php echo $username ?>" href="index.php"><img src="web/resources/images/homeIcon11.png" width="11" height="11" alt="Monitor" /> <?php echo $username ?></a></td>
														<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<td class="tab">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
														<td class="tabBody"><a title="Create List" href="#"><img src="web/resources/images/securityIcon11.png" width="9" height="11" alt="Create List" /> Create List</td>
														<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
											<td class="tab" id="settingsTab">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
														<td class="tabBody"><img src="web/resources/images/confgIcon11.png" width="11" height="11" alt="Settings"/> Admin</td>
														<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							
							
							<tr>
							<?php
include ('tree.php');?>

<table cellpadding="0" cellspacing="0" width="100%">



	<tr>

		<td valign="top" style="border-right: 1px solid #AAAAAA;">

			<table cellpadding="0" cellspacing="0">

				<tr>

					<td>

						<div class="titleBar"><span class="titleModifier">Lists you are subscribed to:</span><div class='paging'>[ <span class='pagingHighlight'>$num of $total ]</div></div>
						
						<div class="basicBox" style="padding: 5px;" align="center">


						</div>

					</td>

				</tr>

				<tr>

					<td>

						<table cellpadding="0" cellspacing="0" width="100%">

						<?php
						$command = "/var/www/major/weblogin/getsubs.pl $username";
							exec($command  . " 2>&1", $subs);
								echo "
							<tr>
								<td class='listBox'>
									<table cellpadding='0' cellspacing='0' width='100%'>
										<tbody>
											<tr class='titleRow'>
												<td>Name</td>
												<td>Subscription Policy</td>
												<td>Moderated</td>
												<td>Description</td>
											</tr>
											
											";
												foreach($subs as $key => $value)
												{
													$command2 = "/var/www/major/weblogin/getdescription.pl $value";
													exec($command2  . " 2>&1", $desc);
													
													$command3 = "/var/www/major/weblogin/getmodpolicy.pl $value";
													exec($command3  . " 2>&1", $mod);
													
													$command3 = "/var/www/major/weblogin/getsubpolicy.pl $value";
													exec($command3  . " 2>&1", $sp);
													
													echo "
													<tr class='listRowAlt'>
														<td>$value</td>
														<td>$sp[0]</td>
														<td>$mod[0]</td>
														<td>$desc[0]</td>
													</tr>";
												unset($desc);
												unset($sp);
												unset($mod);
												}?>
	
												
											
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td  valign="top">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="center">
						<div class="titleBar"><span class="titleModifier">Lists you manage</span></div>
						<div  style="padding: 12px 5px 3px 5px;">
						<table cellpadding="0" cellspacing="0" align="center">
							<?php
							$command = "/var/www/major/weblogin/getadmin.pl $username";
							exec($command  . " 2>&1", $manage);
							
							echo "
							<tr>
								<td class='listBox'>
									<table cellpadding='0' cellspacing='0' width='100%'>
										<tbody>
											<tr class='titleRow'>
												<td>Name</td>
												<td>Type</td>
												<td>Description</td>
											</tr>
											
											";
											foreach($manage as $key => $value)
												{
													$command2 = "/var/www/major/weblogin/getdescription.pl $value";
													exec($command2  . " 2>&1", $desc);
													
													echo "
													<tr class='listRowAlt'>
														<td>$value</td>
														<td></td>
														<td>$desc[0]</td>
													</tr>";
												unset($desc);
												}
												?>
	
												
											
										</tbody>
									</table>
								</td>
							</tr>
						</table>
						</div>
					</td>
				</tr>
				
			</table>
				</tr>
				
					<tr>
						<td>
						<br/><br/>
							
						</td>
					</tr>
				
			</table>
		</td>
	</tr>
</table>

<!-- POPUP CONTAINERS -->



<script language="JavaScript" type="text/javascript">
/* <![CDATA[ */
	//disable controls based on which radio button is checked (applied to onchange handler of radio buttons) - A to B controls start disabled
	function setGraphControls() {
		//determine which type of graph was selected
		var graphType;
		var availableGraphs = document.getElementsByName('graphType');
		for (var i = 0; i < availableGraphs.length; i++) {
			if(availableGraphs[i].checked) {
				graphType = availableGraphs[i].value;
				break;
			}
		}
		
		//TODO: make a util function that retrievs all inputs in a container
		//get the collections of inputs associated with each radio button
		var intervalInputs = returnObject('intervalContainer').getElementsByTagName('select');
		var fromToInputs = new Array();
		var tmpFromToInputs = returnObject('fromToContainer').getElementsByTagName('select');
		for (var i = 0; i < tmpFromToInputs.length; i++) {
			fromToInputs.push(tmpFromToInputs[i]);
		}
		tmpFromToInputs = returnObject('fromToContainer').getElementsByTagName('input');
		for (var i = 0; i < tmpFromToInputs.length; i++) {
			fromToInputs.push(tmpFromToInputs[i]);
		}
		
		//define which collection of inputs to disable
		var disableCollection;
		var enableCollection;
		if(graphType == 'interval') {
			disableCollection = fromToInputs;
			enableCollection = intervalInputs;
		} else if(graphType == 'fromTo') {
			disableCollection = intervalInputs;
			enableCollection = fromToInputs;
		}
		
		//set disabled state based on graph selection
		for (var i = 0; i < disableCollection.length; i++) {
			disableCollection[i].disabled = true;
		}
		for (var i = 0; i < enableCollection.length; i++) {
			enableCollection[i].disabled = false;
		}
	}
	
	//function to use as submit handler
	function updateGraph(instanceData) {
		//get the graph image
		var fullGraph = returnObject('fullGraph');
		//apply the new image and make sure cache is defeated
		var src = instanceData.returnedData.graph.Uri;
		//set the soure to the new source
		fullGraph.src = src;
		//select graph tab
		fullGraphPopup.setFirstTab();
	}
	
	function setGraphTitle(instanceData) {
		//var sentData = instanceData.sentData;
		var name = instanceData.returnedData.graph.name;
		
		return name;
	}
	
	function cleanGraphDisplay() {
		setGraphControls();
		var fullGraph = returnObject('fullGraph');
		fullGraph.src = 'web/resources/images/spacer.gif';
	}
	
	var fullGraphPopup = new popup();
	//special update so that we recenter when a large image changes popup size
	//TODO: move this into a post load thing?
	var fullGraph = returnObject('fullGraph');
	eventManager.registerListener(fullGraph, 'load', function(){fullGraphPopup.rePosition()});
	//bind to html container
	fullGraphPopup.bindToObject('fullGraphPopup');
	//set ajax call for update
	fullGraphPopup.setUpdateAction("ShowFullGraph.action");
	//set ajax call for submission
	fullGraphPopup.setSubmitAction("UpdateFullGraph.action");
	fullGraphPopup.registerSubmit('graphUpdate');
	//assign a function to handle the page display after a successful submit
	fullGraphPopup.setSubmitHandler(updateGraph);
	fullGraphPopup.registerHide('graphHide');
	fullGraphPopup.registerHide('graphHide2');
	//tell the popup to use a loading box and set the text to display
	fullGraphPopup.createLoader("Loading Graph");
	//set function for doing special return to original state on close
	fullGraphPopup.setCleanupAction(cleanGraphDisplay);
	fullGraphPopup.bindData(setGraphControls);

	//bind the data to the display
	fullGraphPopup.bindData('graph.Uri', 'fullGraph');
	fullGraphPopup.bindData('graph.graphName', 'graphTitle');
	fullGraphPopup.init();
	
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
	
	function closurePageUpdate(instanceData) {
		var closedEvents = new Array();
		if(instanceData.affectedRows.length > 0) {
			closedEvents = instanceData.affectedRows;
		} else {
			closedEvents.push(instanceData.row);
		}
		for(var i = 0; i < closedEvents.length; i++) {
			var checkboxContainer = getElementsByClassName('closeCheckbox', closedEvents[i], 'span', false);
			if(checkboxContainer[0]) {
				var checkbox = checkboxContainer[0].getElementsByTagName('input')[0];
				checkbox.disabled = true;
				checkbox.checked = false;
			}
			var statusCell = getElementsByClassName('eventStatus', closedEvents[i], 'span', false);
			if(statusCell[0]) {
				//TODO: replace messages with reference to message keys
				statusCell[0].innerHTML = "Closed";
			}
			getElementsByClassName('closeLink', closedEvents[i], 'span', false)[0].style.display = 'none';
			getElementsByClassName('resolutionNotesLink', closedEvents[i], 'span', false)[0].style.display = 'inline';
		}
		var plurality = closedEvents.length > 1 ? "s" : "";
		noticeFader.addMessage("Closed " + closedEvents.length + " event" + plurality + ".");
		return true;
	}
	
	function cleanupNotes(){
		var textareas = document.getElementsByTagName('textarea');
		for(var i = 0; i < textareas.length; i++) {
			if(textareas[i].name == 'notes') {
				textareas[i].value = "";
			}
		}
	}
	
	function formatEventTime(instanceData) {
		var relativeTime = instanceData.returnedData.event.relativeAlarmTime;
		var formattedTime = instanceData.returnedData.event.formattedAlarmTime;
		return (formattedTime + " (" + relativeTime + ")");
	}
	
	function formatNotifyTargets(instanceData) {
		var notifyTargets = instanceData.returnedData.event.notifyTargets;
		if (notifyTargets.length < 1) {
			notifyTargets = "No notifications set";
		}
		return notifyTargets;
	}
	
	function isResolved(instanceData) {
		if(instanceData.returnedData.event.status.toLowerCase() == 'closed') {
			returnObject('popupHistoryResolutionTab').style.display = 'block';
			returnObject('popupHistoryCloseTab').style.display = 'none';
		}
	}
	
	function cleanResolutionDisplay() {
		returnObject('popupHistoryResolutionTab').style.display = 'none';
		returnObject('popupHistoryCloseTab').style.display = 'block';
		cleanupNotes();
	}
	
	//wrapper for showing of history info to show the resolution notes
	function historInfoResolutionShow(passthrough, event) {
		historyInfoPopup.show(passthrough, event);
		historyInfoPopup.setTab(returnObject('popupHistoryResolutionTab'));
	}
	
	//wrapper for showing of history info to show the resolution notes
	function historInfoCloseShow(passthrough, event) {
		historyInfoPopup.show(passthrough, event);
		historyInfoPopup.setTab(returnObject('popupHistoryCloseTab'));
	}
	
	var historyInfoPopup = new popup();
	//bind to html container
	historyInfoPopup.bindToObject('historyInfoPopup');
	//set ajax call for update
	historyInfoPopup.setUpdateAction("EventsInfo.action");
	//set ajax call for submission
	historyInfoPopup.setSubmitAction("CloseEvent.action");
	historyInfoPopup.registerSubmit('historyInfoClose');
	//assign a function to handle the page display after a successful submit
	historyInfoPopup.setSubmitHandler(closurePageUpdate);
	//bind the data to the display
	historyInfoPopup.bindData("closeTimestamp", "historyInfoTimestamp");
	historyInfoPopup.registerHide('historyInfoHide1');
	historyInfoPopup.registerHide('historyInfoHide2');
	historyInfoPopup.registerHide('historyInfoHide3');
	historyInfoPopup.registerHide('historyInfoHide4');
	historyInfoPopup.registerHide('historyInfoHide5');
	//tell the popup to use a loading box and set the text to display
	historyInfoPopup.createLoader("Loading Rule Information");
	//bind the data to the display
	historyInfoPopup.bindData('event.serverName', 'historyInfoServerName1');
	historyInfoPopup.bindData('event.serverName', 'historyInfoServerName2');
	historyInfoPopup.bindData('event.status', 'historyInfoStatus');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType1');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType2');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType3');
	historyInfoPopup.bindData('event.severeAlarmLevelName', 'historyInfoAlertType4');
	historyInfoPopup.bindData('event.expression', 'historyInfoExpression');
	historyInfoPopup.bindData('event.realExpression', 'historyInfoEvaluatedExpression');
	historyInfoPopup.bindData(formatEventTime, 'historyInfoEventTime1');
	historyInfoPopup.bindData(formatEventTime, 'historyInfoEventTime2');
	historyInfoPopup.bindData(formatNotifyTargets, 'historyInfoNotifications');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName1');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName2');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName3');
	historyInfoPopup.bindData('event.rule', 'historyInfoRuleName4');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion1');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion2');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion3');
	historyInfoPopup.bindData('rule.version', 'historyInfoRuleVersion4');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved1');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved2');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved3');
	historyInfoPopup.bindData(showCertified, 'historyInfoRuleApproved4');
	historyInfoPopup.bindData('rule.categoryName', 'historyInfoParentAdvisor');
	historyInfoPopup.bindData('rule.description', 'historyInfoMoreInfo');
	historyInfoPopup.bindData('event.advice', 'historyInfoAdvice1');
	historyInfoPopup.bindData('event.advice', 'historyInfoAdvice2');
	historyInfoPopup.bindData('event.command', 'historyInfoCommand1')
	historyInfoPopup.bindData('event.command', 'historyInfoCommand2');
	historyInfoPopup.bindData("rule.info", 'historyInfoFurtherInfo');
	historyInfoPopup.bindData('rule.thresholds.info', 'historyInfoInfoThreshold');
	historyInfoPopup.bindData('rule.thresholds.warning', 'historyInfoWarningThreshold');
	historyInfoPopup.bindData('rule.thresholds.critical', 'historyInfoCriticalThreshold');
	historyInfoPopup.bindData('rule.frequency', 'historyInfoFrequency');
	historyInfoPopup.bindData('event.fixedBy', 'historyInfoClosedBy');
	historyInfoPopup.bindData('event.formattedFixedTime', 'historyInfoClosedAt');
	historyInfoPopup.bindData('event.notes', 'historyInfoResolutionNotes');
	historyInfoPopup.bindData('event.rule', 'ruleToClose');
	historyInfoPopup.bindData('event.serverName', 'serverToClose');
	historyInfoPopup.bindData(isResolved);
	//set function for doing special return to original state on close
	historyInfoPopup.setCleanupAction(cleanResolutionDisplay);
	//initialize popup
	historyInfoPopup.init();
	
	
	
	var editGraphDefaults = new popup();
	//bind to html container
	editGraphDefaults.bindToObject('editGraphDefaults');
	//set ajax call for update
	editGraphDefaults.setUpdateAction("SetDashboardGraphDefaultsInfo.action");
	//set ajax call for submission
	editGraphDefaults.setSubmitAction("SetDashboardGraphDefaults.action");
	editGraphDefaults.registerSubmit('editGraphDefaultsSubmit');
	//assign a function to handle the page display after a successful submit
	editGraphDefaults.setSubmitHandler(reloadPage);
	editGraphDefaults.registerHide('editGraphDefaultsHide');

	//bind the data to the display
	editGraphDefaults.bindData('interval.hours', 'hours');
	editGraphDefaults.bindData('interval.minutes', 'minutes');
	editGraphDefaults.bindData('width', 'width');
	editGraphDefaults.bindData('height', 'height');
	editGraphDefaults.bindData('thumbWidth', 'thumbWidth');
	editGraphDefaults.bindData('thumbHeight', 'thumbHeight');
	editGraphDefaults.init();
	
	var editFavorites = new popup();
	//bind to html container
	editFavorites.bindToObject('editFavorites');
	//set ajax call for update
	editFavorites.setUpdateAction("SetGraphFavoritesInfo.action");
	//set ajax call for submission
	editFavorites.setSubmitAction("SetGraphFavorites.action");
	editFavorites.registerSubmit('editFavoritesSubmit');
	//assign a function to handle the page display after a successful submit
	editFavorites.setSubmitHandler(reloadPage);
	editFavorites.registerHide('editFavoritesHide');

	//bind the data to the display
	editFavorites.bindData('favorites', 'favorites');
	editFavorites.bindData('maxFavorites', 'maxFavorites');
	
	editFavorites.init();

	addDOMLoadListener(initLegend);
/* ]]> */
</script>

<?php
include ('footer.php');
?>