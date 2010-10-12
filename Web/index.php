<?php
include ('custom_functions.php');
include ('config.php');
$head = "";
$title = "Domonator";
$name = "Domonator";
include ('header_refresh.php');

$username = "Jnfurst";
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

			<table cellpadding="0" cellspacing="0" width="50%">

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
								echo "
							<tr>
								<td class='listBox'>
									<table cellpadding='0' cellspacing='0' width='100%'>
										<tbody>
											<tr class='titleRow'>
												<td>Name</td>
												<td>Type</td>
												<td>Account</td>
												<td>Date & Time</td>
											</tr>
											
											";
									
													echo "<tr class='listRowAlt'>
													<td>builds-list</td>
													<td>Public</td>
													<td style='white-space: normal;'>$row[1]</td>
													<td title='6 minutes ago'>$row[3]</td>
													
												</tr>";?>
	
												
											
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td style="background: #FFFFFF; border-bottom: 1px solid #C4C4C4;" valign="top">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="center">
						<div class="titleBar"><span class="titleModifier">Lists you manage</span></div>
						<div  style="padding: 12px 5px 3px 5px;">
						<table cellpadding="0" cellspacing="0" align="center">
							<?php
								echo "
							<tr>
								<td class='listBox'>
									<table cellpadding='0' cellspacing='0' width='100%'>
										<tbody>
											<tr class='titleRow'>
												<td>Name</td>
												<td>Type</td>
												<td>Account</td>
												<td>Date & Time</td>
											</tr>
											
											";
									
													echo "<tr class='listRowAlt'>
													<td>builds-list</td>
													<td>Public</td>
													<td style='white-space: normal;'>$row[1]</td>
													<td title='6 minutes ago'>$row[3]</td>
													
												</tr>";?>
	
												
											
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
<form action="#" onsubmit="return false">
<div id="historyInfoPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryResultsTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Results</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryResolutionTab" style="display: none">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Resolution</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryCloseTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Close Event</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryDetailsTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Details</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupHistoryAdvancedTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Advanced</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">
				<div id="popupHistoryResultsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType1">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName1">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion1">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved1">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel">Server</div>
					<div class="itemContents" id="historyInfoServerName1">Error: Server name not loaded</div>
					
					<div class="itemLabel">Time</div>
					<div class="itemContents" id="historyInfoEventTime1">Error: Event time not loaded</div>
					
					<div class="itemLabel">Status</div>
					<div class="itemContents" id="historyInfoStatus">Error: Status not loaded</div>
					
					<div class="itemLabel">Advice</div>
					<div class="itemContents" id="historyInfoAdvice1">Error: Rule advice not loaded</div>
					
					<div class="itemLabel">Recommended Action</div>
					<div class="itemContents" id="historyInfoCommand1">Error: Rule recommended action not loaded</div>
					
					<div class="itemLabel">Notifications</div>
					<div class="itemContents" id="historyInfoNotifications">Error: Notifications not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide1" value="hide" /></div>
				</div>
				<div id="popupHistoryResolutionBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType2">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName2">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion2">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved2">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabelStandalone">Closed by <!-- substitute strings in so that "Closed by" isn't in plain text --><span id="historyInfoClosedBy">Error: Closed by not loaded</span> at <!-- substitute strings in so that "at" isn't in plain text --> <span id="historyInfoClosedAt">Error: Closed time not loaded</span></div>
					
					<div class="itemLabel">Resolution Notes</div>
					<div class="itemContents" id="historyInfoResolutionNotes">Error: Resolution notes not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide2" value="hide" /></div>
				</div>
				<div id="popupHistoryCloseBody" class="popupBody">
					<div class="itemLabelStandalone">Close <span id="ruleToClose">Error: no event found for closure</span> on <span id="serverToClose">Error: no server found for closure</span></div>

					<div class="itemLabel">Timestamp</div>
					<div class="itemContents" id="historyInfoTimestamp">Error: Timestamp no loaded</div>
					
					<div class="itemLabel">Resolution Notes</div>
					<div class="itemContents"><textarea name="notes" rows="5" cols="50"></textarea></div>

					<div align="right">
						<input id="historyInfoClose" name="submit" type="button" value="close" />
						<input id="historyInfoHide3" name="hide" type="button" value="hide" />
					</div>
				</div>
				<div id="popupHistoryDetailsBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType3">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName3">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion3">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved3">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel">Server</div>
					<div class="itemContents" id="historyInfoServerName2">Error: Server name not loaded</div>
					
					<div class="itemLabel">Time</div>
					<div class="itemContents" id="historyInfoEventTime2">Error: Event time not loaded</div>
					
					<div class="itemLabel">Advisor</div>
					<div class="itemContents" id="historyInfoParentAdvisor">Error: Advisor not loaded</div>
					
					<div class="itemLabel">Problem Description</div>
					<div class="itemContents" id="historyInfoMoreInfo">Error: Rule problem description not loaded</div>
					
					<div class="itemLabel">Advice</div>
					<div class="itemContents" id="historyInfoAdvice2">Error: Rule Advice not loaded</div>

					<div class="itemLabel">Recommended Action</div>
					<div class="itemContents" id="historyInfoCommand2">Error: Rule Recommended Action not loaded</div>
					
					<div class="itemLabel">Links and Further Reading</div>
					<div class="itemContents" id="historyInfoFurtherInfo">Error: Rule links and further reading not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide4" value="hide" /></div>
				</div>
				<div id="popupHistoryAdvancedBody" class="popupBody">
					<div class="itemLabelStandalone">
						<span id="historyInfoAlertType4">Error: Alert type not loaded</span> Alert <!-- substitute strings in so that "Alert" isn't in plain text --> - <span id="historyInfoRuleName4">Error: Rule Name not loaded</span>
						<span class="itemLabelModifier">
							(v <span id="historyInfoRuleVersion4">Error: Version not loaded</span> 
							<span id="historyInfoRuleApproved4">Error: Rule Approved state not loaded</span>)
						</span>
					</div>
					
					<div class="itemLabel">Thresholds</div>
					<div class="itemContents">
						Critical Alert = <span id="historyInfoCriticalThreshold">Error: Rule critical threshold not loaded</span><br />
						Warning Alert = <span id="historyInfoWarningThreshold">Error: Rule warning threshold not loaded</span><br />
						Info Alert = <span id="historyInfoInfoThreshold">Error: Rule info threshold not loaded</span>
					</div>
					
					<div class="itemLabel">Frequency</div>
					<div class="itemContents" id="historyInfoFrequency">Error: Rule frequency not loaded</div>
					
					<div class="itemLabel">Expression</div>
					<div class="itemContents" id="historyInfoExpression">Error: Rule expression not loaded</div>
					
					<div class="itemLabel">Evaluated Expression</div>
					<div class="itemContents" id="historyInfoEvaluatedExpression">Error: Evaluated expression not loaded</div>
					
					<div align="right"><input type="button" name="hide" id="historyInfoHide5" value="hide" /></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="web/resources/images/tertiaryOnBL.gif" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="web/resources/images/tertiaryOnBR.gif" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>

<form action="#" onsubmit="return false">
<div id="fullGraphPopup" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupGraphTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Graph Display</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupGraphConfigTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Configure</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">
				<div id="popupGraphBody" class="popupBody">
					<div class="itemLabel" align="center">localhost:3306 : <span id="graphTitle"></span></div>
					<div class="itemContents" align="center"><img src="web/resources/images/spacer.gif" id="fullGraph" alt="" /></div>
					<div class="itemContents" align="right"><input type="button" name="hide" value="hide" id="graphHide" /></div>
				</div>
				
				<div id="popupGraphConfigBody" class="popupBody">
					<div class="itemContents">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" style="padding-right: 10px;" valign="top" nowrap="nowrap"><input type="radio" name="graphType" value="interval" checked="checked" onclick="setGraphControls()" /> Interval:</td>
								<td valign="top" id="intervalContainer" nowrap="nowrap">
									<div class="inputLabelWrap">
										<span class="inputLabelTitle">Hours</span><br/>
										<select name="intervalHours">
											
												<option value="00">00</option>
											
												<option value="01">01</option>
											
												<option value="02">02</option>
											
												<option value="03">03</option>
											
												<option value="04">04</option>
											
												<option value="05">05</option>
											
												<option value="06">06</option>
											
												<option value="07">07</option>
											
												<option value="08">08</option>
											
												<option value="09">09</option>
											
												<option value="10">10</option>
											
												<option value="11">11</option>
											
												<option value="12">12</option>
											
												<option value="13">13</option>
											
												<option value="14">14</option>
											
												<option value="15">15</option>
											
												<option value="16">16</option>
											
												<option value="17">17</option>
											
												<option value="18">18</option>
											
												<option value="19">19</option>
											
												<option value="20">20</option>
											
												<option value="21">21</option>
											
												<option value="22">22</option>
											
												<option value="23">23</option>
											
										</select>
									</div>
									
									<div class="inputLabelWrap">
										<span class="inputLabelTitle">Minutes</span><br/>
										<select name="intervalMinutes">
											
												<option value="00">00</option>
											
												<option value="01">01</option>
											
												<option value="02">02</option>
											
												<option value="03">03</option>
											
												<option value="04">04</option>
											
												<option value="05">05</option>
											
												<option value="06">06</option>
											
												<option value="07">07</option>
											
												<option value="08">08</option>
											
												<option value="09">09</option>
											
												<option value="10">10</option>
											
												<option value="11">11</option>
											
												<option value="12">12</option>
											
												<option value="13">13</option>
											
												<option value="14">14</option>
											
												<option value="15">15</option>
											
												<option value="16">16</option>
											
												<option value="17">17</option>
											
												<option value="18">18</option>
											
												<option value="19">19</option>
											
												<option value="20">20</option>
											
												<option value="21">21</option>
											
												<option value="22">22</option>
											
												<option value="23">23</option>
											
												<option value="24">24</option>
											
												<option value="25">25</option>
											
												<option value="26">26</option>
											
												<option value="27">27</option>
											
												<option value="28">28</option>
											
												<option value="29">29</option>
											
												<option value="30">30</option>
											
												<option value="31">31</option>
											
												<option value="32">32</option>
											
												<option value="33">33</option>
											
												<option value="34">34</option>
											
												<option value="35">35</option>
											
												<option value="36">36</option>
											
												<option value="37">37</option>
											
												<option value="38">38</option>
											
												<option value="39">39</option>
											
												<option value="40">40</option>
											
												<option value="41">41</option>
											
												<option value="42">42</option>
											
												<option value="43">43</option>
											
												<option value="44">44</option>
											
												<option value="45">45</option>
											
												<option value="46">46</option>
											
												<option value="47">47</option>
											
												<option value="48">48</option>
											
												<option value="49">49</option>
											
												<option value="50">50</option>
											
												<option value="51">51</option>
											
												<option value="52">52</option>
											
												<option value="53">53</option>
											
												<option value="54">54</option>
											
												<option value="55">55</option>
											
												<option value="56">56</option>
											
												<option value="57">57</option>
											
												<option value="58">58</option>
											
												<option value="59">59</option>
											
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="padding: 0px 10px 0px 20px;" valign="top" nowrap="nowrap"><input type="radio" name="graphType" value="fromTo" onclick="setGraphControls()" /> From/To:</td>
								<td valign="top" id="fromToContainer" nowrap="nowrap">
									<table cellpadding="0" cellspacing="0">
										<tr>
											<td valign="top">
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">From</span><br/>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td><input type="text" id="fromCalendar" name="fromDate" size="8" disabled="disabled"/></td>
															<td><img src="web/resources/images/calendarIcon.jpg" id="fromCalendarButton" width="16" height="16" alt="" /></td>
														</tr>
													</table>
													<script type="text/javascript" language="javascript">
													/* <![CDATA[ */
														var fromCalendar = new calendar();
														fromCalendar.registerInput('fromCalendar');
														fromCalendar.registerToggle('fromCalendarButton');
														fromCalendar.setTimeOffset('2007-08-06-11-34');
														fromCalendar.init();
													/* ]]> */
													</script>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">Hours</span><br/>
													<select name="fromHours" disabled="disabled">
														
															<option value="00">00</option>
														
															<option value="01">01</option>
														
															<option value="02">02</option>
														
															<option value="03">03</option>
														
															<option value="04">04</option>
														
															<option value="05">05</option>
														
															<option value="06">06</option>
														
															<option value="07">07</option>
														
															<option value="08">08</option>
														
															<option value="09">09</option>
														
															<option value="10">10</option>
														
															<option value="11">11</option>
														
															<option value="12">12</option>
														
															<option value="13">13</option>
														
															<option value="14">14</option>
														
															<option value="15">15</option>
														
															<option value="16">16</option>
														
															<option value="17">17</option>
														
															<option value="18">18</option>
														
															<option value="19">19</option>
														
															<option value="20">20</option>
														
															<option value="21">21</option>
														
															<option value="22">22</option>
														
															<option value="23">23</option>
														
													</select>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">Minutes</span><br/>
													<select name="fromMinutes" disabled="disabled">
														
															<option value="00">00</option>
														
															<option value="01">01</option>
														
															<option value="02">02</option>
														
															<option value="03">03</option>
														
															<option value="04">04</option>
														
															<option value="05">05</option>
														
															<option value="06">06</option>
														
															<option value="07">07</option>
														
															<option value="08">08</option>
														
															<option value="09">09</option>
														
															<option value="10">10</option>
														
															<option value="11">11</option>
														
															<option value="12">12</option>
														
															<option value="13">13</option>
														
															<option value="14">14</option>
														
															<option value="15">15</option>
														
															<option value="16">16</option>
														
															<option value="17">17</option>
														
															<option value="18">18</option>
														
															<option value="19">19</option>
														
															<option value="20">20</option>
														
															<option value="21">21</option>
														
															<option value="22">22</option>
														
															<option value="23">23</option>
														
															<option value="24">24</option>
														
															<option value="25">25</option>
														
															<option value="26">26</option>
														
															<option value="27">27</option>
														
															<option value="28">28</option>
														
															<option value="29">29</option>
														
															<option value="30">30</option>
														
															<option value="31">31</option>
														
															<option value="32">32</option>
														
															<option value="33">33</option>
														
															<option value="34">34</option>
														
															<option value="35">35</option>
														
															<option value="36">36</option>
														
															<option value="37">37</option>
														
															<option value="38">38</option>
														
															<option value="39">39</option>
														
															<option value="40">40</option>
														
															<option value="41">41</option>
														
															<option value="42">42</option>
														
															<option value="43">43</option>
														
															<option value="44">44</option>
														
															<option value="45">45</option>
														
															<option value="46">46</option>
														
															<option value="47">47</option>
														
															<option value="48">48</option>
														
															<option value="49">49</option>
														
															<option value="50">50</option>
														
															<option value="51">51</option>
														
															<option value="52">52</option>
														
															<option value="53">53</option>
														
															<option value="54">54</option>
														
															<option value="55">55</option>
														
															<option value="56">56</option>
														
															<option value="57">57</option>
														
															<option value="58">58</option>
														
															<option value="59">59</option>
														
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td valign="top">
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">To</span><br/>
													<table cellpadding="0" cellspacing="0">
														<tr>
															<td><input type="text" id="toCalendar" name="toDate" size="8" disabled="disabled" /></td>
															<td><img src="web/resources/images/calendarIcon.jpg" id="toCalendarButton" width="16" height="16" alt="" /></td>
														</tr>
													</table>
													<script type="text/javascript" language="javascript">
													/* <![CDATA[ */
														var toCalendar = new calendar();
														toCalendar.registerInput('toCalendar');
														toCalendar.registerToggle('toCalendarButton');
														toCalendar.setTimeOffset('2007-08-06-11-34');
														toCalendar.init();
													/* ]]> */
													</script>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">Hours</span><br/>
													<select name="toHours" disabled="disabled">
														
															<option value="00">00</option>
														
															<option value="01">01</option>
														
															<option value="02">02</option>
														
															<option value="03">03</option>
														
															<option value="04">04</option>
														
															<option value="05">05</option>
														
															<option value="06">06</option>
														
															<option value="07">07</option>
														
															<option value="08">08</option>
														
															<option value="09">09</option>
														
															<option value="10">10</option>
														
															<option value="11">11</option>
														
															<option value="12">12</option>
														
															<option value="13">13</option>
														
															<option value="14">14</option>
														
															<option value="15">15</option>
														
															<option value="16">16</option>
														
															<option value="17">17</option>
														
															<option value="18">18</option>
														
															<option value="19">19</option>
														
															<option value="20">20</option>
														
															<option value="21">21</option>
														
															<option value="22">22</option>
														
															<option value="23">23</option>
														
													</select>
												</div>
												
												<div class="inputLabelWrap">
													<span class="inputLabelTitle">Minutes</span><br/>
													<select name="toMinutes" disabled="disabled">
														
															<option value="00">00</option>
														
															<option value="01">01</option>
														
															<option value="02">02</option>
														
															<option value="03">03</option>
														
															<option value="04">04</option>
														
															<option value="05">05</option>
														
															<option value="06">06</option>
														
															<option value="07">07</option>
														
															<option value="08">08</option>
														
															<option value="09">09</option>
														
															<option value="10">10</option>
														
															<option value="11">11</option>
														
															<option value="12">12</option>
														
															<option value="13">13</option>
														
															<option value="14">14</option>
														
															<option value="15">15</option>
														
															<option value="16">16</option>
														
															<option value="17">17</option>
														
															<option value="18">18</option>
														
															<option value="19">19</option>
														
															<option value="20">20</option>
														
															<option value="21">21</option>
														
															<option value="22">22</option>
														
															<option value="23">23</option>
														
															<option value="24">24</option>
														
															<option value="25">25</option>
														
															<option value="26">26</option>
														
															<option value="27">27</option>
														
															<option value="28">28</option>
														
															<option value="29">29</option>
														
															<option value="30">30</option>
														
															<option value="31">31</option>
														
															<option value="32">32</option>
														
															<option value="33">33</option>
														
															<option value="34">34</option>
														
															<option value="35">35</option>
														
															<option value="36">36</option>
														
															<option value="37">37</option>
														
															<option value="38">38</option>
														
															<option value="39">39</option>
														
															<option value="40">40</option>
														
															<option value="41">41</option>
														
															<option value="42">42</option>
														
															<option value="43">43</option>
														
															<option value="44">44</option>
														
															<option value="45">45</option>
														
															<option value="46">46</option>
														
															<option value="47">47</option>
														
															<option value="48">48</option>
														
															<option value="49">49</option>
														
															<option value="50">50</option>
														
															<option value="51">51</option>
														
															<option value="52">52</option>
														
															<option value="53">53</option>
														
															<option value="54">54</option>
														
															<option value="55">55</option>
														
															<option value="56">56</option>
														
															<option value="57">57</option>
														
															<option value="58">58</option>
														
															<option value="59">59</option>
														
													</select>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>						
						</table>
					</div>
					
					<div class="itemContents">Hide this popup and click on the "configure graphs" to make persistent changes to the default graph size or interval. (Changes made here will only apply to the next graph displayed in this popup.)</div>
					
					<div class="itemContents" align="right">
						<input type="button" name="update" value="update" id="graphUpdate" />
						<input type="button" name="hide" value="hide" id="graphHide2" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="web/resources/images/tertiaryOnBL.gif" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="web/resources/images/tertiaryOnBR.gif" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>

<form action="#" onsubmit="return false">
<div id="editGraphDefaults" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEditGraphDefaultsTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Graph Display</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">	
				<div id="popupEditGraphDefaultsBody" class="popupBody">
					<div class="itemContents">
						<div class="itemContents">
							Edit the setting below to set the width, height, and interval of the thumbnail graphs and fullsized graphs <strong>on this page only</strong>. Note that these settings are for user <strong>admin</strong>.
						</div>
						
						<div class="itemLabel">Default Interval</div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Hours</span><br/>
											<select name="hours">
												
													<option value="00">00</option>
												
													<option value="01">01</option>
												
													<option value="02">02</option>
												
													<option value="03">03</option>
												
													<option value="04">04</option>
												
													<option value="05">05</option>
												
													<option value="06">06</option>
												
													<option value="07">07</option>
												
													<option value="08">08</option>
												
													<option value="09">09</option>
												
													<option value="10">10</option>
												
													<option value="11">11</option>
												
													<option value="12">12</option>
												
													<option value="13">13</option>
												
													<option value="14">14</option>
												
													<option value="15">15</option>
												
													<option value="16">16</option>
												
													<option value="17">17</option>
												
													<option value="18">18</option>
												
													<option value="19">19</option>
												
													<option value="20">20</option>
												
													<option value="21">21</option>
												
													<option value="22">22</option>
												
													<option value="23">23</option>
												
											</select>
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Minutes</span><br/>
											<select name="minutes">
												
													<option value="00">00</option>
												
													<option value="01">01</option>
												
													<option value="02">02</option>
												
													<option value="03">03</option>
												
													<option value="04">04</option>
												
													<option value="05">05</option>
												
													<option value="06">06</option>
												
													<option value="07">07</option>
												
													<option value="08">08</option>
												
													<option value="09">09</option>
												
													<option value="10">10</option>
												
													<option value="11">11</option>
												
													<option value="12">12</option>
												
													<option value="13">13</option>
												
													<option value="14">14</option>
												
													<option value="15">15</option>
												
													<option value="16">16</option>
												
													<option value="17">17</option>
												
													<option value="18">18</option>
												
													<option value="19">19</option>
												
													<option value="20">20</option>
												
													<option value="21">21</option>
												
													<option value="22">22</option>
												
													<option value="23">23</option>
												
													<option value="24">24</option>
												
													<option value="25">25</option>
												
													<option value="26">26</option>
												
													<option value="27">27</option>
												
													<option value="28">28</option>
												
													<option value="29">29</option>
												
													<option value="30">30</option>
												
													<option value="31">31</option>
												
													<option value="32">32</option>
												
													<option value="33">33</option>
												
													<option value="34">34</option>
												
													<option value="35">35</option>
												
													<option value="36">36</option>
												
													<option value="37">37</option>
												
													<option value="38">38</option>
												
													<option value="39">39</option>
												
													<option value="40">40</option>
												
													<option value="41">41</option>
												
													<option value="42">42</option>
												
													<option value="43">43</option>
												
													<option value="44">44</option>
												
													<option value="45">45</option>
												
													<option value="46">46</option>
												
													<option value="47">47</option>
												
													<option value="48">48</option>
												
													<option value="49">49</option>
												
													<option value="50">50</option>
												
													<option value="51">51</option>
												
													<option value="52">52</option>
												
													<option value="53">53</option>
												
													<option value="54">54</option>
												
													<option value="55">55</option>
												
													<option value="56">56</option>
												
													<option value="57">57</option>
												
													<option value="58">58</option>
												
													<option value="59">59</option>
												
											</select>
										</div>
									</td>
								</tr>
							</table>
						</div>

						<div class="itemLabel">Thumbnail Dimensions</div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Width</span><br/>
											<input type="text" name="thumbWidth" size="5" />
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Height</span><br/>
											<input type="text" name="thumbHeight" size="5" />
										</div>
									</td>
								</tr>
							</table>
						</div>
						
						<div class="itemLabel">Full-sized Graph Dimensions</div>
						<div class="itemContents">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Width</span><br/>
											<input type="text" name="width" size="5" />
										</div>
										
										<div class="inputLabelWrap">
											<span class="inputLabelTitle">Height</span><br/>
											<input type="text" name="height" size="5" />
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="itemContents" align="right">
						<input type="button" name="save" value="save" id="editGraphDefaultsSubmit" />
						<input type="button" name="cancel" value="cancel" id="editGraphDefaultsHide" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="web/resources/images/tertiaryOnBL.gif" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="web/resources/images/tertiaryOnBR.gif" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>

<form action="#" onsubmit="return false">
<div id="editFavorites" class="popup">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" class="popupTab" id="popupEditFavoritesTab">
											<tr>
												<td class="tabLeft"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
												<td class="tabBody">Favorite Graphs</td>
												<td class="tabRight"><img src="web/resources/images/spacer.gif" width="8" height="7" alt="" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="tertiaryTopRight"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="tertiaryBody">	
				<div id="popupEditFavoritesBody" class="popupBody">
					<div class="itemContents">
						<div class="itemContents">
							Select which graphs will appear on this page. Note that these settings are for user <strong>admin</strong>.
						</div>
						
						<div class="itemLabel">Favorites <span class="itemLabelModifier">(Max of <span id="maxFavorites"></span>)</span></div>
						<div class="itemContents">
							<select name="favorites" multiple="multiple" size="6">
								
									<option value="-1">[none]</option>
								
									<option value="Hit Ratios">Hit Ratios</option>
								
									<option value="Database Activity">Database Activity</option>
								
									<option value="Connections">Connections</option>
								
									<option value="CPU Utilization">CPU Utilization</option>
								
									<option value="InnoDB Buffer Pool">InnoDB Buffer Pool</option>
								
									<option value="KBytes In/Out">KBytes In/Out</option>
								
									<option value="RAM Usage">RAM Usage</option>
								
									<option value="Table Locks">Table Locks</option>
								
									<option value="Thread Cache">Thread Cache</option>
								
							</select>
						</div>
					</div>
					
					<div class="itemContents" align="right">
						<input type="button" name="save" value="save" id="editFavoritesSubmit" />
						<input type="button" name="cancel" value="cancel" id="editFavoritesHide" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="tertiaryBL"><img src="web/resources/images/tertiaryOnBL.gif" width="8" height="7" alt="" /></td>
						<td class="tertiaryBC"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
						<td class="tertiaryBR"><img src="web/resources/images/tertiaryOnBR.gif" width="8" height="7" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</form>



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