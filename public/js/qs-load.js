
// Feel free to run your own CoffeeScript code right from the console!
var run = function(code) {
	var js = CoffeeScript.compile(code);
	eval(js);
}


(function(Joystick) {
	var setJoystickValue = function(e) {
		JoyStick.set(e.newVal % 360);
	}

	// Load the joystick control
	// using MAX & MIN a bit of a hack to
	// get around the forced dial.
	YUI().use('dial', function(Y) {
		var dial = new Y.Dial({
			stepsPerRevolution : 360,
			value : 0,
			min : Number.MIN_VALUE,
			max : Number.MAX_VALUE,
			after : {
				valueChange: Y.bind(setJoystickValue, dial)
			}
		});
		dial.render("#joystick");
	});
}(Joystick));
