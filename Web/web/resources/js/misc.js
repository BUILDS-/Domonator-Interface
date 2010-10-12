/* LEGEND FUNCTIONS - for use on monitor page and standalone heat chart */
function toggleLegend() {
	var cookiePrepend = cookieManager.getPageID();
	var legend = returnObject('heatChartLegend');
	if(legend.style.display == 'none') {
		cookieManager.set(cookiePrepend + 'heatChartLegendState', 'true');
		updateLegendDisplay('true');
	} else {
		cookieManager.set(cookiePrepend + 'heatChartLegendState', 'false');
		updateLegendDisplay('false');
	}
}

function updateLegendDisplay(show) {
	if(show == 'true') {
		returnObject('heatChartLegendLabel').innerHTML = 'Hide Legend';
		returnObject('heatChartLegend').style.display = 'block';
	} else {
		returnObject('heatChartLegendLabel').innerHTML = 'Show Legend';
		returnObject('heatChartLegend').style.display = 'none';
	}
}

function initLegend() {
	var cookiePrepend = cookieManager.getPageID();
	var cookieValue = cookieManager.get(cookiePrepend + 'heatChartLegendState');
	
	updateLegendDisplay(cookieValue);
}

//function to open links in a parent window
	//ex. <a href="javascript://" onclick="openParent('/controller/?parameter=(JSEncoded'd value)')"...>label</a>
function openParent(location) {
	//below is an IE hack for certain versions of IE that do not allow access to window.opener.closed when the window is closed
	var isOpen = true;
	try {
		var trash = window.opener.closed;
	} catch (e) {
		isOpen = false;
	}
	//if the window is open, change the location
	if(isOpen && window.opener && !window.opener.closed) {
		window.opener.location = location;
		window.opener.focus();
	//otherwise, create a new window
	} else {
		var newParent = window.open(location, 'newParent', 'resizable=yes, scrollbars=yes, location=yes, status=yes, menubar=yes, directories=yes, titlebar=yes, toolbar=yes');
		newParent.focus();
	}
}

//function to open stand alone heat chart from monitor page - also sets focus
function openStandAloneHeatChart(location) {
	var heatChart = window.open(location, 'heatChart', 'resizable=yes,scrollbars=yes,width=500,height=600,location=no,status=yes, menubar=yes,directories=no');
	heatChart.focus();
	return false;	
}