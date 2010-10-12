function noticeFade() {
	var _self = this;
	//elements to allow overrides on
	var _fadeInRate = 15; //milliseconds between fade in incriments 
	var _fadeOutRate = 100; //milliseconds between fade out incriments 
	var _fadeIncrement = 2; //fade by 2/100's
	var _fadeOutWait = 6; //seconds to wait before doing the fade out
	var _courtesyWait = 2; //seconds to wait after rollout if _fadeOutWait has already expired;
	var _messageClass = 'noticeMessage'; //class name of messages within the noticeFader container
	//object containers
	var _fadeObject; //object to fade
	var _messageContainer; //object that contains the messages
	var _frameFix; //object that contains a frame for use by IE making it so dropdowns don't show through
	//mutable elements
	var _init = false;
	var _opacity = 0;
	var _shown = false; //flag for saying that the special on page load show case has already happened
	var _blocked = false; //whether or not the process is blocked from fading out, happens during hover
	var _waitComplete = false; //flag for saying that the minimum wait has been completed
	var _messages = new Array(); //current messages to display
	var _closeButtons  = new Array(); //container for close buttons to register on load
	var _historicalMessages = new Array(); //all messages displayed on this page view - pertinent with streaming events or asynch events
	var _timeout; //container for the fade process
	var _waitTimeout; //container for the wait while the messages are being displayed
	var _courtesyTimeout; //contianer for the wait after roll off
	
	_self.addMessage = function(message) {
		_messages[_messages.length] = message;
		_historicalMessages[_historicalMessages.length] = message;
		
		//if the box has already been shown, this is triggered from an asynch event and should show now
		if(_shown) {
			_self.attachMessage(message);
			//if currently being shown, fade back in and start the wait over
			if(_fadeObject.style.display == 'block') {
				//brute force, reset everything
				_self.position(_fadeObject);
				window.clearTimeout(_timeout);
				window.clearTimeout(_waitTimeout);
				window.clearTimeout(_courtesyTimeout);
				_waitComplete = false;
				_self.fadeIn();
			//else this is hidden and you should do the whole show command
			} else {
				_self.show();
			}
		}
	}
	
	_self.attachMessage = function(message) {
		var newMessage = document.createElement('li');
		newMessage.className = _messageClass;
		newMessage.innerHTML = message;
		_messageContainer.appendChild(newMessage);
	}
	
	_self.showHistory = function() {
		//if already visible, kill the notice box and fill with the historical data
		if(_fadeObject.style.display == 'block') {
			//remove any timouts etc that might interfere with starting the long wait over
			_self.cleanUp();
			//making the _messages array not null so the show logic still works
			_messages = ["filler"];
			for(var i = 0; i < _historicalMessages.length; i++) {
				_self.attachMessage(_historicalMessages[i]);
			}
			_self.show();
			//since this was already being displayed - just set it to fully visible
			_self.setOpacity(100);
		//if not shown, copy messages over and do a show
		} else {
			//making the _messages array not null so the show logic still works
			_messages = ["filler"];
			//add messages to container
			for(var i = 0; i < _historicalMessages.length; i++) {
				_self.attachMessage(_historicalMessages[i]);
			}
			//show the notice box
			_self.show();
		}
	}
	
	_self.show = function() {
		//indicate that you've processed the first special show case (page load)
		_shown = true;
		if(_messages.length >= 1) {
			_fadeObject.style.display = 'block';
			_self.position(_fadeObject);
			_self.updateFrameFix();
			if (_frameFix) {
				//show the frame that blocks dropdowns, fix for IE
				_frameFix.style.display = 'block';
			}
			//set opacity to 0 explicitly so IE can consume the property
			_self.setOpacity(0);
			//start the self referencing fade in function
			_self.fadeIn();
		}		
	}
	
	_self.fadeIn = function() {
		//set the opacity
		var opacity = parseInt(_opacity, 10) + _fadeIncrement;
		opacity = Math.min(opacity, 100);
		_self.setOpacity(opacity);
		//if still visible, keep fading
		if(opacity < 100) {
			_timeout = window.setTimeout(_self.fadeIn, _fadeInRate);
		//else start the timeout on the fade out
		} else {
			_self.doWait();
		}
	}
	
	_self.doWait = function() {
		_waitTimeout = window.setTimeout(_self.waitFade, _fadeOutWait * 1000);
	}
	
	_self.waitFade = function() {
		_waitComplete = true;
		_self.fadeOut();
	}
	
	_self.fadeOut = function() {
		if (!_blocked) {
			//set the opacity
			var opacity = parseInt(_opacity, 10) - _fadeIncrement;
			opacity = Math.max(opacity, 0)
			_self.setOpacity(opacity);
			//if still visible, keep fading
			if(opacity > 0) {
				_timeout = window.setTimeout(_self.fadeOut, _fadeOutRate);
			} else {
				_self.cleanUp();
			}
		}
	}
	
	_self.rollOver = function() {
		if(!_blocked) {
			window.clearTimeout(_courtesyTimeout);
			_blocked = true;
			//snap opacity to 1
			_self.setOpacity(100);
			//kill any current timeout
		}
	}
	
	_self.rollOut = function(event) {
		event = eventManager.returnEvent(event);
		//make sure the cursor is really out of bounds - Firefox triggers this falsely
		if(!eventInBounds(event, _fadeObject)) {
			//clear the block
			_blocked = false;
			//if the long wait is complete, do the short one that follows roll outs
			if (_waitComplete) {
				_courtesyTimeout = window.setTimeout(_self.fadeOut, _courtesyWait * 1000);
			} else {
				//_self.doWait();
			}
		}
	}
	
	_self.setOpacity = function(opacity) {
		//decrease opacity in most browsers
		_fadeObject.style.opacity = opacity/100;
		//decrease opacity in IE
		_fadeObject.style.filter = "alpha(opacity = " + opacity + ")";
		//update opacity
		_opacity = (parseInt(opacity * 100, 10))/100;
	}
	
	_self.setObject = function(objectName) {
		//set the container as the string name of the object - will be replaced with object on load
		_fadeObject = objectName;
	}
	
	_self.setMessageContainer = function(objectName) {
		//set the container as the string name of the object - will be replaced with object on load
		_messageContainer = objectName;
	}
	
	_self.registerClose = function(objectName) {
		//push the name into an array of close objects to register on load
		_closeButtons.push(objectName);
	}

	_self.cleanUp = function() {
		//hide the container
		_fadeObject.style.display = 'none';
		if (_frameFix) {
			//show the frame that blocks dropdowns, fix for IE
			_frameFix.style.display = 'none';
		}
		//clear out messages for next time
		_messages = new Array();
		_messageContainer.innerHTML = '';
		//kill all timeouts
		window.clearTimeout(_timeout);
		window.clearTimeout(_waitTimeout);
		window.clearTimeout(_courtesyTimeout);
		//set appropriate flags back - _shown stays and historical messages stay
		var _blocked = false;
		var _waitComplete = false;
	}
	
	_self.updateFrameFix = function() {
		if (_frameFix) {
			//get coordinates of popup
			var faderCoords = findCoordinates(_fadeObject);
			//duplicate height and width of popup
			_frameFix.style.width = (faderCoords['X2'] - faderCoords['X1']) + 'px';
			_frameFix.style.height = (faderCoords['Y2'] - faderCoords['Y1']) + 'px';
			//position in same location as popup
			_frameFix.style.top = faderCoords['Y1'] + 'px';
			_frameFix.style.left = faderCoords['X1'] + 'px';
		}
	}
	
	_self.init = function() {
		//alert("shit");
		if(!_init) {
			addDOMLoadListener(_self.doInit);
			_init = true;
		}
	}
	
	//position the popup to the top right at the time of the event
	//NOTE: really want to just have position: fixed but not supported in IE < 7
	//NOTE: would be better to set the "right" property but this is no correctly calculated in browsers
	_self.position = function(object) {
		var scrollOffset = getScrollOffset();
		var documentDimensions = getDocumentSize();
		var objectCoordinates = findCoordinates(object);
		var objectWidth = objectCoordinates['X2'] - objectCoordinates['X1'];
		//position the left side of the object such that it's right side is 25 pixels from the right side of the viewport
		//NOTE: this appears to be slightly more or less from the right side of the viewport depending on the browser, however, it's good enough for now
		//NOTE: without making the list items not wrap, the width changes and it calculates incorrectly
		//TODO: figure out how to allow the text to wrap while still correctly positioning the box
		object.style.left = (documentDimensions['viewportWidth'] + scrollOffset['width'] - objectWidth - 25) + 'px';
		//position the top to be 5 pixels below the top of the viewport
		object.style.top = (5 + scrollOffset['height']) + 'px';		
	}
	
	_self.doInit = function() {
		//set the container for the messages
		_messageContainer = returnObject(_messageContainer);
		//set the container for the entire notice display
		_fadeObject = returnObject(_fadeObject);
		//register close button behaviors
		for(key in _closeButtons) {
			var closeListener = eventManager.registerListener(_closeButtons[key], 'click', _self.cleanUp);
		}
		//attach messages to container
		for(key in _messages) {
			_self.attachMessage(_messages[key]);	
		}
		//register the roll in and out behaviors of the message box
		var rollOverListener = eventManager.registerListener(_fadeObject, 'mouseover', _self.rollOver);
		var rollOutListener = eventManager.registerListener(_fadeObject, 'mouseout', _self.rollOut);
		//INSTANTIATE DISPLAY FIX FOR IE ALLOWING DROPDOWNS SHOWING THROUGH FLOATING ELEMENTS
		if(useIEBranch) {
			//TODO: wrap in an IE test here and add defined test everywhere else _frameFix is referenced
			//create an iframe to act as the blocking layer between dropdowns and floating element
			_frameFix = document.createElement('IFRAME');
			//apply pertinent styling
			_frameFix.className = 'frameFix';
			//set the opcacity to 0 for IE - done in js to prevent the parse error in the css file and not require a hack in the css file
			_frameFix.style.filter = "alpha(opacity = 0)";
			//attach the element to the document
			document.body.appendChild(_frameFix);
		}
		//show the notice box
		_self.show();
	}

}