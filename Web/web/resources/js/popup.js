//General Notes

//TODO's
	//High Priority
		//TODO: push errors to an error popup rather than alert box if object found (otherwise do alert)
		//TODO: comment code better
		//TODO: remove the clunky "ret" and "msg" stuff
		
	//General TODO's
		//TODO: convert arrays to strings when printing standard stuff (explode)
		//TODO: if no form found, create a form element as a parent
		//TODO: make failures happen more silently but log something
		//TODO: leverage try catches esp for mis configuration on developer's side
			//TODO: attempt to bind things improperly or two objects that don't exist
		//TODO: pull out serialization of javascript objects to get params - focus on arrays (update: not sure what I meant by this)
	
	//Low Priority TODO's
		//TODO(low): add click outside test if blocking turned off
		//TODO(low): organize variables into groups
		//TODO(low): performance testing
		//TODO(low): allow popup to be dragged
		//TODO(low): reorganize method order to make more sense
		//TODO(low): include sample implementation in notes


//when complete, put a sample of usage here
var popup = function() {
	var _self = this; //instance reference
	
	var _event; //container for submit click event
	var _clickedElement; //holder for clicked element - required to pick up which submit button was clicked
	var _sourceElement; //holder for item that triggered the show method
	
	var _boundObject = null; //REQUIRED - DOM element containing the popup
	var _boundData = new Array(); //databinding container for binding returned items directly to popup elements
	var _boundDataCustom = new Array(); //databinding container for binding functions to popup elements
	var _affectedRows = new Array(); //rows found in batch processing
	var _doHighlight = true; //flag for whether to do row highlight
	var _highlightRow = null; //holder for list row that contained clicked element
	var _hightlightRowClass = 'listRowSelected'; //default highlight class
	var _originalRowClass; //holder for original class of row prior to highlight
	var _boundHideToggles = new Array(); //collection of elements that hide this popup
	var _boundShowToggles = new Array(); //collection of elements that show this popup
	var _boundSubmitToggles = new Array(); //collection of elements that submit this popup
	var _UIErrorCheckHandler = null; //passed in error checking function, recommend minimal use
	var _currentTab = null; //currently selected tab
	var _currentTabBody = null; //body associated with selected tab
	var _firstTab; //first tab in right to left order, used to determine which tab to display on show command
	var _form = null; //surrounding form if this contains form elements - forms currently required for reset method
	var _imageLoadListeners = new Array(); //array to contain load listeners for bound images, used to pass to a cleanup function on hide

	var _usesUpdate = false; //flag to indicate that there is an update connection
	var _updateConnection = new asynchronousRequest(); //ajax wrapper for update
	var _usesSubmit = false; //flag to indicate that there is a submit connection
	var _submitConnection = new asynchronousRequest(); //ajax wrapper for submit
	var _submitHandler = null; //function that handles the returned data from a submit
	var _focus = null;
	var _customCleanup = function(){}
	var _postPopulateAction = function(){}
	var _returnDataObject = new Array(); //array of submitted values for use with submit handler - submission string would have to be parsed otherwise
	var _errorHandler = null; //function that displays captured errors if returned in json format
	
	var _loader; //loading message box, only used if loading message is set
	var _blocking = true; //whether this popup should block page updates
	var _blocker; //div that blocks page access and dims the page
	var _frameFix; //iframe to sit behind popup to prevent dropdowns showing through in IE - fix for IE's rendering issue
	var _opacity = .15; //opacity of blocker
	var _escapeIE; //instance reference for the event listener for the escape key
	var _escapeOther; //instance reference for the event listener for the escape key
	var _resize; //instance reference for the resize event
	
	var _arguments; //arguments passed in during show, should be in JSON format one level deep. will appear in popup submit. accessible to custom functions as the 'customArguments' property of passed in data

	//SCHEDULE INITIALIZE POPUP
	//TODO: look into lazy initialization - do on show command?
	_self.init = function() {
		addDOMLoadListener(_self.doInit);
	}
	
	//logic of above initialization
	_self.doInit = function() {
		//BLOCKER INSTANTIATION
		//TODO: push blocking stuff into a separate method
		if(!_blocker) {
			//create a div to act as the blocker
			_blocker = document.createElement('DIV');
			//apply the style defined for a blocker
			_blocker.className = 'popupBlock';
			//set opacity in forms that all browsers understand
			_blocker.style.opacity = _opacity;
			_blocker.style.filter = "alpha(opacity = " + _opacity * 100 + ")";
			//attach bocker to document
			document.body.appendChild(_blocker);
			//TODO: move this out of here and make it only happen when popup active
		}
		
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

		//TAB HANDLING
		//get first tab
		var popupTabs = getElementsByClassName('popupTab', _boundObject, 'table');
		_firstTab = popupTabs[0];
		//register tab behaviors
		for(var i = 0; i < popupTabs.length; i++) {
			_self.registerTab(popupTabs[i]);
		}
		//set the first tab as on
		_self.setFirstTab();
		//if there is no focus set, try to set it to the first hide button in the first tab or a common hide button
		if(!_focus) {
			_focus = _self.getDefaultFocus();
		}
	}
	
	//GET THE FIRST HIDE BUTTON - this is the default focus or the focus when an invalid focus is set
	_self.getDefaultFocus = function() {
		//TODO: factor out the getting of the first tab body - common with the setTab function
		//TODO: optimize by counting the hidetoggles and if it's only one, just get that element
		var firstHide;
		var firstTabID = _firstTab.id;
		//get the first tab body container
		var firstTabBody = returnObject(firstTabID.substring(0, firstTabID.length - 3) + 'Body');
		//get the inputs within the first tab
		var inputs = firstTabBody.getElementsByTagName('input');
		//if there are none within the container, assume there is a common shared hide that is not in a tab body
		if(inputs.length < 1) {
			inputs = _boundObject.getElementsByTagName('input');
		}
		//iterate over found inputs and the hide toggles until you find a match
		for(var i = 0; i < inputs.length; i++) {
			for(var j = 0; j < _boundHideToggles.length; j++) {
				if(inputs[i] == _boundHideToggles[j]) {
					firstHide = inputs[i];
					break;
				}
			}
		}
		return firstHide;
	}
	//DEFINE AN INPUT TO FOCUS ON WHEN POPUP LOADED
	_self.setFocus = function(focusObject) {
		_focus = focusObject;
	}
	
	//UPDATE BLOCKER SIZE - to be done on resize and show
	//TODO: move _frameFix stuff into something separate and tie to the show and change tab events
	_self.updateBlocker = function() {
		//TODO, take blocker size into account, seems to continually push out boundaries of document because blocker size keeps being updated
		//hiding then showing seems to fix in firefox but not IE - no flicker apparent
		_blocker.style.display = 'none';
		var pageSize = getDocumentSize();
		_blocker.style.display = 'block';
		_blocker.style.width = pageSize['width'] + 'px';
		_blocker.width = pageSize['width'];
		_blocker.style.height = pageSize['height'] + 'px';
		_blocker.width = pageSize['height'];
		//make the frame fix for IE appear behind the popup - note that the tab area without tabs will hide dropdowns
		//TODO: make this work with loader too
		if (_frameFix && _boundObject.style.display == 'block') {
			//get coordinates of popup
			var blockerCoords = findCoordinates(_boundObject);
			//duplicate height and width of popup
			_frameFix.style.width = (blockerCoords['X2'] - blockerCoords['X1']) + 'px';
			_frameFix.style.height = (blockerCoords['Y2'] - blockerCoords['Y1']) + 'px';
			//position in same location as popup
			_frameFix.style.top = blockerCoords['Y1'] + 'px';
			_frameFix.style.left = blockerCoords['X1'] + 'px';
		}
	}
	
	//REGISTER A TAB - event causes a switch between tabs on tab click
	_self.registerTab = function(which) {
		eventManager.registerListener(which, 'click', function(){_self.setTab(which)});
	}
	
	//DEFINE POPUP CONTAINER
	_self.bindToObject = function(object) {
		_boundObject = returnObject(object);
		//bind surrounding form to object if it exists
		var form = getAncestorOfType(_boundObject, 'form');
		if(form) {
			_form = form;	
		}
	}
	
	//REGISTER AN ELEMENT AS SHOWING THIS POPUP ON CLICK
	_self.registerToggle = function(toggle) {
		var toggleObject = returnObject(toggle);
		eventManager.registerListener(toggleObject, 'click', function(){_self.show()});
		toggleObject.style.cursor = "pointer";
		_boundShowToggles.push(toggleObject);
	}
	
	_self.setCleanupAction = function(cleanupFunction) {
		_customCleanup = cleanupFunction;
	}
	
	_self.setPostPopulationAction = function(postPopulateAction) {
		_postPopulateAction = postPopulateAction;
	}
	
	//BIND DATA - binds a form element or container to a piece of returned data
	//TODO: handle duplicate names such as radio or checkboxes
	_self.bindData = function(dataSource, HTMLObject) {
		// default binding to an object
		var bindContainer = _boundData;
		
		// test to see if you are binding a function
		if(typeof(dataSource) == 'function') {
			bindContainer = _boundDataCustom;
			// you are not binding to a specific falue, just bind the function
			if (HTMLObject == null) {
				//register data binding
				bindContainer.push( { 'dataBinding' : dataSource });
				return;
			}
		}
		
		//get named elements
		if(_form) {
			var namedObjects = getElementsByName(HTMLObject, _form);
		}
		//object found by name
		if(namedObjects && namedObjects.length > 0) {
			//register data binding
			bindContainer.push({ 'HTMLObject' : namedObjects, 'dataBinding' : dataSource });
		//not found by name - error
		} else {
			var objByID = returnObject(HTMLObject);
		
			//object not found by id or name
			if(objByID == null) {
				//TODO: log error, push to console, do not alert unless in debug mode
				alert("Attempting to bind to non-existant object :" + HTMLObject);
			} else {
				//register data binding
				bindContainer.push({ 'HTMLObject' : objByID, 'dataBinding' : dataSource });
			}
		}
	}

	//REGISTER AJAX UPDATE URI - the URI that data is to be retrieved from
	_self.setUpdateAction = function(URI){
		_usesUpdate = true;
		//set the submission URI
		_updateConnection.setURL(URI);
		//if there was a custom function for handling the returned results, set it
		_updateConnection.setHandlerFunction(_self.loadData);
	}
	
	//REGISTER SUBMIT HANDLER FUNCTION
	_self.setSubmitHandler = function(handler) {
		_submitHandler = handler;
	}

	//REGISTER AJAX SUBMIT URI - the URI that the collected data from the popup is to be submitted to
	_self.setSubmitAction = function(URI) {
		_usesSubmit = true;
		//set the submission URI in the ajax handler
		_submitConnection.setURL(URI);
		//set the handler function for returned data
		_submitConnection.setHandlerFunction(_self.handleReturn);
	}
	
	//ASSEMBLE NAME/VAL PAIRS FOR SUBMISSION AND INSPECTION BY RETURN HANDLER
	//TODO: account for elements with the same name
	_self.assembleData = function(name, value) {
		//only generate submission object if a submit handler was defined to accept it
		if(_submitHandler != null) {
			//if the element already exists and is a an array, append the value to the array
			if(typeof(_returnDataObject[name]) == 'object') {
				_returnDataObject[name][_returnDataObject[name].length] = value;
			//if the element already exists but is not an array, turn it into an array
			} else if(typeof(_returnDataObject[name]) != 'undefined') {
				 _returnDataObject[name] = new Array(_returnDataObject[name], value);
			} else {
				 _returnDataObject[name] = value;
			}
		}
		return (encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&');
	}
	
	//RETRIEVE DATA FROM POPUP
	//TODO: investigate dynamic javascript object assembly (dynamic property names and values...) [no longer sure what I meant by this]
	//NOTE: popup must have a form as a child element for this to work, if that becomes a problem the behavior can be changed
	_self.getData = function() {
		//get all inputs in the bound object and iterate over them to create submit string
		if(_form) {
			//get input elements from form if form was set
			var elements = _form.elements;
		} else {
			//get input elements manually
			var elements = returnInputs(_boundObject);
		}

		var data = '';
		//insert arguments from show command
		//TODO: determine what to do if arguments are serialization of more complex data types
		for(var element in _arguments) {
			data += serializeToURL(element, _arguments[element]);
		}
		//iterate over input elements
		for(var i = 0; i < elements.length; i++) {
			var element = elements[i];
			//do not add disabled elements to the submission string
			if(element.disabled) {
				continue;
			}
			if(element.type == 'radio') {
				//add name val pair if radio is checked
				if (element.checked == true) {
					data += _self.assembleData(element.name, element.value);
				}
			} else if (element.type == 'checkbox') {
				//add name val pair if checkbox is checked
				if (element.checked == true) {
					data += _self.assembleData(element.name, element.value);
				}
				
			} else if (element.type == 'select-one') {
				//single select boxes can only have one value, append it
				data += _self.assembleData(element.name, element.value);
			} else if (element.type == 'select-multiple') {
				//iterate over options and add name val pair if selected
				for(var j = 0; j < element.options.length; j++) {
					var currentOption = element.options[j];
					if(currentOption.selected == true)  {
						data += _self.assembleData(element.name, currentOption.value);
					}
				}
			} else if(element.type == 'submit' || element.type == 'button') {
				//don't submit name val pair for buttons or submits unless it was the clicked object
				if(element == _clickedElement) {
					data += _self.assembleData(element.name, element.value);
				}
			} else {
				//get everything else that doesn't require special handling
				data += _self.assembleData(element.name, element.value);
			}
		}
		return data;
	}
	
	//SET PAGE TEXT AND INPUTS - set page inputs based on returned bound data
	_self.setData = function(HTMLObject, returnedValue) {
		//NOTE: IE had some issues with HTMLCollection types, was doing special handling with "if(HTMLObject instanceof HTMLCollection)"
		if(HTMLObject.length) {
			for (var i = 0; i < HTMLObject.length; i++) {
				var object = HTMLObject[i];
				if(object.type == 'text') {
					//set the text value
					object.value = returnedValue;
				} else if(object.type == 'textarea') {
					//set the textarea value
					object.value = returnedValue;
				} else if(object.type == 'file') {
					//set the file value - uncommon
					object.value = returnedValue;
				} else if(object.type == 'hidden') {
					//set the hidden value
					object.value = returnedValue;
				} else if(object.type == 'password') {
					//set the password value - usually a bad idea for security reasons
					object.value = returnedValue;
				} else if(object.type == 'radio') {
					//radio of a given name can only have one value set - if current radio has the given value, check it
					if(object.value == returnedValue) {
						object.checked = true;
					}
				} else if(object.type == 'checkbox') {
					//returning a boolean, set checked to boolean state
					if(typeof(returnedValue) == 'boolean') {
						object.checked = returnedValue;
					//returning a value instead of a collection - just set the value
					} else if(typeof(returnedValue) == 'string') {
						if(object.value == returnedValue) {
							object.checked = true;
						}
					//returning a collection
					} else {
						for(value in returnedValue) {
							if(returnedValue[value] == object.value) {
								object.checked = true;
							}
						}						
					}
				//note that opera has a redraw issue with single selects when the element was display:none at time of set - a separate function to reassign value added to show and loadData
				} else if (object.type == 'select-one') {
					var inputOptions = object.options;
					object.value = returnedValue;
				//TODO: identify why this only works once in Opera - reports correct value and selected index but does not show correct selection to user
				} else if (object.type == 'select-multiple') {
					//returning a value instead of a collection - just set the value
					if(typeof(returnedValue) == 'string' || typeof(returnedValue) == 'undefined') {
						object.value = returnedValue;
					//returning a collection
					} else {
						//TODO: optimize this - make the search as short as possible and pull off values when found?
						var inputOptions = object.options;
						//iterate over options and compare
						for(var j = 0; j < inputOptions.length; j++) {
							//check if option value exists in returned collection
								//NOTE: cannot use indexOf since not supported in IE for this object type
							for(var k = 0; k < returnedValue.length; k++) {
								if(returnedValue[k] == inputOptions[j].value) {
									inputOptions[j].selected = true;
								}
							}
						}
					}
				} else {
					alert("Attempting to set unsupported type: " + object.type + " / " + typeof(object) + " / " + HTMLObject + " / " + object.nodeName + " / " + HTMLObject.length);
				}
			}
		//must have found object by ID if made it this far and not HTMLCollection - just set value
		} else  {
			//alert(typeof(HTMLObject.innerHTML));
			//TODO: add error checking, might want to check nodeName and presence of innerHTML property
			//if object is image, set source and resize
			if(HTMLObject.nodeName.toLowerCase() == 'img') {
				//attach listener to update image size
				var imageLoadListener = eventManager.registerListener(HTMLObject, 'load', function(){updateImageSize(HTMLObject, this)});
				HTMLObject.src = returnedValue;
				_imageLoadListeners.push(imageLoadListener);
			//if object is anchor, set href property - use a span inside the anchor to change the linked text
			} else if(HTMLObject.nodeName.toLowerCase() == 'a') {
				HTMLObject.href = returnedValue;
			} else if(typeof(HTMLObject.innerHTML) == 'string') {
				setInnerHTML(HTMLObject, returnedValue);
			} else {
				alert("Attempting to set innerHTML property for object that does not support this: " + 	HTMLObject.nodeName + " " + typeof(HTMLObject.innerHTML));
			}
		}
		
	}
	
	//SUBMIT FORM
	_self.submitData = function(event) {
		if(_usesSubmit) {
			//indicate that the popup is working
			_self.showWorking();
			//get event in appropriate format
			_event = eventManager.returnEvent(event);
			//get the element that triggered the event
			_clickedElement = getClickedElement(_event);
			
			//get data from form elements in popup and prepend any custom arguments
			var collectedData = _self.getData();
			//do custom error handling
			//TODO: more fully support custom error handling
			if (typeof(_UIErrorCheckHandler) == 'function') {
				var testResults = _UIErrorCheckHandler(collectedData);
				if (testResults != true) {
					//iterate over errors and insert into some error handler... these should only be top level errors
				}
			}
			//give the ajax request the collected data
			_submitConnection.setParamString(collectedData);
			//run the request
			_submitConnection.run();
		}
	}
	
	//HANDLE RETURN FROM SERVER
	//TODO: consider some sort of waiting message while 
	_self.handleReturn = function(returnedData) {
		//remove indication that the popup is working
		_self.hideWorking();
		//error returned in json format
		if((returnedData.ret == "false" || returnedData.ret == false) && returnedData.msg) {
			//if there is an error display handler, give it first chance to process the error and handle in a nice format
			if(_errorHandler) {
				_errorHandler(returnedData);
				return;
			}
			alert(returnedData.msg);
		//unformatted error
		} else if(returnedData.ret != true && returnedData.ret != 'true') {
			//strip html so it can be put in alert box
			alert(returnedData.toString().stripHTML());
		//if there was a custom function for handling the returned results, run it
		} else if(_submitHandler) {
			//allow submit handler to handle success case and update the page
			var batchErrors = typeof(returnedData.batchErrors) != 'undefined' ? returnedData.batchErrors : Array();
			var handlerResponse = _submitHandler( { "row" : _highlightRow, "sentData" : _returnDataObject, 'returnedData' : returnedData, 'affectedRows' : _affectedRows, 'batchErrors' : batchErrors} );
			if(handlerResponse || handlerResponse == 'undefined') {
				_self.hide();
			}
		} else {
			_self.hide();
		}
	}
	
	//INITIATE BATCH VERSION OF SHOWING THE POPUP
	//NOTE: this likely to change quickly as receives further use - may need more sophisticated custom argument handling
	_self.showBatch = function(checkboxName, event) {
		var myArguments = new Array();
		myArguments[checkboxName] = new Array();
		var checkboxValues = myArguments[checkboxName];
		//get checkboxes
		var batchIdentifiers = document.getElementsByName(checkboxName);
		//_arguments
		for(var i = 0; i < batchIdentifiers.length; i++) {
			var element = batchIdentifiers[i];
			var value = element.value;
			if (element.checked == true && element.disabled == false) {
				checkboxValues.push(value);
				_affectedRows.push(getAncestorOfType(element, 'tr'));
			}
		}
		// remove array if none found
		if(checkboxValues.length < 1) {
			myArguments = new Array();
		}
		//now that you've assembled the batch items - do the normal show
		_self.show(myArguments, event);
	}

	//INITATE SHOW OF THE POPUP
	_self.show = function(myArguments, event) {
		//get clicked row if applicable
		if(typeof(event) != 'undefined') {
			_sourceElement = getClickedElement(event);
			var parentRow = getAncestorOfType(_sourceElement, 'tr');
			if(parentRow) {
				//make sure this is a list row before highlighting
				if(parentRow.className.lastIndexOf('listRow') != -1) {
					_highlightRow = parentRow;
					_self.setHighlight();
				}
			}
		}
		
		//set passed in custom arguments, will be submitted with submitData function and are made avail to custom bindings
		_arguments = myArguments;
		
		//external function for blocking page updates - add this element to stack
		blocker.add(_self);

		//register listener for escape key to kill popup - removed on hide
		_escapeIE = eventManager.registerListener(document.body, 'keyup', function(event){_self.testEscapeKey(event)});
		_escapeOther = eventManager.registerListener(window, 'keyup', function(event){_self.testEscapeKey(event)});
		
		//show the blocking pane (grey overlay)
		_blocker.style.display = 'block';
		if(_frameFix) {
			//show the frame that blocks dropdowns, fix for IE
			_frameFix.style.display = 'block';
		}
		//update blocker to span viewport
		_self.updateBlocker();
		
		//get data if any
		if(_usesUpdate) {
			//indicate that the popup is working
			_self.showWorking();
			
			//display loader if set
			if(_loader) {
				//show the loading message
				_loader.style.display = 'block';
				//position loader in center of viewport
				_self.position(_loader);
			}
			//get arguments from show command
			var collectedData = "";
			for(var element in _arguments) {
				collectedData += serializeToURL(element, _arguments[element]);
			}
			//give the ajax request the collected data
			_updateConnection.setParamString(collectedData);
			//run the request
			_updateConnection.run();
		//if has custom arguments, pass them on to the load data process
		} else if (arguments.length > 0) {
			_self.loadData();
		} else {
			//TODO: custom data binding for stuff from page rather than request?
			//skip loader and just show the popup - no data to display
			_self.displayPopup();
		}
	}
	
	//DISPLAY POPUP
	_self.displayPopup = function() {
		//hide loader if set
		if(_loader) {
			//hide the loading message
			_loader.style.display = 'none';
		}

		//show the popup
		_boundObject.style.display = 'block';
		//position the popup - must be after loader is shown
		_self.position(_boundObject);
		
		//must have popup visible before getting coordinates to put iframe behind it
		_self.updateBlocker();
		//update blocking div to go with resize
		_resize = eventManager.registerListener(window, 'resize', _self.updateBlocker);
		
		//set focus if set
		if(_focus) {
			//see if the object exists by id
			var focusObject = returnObject(_focus);
			//if not, try to get it by name
			if(focusObject == null) {
				var namedElements = getElementsByName(_focus, _form);
				if(namedElements.length == 1) {
					focusObject = namedElements[0];
				}
			}
			//if an object was found, try to focus on it
			if(focusObject) {
				try {
					focusObject.focus();
				} catch(e) {
					//do nothing - either race condition with the show or the form element is hidden or disabled
				}
			} else {
				try {
					var defaultFocus = _self.getDefaultFocus();
					defaultFocus.focus();
				} catch(e) {
					try {
						_sourceElement.blur();
					} catch(e) {
						//do nothing	
					}
				}
			}
		} else {
			try {
				_sourceElement.blur();
			} catch(e) {
				//do nothing	
			}
		}
	}
	
	//LOAD DATA INTO POPUP - display when done
	_self.loadData = function(returnedData) {
		//make sure you have returned data to work with - will not have if you have custom arguments but no update url 
		if(typeof(returnedData) != 'undefined') {
			//check to see if there was an error
			if(((returnedData.ret == false || returnedData.ret == 'false') && returnedData.msg) || (returnedData.ret != true && returnedData.ret != 'true')) {
				//hide the working state
				_self.hideWorking();
				//hide the loader
				if(_loader) {
					_loader.style.display = 'none';
				}
				_self.hide();
				if((returnedData.ret == false || returnedData.ret == 'false') && returnedData.msg) {
					//alert the message
					alert(returnedData.msg);
				//unformatted error
				} else if(returnedData.ret != true && returnedData.ret != 'true') {
					//strip html so it can be put in alert box
					alert(returnedData.toString().stripHTML());
				}
				return;
			}
			
			//iterate over STANDARD bound data and load returned data into popup 
			for (var i = 0; i < _boundData.length; i++) {
				var HTMLObject = _boundData[i].HTMLObject;
				//split the json property string for the ajax returned object into each property - may not be splitable if comes from custom function
				var jsonPropsList;
				if(_boundData[i].dataBinding.split) {
					jsonPropsList = _boundData[i].dataBinding.split('.');
				} else if(typeof(_boundData[i].dataBinding) == 'function') {
					alert("It is likely that you used bindData rather than bindDataCustom when passing a function reference to databinding");
				}
				var tempProp = returnedData;
				//iterate over the properties and mine down to the requested object
				for( var j = 0; j < jsonPropsList.length; j++) {
					//make sure the value exists in the returned data, if not inform the UI and skip the set
					if(typeof(tempProp) == 'undefined') {
						alert("Defined data reference '" + _boundData[i].dataBinding + "' was not defined");
						continue;
					}
					tempProp = tempProp[jsonPropsList[j]];
				}
				_self.setData(HTMLObject, tempProp);
			}
		}
		//iterate over CUSTOM bound data and load returned data into popup - typically a value is returned by a bound function
		//TODO: consolidate this into the above iteration over standard data
		for(var i = 0; i < _boundDataCustom.length; i++) {
			var HTMLObject = _boundDataCustom[i].HTMLObject;
			//NOTE: may be further arguments pertient to custom function (currently: identifier, returned data, event)
			if(HTMLObject) {
				//get the return of the function and provide that and custom args to passed in function
				var customReturn = _boundDataCustom[i].dataBinding({ 'customArguments' : _arguments, 'returnedData' : returnedData });
				_self.setData(HTMLObject, customReturn);
			} else {
				//just do the function
				_boundDataCustom[i].dataBinding({ 'customArguments' : _arguments, 'returnedData' : returnedData });
			}
		}
		//TODO: hide loader
		//indicate that the popup is working
		_self.hideWorking();
		//show popup
		_self.displayPopup();
		//opera fix for set of input values when display is set to none
		_self.redrawSelect();
		//custom user function to do more work once population is done, common for enabling and disabling inputs
		//NOTE: only use this for work that HAS to be done after all population is complete
		_postPopulateAction();
	}
	
	//HIDE POPUP
	_self.hide = function() {
		//clear registered listeners (use of unregisterListenerObject appears to be required when using an anonymous function)
		eventManager.unregisterListenerObject(_escapeIE);
		eventManager.unregisterListenerObject(_escapeOther);
		eventManager.unregisterListenerObject(_resize);
		eventManager.cleanup(_imageLoadListeners);
		//alert(registeredListeners.length);
		//external function for blocking page updates - release this element from stack
		blocker.remove(_self);
		//remove row highlight
		_self.unsetHighlight();
		//hide the popup
		_boundObject.style.display = 'none';
		//hide display fix for IE
		if(_frameFix) {
			_frameFix.style.display = 'none';
		}
		//hide the blocking element
		_blocker.style.display = 'none';
		//if there is a clicked element and it has a focus property, return focus to the clicked element
		if(_sourceElement && _sourceElement.focus) {
			try {
				_sourceElement.focus();
			} catch(e) {
				//do nothing - either race condition with the show or the form element is hidden or disabled
			}
		}
		//clear values that were for this event only
		_self.clear();
		//reset to show first tab
		_self.setFirstTab();
		//reset inputs to original state - need to add functionality to have this disasbled if desired
		_self.clearInputs();
		//do customer cleanup of popup if function set
		_customCleanup();
	}
	
	//REGISTER SUBMIT - bind an object to form submission of popup's inputs
	_self.registerSubmit = function(which) {
		eventManager.registerListener(which, 'click', function(event){_self.submitData(event)});
	}
	
	//REGISTER HIDE - bind an object to the hiding of the popup - also counts as cancel
	_self.registerHide = function(which) {
		_boundHideToggles.push(returnObject(which));
		eventManager.registerListener(which, 'click', function(){_self.hide()});
	}
	
	//HANDLE ESCAPE KEY - function for testing if the keyup event was the escape key - hides if so
	_self.testEscapeKey = function(event) {
		event = eventManager.returnEvent(event);
		if (event.keyCode == 27) {
			_self.hide();
		}
	}
	
	//CREATE LOADER - create loader for showing loading message, optional but recommended when retrieving data
	//TODO: optionally bind to better formatted loader - perhaps always present in footer?
	_self.createLoader = function(loadingMessage) {
		//decouple call since this happens prior to page load and will cause an access violation
		addDOMLoadListener(function(){_self.doCreateLoader(loadingMessage)});
	}
	
	//logic of creating loader - see above function
	_self.doCreateLoader = function(loadingMessage) {
		//create new div that acts as loader and gets bound to this object
		if(!_loader) {
			_loader = document.createElement('DIV');
			_loader.className = 'loadingDialog';
			_loader.innerHTML = loadingMessage;
			//attach to body
			document.body.appendChild(_loader);
		}	
	}
	
	//HIGHLIGHT ROW - highlight the triggering row if applicable
	_self.setHighlight = function() {
		//get parent of type TR and update row name to be rowName + "On" unless ends in "On" already
		if(_doHighlight) {
			//cache original row class
			_originalRowClass = _highlightRow.className;
			_highlightRow.className = _hightlightRowClass;
		}
	}
	
	//UNSET HIGHLIGHT - if the row was lit, return to original state on hide
	_self.unsetHighlight = function() {
		//get parent of type TR and update row name to be rowName - "On" if ends in "On" already
		if(_doHighlight && _highlightRow) {
			_highlightRow.className = _originalRowClass;
		}
	}
	
	//SET TAB - set the tab and associated body
	//TODO: move the frame fix resize here
	_self.setTab = function(which) {
		var selectedTabID = which.id;
		//if a tab was already selected, clear it and its associated body
		if(_currentTab){
			_currentTab.className = 'popupTab';
			_currentTabBody.className = 'popupBody';
		}
		//set the current tab to this tab
		_currentTab = which;
		//set the style of the current tab to on
		_currentTab.className = 'popupTabOn';
		//get the associated body by naming convention
		//TODO: do error testing on this
		var selectedTabBodyID = selectedTabID.substring(0, selectedTabID.length - 3) + 'Body';
		_currentTabBody = returnObject(selectedTabBodyID);
		//set the body to visible
		_currentTabBody.className = 'popupBodyOn';
		//opera fix for set of input values when display is set to none
		_self.redrawSelect();
	}
	
	//RESET - reset of elements specific to last show and reset view, call this in hide method
	_self.clear = function() {
		//reset all values that may impact next load of popup	
		_event = null;
		_clickedElement = null;
		_sourceElement = null;
		_highlightRow = null;
		_originalRowClass = null;
		_arguments = new Array();
		_returnDataObject = new Array();
		_affectedRows = new Array();
		
	}
	
	//SET FIRST TAB - to be called on init and hide - do not do in show command to avoid further delays
	_self.setFirstTab = function() {
		_self.setTab(_firstTab);
	}
	
	//RESET FORM FIELDS - reset data from inputs for next view - pertinent when data not being loaded into form fields on show
	//TODO: allow this to be skipped if desired
	_self.clearInputs = function() {
		if(_form != null) {
			_form.reset();	
		} else {
			//iterate over inputs and set to values captured at initialization time
			//NOTE: cannot just clear values because would kill defaults
		}
	}
	
	//SHOW WORKING
	//TODO: add animation
	_self.showWorking = function() {
		document.documentElement.className = 'working';
	}
	
	//HIDE WORKING
	_self.hideWorking = function() {
		document.documentElement.className = '';
	}
	
	//REQUEST REDRAW SINGLE-SELECT
	_self.redrawSelect = function() {
		//delay redraw logic so that the page can process the class change and show the display change prior to attempting to set the select property
		window.setTimeout(_self.doRedrawSelect, 50);
	}
	
	//DO SINGLE-SELECT REDRAW
	_self.doRedrawSelect = function() {
		if(_form) {
			var elements = _form.elements;
			for(var i = 0; i < elements.length; i++) {
				if(elements[i].type == 'select-one') {
					elements[i].value = elements[i].value;
				}
			}
		}
	}
	
	//POSITION POPUP - move the loader and popup to the center of the viewport *DO NOT REPOSITION ON RESIZE OR TAB CHANGE - will cause navigation problems
	//TODO: when left or top is out of viewport because of size of popup vs size of viewport, make the top left of popup be in top left of viewport
	_self.position = function(object) {
		//defeat the issue with the containing div not reporting its dimensions correctly when having class specified width
		var testObject = object;
		//only do this position test on the nested table if this is the popup (rather than loader)
		if(object.id) {
			//get the first table in the div and get the table's position
			testObject = object.getElementsByTagName('table')[0];
		}
		//get the size of the window
		var viewportDimensions = getViewportSize();
		//get the coordinates of the object
		var objectCoordinates = findCoordinates(testObject);
		//determine where the user has scrolled to
		var scrollOffset = getScrollOffset();
		//get the object width - not the most efficient method but stable
		var objectWidth = objectCoordinates['X2'] - objectCoordinates['X1'];
		//bet the object height - not the most efficient method but stabe
		var objectHeight = objectCoordinates['Y2'] - objectCoordinates['Y1'];
		//get the width midpoint and subtract half of the object width to center
		var finalX = (viewportDimensions['width'] / 2) - (objectWidth / 2);
		//get the height midpoint and subtract half of the object height to center
		var finalY = (viewportDimensions['height'] / 2) - (objectHeight / 2);
		//add the scroll width offset
		finalX += scrollOffset['width'];
		//add the scroll height offset
		finalY += scrollOffset['height'];
		finalX = finalX > 0 ? finalX : 0;
		finalY = finalY > 0 ? finalY : 0;
		//set the left position
		object.style.left = finalX + 'px';
		//set the top position
		object.style.top = finalY + 'px';		
	}
	
	//RE-POSTITION POPUP - only to be used on an external load event where the popup size will change drastically - like loading a large image
	_self.rePosition = function() {
		if(_boundObject.style.display == 'block') {
			//position the popup - must be after loader is shown
			_self.position(_boundObject);
			
			//must have popup visible before getting coordinates to put iframe behind it
			_self.updateBlocker();
		}
	}
}