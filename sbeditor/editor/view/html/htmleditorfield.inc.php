<?php
require_once("data/view/html/field/textfield.inc.php");
require_once("htmleditor.inc.php");

function displayHTMLEditorField(HTMLEditorField $field)
{
	print($field->value);
}

function displayEditableHTMLEditorField($name, HTMLEditorField $field)
{
	displayHTMLEditor($field->id, $name, $field->iframePage, $field->iconsPath, $field->value, $field->width, $field->height);
}
?>
