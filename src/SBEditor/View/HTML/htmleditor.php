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
 * @param $contents HTML code to edit (defaults to NULL)
 * @param $width Width of the rich text editor in characters (defaults to 60)
 * @param $height Height of the rich text editor in characters (defaults to 20)
 */
function displayHTMLEditor(string $id, string $name, string $iframePage, string $iconsPath, string $contents = NULL, int $width = 60, int $height = 20): void
{
	?>
	<div class="sbeditor" id="<?php print($id); ?>">
		<div style="display: none;">
			<select onchange="sbeditor.doRichEditCommand('<?php print($id); ?>', 'formatBlock', this.options[this.selectedIndex].value);">
				<option value="">[Style]</option>
				<option value="<p>">Paragraph</option>
				<option value="<h1>">Heading 1</option>
				<option value="<h2>">Heading 2</option>
				<option value="<h3>">Heading 3</option>
				<option value="<blockquote>">Blockquote</option>
				<option value="<pre>">Preformatted</option>
			</select><br>
			<button onclick="sbeditor.doRichEditCommand('<?php print($id); ?>', 'bold'); return false;"><strong>Highlight</strong></button>
			<button onclick="sbeditor.doRichEditCommand('<?php print($id); ?>', 'subscript'); return false;">S<sub>ubscript</sub></button>
			<button onclick="sbeditor.doRichEditCommand('<?php print($id); ?>', 'superscript'); return false;">S<sup>uperscript</sup></button>&nbsp;|&nbsp;
			<button onclick="sbeditor.addLink('<?php print($id); ?>'); return false;"><img src="<?php print($iconsPath); ?>/a.gif" alt="Add link"></button>
			<button onclick="sbeditor.addImage('<?php print($id); ?>'); return false;"><img src="<?php print($iconsPath); ?>/img.gif" alt="Add image"></button>&nbsp;|&nbsp;
			<button onclick="sbeditor.doRichEditCommand('<?php print($id); ?>', 'InsertUnorderedList'); return false;"><img src="<?php print($iconsPath); ?>/ul.gif" alt="Add unordered list"></button>
			<button onclick="sbeditor.doRichEditCommand('<?php print($id); ?>', 'InsertOrderedList'); return false;"><img src="<?php print($iconsPath); ?>/ol.gif" alt="Add ordered list"></button>&nbsp;|&nbsp;
			<button onclick="sbeditor.addTableWithHorizontalHeader('<?php print($id); ?>'); return false;"><img src="<?php print($iconsPath); ?>/table_hh.gif" alt="Add table with horizontal header"></button>
			<button onclick="sbeditor.addTableWithVerticalHeader('<?php print($id); ?>'); return false;"><img src="<?php print($iconsPath); ?>/table_vh.gif" alt="Add table with vertical header"></button>
			<button onclick="sbeditor.addTableWithoutBorder('<?php print($id); ?>'); return false;"><img src="<?php print($iconsPath); ?>/table_nb.gif" alt="Add table without border"></button>&nbsp;|&nbsp;<br>
			<iframe src="<?php print($iframePage); ?>" style="<?php print("width: ".$width."em; height: ".$height."em;"); ?>"></iframe>
		</div>
		<div>
			<textarea name="<?php print($name); ?>" cols="<?php print($width); ?>" rows="<?php print($height); ?>"><?php if($contents != NULL) print(htmlentities($contents)); ?></textarea>
		</div>
		<input type="checkbox" onclick="sbeditor.toggleView('<?php print($id); ?>', this.checked);" checked>View source
	</div>
	<?php
}

/**
 * @}
 */
?>
