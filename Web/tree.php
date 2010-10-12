									<td id="treeBody" class="secondaryBody" height="100%" valign="top">
										<!-- using table to deal with overflow rendering issue in firefox -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<div class="treeWidgetNodeList" id="navTree">
														
															<div class="treeWidgetNode"><span class="nodeSelector" id="treeGroup1Toggle"><img src="web/resources/images/spacer.gif" width="19" height="11" alt="" />&nbsp;</span><span class="nodeLabel" id="treeGroup1"><span>All Servers (1)</span></span><span class="nodeModifier"></span>
																<div class="treeWidgetNodeList">
																	
																		<div class="treeWidgetNode"><center><span class="nodeSelector"><img src="web/resources/images/spacer.gif" width="19" height="11" alt="" />&nbsp;</span><span class="nodeLabel" id="treeServer1.-.Group1"><span><?php echo $name; ?> <br> <?php echo "($login_add)";?></span></span><span class="nodeModifier"></span></center></div>
																	
																</div>
															</div>
													</div>
												</td>
											</tr>
										</table>
										<script type="text/javascript" language="javascript">
										/* <![CDATA[ */
											//TODO: push this into the tree.js file but pass in the location and param structures
											function handleTreeSelection(which) {
												var locationString = "index.php";
												var serverMatch = which.match('treeServer([0-9]+)\.-\.Group([0-9]+)');
												if(serverMatch) {
													var serverId = serverMatch[1];
													var parentGroupId = serverMatch[2];
													
												} else {
													var groupMatch = which.match('treeGroup([0-9]+)');
													var groupId = groupMatch[1];
													
												}
												document.location = locationString;
											}
											
											//create a new tree
											var treeInstance = new tree();
											//set a function for handling node selection
											treeInstance.setTree("navTree");
											treeInstance.setSelectedID("treeServer1.-.Group1");
											treeInstance.setSelectionHandler(handleTreeSelection);
											//initialize tree
											treeInstance.init();
										/* ]]> */
										</script>
									</td>
									<td class="treeToBodySpacer"><img src="web/resources/images/spacer.gif" width="10" height="1" alt="" /></td>
								
								<td id="bodyContentsWrapper" width="100%">
									
										
										
										
										
											<div id="secondaryNav"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></div>
									<div id="bodyContents">