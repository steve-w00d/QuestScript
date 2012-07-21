/*
 * qs-editor.js
 * Configures the CodeMirror instance
 */

var editor = CodeMirror.fromTextArea(document.getElementById("editor-form"), {
	mode: "coffeescript",
	lineNumbers: true,
	onChange: function(cm) {
		var textarea = cm.getTextArea();
		$(textarea).html(cm.getValue());
	}
});
