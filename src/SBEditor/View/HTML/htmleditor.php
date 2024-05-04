<?php
/**
 * @file
 * @brief SBEditor-View-HTML module
 * @defgroup SBEditor-View-HTML
 * @{
 */
namespace SBEditor\View\HTML;

/**
 * Displays a nested div with a text field in which an editor can be dynamically embedded.
 *
 * @param $id ID of the HTML editor
 * @param $name Name of the database column
 * @param $contents HTML code to edit (defaults to an empty string)
 * @param $width Width of the rich text editor in characters (defaults to 60)
 * @param $height Height of the rich text editor in characters (defaults to 20)
 */
function displayEditorTextAreaDiv(string $id, string $name, ?string $contents = "", int $width = 60, int $height = 20): void
{
	?>
	<div class="sbeditor" id="<?= $id ?>">
		<div>
			<textarea name="<?= $name ?>" cols="<?= $width ?>" rows="<?= $height ?>"><?= $contents === null ? "" : htmlentities($contents) ?></textarea>
		</div>
	</div>
	<?php
}

/**
 * Displays a HTML editor.
 *
 * @param $id ID of the HTML editor
 * @param $name Name of the database column
 * @param $iframePage HTML page to display in the iframe
 * @param $iconsPath Path where to look for the editor's icons
 * @param $contents HTML code to edit (defaults to an empty string)
 * @param $width Width of the rich text editor in characters (defaults to 60)
 * @param $height Height of the rich text editor in characters (defaults to 20)
 * @param $labelsParameter Expression referring to the labels parameter that can be used to provide a JavaScript object that defines the labels (null omits the parameter so that the default labels are used)
 */
function displayHTMLEditor(string $id, string $name, string $iframePage, string $iconsPath, ?string $contents = "", int $width = 60, int $height = 20, string $labelsParameter = null): void
{
	displayEditorTextAreaDiv($id, $name, $contents, $width, $height);
	?>
	<script type="text/javascript">
	var editor_<?= $id ?> = new sbeditor.SBEditor('<?= $iconsPath ?>', '<?= $iframePage ?>', <?= $width ?>, <?= $height ?><?= $labelsParameter === null ? "" : (", ".$labelsParameter) ?>);
	editor_<?= $id ?>.addEditorCapabilities('<?= $id ?>');
	</script>
	<?php
}

/**
 * @}
 */
?>
