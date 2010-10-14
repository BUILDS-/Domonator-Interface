<?php
/**
 *  Class     : VendorRequest
 *  Version	  : 2.1 Release 7
 *  Title      : Request for BU UIS Service.
 *  Description: This interface provides methods to send a request XML document
 * 				for BU Computing Services
 * PHP version by Roland Jaeckel 8/10/2004
 * Modified by Roland Jaeckel 12/2/2004 to create replacement for function 'file_get_content'
 *										 if this function is undefined in installed version of PHP
 * Modified: 11/03/06 by Michael Shulman : New attribute transaction added to BuResponse
 * Modified: 01/19/07 by Michael Shulman : Added encodeXml sync url to VendorRequest
 * Modified: 04/30/09 by Michael Shulman : setSuncUrl use $_SERVER['SERVER_NAME'] instead off $_SERVER['HTTP_HOST']
 */

#include_once "HTTP/Request.php";

# Constants
define('VERSION'	,'2.1');
define('REQUEST_TEMPLATE_LOCATION','request.xmt');
define('DEFAULT_SYNC_METHOD', 'GET');
define('DEFAULT_XML_REQUEST_SCHEMA', 'http://www.bu.edu/uis/XmlGateway');
define('DEFAULT_XML_REQUEST_SCHEMA_LOC', 'http://www.bu.edu/link/system/schemas/XmlGateway/Request.xsd');

# define connection timeout
define('CONN_TIMEOUT',30);

class VendorRequest{

		# define class variables
		# url
		var $url;
		var $host;
		var $path;
		# parameters
		var $parameters;
		# synchronization parameters
		var $syncParameters;
		var $syncUrl;
		var $syncMethod;
		var $session;
		# custom data
		var $customData;
		# error vars
		var $error;
		var $errorMsg;
		var $errorInd;
		# xml
		var $xml;
		var $xmlRequestSchema;
		var $xmlRequestSchemaLoc;
		var $_fp;

	/**
	 * CONSTRUCTOR
	 */
	function VendorRequest($params='') {
		# if parameters passed initialize them
		# they need to be passed as associative array
		if(is_array($params) && count($params>=1)) {
			foreach($params as $key=>$val) {
				$this->parameters[$key] = $val;
			}
		}
	}
	/**
	 * Add one parameter to send to BU Computing Services
	*/
	function addParameter($key, $value) {
		$this->parameters[$key] = $value;
	}
	/**
	 * Add one synchronization parameter to send to BU Computing Services to regain
	 * the control back after asynchronous process (LOGIN) will be completed
	 */
	function addSyncParameter($key, $value) {
		$this->syncParameters[$key] = $value;
	}
	/**
	 * Retrieves error message
	 */
	function getErrorMsg() {
		return $this->errorMsg;
	}
	/**
	 * Retrieves return code
	 * !!! Deprecated. Replaced with isError()
	 */
function getReturnCd() {
	return $this->isError();
}
	/**
	 * Sends request XML document to BU Computing Services and returns the response as
	 * a BuResponse object.
	*/
	function getResponse() {
		if(empty($this->xml)) $this->_createXml();			# if inputXml is not set we create it

		$this->openServer();

		# socket connection sucessful?
		if (!$this->_fp) {
			return (array("rc"=>"-6500","errortext"=>"Socket errors","values"=>$this->_error));
		}
		$requestContent = rawurlencode($this->xml);
		# construct payload
		$msg = "GET ".$this->path.'/'. rand() .'?'.$requestContent." HTTP/1.0\r\n";
		# make payload
		$msg .= "User-Agent: BU PHP XML Gateway\r\n";
		$msg .= "Host: ".$this->host."\r\n";
//		$msg .= "Content-Type: application/x-www-form-urlencoded;\r\nContent-Length: ".strlen($requestContent)."\r\n\r\n";
		$msg.= "\r\n\r\n";
		# send the message in buffer fashion
		$msgLength = strlen($msg);
		while(strlen($msg) > 0) {
			$sent = fwrite($this->_fp, $msg);
			$msg = substr($msg,$sent);
			$totalBytes = $totalBytes + $sent;
		}

		# check for correct sent bytes total
		if($totalBytes != $msgLength) {
			$this->error[] = array('-6504',"Expected to send $msgLength bytes but only $totalBytes sent");
			return;
		}

		# read answer while socket is valid and message not ended
		while (!feof($this->_fp) && ($this->_fp)){
			$data = fread($this->_fp, 1024);
			$contents .= $data;
		}

		# get socket status
		$status = socket_get_status($this->_fp);

		# close socket under all cicumstances
		fclose($this->_fp);

		if ($status['timed_out']) {
			$this->error[] = (array('-6501','Socket timed out. Timeout set was '.$this->_timeout));
			return;
		}
		$rContent = (substr(strstr($contents,"\r\n\r\n"),4));
		# content starts after the double \r\n
		$response = new BuResponse($rContent);
		return $response;
	}
	/**
	 * open server method - private
	*/
	function openServer() {

		# open TCP socket
		$this->_fp = fsockopen($this->host, 80, $errno, $errstr, CONN_TIMEOUT);
		if($errno || !$this->_fp) {
				$this->error[] = array('-6502','Socket open connection error: '.$errno.' '.$errstr);
		}
		if(!$this->_fp) {
			$this->error[] = (array('-6502','Socket connection error'));
			return -1;
		}
	}


	/**
	* Checks for errors
	*/
	function isError() {
		return ($this->errorInd == 'ON') ? 1 : 0;
	}
	/**
	 *  Sets Custom Data to send to BU Computing Services.
	*/
	function setCustomData($data)  {
		$this->customData[] = "<![CDATA[$data]]>";
	}
	/**
	 * Sets one single value parameter to send to BU Computing Services.
	*/
	function setParameter($name, $value) {
		$this->setParameterValues($name, $value);
	}
	/**
	 * Sets all parameters to send to BU Computing Services.
	 * $parameters must refer to hash of arrays or
	 * be a string with XML content
	*/
	function setParameters($parameters) {
		$this->parameters= $parameters;
	}
	/**
	 * Sets one single or multi value parameter to send to BU Computing Services.
	*/
	function setParameterValues($name, $values) {
		$this->parameters[$name] = $values;
	}
	/**
	 * Sets Session for current Vendor's session with BU Computing Services
	 */
	function setSession($session) {
		$this->session = $session;
	}
	/**
	 * Sets method to be used to send HTTP(s) message to Vendor application
	* to regain the control back after asynchronous process (LOGIN) will be completed.
	*/
	function setSyncMethod($method) {
		$this->syncMethod = $method;
	}
	/**
	 * Sets one single value synchronization parameter to send to BU Computing Services
	 * to regain the control back after asynchronous process (LOGIN) will be completed.
	 */
	function setSyncParameter($name, $value) {
		$this->setSyncParameterValues($name, $value);
	}
	/**
	 * Sets one single or multi value synchronization parameter to send to BU Computing
	 * Services to regain the control back after asynchronous process (LOGIN) will be
	 * completed.
	*/
	function setSyncParameterValues($name, $values) {
		$this->syncParameters[$name] = $values;
	}
	/**
	 * Sets all synchronization parameters to send to BU Computing Services to regain
	 * the control back after asynchronous process (LOGIN) will be completed.
	 * $parameters must refer to hash of arrays or
	 * be a string with XML content
	 */
	function setSyncParameters($parameters) {
		$this->syncParameters = $parameters;
	}
	/**
	 * Sets URL to Vendor application to regain the control back after asynchronous
	 * process (LOGIN) will be completed.
	 */
	function setSyncUrl($url='') {

		if ($url == '') {								# vendor wants default syncUrl
			# ascertain current script environment parameters

			$method = $_SERVER['REQUEST_METHOD'];
			$this->syncMethod = $method;
			if ($method == "POST") {
				foreach($_POST as $key=>$value) {
					$this->addSyncParameter($key, $value);
				}
			}
#			$url = $_SERVER['SCRIPT_NAME'];
			if ($_ENV['HTTPS'] == 'on') {
				$url = 'https://';
			} else {
				$url = 'http://';
			}
			$url .= $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . $_SERVER['SCRIPT_NAME'] . $_SERVER['PATH_INFO'];
			if ($_SERVER['QUERY_STRING'] != '') {
				$url .= '?' . $_SERVER['QUERY_STRING'];
			}
		}
		$this->syncUrl = $this->_encodeXml($url);
	}
	/**
	 * Sets URL to BU Computing Services
	 */
	function setUrl($url) {
		$this->url = $url;
		$connArr = parse_url($url);
		$this->host = $connArr['host'];
		$this->path = $connArr['path'];
}
	/**
	 * Sets the request XML document to be send within the body of HTTP(s) request to
	 * BU Computing Services.
	 */
	function setXml($xml) {
		$this->xml = $xml;
	}
	/**
	* Sets the request XML schema
	*/
	function setXmlRequestSchema($xmlRequestSchema) {
		$this->xmlRequestSchema = $xmlRequestSchema;
	}
	/**
	 * Sets the request XML schema location
	 */
	function setXmlRequestSchemaLoc($xmlRequestSchemaLoc) {
		$this->xmlRequestSchemaLoc= $xmlRequestSchemaLoc;
	}
	/**
	 * Create Input Xml
	 */
	function _createXml() {
		# revert to default if not customized
		if(empty($this->syncMethod)) $this->syncMethod = DEFAULT_SYNC_METHOD;
		if(empty($this->xmlRequestSchema)) $this->xmlRequestSchema = DEFAULT_XML_REQUEST_SCHEMA;
		if(empty($this->xmlRequestSchemaLoc)) $this->xmlRequestSchemaLoc = DEFAULT_XML_REQUEST_SCHEMA_LOC;

	# if parameters are set as an array convert it to a string
		if(is_array($this->parameters)) $this->parameters = $this->_createParamString($this->parameters);
	# if syncronization parameters are set as an array convert it to a string
		if(is_array($this->syncParameters)) $this->syncParameters = $this->_createParamString($this->syncParameters);
/**
		$requestTemplateLoc = REQUEST_TEMPLATE_LOCATION;

		# load the template
		if (!$fileHandle	= fopen($requestTemplateLoc, 'r', TRUE)) {
			$this->errorInd = 'ON';
			$this->errorMsg = "Can't open template $requestTemplateLoc";
			return;
		}

		$_fstat = fstat($fileHandle);
		$this->xml = fread($fileHandle,$_fstat['size']);
		fclose($fileHandle);
*/
		$this->xml = file_get_contents(REQUEST_TEMPLATE_LOCATION, TRUE);

		# placeholder substitution
		$patterns[] = '/!SESSION_KEY!/';
		$patterns[] = '/!VERSION!/';
		$patterns[] = '/!XML_REQUEST_SCHEMA!/';
		$patterns[] = '/!XML_REQUEST_SCHEMA_LOC!/';
		$patterns[] = '/!SYNC_URL!/';
		$patterns[] = '/!SYNC_METHOD!/';
		$patterns[] = '/!PARAMETERS!/';
		$patterns[] = '/!SYNC_PARAMETERS!/';
		$patterns[] = '/!CUSTOM_DATA!/';
		# values
		$rValues[] = $this->session;
		$rValues[] = VERSION;
		$rValues[] = $this->xmlRequestSchema;
		$rValues[] = $this->xmlRequestSchemaLoc;
		$rValues[] = $this->syncUrl;
		$rValues[] = $this->syncMethod;
		$rValues[] = $this->parameters;
		$rValues[] = $this->syncParameters;
		$rValues[] = $this->customData;
		#execute in one preg_replace
		$this->xml = preg_replace($patterns, $rValues, $this->xml); ;
	}
	/**
	 * Create Param String
	 */
	function _createParamString($parameters) {
		foreach($parameters as $name=>$val){
			# check for array within val
			if(is_array($val)) {
				foreach($val as $cKey=>$sVal) {
					$encName	= $this->_encodeXml($name);
					$encValue	= $this->_encodeXml($sVal);
					$result		.= "\n\t\t<param name=\"$encName\" value=\"$encValue\"/>";
				}
			} else {
				$encName	= $this->_encodeXml($name);
				$encValue	= $this->_encodeXml($val);
				$result		.= "\n\t\t<param name=\"$encName\" value=\"$encValue\"/>";
			}
		}
		return $result;
	}
	/**
	 * Return the passed string after replacing all special and non-printable characters
	 * with their %XX hex values (URL-encoded)
	*/
	function _encodeUrl($Value) {
		return urlencode($Value);
	}
	/**
	 * Encode XML
	*/
	function _encodeXml($value) {
		return htmlspecialchars($value);
//		return $value;
	}
}
/**
 * Replace file_get_contents() if unavailable
 *
 * creates replacement function if function is undefined
 * Roland Jaeckel, 12/2/2004
 */
if (!function_exists('file_get_contents')) {
    function file_get_contents($filename, $includepath = false, $resource_context = null) {
        if (false === $fh = fopen($filename, 'rb', $includepath)) {
            trigger_error('file_get_contents() failed to open stream: No such file or directory', E_USER_WARNING);
            return false;
        }
        # refresh file size info
        clearstatcache();
        # ascertain file size if possible, otherwise read to <eof>
        if ($fsize = @filesize($filename)) {
            $data = fread($fh, $fsize);
        } else {
            $data = '';
            while (!feof($fh)) {
                $data .= fread($fh, 8192);
            }
        }
        fclose($fh);
        return $data;
    }
}
?>