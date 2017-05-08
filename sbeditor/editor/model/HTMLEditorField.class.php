<?php
require_once("data/model/field/TextField.class.php");

/**
 * Represents the structure of an editable editor that can be used to edit HTML.
 */
class HTMLEditorField extends TextField
{
	/**
	 * Constructs a new HTMLEditor instance.
	 *
	 * @param string $id A unique identifier for the editor div
	 * @param string $title Title of the field
	 * @param string $iframePage Path to an HTML page that is displayed in the editor iframe
	 * @param string $iconsPath Path where the editor's icons can be found
	 * @param bool $mandatory Indicates whether a given value is mandatory
	 */
	public function __construct($id, $title, $iframePage, $iconsPath, $mandatory = false)
	{
		parent::__construct($title, $mandatory);
		$this->id = $id;
		$this->iframePage = $iframePage;
		$this->iconsPath = $iconsPath;
	}
}
?>
