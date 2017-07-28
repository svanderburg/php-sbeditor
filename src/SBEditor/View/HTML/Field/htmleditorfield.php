<?php
namespace SBEditor\View\HTML\Field;
use SBEditor\Model\Field\HTMLEditorField;

function displayHTMLEditorField(HTMLEditorField $field)
{
	print($field->value);
}

function displayEditableHTMLEditorField($name, HTMLEditorField $field)
{
	\SBEditor\View\HTML\displayHTMLEditor($field->id, $name, $field->iframePage, $field->iconsPath, $field->value, $field->width, $field->height);
}
?>
