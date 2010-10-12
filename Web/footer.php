
									</div>
								</td>
							</tr>
							<tr>
								
								<td id="bodyBottom">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr class="secondaryFooterBG">
											<td><img src="web/resources/images/secondaryBL.gif" width="8" height="7" alt=""/></td>
											<td class="right"><img src="web/resources/images/secondaryBR.gif" width="8" height="7" alt=""/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div id="footer">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td><img src="..web/resources/images/primaryTL.gif" width="5" height="5" alt=""/></td>
								<td class="right"><img src="..web/resources/images/primaryTR.gif" width="5" height="5" alt=""/></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td id="copyright"> Copyright &copy; <?php echo date('Y'); ?> John-Nicholas Furst - <a href="http://www.john-nicholas.net/" target="_blank">BUILDS</a>. All rights reserved.</td>
											
											<td id="footerInfo">
											<?php
											if (isset($_COOKIE['username']))
											{
												//echo "Logged in as <strong> $_COOKIE['username'] </strong>";
											echo 'Logged in as "<strong>';
											echo $_COOKIE["username"];
											echo'</strong>" ';
											}
											echo'(';
											$today = date("F j, Y, g:i a");
											echo $today;
											?>)</td>
										</tr>
									</table>
								</td>
								
							</tr>
							<tr>
								<td id="license">
									
										
										
									
									
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td><img src="..web/resources/images/primaryBL.gif" width="5" height="5" alt=""/></td>
								<td class="right"><img src="..web/resources/images/primaryBR.gif" width="5" height="5" alt=""/></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>		
		<table id="fader">
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="web/resources/images/secondaryTL.png" width="8" height="7" alt="" /></td>
							<td class="secondaryHeaderSpacer"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
							<td><img src="web/resources/images/secondaryTR.png" width="8" height="7" alt="" /></td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td class="noticeBody">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td>Notice:</td>
										<td class="right"><img src="web/resources/images/deleteIcon11.gif" id="noticeClose" width="11" height="11" alt="close" style="cursor: pointer;" /></td>
									</tr>
								</table>
								<ul id="noticeMessages">
								</ul>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td><img src="web/resources/images/secondaryBL.png" width="8" height="7" alt="" /></td>
							<td class="secondaryFooterSpacer"><img src="web/resources/images/spacer.gif" width="1" height="1" alt="" /></td>
							<td><img src="web/resources/images/secondaryBR.png" width="8" height="7" alt="" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>	
	</body>
</html>