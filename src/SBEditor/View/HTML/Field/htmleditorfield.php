<?php
/**
 * @file
 * @brief SBEditor-View-HTML-Field module
 * @defgroup SBEditor-View-HTML-Field
 * @{
 */
namespace SBEditor\View\HTML\Field;
use SBEditor\Model\Field\HTMLEditorField;

function displayHTMLEditorField(HTMLEditorField $field): void
{
	print($field->value);
}

function displayEditableHTMLEditorField(string $name, HTMLEditorField $field): void
{
	\SBEditor\View\HTML\displayHTMLEditor($field->id, $name, $field->iframePage, $field->iconsPath, $field->value, $field->width, $field->height);
}

/**
 * @}
 */
?>
