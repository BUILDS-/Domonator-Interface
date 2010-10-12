function tree() {
	var _self = this;
	
	var _tree = null;
	//function that handles node selection - gets passed into tree instance prior to initialization
	var _selectionHandler = function(){};
	//holder for currently selected node - used to remove last selection prior to new selection
	var _selectedNode = null;
	//ID of node to show as selected on instantiation
	var _preselectedID = null;
	//name of cookie expansion of nodes is stored in
	var _cookieName = 'treeControl';
	//storage of expanded nodes
	var _expandedNodeNames = new Array();
	
	//resore expand state from stored cookie
	_self.restoreExpansion = function() {
		var cookieValue = cookieManager.get(_cookieName);
		if (cookieValue) {
			_expandedNodeNames = unescape(cookieValue).split(",");
		}
		//iterate over each node and expand the group
		for(index in _expandedNodeNames) {
			var nodeToggle = returnObject(_expandedNodeNames[index]);
			if(nodeToggle) {
				_self.doToggleChildren(nodeToggle, 'collapsed');
			} else {
				_expandedNodeNames.splice(index, 1);
			}
		}
	}
	
	_self.doToggleChildren = function(which, state) {
		//get the node that fired the event then get it's child node collection
		var childrenNodes = getElementsByClassName('treeWidgetNodeList', which.parentNode, 'div')[0];
		if(which.className && typeof(childrenNodes) != 'undefined') {
			//expand if collapsed
			if(state == 'collapsed') {
				which.className = 'nodeSelectorExpanded';
				_self.setDisplay(childrenNodes, "EXPANDED");
			//collapse if expanded
			} else if(state == 'expanded') {
				which.className = 'nodeSelectorCollapsed';
				_self.setDisplay(childrenNodes, "COLLAPSED");
			}
		}
	}
	
	//toggle expand/collapse - wraps doToggleChildren so that cookies can restore state without resetting cookies...
	_self.toggleChildren = function(which) {
		var className = which.className;
		var identifier = which.id;
		var state = 'collapsed';
		if(className) {
			//will be expanded
			if(className == 'nodeSelectorCollapsed') {
				state = 'collapsed';
				//add to expanded list
				_expandedNodeNames.push(identifier);
			//will be collapsed
			} else {
				state = 'expanded';
				//try to remove from expanded list
				for (var i = 0; i < _expandedNodeNames.length; i++) {
					if(_expandedNodeNames[i] == identifier) {
						_expandedNodeNames.splice(i, 1);
					}
				}
			}
		}
		//store the updated expanded list
		storeNodeCookie(_expandedNodeNames);
		//toggle display
		_self.doToggleChildren(which, state);
	}
	
	//store the expanded nodes in a cookie
	function storeNodeCookie(nodeNames) {
		if(nodeNames.length > 0) {
			var nodeNamesString = nodeNames.join(',');
			cookieManager.set(_cookieName, nodeNamesString);
		} else {
			cookieManager.remove(_cookieName);
		}
	}
	
	//mark the node as selected
	_self.markSeleted = function(which) {
		//clear the last selection if set
		if(_selectedNode != null) {
			_selectedNode.className = 'nodeLabel';
		}
		//set the display of the current selection
		which.className = "nodeLabelSelected";
		//set the current selection
		_selectedNode = which;
	}
	
	//trigger the node selection
	_self.selectNode = function(which) {
		//mark the node as selected
		_self.markSeleted(which);
		//pass the node's ID to the selection handler function
		_selectionHandler(which.id);
	}
	
	//set a node to be selected on page load
	_self.setSelectedID = function(which) {
		_preselectedID = which;	
	}
	
	//toggle node group expansion
	_self.setDisplay = function(which, state) {
		if(state == "EXPANDED") {
			which.style.display = 'block';
		} else if(state == "COLLAPSED") {
			which.style.display = 'none';
		}
	}
	
	//initialize nodes
	_self.attachNodeBehavior = function(which) {
		//check to see if node has child nodes
		var childrenNodes = getElementsByClassName('treeWidgetNodeList', which, 'div');
		if(childrenNodes.length > 0) {
			//get the first node selector child of the node
			var toggle = getElementsByClassName('nodeSelector', which, 'span')[0];
			//change the selector's class name to display the toggle correctly
			toggle.className = 'nodeSelectorCollapsed';
			//register the expand/collapse function to a click listener
			eventManager.registerListener(toggle, 'click', function(){_self.toggleChildren(toggle)});
		}
		//get the node label for the node
		var selector = getElementsByClassName('nodeLabel', which, 'span')[0];
		//attach the selection handler to the label
		eventManager.registerListener(selector, 'click', function(){_self.selectNode(selector)});					
	}
	
	//set the function that selection will pass its ID to
	_self.setSelectionHandler = function(handler) {
		_selectionHandler = handler;
	}
	
	//set the tree object id
	_self.setTree = function(tree) {
		_tree = tree;
	}
	
	//register intitialize tree
	_self.init = function() {
		//don't initialize until page has loaded
		addDOMLoadListener(_self.doInit);
	}
	
	//initialize tree
	_self.doInit = function() {
		//get tree DOM object
		_tree = returnObject(_tree);
		//attach node behaviors
		var treeNodes = getElementsByClassName('treeWidgetNode', _tree, 'div');
		for (var i = 0; i < treeNodes.length; i++) {
			_self.attachNodeBehavior(treeNodes[i]);
		}
		//if there is a node that should be preselected, select it
		if(_preselectedID != null) {
			var preselectedNode = returnObject(_preselectedID);
			if(preselectedNode) {
				_self.markSeleted(preselectedNode);
			}
		}
		//change display of boundary cases
		var nodeLists = getElementsByClassName('treeWidgetNodeList', _tree.parentNode, 'div');
		for( var i = 0; i < nodeLists.length; i++) {
			//get last node - defeat issue where some browsers see it as a text node from white space
			var lastNode = nodeLists[i].lastChild;
			while(lastNode && lastNode.nodeName.toLowerCase() != 'div' && lastNode.previousSibling) {
				lastNode = lastNode.previousSibling;
			}
			if(lastNode && lastNode.style) {
				//remove the vertical bar from the last node in any node list
				lastNode.style.backgroundImage = 'none';
				//change the T to an L on the last node
				var childSelector = getElementsByClassName('nodeSelector', lastNode, 'span')[0];
				if(childSelector) {
					childSelector.style.backgroundImage = 'url(' + GLOBAL_baseImagePath + 'treenode_grid_l.gif)';
				}
			}
		}
		_self.restoreExpansion();
	}
}