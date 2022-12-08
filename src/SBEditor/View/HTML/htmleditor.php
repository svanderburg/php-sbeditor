<?php
/**
 * @file
 * @brief SBEditor-View-HTML module
 * @defgroup SBEditor-View-HTML
 * @{
 */
namespace SBEditor\View\HTML;

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
 */
function displayHTMLEditor(string $id, string $name, string $iframePage, string $iconsPath, ?string $contents = "", int $width = 60, int $height = 20): void
{
	?>
	<div class="sbeditor" id="<?= $id ?>">
		<div>
			<textarea name="<?= $name ?>" cols="<?= $width ?>" rows="<?= $height ?>"><?= htmlentities($contents) ?></textarea>
		</div>
	</div>
	<script type="text/javascript">
	sbeditor.addEditorCapabilities('<?= $id ?>', '<?= $iconsPath ?>', '<?= $iframePage ?>', '<?= $width ?>', '<?= $height ?>');
	</script>
	<?php
}

/**
 * @}
 */
?>
