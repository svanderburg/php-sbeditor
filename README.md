php-sbeditor
============
This package contains my implementation of a simple HTML editor to be used in
conjunction with my own custom web framework.

The HTML editor's feature set is deliberately left simple -- it only exposes
basic functionality and intentionally lacks any functionality modifying the
style of a web page. I have made the assumption that users should follow the
style that a CSS stylesheet provides. The editor should not encourage users to
deviate from that.

Moreover, the editor offers a degree of fallback to users using more basic web
browsers or users having JavaScript disabled -- by default, the editor is a text
area allowing one to directly edit HTML code and "changes" into a HTML editor
when JavaScript has been enabled.

Usage
=====
There are two usage scenarios for this package. In both cases, you must include
the the `htmleditor.js` script file in the header of a web page:

```html
<script type="text/javascript" src="htmleditor.js"></script>
```

And run the following function call in the body to enable the editors in the
forms on the page:

```html
<script type="text/javascript">
sbeditor.initEditors();
</script>
```

The `sbeditor.initEditors()` invocation will by default inspect all forms in the
document. It is also possible to limit the initialisation to a single form
(by providing the HTML DOM element of the form as a parameter) or a collection of
forms (by providing an array of HTML DOM elements as a parameter).

Apart from the initialisation, this package can be used to directly embed an
editor div in a page or in conjuction with the
[php-sbdata](https://github.com/svanderburg/php-sbdata) framework.

Direct usage
------------
By invoking the `displayHTMLEditor()` function:

```php
require_once("editor/view/html/htmleditor.inc.php");

displayHTMLEditor("editor1", "contents", "iframepage.html", "image");
```

we can directly generate a `div` providing a `textarea` and editor `iframe`.
The corresponding div has an id: `editor1`, the textarea field has the name:
`contents`, the iframe embeds the `iframepage.html` page and the editor's icons
are stored in the `image/` sub folder.

The generated `div` should be embedded inside a `form` element.

Integration with php-sbdata
---------------------------
This framework also provides a `HTMLEditorField` class that can be used to
construct fields that can be added to a `Form` managed by the `php-sbdata`
framework:

```php
require_once("editor/model/HTMLEditorField.class.php");

$form = new Form(array(
    "title" => new TextField("Title", true),
    "contents" => new HTMLEditorField("editor1", "Contents", "iframepage.html", "image", true)
));
```

When displaying the above form as an editable form:

```php
require_once("editor/view/html/htmleditorfield.inc.php");

displayEditableForm($form,
    "Submit",
    "One or more of the field values are incorrect!",
    "This field is incorrect!");
```

Then the corresponding field will be displayed as an HTML editor (or a text area
if JavaScript functionality is absent). The parameters to the HTML editor field
constructor are similar to those of the view function shown in the previous
section.

Examples
========
This package includes two example web applications that can be found in the
`examples/` folder:

* The `simple` example demonstrates how to directly embed an editor div and how
  it can be used to retrieve the submitted data.
* The `form` example demonstrates how the editor can be integrated with the
  `php-sbdata` framework, so that input can be automatically validated and
  presented.

API documentation
=================
This package includes API documentation, which can be generated with
[Doxygen](http://www.doxygen.org). The Makefile in this package contains a `doc`
target and produces the corresponding HTML files in `apidoc`:

    $ make doc

License
=======
The contents of this package is available under the
[Apache Software License](http://www.apache.org/licenses/LICENSE-2.0.html)
version 2.0
