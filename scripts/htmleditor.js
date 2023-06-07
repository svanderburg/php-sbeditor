/**
 * @static @class sbeditor
 *
 * Exposes functions to manage the state of embedded HTML editors
 */

(function() {
    var sbeditor = {};

    ////////// SBEditor class

    var sbEditorLabels = {
        "View source": "View source",
        "[Style]": "[Style]",
        "Paragraph": "Paragraph",
        "Heading 1": "Heading 1",
        "Heading 2": "Heading 2",
        "Heading 3": "Heading 3",
        "Heading 4": "Heading 4",
        "Heading 5": "Heading 5",
        "Heading 6": "Heading 6",
        "Blockquote": "Blockquote",
        "Preformatted": "Preformatted",
        "Enter link URL:": "Enter link URL:",
        "Enter image URL:": "Enter image URL:",
        "You must provide an URL!": "You must provide an URL!",
        "Enter alternate text:": "Enter alternate text:",
        "You must provide alternate text!": "You must provide alternate text!",
        "Number of rows:": "Number of rows (excluding the header):",
        "Number of columns:": "Number of columns:",
        "You must specify at least one row!": "You must specify at least one row!",
        "You must specify at least one column!": "You must specify at least one column!",
        "Highlight": "<strong>Highlight</strong>",
        "Subscript": "S<sub>ubscript</sub>",
        "Superscript": "S<sup>uperscript</sup>",
        "Add link": "Add link",
        "Remove link": "Remove link",
        "Add image": "Add image",
        "Add unordered list": "Add unordered list",
        "Add ordered list": "Add ordered list",
        "Add table with horizontal header": "Add table with horizontal header",
        "Add table with vertical header": "Add table with vertical header",
        "Add table without border": "Add table without border"
    };

    /**
     * Creates a new SBEditor object that turns a div with a textarea into a rich text editor.
     *
     * @param {String} iconsPath Path in which the editor icons reside
     * @param {String} iframePage Path to an HTML page that is displayed inside the editor iframe
     * @param {number} width Width of the editor (in em)
     * @param {number} height Height of the editor (in em)
     * @param {Object} labels An object that translates every label. If none is given, the editor uses the default labels
     */
    function SBEditor(iconsPath, iframePage, width, height, labels) {
        this.iconsPath = iconsPath;
        this.iframePage = iframePage;
        this.width = width;
        this.height = height;

        if(labels === undefined) {
            this.labels = sbEditorLabels;
        } else {
            this.labels = labels;
        }
    }

    sbeditor.SBEditor = SBEditor;

    /**
     * Adds editor capabilities to a div with a textarea
     *
     * @param {String} divId Id of the div
     */
    SBEditor.prototype.addEditorCapabilities = function(divId) {
        var div = document.getElementById(divId);

        div.appendChild(this.createEditorDiv());
        div.appendChild(createViewSourceCheckBox(div));
        div.appendChild(document.createTextNode(this.labels["View source"]));
    };

    ////////// Editor callbacks

    function doRichEditCommand(iframeElement, command, arg) {
        iframeElement.contentWindow.focus();
        getIFrameDocument(iframeElement).execCommand(command, false, arg);
        iframeElement.contentWindow.focus();
        return false;
    }

    SBEditor.prototype.addLink = function(iframe) {
        var url = prompt(this.labels["Enter link URL:"], "http://");

        if(url === null || url == "") {
            alert(this.labels["You must provide a URL!"]);
        } else {
            doRichEditCommand(iframe, "createLink", url);
        }

        return false;
    };

    SBEditor.prototype.addImage = function(iframe) {
        var url = prompt(this.labels["Enter image URL:"], "http://");

        if(url === null || url == "") {
            alert(this.labels["You must provide an URL!"]);
            return false;
        }

        var alt = prompt(this.labels["Enter alternate text:"], "image");

        if(alt === null || alt == "") {
            alert(this.labels["You must provide alternate text!"]);
            return false;
        }

        var html = '<img src="'+url+'" alt="'+alt+'">';
        insertHTML(iframe, html);

        return false;
    };

    /**
     * Inserts HTML code into an iframe element's document
     *
     * @param {HTMLIFrameElement} iframeElement iframe element to insert code into
     * @param {String} html HTML code to insert
     */
    function insertHTML(iframeElement, html) {
        var iframeDocument = getIFrameDocument(iframeElement);

        if(navigator.appName.indexOf("Microsoft") != -1) {
            /* Insert routine for Internet Explorer */
            iframeDocument.body.focus();
            var range = iframeDocument.selection.createRange();
            range.pasteHTML(html);
            range.collapse(false);
            range.select();
        } else {
            /* Insert routine for other browsers */
            iframeDocument.execCommand("InsertHTML", false, html);
        }

        return false;
    }

    sbeditor.insertHTML = insertHTML;

    SBEditor.prototype.queryRows = function() {
        var rows = prompt(this.labels["Number of rows:"], "1");
        rows = parseInt(rows);

        if(isNaN(rows) || rows <= 0) {
            alert(this.labels["You must specify at least one row!"]);
            throw this.labels["You must specify at least one row!"];
        }

        return rows;
    };

    SBEditor.prototype.queryCols = function() {
        var cols = prompt(this.labels["Number of columns:"], "1");
        cols = parseInt(cols);

        if(isNaN(cols) || cols <= 0) {
            alert(this.labels["You must specify at least one column!"]);
            throw this.labels["You must specify at least one column!"];
        }

        return cols;
    };

    SBEditor.prototype.addTableWithHorizontalHeader = function(iframe) {
        try {
            var rows = this.queryRows();
            var cols = this.queryCols();
        } catch(e) {
            return false;
        }

        var html = "<table>\n";

        /* Add table header */

        html += "<tr>\n";

        for(var j = 0; j < cols; j++) {
            html += "<th>&nbsp;</th>\n";
        }

        html += "</tr>\n";

        /* Add each row to the document */

        for(var i = 0; i < rows; i++) {
            html += "<tr>\n";

            /* Add each column to the document */

            for(var j = 0; j < cols; j++) {
                html += "<td>&nbsp;</td>\n";
            }

            html += "</tr>\n";
        }

        html += "</table>\n";

        /* Add generated HTML to the document */
        insertHTML(iframe, html);

        return false;
    };

    SBEditor.prototype.addTableWithVerticalHeader = function(iframe) {
        try {
            var rows = this.queryRows();
            var cols = this.queryCols();
        } catch(e) {
            return false;
        }

        var html = "<table>\n";

        /* Add each row to the document */

        for(var i = 0; i < rows; i++) {
            html += "<tr>\n";

            /* Add column header */
            html += "<th>&nbsp;</th>";

            /* Add each column to the document */

            for(var j = 0; j < cols; j++) {
                html += "<td>&nbsp;</td>\n";
            }

            html += "</tr>\n";
        }

        html += "</table>\n";

        /* Add generated HTML to the document */
        insertHTML(iframe, html);

        return false;
    };

    SBEditor.prototype.addTableWithoutBorder = function(iframe) {
        try {
            var rows = this.queryRows();
            var cols = this.queryCols();
        } catch(e) {
            return false;
        }

        var html = '<table class="noborder">\n';

        /* Add each row to the document */

        for(var i = 0; i < rows; i++) {
            html += "<tr>\n";

            /* Add each column to the document */

            for(var j = 0; j < cols; j++) {
                html += "<td>&nbsp;</td>\n";
            }

            html += "</tr>\n";
        }

        html += "</table>\n";

        /* Add generated HTML to the document */
        insertHTML(iframe, html);

        return false;
    };

    ////////// Editor DOM objects

    SBEditor.prototype.createIFrame = function() {
        var iframe = document.createElement("iframe");
        iframe.src = this.iframePage;
        iframe.style.width = this.width + "em";
        iframe.style.height = this.height + "em";
        return iframe;
    };

    function createOptionElement(value, text) {
        var option = document.createElement("option");
        option.value = value;
        option.text = text;
        return option;
    }

    function createStyleSelectBox(iframe, labels) {
        var selectBox = document.createElement("select");
        selectBox.add(createOptionElement("", labels["[Style]"]));
        selectBox.add(createOptionElement("<p>", labels["Paragraph"]));
        selectBox.add(createOptionElement("<h1>", labels["Heading 1"]));
        selectBox.add(createOptionElement("<h2>", labels["Heading 2"]));
        selectBox.add(createOptionElement("<h3>", labels["Heading 3"]));
        selectBox.add(createOptionElement("<h4>", labels["Heading 4"]));
        selectBox.add(createOptionElement("<h5>", labels["Heading 5"]));
        selectBox.add(createOptionElement("<h6>", labels["Heading 6"]));
        selectBox.add(createOptionElement("<blockquote>", labels["Blockquote"]));
        selectBox.add(createOptionElement("<pre>", labels["Preformatted"]));
        selectBox.onchange = function() {
            doRichEditCommand(iframe, "formatBlock", this.options[this.selectedIndex].value);
        };
        return selectBox;
    }

    function createDelimiter() {
        var noBreakSpace = String.fromCharCode(160);
        return document.createTextNode(noBreakSpace + "|" + noBreakSpace);
    }

    function createEditorButton(innerHTML, onclick) {
        var button = document.createElement("button");
        button.innerHTML = innerHTML;
        button.onclick = onclick;
        return button;
    }

    SBEditor.prototype.createEditorDiv = function() {
        var self = this;

        var div = document.createElement("div");
        div.style.display = "none";

        // Create iframe
        var iframe = self.createIFrame();

        // Create select style section
        div.appendChild(createStyleSelectBox(iframe, self.labels));
        div.appendChild(document.createElement("br"));

        // Create highlight button
        div.appendChild(createEditorButton(this.labels["Highlight"], function() {
            return doRichEditCommand(iframe, "bold");
        }));

        // Create subscript button
        div.appendChild(createEditorButton(this.labels["Subscript"], function() {
            return doRichEditCommand(iframe, "subscript");
        }));

        // Create superscript button
        div.appendChild(createEditorButton(this.labels["Superscript"], function() {
            return doRichEditCommand(iframe, "superscript");
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Create link button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/a.gif" alt="' + this.labels["Add link"] + '">', function() {
            return self.addLink(iframe);
        }));

        // Create unlink button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/a-remove.gif" alt="' + this.labels["Remove link"] + '">', function() {
            return doRichEditCommand(iframe, "unlink");
        }));

        // Create add image button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/img.gif" alt="' + this.labels["Add image"] + '">', function() {
            return self.addImage(iframe);
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Add unordered list button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/ul.gif" alt="' + this.labels["Add unordered list"] + '">', function() {
            return doRichEditCommand(iframe, "InsertUnorderedList");
        }));

        // Add ordered list button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/ol.gif" alt="' + this.labels["Add ordered list"] + '">', function() {
            return doRichEditCommand(iframe, "InsertOrderedList");
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Create table with horizontal header button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/table_hh.gif" alt="' + this.labels["Add table with horizontal header"] + '">', function() {
            return self.addTableWithHorizontalHeader(iframe);
        }));

        // Create table with vertical header button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/table_vh.gif" alt="' + this.labels["Add table with vertical header"] + '">', function() {
            return self.addTableWithVerticalHeader(iframe);
        }));

        // Create table without border button
        div.appendChild(createEditorButton('<img src="' + self.iconsPath + '/table_nb.gif" alt="' + this.labels["Add table without border"] + '">', function() {
            return self.addTableWithoutBorder(iframe);
        }));

        // Create delimiter
        div.appendChild(createDelimiter());
        div.appendChild(document.createElement("br"));

        // Add editable iframe
        div.appendChild(iframe);

        // Return the div
        return div;
    };

    /* Provides an interface that exposes the HTML editor and text areas inside the provided editor div */
    function extractDivElements(editorDivElement) {
        var divElements = editorDivElement.getElementsByTagName("div");
        return {
            htmlDivElement: divElements[1],
            textAreaDivElement: divElements[0]
        };
    }

    /* Provides an interface that gives the document object to be edited in the iframe */
    function getIFrameDocument(iframeElement) {
        if (iframeElement.contentDocument) {
            return iframeElement.contentDocument; // For normal browsers
        } else {
            return iframeElement.document; // For Internet Explorer
       }
    }

    /* Make editor visible and textarea invisible */
    function switchToHTML(htmlDivElement, textAreaDivElement) {
        if(htmlDivElement.style.display != "block") {
            htmlDivElement.style.display = "block";
            textAreaDivElement.style.display = "none";

            /* Update rich text editor contents with HTML code from the textarea */

            var iframeElement = htmlDivElement.getElementsByTagName("iframe")[0];
            var textAreaElement = textAreaDivElement.getElementsByTagName("textarea")[0];
            getIFrameDocument(iframeElement).body.innerHTML = textAreaElement.value;
        }
    }

    /* Make editor invisible and textarea visible */
    function switchToTextArea(htmlDivElement, textAreaDivElement) {
        if(textAreaDivElement.style.display != "block") {
            htmlDivElement.style.display = "none";
            textAreaDivElement.style.display = "block";

            /* Set HTML code in the textarea */

            var iframeElement = htmlDivElement.getElementsByTagName("iframe")[0];
            var textAreaElement = textAreaDivElement.getElementsByTagName("textarea")[0];
            textAreaElement.value = getIFrameDocument(iframeElement).body.innerHTML;
        }
    }

    function createViewSourceCheckBox(div) {
        var checkBox = document.createElement("input");
        checkBox.type = "checkbox";
        checkBox.checked = true;
        checkBox.onclick = function() {
            var divElements = extractDivElements(div);

            if(this.checked) {
                switchToTextArea(divElements.htmlDivElement, divElements.textAreaDivElement);
            } else {
                switchToHTML(divElements.htmlDivElement, divElements.textAreaDivElement);
            }
        };
        return checkBox;
    }

    ////////// Functions that do the initialization on loading the page

    function enableDesignMode(htmlDivElement) {
        var iframeElement = htmlDivElement.getElementsByTagName("iframe")[0];
        var iframeDocument = getIFrameDocument(iframeElement);

        if(navigator.appName.indexOf("Microsoft") != -1) {
            iframeDocument.body.contentEditable = true;
        } else {
            iframeDocument.designMode = "On";
        }
    }

    function initEditor(editorDivElements) {
        for(var i = 0; i < editorDivElements.length; i++) {
            var editorDivElement = editorDivElements[i];

            var divElements = extractDivElements(editorDivElement);

            /* Switch to HTML editor mode and enable design mode in the iframe */
            switchToHTML(divElements.htmlDivElement, divElements.textAreaDivElement);
            enableDesignMode(divElements.htmlDivElement);

            /* Uncheck the checkbox element */
            var checkBoxElement = editorDivElement.getElementsByTagName("input")[0];
            checkBoxElement.checked = false;
        }
    }

    function enableEditors(param) {
        /* Query the requested forms from the param parameter */
        var formElements;

        if(param === undefined)
            formElements = document.getElementsByTagName("form");
        else if(Array.isArray(param))
            formElements = param;
        else
            formElements = [ param ];

        /* Enable all editors in the requested forms */
        for(var i = 0; i < formElements.length; i++) {
            var formElement = formElements[i];
            var editorDivElements = formElement.getElementsByClassName("sbeditor");

            /* Add a submit handler to each form that updates the textarea before submitting */
            formElement.onsubmit = function() {
                for(var i = 0; i < editorDivElements.length; i++) {
                    var editorDivElement = editorDivElements[i];

                    var divElements = extractDivElements(editorDivElement);
                    switchToTextArea(divElements.htmlDivElement, divElements.textAreaDivElement);
                }
            };

            /* Initialize all sbeditor divs inside the form */
            initEditor(editorDivElements);
        }
    }

    /**
     * Initializes all editors in the given forms to display a HTML editor.
     *
     * @param {Object} param A HTML DOM element representing a form, an array or forms or undefined to process all forms in the HTML document.
     */
    function initEditors(param) {
        window.onload = function() {
            enableEditors(param);
        };
    }

    sbeditor.initEditors = initEditors;

    this.sbeditor = sbeditor;
})();
