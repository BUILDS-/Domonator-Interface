<?php
/**
 *  Class     : BuResponse
 *  Version	  : 2.1 Release 7
 *  Title      : Response from BU UIS Service.
 *  Description: This interface provides methods to parse a response XML document
 * 				from BU Computing Services
 * PHP version by Roland Jaeckel 8/10/2004
 * Modified: 11/03/06 by Michael Shulman : New attribute transaction added to BuResponse
 * Modified: 01/19/07 by Michael Shulman : Added encodeXml sync url to VendorRequest
 * Modified: 02/12/10 by Michael Shulman : Added added getTracaction and getType. get_Tracaction and get_Type are depricated 
 */

# Constants
#	define('VERSION', '2.1');
class BuResponse {

	# variables
	var $alias;
	var $content;
	var $custom_data;
	var $email;
	var $html;
	var $id;
	var $message;
	var $name;
	var $parameters;
	var $parsed;
	var $session;
	var $subtype;
	var $type;
	var $url;
	var $version;
	var $xsi_type;
	var $transaction;

	/**
	* Constructor
	*/
	function BuResponse($content) {
		$this->content = $content;
		//exit;
	}
	/**
	 *"private" method to initialize fields.  It always sets ....
	 * If called with arguments, _init
	 * interprets them as key+value pairs to initialize the object with.
	 */
	function _init($parameters) {
	/*	if (is_array($parameters)) {
			foreach($parameters as $key=>$val) {
				$self->parameters[$key] = $value;
			}
		}*/
	}
	/**
	 * Retrieves client's BU Login name (alias)
	 */
	function getAlias() {
		if (!$this->parsed) $this->_parseContent();
		return $this->alias;
	}
	/**
	 * Retrieves custom data from BU Computing services response
	 */
	function getCustomData() {
		if (!$this->parsed) $this->_parseContent();
		return $this->custom_data;
	}
	/**
	 * Retrieves client's email address if available
	 */
	function getEmail() {
		if (!$this->parsed) $this->_parseContent();
		return $this->email;
	}
	/**
	* Retrieves the response HTML page from BU Computing Services.
	*/
	function getHtml() {
		if (!$this->parsed) $this->_parseContent();
		return $this->html;
	}
	/**
	 * Retrieves client's BU unique ID (UID).
	 */
	function getId() {
		if (!$this->parsed) $this->_parseContent();
		return $this->id;
	}
	/**
	* Retrieves the response message from BU Computing Services.
	*/
	function getMessage() {
		if (!$this->parsed) $this->_parseContent();
		return $this->message;
	}
	/**
	*  Retrieves client's Full Name
	*/
	function getName() {
		if (!$this->parsed) $this->_parseContent();
		return $this->name;
	}
	/**
	* Retrieves value for one particaular parameter from BU Computing Services response
	*/
	function getParameter($name) {
		if (!$this->parsed) $this->_parseContent();
		# simplify when single array member
		if(count($this->parameters[$name]) == 1) {
			return $this->parameters[$name][0];
		} else {
			return $this->parameters[$name];
		}
	}
	/**
	* Retrieves list of names for all parameters from BU Computing Services response.
	*/
	function getParameterNames() {
		if (!$this->parsed) $this->_parseContent();
		return (array_keys($this->parameters));
	}
	/**
	*  Retrieves list of all values for one particaular parameter from BU Computing
	* Services response.
	*/
	function getParameterValues($name) {
		if (!$this->parsed) $this->_parseContent();
		return (isset($this->parameters[$name])) ? ($this->parameters[$name]) : '';
	}
	/**
	* Retrieves the value of BU WebLink session key for the current request.
	*/
	function getSession() {
		if (!$this->parsed) $this->_parseContent();
		return $this->session;
	}
	/**
	 *	Retrieves the sub_type of BU response.
	 */
	function getSubType() {
		if (!$this->parsed) $this->_parseContent();
		return $this->subtype;
	}
	/**
	 * Retrieves the transaction of BU response.
	 */
	function getTransaction() {
		if (!$this->parsed) $this->_parseContent();
		return $this->transaction;
	}
	/**
	 * Retrieves the type of BU response.
	 */
	function getType() {
		if (!$this->parsed) $this->_parseContent();
		return ($this->xsi_type? $this->xsi_type : $this->type);
	}	
	/**
	 * Retrieves the transaction of BU response. Depricated use getTransaction
	 */
	function get_Transaction() {
		if (!$this->parsed) $this->_parseContent();
		return $this->transaction;
	}
	/**
	 * Retrieves the type of BU response. Depricated use getType
	 */
	function get_Type() {
		if (!$this->parsed) $this->_parseContent();
		return ($this->xsi_type? $this->xsi_type : $this->type);
	}
	/**
	 * Retrieves the url to BU "PreLogin" Service.
	 */
	function getUrl() {
		if (!$this->parsed) $this->_parseContent();
		return $this->url;
	}
	/**
	 * Retrieves the version of BU Response XML document
	 */
	function getVersion() {
		if (!$this->parsed) $this->_parseContent();
		return $this->version;
	}
	/**
	 *  Retrieves the response XML document for future 'manual' processing without
	 *  using most of current interface methods.
	 */
	function getXml() {
		if (!$this->parsed) $this->_parseContent();
		return $this->content;
	}
	/**
	 *# Parse Content
	 */
	function _parseContent() {
		# instantiate parser
		$parser = xml_parser_create();
		xml_set_element_handler($parser, array(&$this,"_StartHandler"), array(&$this,"_EndHandler"));
		xml_set_character_data_handler($parser, array(&$this,'_CharHandler'));
		xml_parse($parser, $this->content);
		$this->parsed = 1;
	}
	function _StartHandler($p, $element, $attributes) {

			if ( $element == 'BU_UIS_OUTPUT' ) {
				$this->version	= $attributes['VERSION'];
				$this->session	= $attributes['SESSION'];
				$this->xsi_type	= $attributes['XSI:TYPE'];
				$this->type		= $attributes['TYPE'];
				$this->subtype	= $attributes['SUBTYPE'];
				$this->alias	= $attributes['ALIAS'];
				$this->id		= $attributes['ID'];
				$this->name		= $attributes['NAME'];
				$this->email	= $attributes['EMAIL'];
				$this->transaction	= $attributes['TRANSACTION'];
			}
			if ( $element == 'HTML' ) {
				$this->url		= $attributes['URL'];
			}
			if ( $element == 'PARAMETERS' ) {
				$this->parametersElementInd = 'ON';
			}
			if ( $element == 'PARAM' && $this->parametersElementInd == 'ON' ) {
				$this->parameters[$attributes['NAME']][] = $attributes['VALUE'];
			}
			$this->tagname = $element;
	}
	function _CharHandler($p, $characters) {
			$element = $this->tagname;

			if ($element == 'MESSAGE') {
				$this->message .= $characters;
			}
			if ($element == 'HTML') {
				$this->html .= $characters;
			}
			if ($element == 'CUSTOM_DATA') {
				$this->custom_data .= $characters;
			}
	}
	function _EndHandler($p, $element) {
			if ( $element == 'PARAMETERS' ) {
				$this->parametersElementInd = 'OFF';
			}
	}

}
?>