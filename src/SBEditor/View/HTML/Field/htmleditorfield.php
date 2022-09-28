<?php
/**
 * @file
 * @brief SBEditor-View-HTML-HTMLEditorField module
 * @defgroup SBEditor-View-HTML-HTMLEditorField
 * @{
 */
namespace SBEditor\View\HTML\Field;
use SBEditor\Model\Field\HTMLEditorField;

function displayHTMLEditorField(HTMLEditorField $field): void
{
	print($field->exportValue());
}

function displayEditableHTMLEditorField(string $name, HTMLEditorField $field): void
{
	\SBEditor\View\HTML\displayHTMLEditor($field->id, $name, $field->iframePage, $field->iconsPath, $field->exportValue(), $field->width, $field->height);
}

/**
 * @}
 */
?>
