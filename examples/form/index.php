<?php
error_reporting(E_STRICT | E_ALL);

set_include_path("../../sbeditor:lib/sbdata");

require_once("data/model/Form.class.php");
require_once("data/model/field/TextField.class.php");
require_once("editor/model/HTMLEditorField.class.php");
require_once("data/view/html/form.inc.php");
require_once("editor/view/html/htmleditorfield.inc.php");

$form = new Form(array(
	"title" => new TextField("Title", true),
	"contents" => new HTMLEditorField("editor1", "Contents", "iframepage.html", "image", true)
));

if(count($_REQUEST) > 0)
{
	$form->importValues($_REQUEST);
	$form->checkFields();
	$valid = $form->checkValid();
}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>HTML editor test</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="htmleditor.js"></script>
	</head>
	
	<body>
		<?php
		if(count($_REQUEST) > 0 && $valid)
		{
			?>
			<p>You have submitted:</p>
			<h1><?php print($form->fields["title"]->value); ?></h1>
			<div><?php print($form->fields["contents"]->value); ?></div>
			<?php
		}

		displayEditableForm($form, "Submit", "One or more of the field values are incorrect!", "This field is incorrect!");
		?>

		<script type="text/javascript">
		sbeditor.initEditors();
		</script>
	</body>
</html>
