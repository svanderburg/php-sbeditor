<?php
error_reporting(E_STRICT | E_ALL);

require_once("../../vendor/autoload.php");
?>
<!DOCTYPE html>

<html>
	<head>
		<title>HTML editor test</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="scripts/htmleditor.js"></script>
	</head>

	<body>
		<?php
		if(count($_REQUEST) > 0)
		{
			if(array_key_exists("contents", $_REQUEST))
			{
				$contents = $_REQUEST["contents"];
				?>
				<p>You have submitted:</p>
				<div><?= $_REQUEST["contents"] ?></div>
				<?php
			}
			else
				$contents = NULL;
		}
		else
			$contents = NULL;
		?>
		<form action="" method="post">
			<?php
			\SBEditor\View\HTML\displayHTMLEditor("editor1", "contents", "iframepage.html", "image/editor", $contents);
			?>
			<br>
			<input type="submit" value="Submit">
		</form>

		<script type="text/javascript">
		sbeditor.initEditors();
		</script>
	</body>
</html>
