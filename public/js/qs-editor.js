/*
 * qs-editor.js
 * Configures the CodeMirror instance
 */

var sampleCode = "hey";

var editor = CodeMirror.fromTextArea(document.getElementById("editor-form"), {
	mode: "coffeescript",
	lineNumbers: true
});
