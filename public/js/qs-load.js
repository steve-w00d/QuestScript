// Feel free to run your own CoffeeScript code right from the console!
var run = function(code) {
	var js = CoffeeScript.compile(code);
	eval(js);
}

$("button[name='run']").click(function() {
	var code = $('#editor-form').val();
	run(code);
});


var Joystick;
(function(Joystick) {
	var dial,
		INTENT_THRESH = 50,
		fastPoll = 100,
		
		getPositions = function(target) {
			var handle = target._handleNode._node,
				marker = target._markerNode._node,
				handleX = parseInt(handle.style.left.substring(0, handle.style.left.length-2), 10),
				handleY = parseInt(handle.style.top.substring(0, handle.style.top.length-2), 10),
				markerX = parseInt(marker.style.left.substring(0, marker.style.left.length-2), 10),
				markerY = parseInt(marker.style.top.substring(0, marker.style.top.length-2), 10);
			return {
				handleX : handleX,
				handleY : handleY,
				markerX : markerX,
				markerY : markerY,
				deltaX  : Math.abs(handleX - markerX),
				deltaY  : Math.abs(handleY - markerY)
			};
		},
		
		interval = setInterval(function() {
			if (dial) {
				var p = getPositions(dial);
				if (Math.sqrt(p.deltaX * p.deltaX +
						p.deltaY * p.deltaY) < INTENT_THRESH) {
					// TODO: UNCOMMENT LATER	
					// Joystick.setIntent(false);
				} else {
					// TODO: UNCOMMENT LATER
					// Joystick.setIntent(true);
				}
			}
		}, fastPoll),
		
		setJoystickValue = function(e) {
			var currentTarget = e.currentTarget;

			// TODO: UNCOMMENT LATER
			//Joystick.setDegree(currentTarget._angle);
		};

	// Load the joystick control
	// using MAX & MIN a bit of a hack to
	// get around the forced dial.
	YUI().use('dial', function(Y) {
		dial = new Y.Dial({
			stepsPerRevolution : 360,
			value : 0,
			diameter : 100,
			handleDistance : 0,
			handleDiameter : 0.5,
			strings : { 
				label: "",
				resetStr : "" 
			},
			after : {
				valueChange : Y.bind(setJoystickValue, dial)
			},
			centerButtonDiameter : 0,
			min : -Number.MAX_VALUE,
			max : Number.MAX_VALUE
		});
		dial.render("#joystick");
	});
}(Joystick));
