exports = this
$ ->
	exports.speechBubble = ->
		bubble = document.getElementById("speech-bubble");
		
		# public methods -----------------
		pub = {}

		pub.show = (content) ->
			bubble.style.display = "inline";
			bubble.innerHTML = content;
			
		pub.hide = ->
			bubble.style.display = "none";	
	
	exports.speechBubble.show("hello");
