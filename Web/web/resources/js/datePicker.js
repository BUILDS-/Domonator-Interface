//class for the display and selection of calendar days, requires css classes found in default.css
//TODO(important): add ability to clear date
//TODO(important): allow other calendars to share calendar tables to reduce load?
//TODO(important): improve performance by only attaching one click listener to the body table and inspecting the event to determine the cell?
//TODO: update for internationalization
//TODO: consider any boundary cases such as instantiating just before midnight
//TODO: consider case where user has chosen UTC time rather than local time
function calendar() { 
	var _self = this; //instance reference
	
	var _registeredToggles = new Array(); //toggles registered for this instance
	var _input; //input that accepts user selected value
	var _calendarTable;  //calendar
	var _currentSelectedDay; //container for the currently selected day, only used for clearing last selection if still in same month
	var _currentSelectedDate; //string representation for currently selected date, used when building a month to show selection
	var _calendarTitleCell; //container for the title element of the calender
	var _bodyTable; //container for the days of the month
	var _calendarLastCell; //container for prev month paginator
	var _calendarNextCell; //container for next month paginator
	var _currentDate; //current date - this is a transient date used for updating the calendar view when paging through months
	var _todayDate; //current date/time object
	var _todayDateString; //string representation of today's date, use when building a month to show current day
	var _frameFix; //iframe to sit behind popup to prevent dropdowns showing through in IE - fix for IE's rendering issue
	var _timeOffset; //time offset from php
	
	//set today's date in the accepted format - should be used when user time is not the appropriate time to use
	_self.setTimeOffset = function(date) {
		var currentDate = new Date();
		currentDate.setSeconds(0); 
		currentDate.setMilliseconds(0);

		var dateArray = date.split('-');
		var PHPDate = new Date(dateArray[0], dateArray[1] - 1, dateArray[2], dateArray[3], dateArray[4], 0);
		_timeOffset = (currentDate.getTime() - PHPDate.getTime())/1000/60/60;
		_self.updateToday();
	}
	
	//update today's date taking into account the offset from the locale settings
	_self.updateToday = function() {
		_todayDate = new Date();
		_todayDate.setSeconds(0); 
		_todayDate.setMilliseconds(0);
		_todayDate.setHours(_todayDate.getHours() - _timeOffset);
		var todayYear = _todayDate.getFullYear();
		//increment month since january == 0
		var todayMonth = _todayDate.getMonth() + 1;
		//pad month if necessary
		todayMonth = (todayMonth < 10) ? '0' + todayMonth.toString() : todayMonth;
		var todayDate = _todayDate.getDate();
		//padd date if necessary
		todayDate = (todayDate < 10) ? '0' + todayDate.toString() : todayDate;
		_todayDateString = todayYear + "-" + todayMonth + "-" + todayDate;
		//console.log(_todayDate);
	}
	
	//hide the calendar
	_self.hide = function() { 
		if (_frameFix) {
			_frameFix.style.display = 'none';
		}
		_calendarTable.style.display = "none";
		//clear registered listeners
		eventManager.unregisterListener(document, 'click', function(event){_self.clickOutsideTest(event)});
		eventManager.unregisterListener(window, 'keyup', function(event){_self.testEscapeKey(event)});
	} 
	
	//show the calendar
	_self.show = function(which) {
		if(_input) {
			var inputValue = _input.value;
			//if the value in the input appears to be valid - use that as the current selected date
			if(isValidEuroDate(inputValue)) {
				_currentSelectedDate = inputValue;
			//else clear it
			} else {
				_input.value = '';
			}
		}
		//update today's date
		_self.updateToday();
		//if there is a day selected - parse it into a date to pass to the calendar update - the calendar should default to showing the month with a day selected in it
		if(_currentSelectedDate) {
			var selectedDateArray = _currentSelectedDate.split("-");
			var showDate = new Date(selectedDateArray[0], selectedDateArray[1] - 1, selectedDateArray[2]);
		//otherwise just use today's date
		} else {
			var showDate = _todayDate;
		}
		
		//update calendar to contain appropriate days
		_self.updateCalendar(showDate); 
		
		//get the coordinates of the clicked event as a relative position
		var clickedElementCoordinates = findCoordinates(which); 
		_calendarTable.style.left = clickedElementCoordinates['X1'] + 'px'; 
		_calendarTable.style.top = (clickedElementCoordinates['Y2'] + 5)  + 'px';
		_calendarTable.style.display = "block";
		//register listern for click outside of calendar bounds
		eventManager.registerListener(document, 'click', function(event){_self.clickOutsideTest(event)}); 
		//register listener for escape key to kill popup - removed on hide
		eventManager.registerListener(window, 'keyup', function(event){_self.testEscapeKey(event)});
		
		if (_frameFix) {
			//get coordinates of calendar
			var calendarCoords = findCoordinates(_calendarTable);
			//duplicate height and width of popup
			_frameFix.style.width = (calendarCoords['X2'] - calendarCoords['X1']) + 'px';
			_frameFix.style.height = (calendarCoords['Y2'] - calendarCoords['Y1']) + 'px';
			//position in same location as popup
			_frameFix.style.top = calendarCoords['Y1'] + 'px';
			_frameFix.style.left = calendarCoords['X1'] + 'px';
			_frameFix.style.display = 'block';
		}
	}
	
	//toggle display of calendar
	_self.toggle = function(which) {
		if(!_input || _input.disabled == false) {
			if (_calendarTable.style.display == "none" || _calendarTable.style.display == "") { 
				_self.show(which); 
			} else { 
				_self.hide(); 
			}
		}
	} 
	
	//register a page object as a toggle for the display of the calendar
	_self.registerToggle = function(toggle) { 
		var toggleObject = returnObject(toggle);
		eventManager.registerListener(toggleObject, 'click', function(){_self.toggle(toggleObject)});
		//assign pointer inline rather than applying a class in case there is already a class
		toggleObject.style.cursor = "pointer";
		//push registered toggle into a stack for later behavioral handling of clicked elements
		_registeredToggles.push(toggleObject); 
	} 
	
	//register the input that will display the selected date value
	_self.registerInput = function(input) { 
		_input = returnObject(input); 
	} 
	
	//test to see if the user has clicked outside of the calendar - closes calendar
	_self.clickOutsideTest = function(event) { 
		event = eventManager.returnEvent(event);
		//if the event was not in the bounds of the table, make sure it wasn't a toggle that was clicked and hide
		if (!eventInBounds(event, _calendarTable)) { 
			var clickedElement = getClickedElement(event);
			//make sure it wasn't a toggle that was clicked
			for (toggle in _registeredToggles) { 
				if (_registeredToggles[toggle] == clickedElement) { 
					return;
				} 
			} 
			//hide the calendar
			_self.hide(); 
		} 
		return; 
	} 
	
	//HANDLE ESCAPE KEY - function for testing if the keyup event was the escape key - hides if so
	_self.testEscapeKey = function(event) {
		event = eventManager.returnEvent(event);
		if (event.keyCode == 27) {
			_self.hide();
		}
	}
	
	//over behavior on individual day cells
	_self.cellOver = function(which) { 
		which.originalClass = which.className;
		which.className = 'calendarDayOver';
	} 
	
	//return cell to normal state when cursor leaves cell
	_self.cellOut = function(which) {
		if(which.className != 'calendarDayOn') {
			if (which.originalClass) {
				which.className = which.originalClass;
			} else {
				which.className = ''; 
			} 
		}
	} 
	
	//click behavior on selecting a day in the calendar
	_self.cellClick = function(which, dateValue) {
		//TODO: split out setting into a new method to be used at load time?
		//update the class name to indicate it is the current selection
		which.className = 'calendarDayOn'; 
		//set value in input 
		_input.value = dateValue; 
		_currentSelectedDate = dateValue;
		_self.hide(); 
		//clear past selection and set new selection 
		if (_currentSelectedDay) { 
			if (typeof(_currentSelectedDay.originalClass) != 'undefined' && _currentSelectedDay.originalClass != 'calendarDayOn') {
				_currentSelectedDay.className = _currentSelectedDay.originalClass;
			} else {
				_currentSelectedDay.className = ''; 
			}
		}
		//set current selection
		_currentSelectedDay = which; 
	}
	
	//register events on a single cell
	_self.registerCellEvents = function(cell, dateValue) { 
		eventManager.registerListener(cell, 'mouseover', function(){_self.cellOver(cell)}); 
		eventManager.registerListener(cell, 'mouseout', function(){_self.cellOut(cell)}); 
		eventManager.registerListener(cell, 'click', function(){_self.cellClick(cell, dateValue)}); 
	} 
	
	//update calendar for next month
	_self.nextMonth = function() { 
		nextDate = new Date(_currentDate); 
		nextDate.setMonth(_currentDate.getMonth() + 1);
		//update calendar with given date
		_self.updateCalendar(nextDate); 
	} 
	
	//update calendar for previous month
	_self.prevMonth = function() { 
		prevDate = new Date(_currentDate); 
		//if month is january, special case month to december and decrement year
		if(prevDate.getMonth() == 0){ 
			prevDate.setMonth(11); 
			prevDate.setYear(_currentDate.getFullYear() - 1);
		//just decrement month
		} else { 
			prevDate.setMonth(_currentDate.getMonth() - 1); 
		}
		//update calendar with given date
		_self.updateCalendar(prevDate); 
	} 
	
	_self.updateCalendar = function(dateValue) {
		//update the current date to the given date
		_currentDate = dateValue; 
		//first of month is first day of current month, used to start date display from 
		var firstOfMonth = new Date(dateValue); 
		firstOfMonth.setDate(1);
		//arrays for js index to english value conversion
		//TODO: make this internationalization safe
		var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
		//set the title of the calendar to include the month and year
		_calendarTitleCell.innerHTML = months[dateValue.getMonth()] + " " + dateValue.getFullYear(); 
		//clear last calendar values
		numRows = _bodyTable.rows.length; 
		for (var i = 2; i < numRows; i ++) { 
			_bodyTable.deleteRow(2); 
		} 
		//start assembling calendar rows
		currentRow = _bodyTable.insertRow(_bodyTable.rows.length); 
		currentRow.className = 'calendarRow'; 
		//insert blank cells until first day of month 
		for(var i = 0; i < firstOfMonth.getDay(); i ++) { 
			currentCell = currentRow.insertCell(currentRow.cells.length); 
			currentCell.innerHTML = "&#160;"; 
		} 
		var tempDate = new Date(firstOfMonth); 
		currMonth = tempDate.getMonth(); 
		testMonth = tempDate.getMonth();
		//while you are in the given month, keep inserting cells
		for(var i = 0; currMonth == testMonth; i ++) { 
			//if the day is monday, insert a new row
			if(tempDate.getDay() == 0) { 
				currentRow = _bodyTable.insertRow(_bodyTable.rows.length); 
				currentRow.className = 'calendarRow'; 
			}
			//create the cell and insert the date
			currentCell = currentRow.insertCell(currentRow.cells.length);
			currentCell.innerHTML = tempDate.getDate();
			var selectedYear = tempDate.getFullYear();
			//increment month since january == 0
			var selectedMonth = tempDate.getMonth() + 1;
			//pad month if necessary
			if(selectedMonth < 10) {
				selectedMonth = '0' + selectedMonth.toString();
			}
			var selectedDate = tempDate.getDate();
			//pad date if necessary
			if(selectedDate < 10) {
				selectedDate = '0' + selectedDate.toString();
			}
			currentDateValue = selectedYear + "-" + selectedMonth + "-" + selectedDate;
			currentCell.title = currentDateValue;
			if(_currentSelectedDate == currentDateValue) {
				currentCell.className = 'calendarDayOn';
				_currentSelectedDay = currentCell;
			} else if (_todayDateString == currentDateValue) {
				currentCell.className = 'calendarDayCurrent';
			}
			//register over, out, and click events
			_self.registerCellEvents(currentCell, currentDateValue);
			//increment day
			tempDate.setDate(tempDate.getDate() + 1);
			//test to see if you have gone into next month, if so, set flag to not continue rendering calendar days
			testMonth = tempDate.getMonth();
			//TODO: may need to insert trailing cells, might want to switch for condition
			/*
			if(currMonth != testMonth){
				//break;
				mon_selfCurrent = false;
			}
			*/
		} 
	} 
	
	//request initialization
	_self.init = function() {
		//delay init until page is loaded
		addDOMLoadListener(_self.doInit);
	}
	
	//initialize date picker
	_self.doInit = function() {

		_calendarTable = createTable(); 
		_calendarTable.className = 'calendarWrapper'; 
		//generate calendar structure
		var headerRow = _calendarTable.insertRow(_calendarTable.rows.length); 
		var headerCell = headerRow.insertCell(headerRow.cells.length); 
		var headerTable = createTable(); 
		headerTable.width = "100%"; 
		headerCell.appendChild(headerTable); 
		var headerBaseRow = headerTable.insertRow(0); 
		_calendarLastCell = headerBaseRow.insertCell(headerBaseRow.cells.length); 
		_calendarLastCell.innerHTML = '&#171;'; 
		_calendarLastCell.className = 'calendarLast'; 
		_calendarTitleCell = headerBaseRow.insertCell(headerBaseRow.cells.length); 
		_calendarTitleCell.className = 'calendarTitle'; 
		_calendarNextCell = headerBaseRow.insertCell(headerBaseRow.cells.length); 
		_calendarNextCell.innerHTML = '&#187;'; 
		_calendarNextCell.className = 'calendarNext'; 
		_calendarNextCell.align = "right"; 
		//register pagination
		eventManager.registerListener(_calendarLastCell, 'click', _self.prevMonth); 
		eventManager.registerListener(_calendarNextCell, 'click', _self.nextMonth); 
		//generate wrapper for days
		var bodyRow = _calendarTable.insertRow(_calendarTable.rows.length); 
		var bodyCell = bodyRow.insertCell(bodyRow.cells.length); 
		bodyCell.className = 'calendarPadder'; 
		_bodyTable = createTable(); 
		_bodyTable.className = 'calendarTable'; 
		bodyCell.appendChild(_bodyTable); 
		//generate days of week headers
		var currentRow = _bodyTable.insertRow(_bodyTable.rows.length); 
		currentRow.className = 'calendarDaysOfWeek'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'S'; 
		currentCell.className = "firstDayOfWeek"; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'M'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'T'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'W'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'T'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'F'; 
		currentCell = currentRow.insertCell(currentRow.cells.length); 
		currentCell.innerHTML = 'S'; 
		currentCell.className = "lastDayOfWeek"; 
		//create a gap between header and days
		var currentRow = _bodyTable.insertRow(_bodyTable.rows.length); 
		currentCell = currentRow.insertCell(currentRow.cells.length);
		currentCell.innerHTML = "<img id=\"testMe\" src='" + GLOBAL_baseImagePath + "spacer.gif' height='4' width='1' />"; 
		
		//append calendar to body
		document.body.appendChild(_calendarTable);
		if(useIEBranch) {
			_frameFix = document.createElement('IFRAME');
			//apply pertinent styling
			_frameFix.className = 'frameFix2'; //higher z-index than frameFix
			//set the opcacity to 0 for IE - done in js to prevent the parse error in the css file and not require a hack in the css file
			_frameFix.style.filter = "alpha(opacity = 0)";
			//attach the element to the document
			document.body.appendChild(_frameFix);
		}
	} 
} 

