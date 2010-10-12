function tableExpandCollapse() {
	var _self = this;
	var _collapsibleTableClass = 'listBoxCollapsible';
	var _tableElements = new Array(); //top level of containers, anything with expand/collapse all should have all top level elements in the table have the same first node
	var _cookieRoot = 'nodeExpansion';
	var _expanderClass = 'expandTransformer';
	var _expandedNodeNames = new Array();
	var _metaExpanded = false;
	var _customToggleFunction = function() {}
	
	_self.init = function(){
		if(typeof(ROW_DISPLAY_TOGGLE_CUSTOM_FUNCTION) == 'function') {
			_customToggleFunction = ROW_DISPLAY_TOGGLE_CUSTOM_FUNCTION;
		}
		//find all cells marked as containers for collapsible list boxes
		var collapseTableContainers = getElementsByClassName(_collapsibleTableClass, null, 'td', false);
		//get the collapsible tables
		var collapseTables = new Array();
		//retrieve the collapsible tables from the containers
		for (var i = 0; i < collapseTableContainers.length; i++) {
			var childTables = collapseTableContainers[i].getElementsByTagName('table');
			if (childTables) {
				collapseTables.push(childTables[0]);
			}
		}
		
		//iterate over each collapsible table and inspect the rows for assembly
		for (var i = 0; i < collapseTables.length; i++) {
			var tableRows = collapseTables[i].rows;
			for (var j = 0; j < tableRows.length; j++) {
				//retrieve ID from row and get string representation of relationship (ex "Administration.-.Get Keys By Something.-.Something Else" where this is a tertiary row)
				var identifier = tableRows[j].id;
				if(identifier) {
					var relationshipChain = identifier.split('.-.');
				} else {
					//row is not identified in the chain, skip it
					continue;
				}
				//create new top level element if it doesn't already exist
				if(!_tableElements.hasOwnProperty(relationshipChain[0])) {
					_tableElements[relationshipChain[0]] = new tableElement();
				}
				var tempTableElement = _tableElements[relationshipChain[0]];
				//set the top level as collapsed until overridden
				for(var k = 1; k < relationshipChain.length; k++) {
					//get the next node in the chain
					var nextChild = tempTableElement.getChildByID(relationshipChain[k]);
					//create node if it didn't exist
					tempTableElement = (nextChild == null) ? tempTableElement.setChild(relationshipChain[k]) : nextChild;
				}
				//now at the bottom of the chain, set the row element
				tempTableElement.setRow(tableRows[j]);
				var expander = getElementsByClassName(_expanderClass, tableRows[j], 'img', false);
				if(expander.length == 1) {
					//register the click behavior
					_self.registerToggle(expander[0], tempTableElement);
				}
			}
		}
		_self.getCookieState();
		// force redraw of each table - required due to redraw bug with too many updates in the same table at once from the cookie updates
		for (var i = 0; i < collapseTables.length; i++) {
			collapseTables[i].style.display = 'none';
			collapseTables[i].style.display = 'block';
		}
	}
	
	_self.registerToggle = function(toggle, tableElement) {
		eventManager.registerListener(toggle, 'click', function(){_self.toggleRowState(toggle, tableElement)});
	}
	
	_self.updateRowDisplay = function(which, topLevelExpansion) {
		var whichRow = which.getRow();
		var currentExpansion = which.getExpanded();
		var expander = getElementsByClassName(_expanderClass, whichRow, 'img', false);
		if(expander.length == 1) {
			expander = expander[0];
			var imageBasePath = getFilePath(expander.src);
			var src = imageBasePath;
			if(which.getNumChildren() > 0) {
				src += currentExpansion ? 'expandMinus.gif' : 'expandPlus.gif';
			} else {
				src += 'expandNone.gif';
			}
			expander.src = src;
		}
		
		var children = which.getChildren();
		if(children) {
			var expansion = topLevelExpansion && currentExpansion;
			for(var i in children) {
				if(whichRow) {
					var currentRow = children[i].getRow();
					currentRow.style.display = expansion ? tableRowDisplay : 'none';
					_customToggleFunction(currentRow, expansion);
				}
				_self.updateRowDisplay(children[i], expansion);
			}
		}
	}
	
	_self.toggleRowState = function(toggle, tableElement) {
		var expandState = !tableElement.getExpanded();
		tableElement.setExpanded(expandState);
		_self.setCookieState(tableElement);
		
		_self.updateRowDisplay(tableElement, expandState)
	}
	
	_self.batchSet = function(tableElement, expansion) {
		//if this is a string identifier for a node, get the node and do a recursive expand state set
		if(typeof(tableElement) == 'string') {
			var relationshipChain = tableElement.split('.-.');
			var tempTableElement = _tableElements[relationshipChain[0]];
			//step down each element in the chain to find node
			for(var i = 1; i < relationshipChain.length; i++) {
				//get the next node in the chain
				tempTableElement = tempTableElement.getChildByID(relationshipChain[i]);
			}
			//set node to expand state
			if(tempTableElement) {
				//recursively set expand state element and children
				_self.batchSet(tempTableElement, expansion);
				//after all expand states have been set, update display
				_self.updateRowDisplay(tempTableElement, expansion)
			}
		} else {
			var row = tableElement.getRow();
			//make sure it contains a row
			if(row) {
				//make sure it's a row that can expand
				var expander = getElementsByClassName(_expanderClass, row, 'img', false);
				if(expander.length == 1) {
					//set current node to expanded
					tableElement.setExpanded(expansion);
					//save expand state in cookie
					_self.setCookieState(tableElement);
				}
			}
			//get children
			var children = tableElement.getChildren();
			//if there are children, batch set their state
			if(children) {
				for(var i in children) {
					_self.batchSet(children[i], expansion);
				}
			}
		}
	}
	
	_self.expandAll = function(tableElement) {
		_self.batchSet(tableElement, true);
	}
	
	_self.collapseAll = function(tableElement) {
		_self.batchSet(tableElement, false);
	}
	
	_self.toggleAll = function(tableElement, which) {
		var isButton = false;
		var isText = false;
		
		if(which.nodeName.toLowerCase() == 'input' && which.type == 'button') {
			var label = which.value.toLowerCase();
			isButton = true;
		} else if(which.nodeName.toLowerCase() == 'div') {
			var label = which.innerHTML.toLowerCase();
			isText = true;
		}
		
		if(label.lastIndexOf('expand') != -1) {
			_metaExpanded = true;
		} else if(label.lastIndexOf('collapse') != -1) {
			_metaExpanded = false;
		} else {
			_metaExpanded = !_metaExpanded;
		}
		
		//TODO: allow labels to be overridden for language support
		if(_metaExpanded) {
			label = "collapse all";
		} else {
			label = "expand all";
		}
		
		if(isText) {
			var textNode = document.createTextNode(label);
			HTMLObject.appendChild(textNode);	
		} else if (isButton) {
			which.value = label;
		} else {
			//unknown type
		}

		_self.batchSet(tableElement, _metaExpanded);
	}
	
	_self.getCookieState = function() {
		//make the cookie prepender be something like "settings_notifications"
		cookieBase = cookieManager.getPageID();
		var topNodes = new Array();
		
		//RETRIEVE VALUES FROM COOKIE AND UPDATE DISPLAY
		var cookieName = cookieBase + _cookieRoot;
		//retrieve cookie for page and split into individual mappings
		var cookieValue = cookieManager.get(cookieName);
		if (cookieValue) {
			_expandedNodeNames = unescape(cookieValue).split(",");
			for(var i in _expandedNodeNames) {
				var relationshipChain = _expandedNodeNames[i].split('.-.');
				if(_tableElements.hasOwnProperty(relationshipChain[0])) {
					var tempTableElement = _tableElements[relationshipChain[0]];
					//step down each element in the chain to find node
					for(var i = 1; i < relationshipChain.length; i++) {
						//get the next node in the chain
						tempTableElement = tempTableElement.getChildByID(relationshipChain[i]);
					}
					//set node to expanded
					if(tempTableElement) {
						tempTableElement.setExpanded(true);
					}
				} else {
					//console.log("element not found?" + relationshipChain[0]);	
				}
			}
		}

		for(var i in _tableElements) {
			_self.updateRowDisplay(_tableElements[i], true);
		}
	}
	
	_self.setCookieState = function(tableElement) {
		var expansion = tableElement.getExpanded();
		var row = tableElement.getRow();
		if(row) {
			var identifier = row.id;
			var foundIndex = getIndexOf(_expandedNodeNames, identifier);
			
			if(!expansion) {
				if(foundIndex != -1) {
					_expandedNodeNames.splice(foundIndex, 1);
				}
			} else {
				//only push if it's not already there, don't want duplicates
				if(foundIndex == -1) {
					_expandedNodeNames.push(identifier);
				}
			}
	
			cookieBase = cookieManager.getPageID();
			var cookieName = cookieBase + _cookieRoot;
			
			if(_expandedNodeNames.length > 0) {
				var nodeNamesString = _expandedNodeNames.join(',');
				cookieManager.set(cookieName, nodeNamesString);
			} else {
				cookieManager.remove(cookieName);
			}
		}
	}
	
	//for debug purposes only
	_self.getNodeID = function(tableElement) {
		var row = tableElement.getRow();
		if(row && row.id) {
			return row.id;
		} else {
			var children = tableElement.getChildren();
			if(children) {
				for(var i in children) {
					var childID = _self.getNodeID(children[i]);
					var currentID = childID.substr(0, childID.lastIndexOf(".-.") + 1);
					return currentID;
					break;
				}
				return "id not found in children";
			} else {
				return "id not found in children";
			}
		}
	}
}

//expander node element
function tableElement(parent) {
	var _self = this;
	var _parent = parent;
	var _children = new Array();
	var _numChildren = 0;
	var _row = null;
	var _expanded = null;
	
	_self.getParent = function() {
		return _parent;
	}
	
	_self.hasParent = function() {
		return _parent && _parent.getRow() ? true : false;
	}
	
	_self.getChildren = function() {
		if(_numChildren > 0) {
			return _children;
		} else {
			return null
		}
	}
	
	_self.getNumChildren = function() {
		return _numChildren;
	}
	
	_self.getChildByID = function(ID) {
		return _children.hasOwnProperty(ID) ? _children[ID] : null;
	}
	
	_self.setChild = function(ID) {
		//check to see if id exists in associative _children array
		if(!_children.hasOwnProperty(ID)) {
			_children[ID] = new tableElement(_self);
		}
		_numChildren ++;
		return _children[ID];
	}
	
	_self.setRow = function(row) {
		_row = row;
	}
	
	_self.getRow = function() {
		return _row;	
	}
	
	_self.setExpanded = function(expanded) {
		_expanded = expanded;
		return expanded;
	}
	
	_self.getExpanded = function() {
		//if there is no row, this isn't a "real" node, it's a node used for organizational purposes, must be expanded to manage nodes below
		if(_row == null) {
			return true;
		} else if(_expanded == null) {
			return false;
		} else {
			return _expanded;
		}
	}
}

//create instance of expand collapse handler
var tableExpandCollapseHandler = new tableExpandCollapse();
//register initialization after dom has been loaded
addDOMLoadListener(tableExpandCollapseHandler.init);