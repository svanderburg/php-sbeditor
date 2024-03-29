<?php
namespace SBEditor\Model\Field;
use SBData\Model\Field\VisibleField;
use SBData\Model\Value\Value;

/**
 * Represents the structure of an editable editor that can be used to edit HTML.
 */
class HTMLEditorField extends VisibleField
{
	/** A unique identifier for the editor div */
	public string $id;

	/** Title of the field */
	public string $iframePage;

	/** Path where the editor's icons can be found */
	public string $iconsPath;

	/** Width of the rich text editor in characters (defaults to 60) */
	public int $width;

	/** Height of the rich text editor in characters (defaults to 20) */
	public int $height;

	/** Expression referring to the labels parameter that can be used to provide a JavaScript object that defines the labels (null omits the parameter so that the default labels are used) */
	public ?string $labelsParameter;

	/** Package name */
	public string $package;

	/**
	 * Constructs a new HTMLEditor instance.
	 *
	 * @param $id A unique identifier for the editor div
	 * @param $title Title of the field
	 * @param $iframePage Path to an HTML page that is displayed in the editor iframe
	 * @param $iconsPath Path where the editor's icons can be found
	 * @param $mandatory Indicates whether a given value is mandatory
	 * @param $width Width of the rich text editor in characters (defaults to 60)
	 * @param $height Height of the rich text editor in characters (defaults to 20)
	 * @param $labelsParameter Expression referring to the labels parameter that can be used to provide a JavaScript object that defines the labels (null omits the parameter so that the default labels are used)
	 */
	public function __construct(string $id, string $title, string $iframePage, string $iconsPath, bool $mandatory = false, int $width = 60, int $height = 20, string $labelsParameter = null)
	{
		parent::__construct($title, new Value($mandatory));
		$this->id = $id;
		$this->iframePage = $iframePage;
		$this->iconsPath = $iconsPath;
		$this->width = $width;
		$this->height = $height;
		$this->labelsParameter = $labelsParameter;
		$this->package = "SBEditor";
	}
}
?>
