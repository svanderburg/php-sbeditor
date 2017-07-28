<?php
namespace SBEditor\Model\Field;
use SBData\Model\Field\TextField;

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
	 * @param int $width Width of the rich text editor in characters (defaults to 60)
	 * @param int $height Height of the rich text editor in characters (defaults to 20)
	 */
	public function __construct($id, $title, $iframePage, $iconsPath, $mandatory = false, $width = 60, $height = 20)
	{
		parent::__construct($title, $mandatory);
		$this->id = $id;
		$this->iframePage = $iframePage;
		$this->iconsPath = $iconsPath;
		$this->width = $width;
		$this->height = $height;
		$this->package = "SBEditor";
	}
}
?>
