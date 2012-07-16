
// Feel free to run your own CoffeeScript code right from the console!
var run = function(code) {
	var js = CoffeeScript.compile(code);
	eval(js);
}
