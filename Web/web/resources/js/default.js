//TODO: reorganize by function type and adding notes tests and samples

/* PAGE INITIALIZATION FUNCTIONS */

//array for storing functions to load on DOM load time
var DOMLoadEvents = new Array();
//function for adding a function to the stack of things to run on DOM load time
function addDOMLoadListener(listener) {
	DOMLoadEvents.push(listener);
}

//initialize document
function initDocument() {
    // quit if this function has already been called
    if (arguments.callee.done) return;

    // flag this function so we don't do the same thing twice
    arguments.callee.done = true;

    // kill the timer
    if (typeof(_timer) != 'undefined') {
		 clearInterval(_timer);
	}
	
	//run the stack of functions scheduled for DOM load time
	for(var index in DOMLoadEvents) {
		DOMLoadEvents[index]();
	}
};

//assemble initialization to appropriately detect the DOM load event
function setupInit() {
	/* for Internet Explorer */
	/*@cc_on @*/
	/*@if (@_win32)
		document.write("<script id=__ie_onload defer src=javascript:void(0)><\/script>");
		var script = document.getElementById("__ie_onload");
		script.onreadystatechange = function() {
			if (this.readyState == "complete") {
				initDocument(); // call the onload handler
			}
		};
		return;
	/*@end @*/
	
	/* for Safari */
	if (/WebKit/i.test(navigator.userAgent)) { // sniff
		var _timer = setInterval(function() {
			if (/loaded|complete/.test(document.readyState)) {
				initDocument(); // call the onload handler
			}
		}, 10);
		return;
	//else, add a listener to the document for the DOMContentLoaded event
	} else {
		eventManager.registerListener(document, 'DOMContentLoaded', initDocument);
		//it will never run twice and rather than doing fragile support sniffing, just schedule it for load in case 'DOMContentLoaded' never fires
		eventManager.registerListener(window, 'load', initDocument);
	}
}

function IECleanup() {
	/* for Internet Explorer */
	/*@cc_on @*/
	/*@if (@_win32)
		var script = document.getElementById("__ie_onload");
		script.onreadystatechange = null;
		return;
	/*@end @*/
}

/* REUSABLE DISPLAY SNIFF */

//variables to provide browser specific cell and row display
var tableCellDisplay;
var tableRowDisplay;
var testCell = document.createElement('td');
try {
	testCell.style.display = 'table-cell';
	tableCellDisplay = 'table-cell';
	tableRowDisplay = 'table-row'
} catch(e) {
	tableCellDisplay = 'inline-block';
	tableRowDisplay = 'inline-block';
}

var IEVersionArray = navigator.appVersion.split("MSIE");
var IEVersion = IEVersionArray.length > 1 ? parseFloat(IEVersionArray[1]) : NaN;
var useIEBranch = isNaN(IEVersion) ? false : true;



//function to cause a processing delay, not currently recommended for more than debugging use - will cause a cpu spike
function wait(milliseconds) {
	var currentDate = new Date();
	var targetDate = currentDate.getTime() + milliseconds;
	var count = 0;
	while(targetDate > currentDate.getTime()) {
		currentDate = new Date();
		count++;
	}
	return count;
} 

//a wrapper class to allow you to easily pass arguments to a settimeout call, useful in iteration
function asynchWrapper(functionReference, timeout, argumentList) {
	var _self = this;
	var _function = functionReference;
	var _timeout = timeout;
	var _arguments = argumentList;
	
	_self.run = function() {
		window.setTimeout(_self.doRun, _timeout);
	}
	
	_self.doRun = function() {
		_function(_arguments)
	}
	
}

//return object if passed ID or object - allows for easier use of references on page
function returnObject(objectReference) {
	if (typeof(objectReference) == "string") {
		if (document.getElementById(objectReference)) {
			if (document.getElementById(objectReference).id == objectReference) {
				return document.getElementById(objectReference);
			} else {
				return null;
			}
		} else {
			return null;
		}
	} else if (typeof(objectReference) == "object") {
		return objectReference;
	} else {
		return null;
	}
}

function setInnerHTML(object, value) {
	try {
		object.innerHTML = value;
	} catch (e) {
		//if this is xhtml, it doesn't like to set by using the innerHTML property, try to append a text node instead
		try {
			var textNode = document.createTextNode(value);
			object.appendChild(textNode);
		} catch (e) {
			alert(e.message + " " + typeof(object.innerHTML) + " " +  value);
		}
	}	
}

//takes the NAME of a variable and tests to see if it is defined
function isset(variable) {
	//TODO: figure out how to pass in a variable that has not been initialized... window[varname] the only way?
	if (typeof(window[variable]) != 'undefined') {
		//return 1;
		return true;
	} else if ((typeof(variable) == "object") && (variable != null)) {
		//return 2;
		return true;
	} else {
		//return 3;
		return false;
	}
}


//replacement of indexOf method in arrays, using function instead of prototype due to iterative applications that cause unsupported errors on this property
function getIndexOf(object, value) {
	if(typeof(Array.indexOf) != 'undefined') {
		return object.indexOf(value);
	} else {
		for(var i in object) {
			if(object[i] == value) {
				return i;
			}
		}
		return -1;
	}
}

//UI event handling - verify against event management from quirksmode and confirm licencing if required
//TODO: make this a function/class so you can put registered listeners into it
//TODO: comment well
//TODO: put event position retrieval here?
var registeredListeners = new Array();
var eventManager = {
	returnEvent : function(event) {
		if (!event) {
			event = window.event;
		}
		if (event.target) {
			// defeat Safari bug
			if (event.target.nodeType == 3) {
				event.target = event.target.parentNode;
			}
		} else if (event.srcElement) {
			event.target = event.srcElement;
		}
		return event;
	},
	
	registerListener : function(object, eventType, handler) {
		object = returnObject(object);
		if (object.addEventListener) {
			object.addEventListener(eventType, handler, false);
		} else if (object.attachEvent) {
			object.attachEvent('on' + eventType, handler);
		}
		var registeredListener = {'object' : object, 'eventType' : eventType, 'handler' : handler}
		registeredListeners.push(registeredListener);
		return registeredListener;
	},
	
	unregisterListener : function(object, eventType, handler) {
		object = returnObject(object);
		if (object.removeEventListener) {
			object.removeEventListener(eventType, handler, false);
			return true;
		} else if (object.detachEvent) {
			return (object.detachEvent('on' + eventType, handler));
		} else {
			return false;
		}
	},
	
	unregisterListenerObject : function(object) {
		for(var i = 0; i < registeredListeners.length; i++) {
			if(object === registeredListeners[i]) {
				registeredListeners.splice(i, 1);
				break;
			}
		}
		try {
			eventManager.unregisterListener(object.object, object.eventType, object.handler);
		//trying to cleanup an object that wasn't created
		} catch(e) {
			//alert(typeof(object));
		}
	},
	
	registeredListeners : new Array(),
	
	cleanup : function(listeners) {
		if(typeof(listeners) == 'undefined') {
			listeners = registeredListeners;
		}
		for(var i = 0; i <	listeners.length; i++) {
			eventManager.unregisterListener(listeners[i].object, listeners[i].eventType, listeners[i].handler);
		}
	}
}
//TODO: make this happen automatically
eventManager.registerListener(window, 'unload', function(){eventManager.cleanup()});
eventManager.registerListener(window, 'abort', function(){eventManager.cleanup()});
eventManager.registerListener(window, 'unload', function(){IECleanup()});
eventManager.registerListener(window, 'abort', function(){IECleanup()});

//generic page refresh
function reloadPage() {
	window.location.reload(true);	
}

/* DOM RELATED UTILITIES */

//returns all elements by name within a particular node - not as performant as getElementsByName but deals with multiple form name collisions
function getElementsByName(name, node) {
	//elements
	if (node == null) {
		var matches = document.getElementsByName(name);	
	} else if(node.nodeName.toLowerCase() == 'form') {
		var foundInputs = node.elements;
		var matches = new Array();
		for(var i = 0; i < foundInputs.length; i++) {
			if(foundInputs[i].name == name) {
				matches.push(foundInputs[i]);
			}
		}
	} else {
		var inputs = Array('input', 'select', 'submit', 'textarea');
		var matches = new Array();
		for(index in inputs) {
			var foundInputs = node.getElementsByTagName(inputs[index]);
			for(var i = 0; i < foundInputs.length; i++) {
				if(foundInputs[i].name == name) {
					matches.push(foundInputs[i]);
				}
			}
		}
	}
	return matches;
}
//return all elements with the given class name
function getElementsByClassName(className, node, tag, multi) {
	var classElements = new Array();
	//default to body if not set
	if (node == null) {
		node = document.body;		
	}
	//search all tags if not set
	if (tag == null) {
		tag = '*';
	}
	tag = tag.toLowerCase();
	var elements = node.getElementsByTagName(tag);

	//ignore multiple classname support unless explicitly turned on
	if(!multi) {
		for(var i = 0, j = 0; i < elements.length; i++) {
			if (elements[i].className == className) {
				classElements[j] = elements[i];
				j++;
			}
		}
	//do full search of classnames
	} else {
		var pattern = new RegExp("(^|\\s)" + className + "(\\s|$)");
		for(var i = 0, j = 0; i < elements.length; i++) {
			if (pattern.test(elements[i].className)) {
				classElements[j] = elements[i];
				j++;
			}
		}
	}
	return classElements;
}

function getAncestorWithClassName(object, searchClass) {
	var tempObject = object;
	var currentClassName;
	while(tempObject && (currentClassName != searchClass)) {
		//avoids issue with getAttribute returning error at top node
		if (tempObject.parentNode) {
			currentClassName = tempObject.className;
		}
		if (currentClassName == searchClass) {
			return tempObject;
		} else {
			tempObject = tempObject.parentNode;
		}
	}
	return false;
}

function getAncestorOfType(object, searchType) {
	searchType = searchType.toLowerCase();
	var tempObject = object;
	var currentNodeName;
	while(tempObject && (currentNodeName != searchType)) {
		//avoids issue with getAttribute returning error at top node
		if (tempObject.parentNode) {
			currentNodeName = tempObject.nodeName.toLowerCase();
		}
		if (currentNodeName == searchType) {
			return tempObject;
		} else {
			tempObject = tempObject.parentNode;
		}
	}
	return false;
}

//get the clicked element
function getClickedElement(event){
	event = eventManager.returnEvent(event);
	return event.target;
}

//return true if clicked object has ancestor with given ID
function isAncestorOf(event, testID) {
	event = eventManager.returnEvent(event);
	var clickedObject = getClickedElement(event);
	var tempObject = clickedObject;
	var objectID = null;
	while(tempObject && (objectID != testID)) {
		//avoids issue with getAttribute returning error at top node
		if (tempObject.parentNode) {
			objectID = tempObject.getAttribute('id');
		}
		if (objectID == testID) {
			return true;
		}
		tempObject = tempObject.parentNode;
	}
	return false;
}

//return first ancestor of of clicked object with an ID
function getAncestorID(event) {
	event = eventManager.returnEvent(event);
	var clickedObject = getClickedElement(event);
	var tempObject = clickedObject;
	var objectID = null;
	while(tempObject && (objectID == null)) {
		//avoids issue with getAttribute returning error at top node
		if (tempObject.parentNode) {
			objectID = tempObject.getAttribute('id');
		}
		tempObject = tempObject.parentNode;
	}
	return objectID;
}

//create a table object with default parameters
function createTable() {
	var newTable = document.createElement('table');
	//IE
	newTable.setAttribute('cellPadding',0);
	newTable.setAttribute('cellSpacing',0);
	//XHTML compliantn - need to do them together since setting either property does not result in an exception in any browser
	newTable.setAttribute('cellpadding',0);
	newTable.setAttribute('cellspacing',0);	
	return newTable;
}

function getImagePath(which) {
	return getFilePath(which.src);
}

function getFilePath(which) {
	return which.substring(0, which.lastIndexOf("/") + 1);
}

function getFileExtension(which) {
	return which.substring(which.lastIndexOf(".") + 1, which.length).toLowerCase();
}

//strip html tags from a string
String.prototype.stripHTML = function() {
	var strippedHTML = this.replace(/<\/?[^>]+>/gi, '');
	return strippedHTML;
}

//strip whitespace from a string
String.prototype.trim = function() {
	var trimmedString = this.replace(/^\s+/, '').replace(/\s+$/, '');
	return trimmedString;
}

function isValidEuroDate(value) {
	//strip padding
	value = value.trim();
	//split date string on "-" to get components
	var dateArray = value.split("-");
	//date format is european standard YYYY-MM-DD
	var year = parseInt(dateArray[0], 10);
	var month = parseInt(dateArray[1], 10);
	var day = parseInt(dateArray[2], 10);

	//make sure have 3 date components
	if(dateArray.length != 3) {
		return false;
	}
	
	//verify each component is an integer
	var pattern = /^\d+$/;
	var expression = new RegExp(pattern);
	for(var i in dateArray) {
		if(!pattern.test(dateArray[i])) {
			return false;
		}
	}
	
	//verify year greater than 1900
	if(year < 1900) {
		return false;
	}
	//check year for leap year, up monthLength[1] to 29 if so
	var monthLength = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	if (year/4 == parseInt(year/4, 10)) {
		monthLength[1] = 29;
	}
	
	//verify month between 1 and 12
	if(month < 1 || month > 12) {
		return false;
	}
	
	//verify date in range for month
	var lastDay = monthLength[month - 1];
	if(day < 1 || day > lastDay) {
		return false;
	}
	
	//passed all the tests
	return true;
}

function isEmpty(string) {
	var reg = /\S+/i;
	if (reg.test(string)) {
		return false;
	}
	return true;
}

//update an image to show correct size - function should be used in the image's load event
//NOTE: this can easily be misused to attach multiple listeners to the same image, be sure you are not attaching multiple copies each time you update an image
function updateImageSize(image, listener) {
	//if the behaviors from pngbehavior.htc have replaced this with a spacer image, this function is not necessary and will  shrink the image to 1 by 1
	if(typeof(image.runtimeStyle) != 'undefined') {
		return;
	}
	var testImage = document.createElement('img');
	
	testImage.src = image.src;
	//if the height and width properties are not set, or returning zero, attach the node to the document to get at the properties (Safari and possible other broswers)
	if(!(testImage.width > 0 || testImage.height > 0)) {
		testImage.style.position = 'absolute';
		testImage.style.left = '0px';
		testImage.style.top = '0px';
		testImage.style.visibility = 'hidden';
		document.body.appendChild(testImage);
	}
	//update width and height to values from test image (if values are now set, otherwise fail silently)
	if(testImage.width > 0 && testImage.height > 0) {
		image.width = testImage.width;
		image.height = testImage.height;
	}
	return;
}

/* EVENT RELATED UTILITIES */

//confirmation function for links and forms
//example : <a href="http://www.skylist.com" onclick="confirmAction(event, leaveSite)">confirm click test</a>
// above example - leave "this" and "event" as is, change "leaveSite" to variable reference to appropriate confirm string
function confirmAction(event, confirmationString) {
	event = eventManager.returnEvent(event);
	if (confirm(confirmationString)) {
		return true;
	} else {
		if (event.preventDefault) {
			event.preventDefault();
		} else if (window.event) {
			event.returnValue = false;
		}
		return false;
	}
}

//check to see if the given events happened inside of the bounds of the passed in object
function eventInBounds(event, object) {
	event = eventManager.returnEvent(event);
	//get the location of the event
	var eventCoordinates = getMouseCoordinates(event);
	//get the position of the 4 corners of the passed in object
	var objectCoordinates = findCoordinates(object);
	//test to see if event happened inside object coordinates
	if ((eventCoordinates['X'] > objectCoordinates['X1']) && (eventCoordinates['X'] < objectCoordinates['X2']) && (eventCoordinates['Y'] > objectCoordinates['Y1']) && (eventCoordinates['Y'] < objectCoordinates['Y2'])) {
		return true;
	} else {
		return false;
	}
}

//get location of mouse from event
function getMouseCoordinates(event) {
	event = eventManager.returnEvent(event);
	var position = new Array();
	position['X'] = 0;
	position['Y'] = 0;
	//IE
	if (document.all) {
		position['X'] = event.clientX + document.body.scrollLeft;
		position['Y'] = event.clientY + document.body.scrollTop;
	//OTHER
	} else {
		position['X'] = event.pageX;
		position['Y'] = event.pageY;
	}  
	// catch possible negative values in NS4
	if (position['Y'] < 0) {
		position['Y'] = 0;
	}
	if (position['X'] < 0) {
		position['X'] = 0;
	}
	return position;
}

//check all children functionality - specific to class name structure 
function updateCheckboxes(which){
	var currentRow = getAncestorOfType(which, 'tr');
	var negativeTextName;
	
	this.getIdentifier = function(row) {
		if(currentRow.nodeName.toLowerCase() == 'tr') {
			var identifier;
			var rowClass = row.className;
			if(rowClass.lastIndexOf("listRowCategoryL") != -1) {
				identifier  = rowClass.substring(("listRowCategoryL").length, rowClass.length);
			} else {
				identifier  = row.className;
			}
			return identifier;
		} else {
			return '';
		}
	}
	
	this.compareRows = function(row1Itentifier, row2Identifier) {
		if (!isNaN(parseInt(row1Itentifier)) && !isNaN(parseInt(row2Identifier, 10))) {
			//alert("\"" + parseInt(row1Itentifier) + "\" \"" + parseInt(row2Identifier) + "\" " + (row1Itentifier > row2Identifier));
			return (row1Itentifier > row2Identifier);
		} else {
			return (row1Itentifier != row2Identifier);
		}
	}
	
	negativeTextName = getIdentifier(currentRow);
	
	currentRow = currentRow.nextSibling;
	while(compareRows(getIdentifier(currentRow), negativeTextName)) {
		if(currentRow.nodeName.toLowerCase() == 'tr') {
			var rowCheckboxes = getElementsByClassName('checkbox', currentRow, 'input');
			if(rowCheckboxes.length > 0) {
				if(!rowCheckboxes[0].disabled) {
					rowCheckboxes[0].checked = which.checked;
				}
			}
		}
		if(currentRow.nextSibling) {
			currentRow = currentRow.nextSibling;
		} else {
			break;
		}
	}
}

//checks parent for having enabled first level children - if none, disables the checkbox
function updateDisabledCheckboxes(checkboxName){
	//function for getting the identifying portion of the class name (ingores the appended 'Alt")
	this.getIdentifier = function(which) {
		if(typeof(which.className) != 'undefined') {
			return which.className.replace("/Alt$/", "");
		}
		return null;
	}
	//get the checkboxes that match the provided name
	var parentCheckboxes = document.getElementsByName(checkboxName);
	//iterate over the found checkboxes
	for(var i = 0; i < parentCheckboxes.length; i++) {
		//assume you want to disable the checkbox
		var doDisable = true;
		//get the current row
		var currentRow = getAncestorOfType(parentCheckboxes[i], 'tr');
		//capture the current row identifier as the boundary case
		var negativeClass = this.getIdentifier(currentRow);
		//get the next row
		currentRow = currentRow.nextSibling;
		//while there is a valid row and the row is not the negative case, do a test to see if you should change the disable state
		//NOTE: this will get more than the first level child at the moment since the positive case may be the row highlight class, giving a false level indicator
		while(currentRow && this.getIdentifier(currentRow) != negativeClass) {
			//if it has a classname - double checking validity
			if(typeof(currentRow.className) != 'undefined') {
				//get the checkbox collection
				var checkbox = currentRow.getElementsByTagName('input');
				//if the collection is non-empty, get the first element otherwise set to false
				checkbox = checkbox.length > 0 ? checkbox[0] : false;
				//if there is a checkbox and it is not disabled, flag this collection as not disabled and move to the next collection
				if(checkbox && checkbox.disabled == false) {
					doDisable = false;
					break;
				}
			}
			//get the next sibling and retest
			currentRow = currentRow.nextSibling;
		}
		//if you are supposed to disable, remove the check and set the checkbox as disabled
		if(doDisable) {
			parentCheckboxes[i].disabled = true;
			parentCheckboxes[i].checked = false;
		}
	}
}

//checks parent for having checked first level children - if none, disables the checkbox
function updateCheckedCheckboxes(checkboxName){
	//function for getting the identifying portion of the class name (ingores the appended 'Alt")
	this.getIdentifier = function(which) {
		if(typeof(which.className) != 'undefined') {
			return which.className.replace("/Alt$/", "");
		}
		return null;
	}
	//get the checkboxes that match the provided name
	var parentCheckboxes = document.getElementsByName(checkboxName);
	//iterate over the found checkboxes
	for(var i = 0; i < parentCheckboxes.length; i++) {
		//assume you want don't want to uncheck the checkbox
		var doUncheck = false;
		//get the current row
		var currentRow = getAncestorOfType(parentCheckboxes[i], 'tr');
		//capture the current row identifier as the boundary case
		var negativeClass = this.getIdentifier(currentRow);
		//get the next row
		currentRow = currentRow.nextSibling;
		//while there is a valid row and the row is not the negative case, do a test to see if you should change the checked state
		//NOTE: this will get more than the first level child at the moment since the positive case may be the row highlight class, giving a false level indicator
		while(currentRow && this.getIdentifier(currentRow) != negativeClass) {
			//if it has a classname - double checking validity
			if(typeof(currentRow.className) != 'undefined') {
				//get the checkbox collection
				var checkbox = currentRow.getElementsByTagName('input');
				//if the collection is non-empty, get the first element otherwise set to false
				checkbox = checkbox.length > 0 ? checkbox[0] : false;
				//if there is a checkbox and it is not disabled, flag this collection as not disabled and move to the next collection
				if(checkbox && checkbox.checked == false) {
					doUncheck = true;
					break;
				}
			}
			//get the next sibling and retest
			currentRow = currentRow.nextSibling;
		}
		//if you are supposed to disable, remove the check and set the checkbox as disabled
		if(doUncheck) {
			parentCheckboxes[i].checked = false;
		}
	}
}

/* AJAX */
//TODO: formalize error format and throw an error if an error string or error is returned
//TODO: add property for number of top level results
function asynchronousRequest() {
	var _instanceReference = this;
	
	var _handler = function(){};
	// URL to request data from
	var _URL = null;
	// Method to send data
	var _transferMethod = "POST";
	// Whether request should run asynchrounously or wait for completion to continue running page scripts
	var _isAsynch = true;
	// params to post, tied to _transferMethod *reccomend not using for now due to support issue*
	var _paramString = '';
	// number of seconds to allow before timeout
	var _timeoutSeconds = 20;
	
	// holder for request
	var _request = null;
	// indication of load state
	var _loaded = false;
	// holder for timeoutID
	var _timeoutID;
	
	//set transfer method
	this.setTransferMethod = function(transferMethod) {
		if (transferMethod == "GET" || transferMethod == "POST") {
			_transferMethod = transferMethod;
		} else {
			throw new Error(1,"invalid transferMethod type");
		}
	}
	
	//set transfer method
	this.setIsAsynch = function(isAsynch) {
		if (isAsynch == true || isAsynch == false) {
			_isAsynch = isAsynch;
		}
	}
	
	//set params
	this.setParamString = function(paramString) {
		//TODO: add testing to insure proper format
		_paramString = paramString;
	}
	
	//set url to request data from
	this.setURL = function(URL) {
		_URL = URL;
	}
	
	//set handler function that will make use of returned data
	this.setHandlerFunction = function(handler) {
		_handler = handler;
	}
	
	//set number of seconds to allow before timing out
	this.setTimeoutSeconds = function(numSeconds) {
		_timeoutSeconds = numSeconds;
	}
	
	//getter for timeout period
	this.getTimeout = function() {
		return _timeoutSeconds * 1000;
	}
	
	this.checkTimeout = function() {
		if (!_loaded) {
			_request.abort();
		} else {
			alert("loaded in time");
		}
	}
	function handleRequest() {
		if (_request.readyState == 4) {
			if (_request.status == 200) {
				//url exists and there were no errors
				var requestData = _request.responseText;
				try {
					eval("var requestObject = (" + requestData + ")");
				//returned string resulted in invalid js, just return as string
				} catch (e) {
					var requestObject = requestData;
				}
				_handler(requestObject);
			} else {
				var requestObject = { "error" : {"errorCode" : _request.status, "errorText" : _request.statusText} }
				_handler(requestObject);
			}
			_loaded = true;
			//clear attached events now that completed
			clearTimeout(_timeoutID);
			try {
				_request.onreadystatechange = null;
			//ie complains about a type mismatch here, catching and ignoring error
			} catch (e) {
				_request.onreadystatechange = new Function();
			}
		}
	}
	
	this.run = function() {
		/*@cc_on @*/
		/*@if (@_jscript_version >= 5)
			// JScript gives us Conditional compilation, we can cope with old IE versions.
			// and security blocked creation of the objects.
			try {
				_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (E) {
					_request = null;
				}
			}
		@end @*/
		if (!_request && typeof XMLHttpRequest!='undefined') {
			_request = new XMLHttpRequest();
		}
		//alert(_request);
		_request.onreadystatechange = handleRequest;
		_request.open(_transferMethod, _URL, _isAsynch);
		_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		_request.setRequestHeader("Content-length", _paramString.length);
		_request.setRequestHeader("Connection", "close");
		_request.send(_paramString);
		//requires that the name of the object be passed in to work correctly...
		//_timeoutID = setTimeout('brandUpdate.checkTimeout()',this.getTimeout());
	}
}

//get inputs inside of object as a single collection - only required when not surrounded by a form
function returnInputs(object) {
	var _self = this;
	var _inputCollection = new Array();
	
	//convert the dom collection to array so that it may use concatenation
	_self.getInputArray = function(inputType) {
		var collection = object.getElementsByTagName(inputType);
		
		var tmpArray = new Array();
		for( var i = 0; i < collection.length; i++) {
			tmpArray.push(collection[i]);
		}
		return tmpArray;
	}
	
	//assemble all inputs into one array
	_inputCollection = _inputCollection.concat(
		_self.getInputArray('INPUT'),
		_self.getInputArray('SELECT'),
		_self.getInputArray('TEXTAREA')
	);
	return _inputCollection;
}

//handler for doing auto refresh based on a select box value
function refreshHandler() {
	var _self = this;
	//period of time to wait before doing refresh
	var _duration;
	//select box instance is bound to - receives period of time to wait from this
	var _boundSelectbox;
	//minimum period of time can wait before refresh
	var _minValue = 15;
	//id for timeout instance - used to clear the timeout when the period is changed
	var _timeoutHandler = null;
	//container to hold identifier for a given page - allows refresh to be sticky to individual pages
	var _refreshID;
	//containers to hold the scroll position at time of refresh, cleared immediately after use
	var _scrollXID;
	var _scrollYID;
	
	//set duration of time to wait
	_self.setDuration = function(numSeconds) {
		_duration = numSeconds;
	}
	
	//get value from select box, store in cookie, clear timeout if necessary
	_self.setFrequency = function() {
		//if no select box, do nothing
		if(_boundSelectbox) {
			//get value from select box
			var value = _boundSelectbox.value;
			//set duration
			_self.setDuration(value);
			//set cookie value
			cookieManager.set(_refreshID, value);
			//if timeout already exists, clear it and create a new one
			if(_timeoutHandler) {
				window.clearTimeout(_timeoutHandler);
			}
			_self.updateTimeout();
		}
	}

	//bind instance to a specific select box and attach listener to the change event on the box
	_self.bindToSelectbox = function(object) {
		_boundSelectbox = returnObject(object);
		eventManager.registerListener(_boundSelectbox, 'change', function(){_self.setFrequency()});
	}

	//start the refresh process
	_self.doRefresh = function() {
		//if the duration is never (-1) or the process is blocked by another page event, don't refresh
		if (_duration > 0 && !blocker.isBlocked()) {
			//get the window position before refreshing
			var scrollPosition = getScrollOffset();
			cookieManager.set(_scrollXID, scrollPosition.width);
			cookieManager.set(_scrollYID, scrollPosition.height);
			reloadPage();
		}
		//if you didn't refresh, set a new timeout to try again
		_self.updateTimeout();
	}

	//set a timeout for the refresh process
	_self.updateTimeout = function() {
		if(_duration > 0) {
			_timeoutHandler = window.setTimeout(function(){_self.doRefresh()},_duration * 1000);
		}
	}
	
	//request initialization
	_self.init = function() {
		//delay init until page is loaded
		addDOMLoadListener(_self.doInit);
	}
	
	//initialize refresh handler instance
	//TODO: figure out why firefox moves slightly if you scroll all the way to the bottom
	_self.doInit = function() {
		var pageID = cookieManager.getPageID();
		_refreshID = pageID + "doRefresh";
		_scrollXID = pageID + "_scrollX";
		_scrollYID = pageID + "_scrollY";
		if (_boundSelectbox) {
			//try to get the cookie that retains the duration to wait
			var cookieValue = cookieManager.get(_refreshID);
			//if the value appears to be valid, set the select box and set the duration
			if(parseInt(cookieValue, 10) >= _minValue || cookieValue == -1) {
				_boundSelectbox.value = cookieValue;
				_self.setDuration(cookieValue);
			//otherwise, get the duration from the select box
			} else {
				_self.setFrequency();
			}
		}
		//create a timeout if it's positive and greater than the min value
		if(parseInt(_duration, 10) >= _minValue) {
			_self.updateTimeout();
		}
		//scroll the page to the previous position at time of refresh
		var scrollX = cookieManager.get(_scrollXID);
		var scrollY = cookieManager.get(_scrollYID);
		if (scrollX && scrollY) {
			window.scroll(scrollX, scrollY);
			cookieManager.remove(_scrollXID);
			cookieManager.remove(_scrollYID);
		}
	}
}

/* COOKIE HANDLER */
/*
Copyright (c) 2005 Tim Taylor Consulting <http://tool-man.org/>

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.*/
var cookieManager = {

	set : function(name, value, expiration, path, domain, secure) {
		if (!expiration) {
			expiration = 365;
		}
		var date = new Date();
		date.setTime(date.getTime() + (expiration * 24 * 60 * 60 * 1000));

		if(!path) {
			path = '/';	
		}
		var cookieString = name + "=" +escape(value) +
		";expires=" + date.toGMTString()+
		((path) ? ";path=" + path : "") + 
		((domain) ? ";domain=" + domain : "") +
		((secure) ? ";secure" : "");
		document.cookie = cookieString;
	},

	get : function(name) {
		var namePattern = name + "="
		var cookies = document.cookie.split(';')
		for(var i = 0, n = cookies.length; i < n; i++) {
			var c = cookies[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1, c.length);
			}
			if (c.indexOf(namePattern) == 0) {
				return c.substring(namePattern.length, c.length);
			}
		}
		return null;
	},

	remove : function(name) {
		cookieManager.set(name, "", -1);
	},
	
	//get pseudo unique identifier per page to make objects sticky to a given page
	getPageID : function() {
		//ASSEMBLE COOKIE PREPEND IDENTIFIER
		//get the url past the hostname minus the get params
		var sectionString = document.location.pathname;
		//strip out the index.php if there
		//WARNING: SPECIFIC TO MERLIN CONFIGURATION - IF REUSED, MAY NEED TO BE MODIFIED
			sectionString = sectionString.replace(/^\/index\.php\//gi, "");
			//remove the trailing forward slash if there
			sectionString = sectionString.replace(/\//gi, "");
			//get the search params
			var searchString = document.location.search;
			//extract the action from the search params
			searchString = searchString.replace(/^.*action=([^&]*).*/gi, "$1");
			//if the action was not found, assume index
			if(searchString == '') {
				searchString = 'index';
			}
		//make the cookie prepender be something like "settings_notifications"
		var cookieBase = sectionString + "_" + searchString + "_";
		return cookieBase;
	}
}

//utility for managing UI states blocking certain activities (ex. popups preventing page refresh)
var blocker = {
	blockingElements : new Array(),
	//add an element as a blocking element
	add : function(which) {
		blocker.blockingElements.push(which);
	},
	
	//remove a block - MUST assign this to the closure event of anything that creates a block
	remove : function(which) {
		for(index in blocker.blockingElements) {
			if(blocker.blockingElements[index] == which) {
				blocker.blockingElements.splice(index, 1);
			}
		}
	},
	
	//check to see if there are any currently blocking states
	isBlocked  : function() {
		if (blocker.blockingElements.length > 0) {
			return true;
		} else {
			return false;
		}
	}
}

//get overall document size
function getDocumentSize() {
	//get window dimensions - will be smaller than document if scroll bars present
	var viewportDimensions = getViewportSize();
	//return largest of any dimension, the body may be smaller or larger than window but needs to be treated as largest of either
	var y = Math.max(document.documentElement.scrollHeight, document.body.offsetHeight, viewportDimensions['height']);
	var x = Math.max(document.documentElement.scrollWidth, document.body.offsetWidth, viewportDimensions['width']);
	return({"width" : x, "height" : y, 'viewportWidth' : viewportDimensions['width'], 'viewportHeight' : viewportDimensions['height']});
}

function getViewportSize() {
	var x,y;
	if (window.innerHeight) { // all except Explorer
		x = window.innerWidth;
		y = window.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		x = document.documentElement.clientWidth;
		y = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		x = document.body.clientWidth;
		y = document.body.clientHeight;
	}
	return({"width" : x, "height" : y});
}

function getScrollOffset() {
	var x, y;
	if(typeof(window.pageYOffset) == 'undefined') {
		x = document.documentElement.scrollLeft
		y = document.documentElement.scrollTop;
	} else {
		x = window.pageXOffset;
		y = window.pageYOffset;
	}
	return({"width" : x, "height" : y});
}

/* POSITION RELATED UTILITIES */

//find object position
function findCoordinates(object) {
	var tempObject = object;
	var position = new Array();
	position['X1'] = 0;
	position['Y1'] = 0;
	position['X2'] = 0;
	position['Y2'] = 0;
	if (object.offsetParent) {
		while (object) {
			position['X1'] += object.offsetLeft;
			position['Y1'] += object.offsetTop;
			object = object.offsetParent;
		}
	} else if (object.x) {
		position['X1'] += object.x;
		position['Y1'] += object.y;
	}
	position['X2'] = position['X1'] + tempObject.offsetWidth;
	position['Y2'] = position['Y1'] + tempObject.offsetHeight;
	return position;
}

//SHOW WORKING
//TODO: add animation
var showWorking = function() {
	document.documentElement.className = 'working';
}

//HIDE WORKING
var hideWorking = function() {
	document.documentElement.className = '';
}

function serializeToURL(name, value) {
	var returnString = '';
	if(typeof(value) == 'object' && value.length) {
		for(var i = 0; i < value.length; i++) {
			returnString += serializeToURL(name, value[i]);
		}
	} else {
		returnString += escape(name) + '=' + escape(value) + '&';
	}
	return returnString;
}

//ADD BUTTON STYLES AND BEHAVIORS
//NOTE: exists as a class so it can be later updated to have overrides with classes and behaviors
function buttonBehaviors() {
	var _self = this;
	//TODO: create overrides and extend behaviors
	var _overClass = "submitButtonOver";
	var _outClass = "submitButton";
	
	_self.over = function(which) {
		which.className = _overClass;
		if (!which.disabled) {
			which.style.cursor = 'pointer';
		}
	}
	
	_self.out = function(which) {
		which.className = _outClass;
	}

	_self.attachBehaviors = function(which) {
		eventManager.registerListener(which, 'mouseover', function(){_self.over(which)});
		eventManager.registerListener(which, 'mouseout', function(){_self.out(which)});
		which.className = "submitButton";
	}
	
	_self.init = function() {
		var elements = document.getElementsByTagName('input');
		for(var i = 0; i < elements.length; i++) {
			var element = elements[i];
			if(element.type == "submit" || element.type == "button") {
				if(!element.className) {
					_self.attachBehaviors(elements[i]);
				}
			}
			if (element.src != null && element.src != '') {
				element.style.borderStyle = "none";
			}
		}
	}
}
var defaultButtonBehavior = new buttonBehaviors();
addDOMLoadListener(defaultButtonBehavior.init);

/* Attach IE PNG behavior */
/*@cc_on @*/
/*@if (@_win32)
	document.write("<style type=\"text/css\"> img { behavior: url(\"" + GLOBAL_baseResourcePath + "/js/pngbehavior.htc\"); } </style>");
/*@end @*/

//set up the page initialization
setupInit();





