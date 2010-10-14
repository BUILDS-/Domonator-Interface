<?php
# PHP example authenticated call
#
# Roland Jaeckel 8/19/2004
#
# include the mechanisms to send and receive XML package
require('edu/bu/nis/XmlGateway/Connector/VendorRequest.php');
require('edu/bu/nis/XmlGateway/Connector/BuResponse.php');
#
#
# The vendor needs to handle the session ID from UIS internally
# to be able to communicate with the XML gateway
# This example stores it in PHP session variable
session_start();
$session = $_SESSION['xml_gateway_session'];
# instantiate object
$request = new VendorRequest();
$request->setUrl('http://www-test.bu.edu/link/bin/uiscgi_shared_xml.pl/uismpl');
$request->setSession($session);
$request->setParameter('ModuleName', $_GET['ModuleName']);
$request->setSyncUrl();

$response	= $request->getResponse();

if ($request->isError()) {
	$ErrorMsg = $request->getErrorMsg();
	print "System Error: $ErrorMsg\n";
	exit;
}
$_SESSION['xml_gateway_session'] = $response->getSession();

if ($response->get_Type() == 'ERROR') {
	# to see what's going on
	$responseHTML = $response->getHtml();
	print($responseHTML);
} elseif ($response->get_Type() == 'LOGIN') {
	# to see what's going on
	$responseHTML = $response->getHtml();
	print($responseHTML);
} elseif ($response->get_Type() == 'DATA') {
	$UserAlias	= $response->getAlias();
	$UserId		= $response->getId();
	$UserName	= $response->getName();
	$UserEmail	= $response->getEmail();


	print <<<XXX
		<html>
			<head>
				<title>User Information</title>
			</head>
			<body>
				<h3>USER INFORMATION</h3>
				<hr>
				<br>
				<p>User Alias: <b>$UserAlias</b></p>
				<p>User Id:&nbsp;&nbsp;&nbsp;&nbsp;<b>$UserId</b></p>
				<p>User Name:&nbsp;&nbsp;<b>$UserName</b></p>
				<p>User Email:&nbsp;&nbsp;<b>$UserEmail</b></p>
			</body>
		</html>
XXX;

} else {
	print "XmlGateway Error: Unsupported data type $response->getType()\n";
}
?>
