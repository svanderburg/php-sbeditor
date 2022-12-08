/**
 * @static @class sbeditor
 *
 * Exposes functions to manage the state of embedded HTML editors
 */

(function() {
    var sbeditor = {};

    ////////// Utility functions

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

    /* Provides an interface that exposes the HTML editor and text areas inside the provided editor div */
    function extractDivElements(editorDivElement) {
        var divElements = editorDivElement.getElementsByTagName("div");
        return {
            htmlDivElement: divElements[1],
            textAreaDivElement: divElements[0]
        };
    }

    ///////// Functionality that adds editor capabilities to a textarea div

    function createIFrame(iframePage, width, height) {
        var iframe = document.createElement("iframe");
        iframe.src = iframePage;
        iframe.style.width = width + "em";
        iframe.style.height = height + "em";
        return iframe;
    }

    function createOptionElement(value, text) {
        var option = document.createElement("option");
        option.value = value;
        option.text = text;
        return option;
    }

    function createStyleSelectBox(iframe) {
        var selectBox = document.createElement("select");
        selectBox.add(createOptionElement("", "[Style]"));
        selectBox.add(createOptionElement("<p>", "Paragraph"));
        selectBox.add(createOptionElement("<h1>", "Heading 1"));
        selectBox.add(createOptionElement("<h2>", "Heading 2"));
        selectBox.add(createOptionElement("<h3>", "Heading 3"));
        selectBox.add(createOptionElement("<h4>", "Heading 4"));
        selectBox.add(createOptionElement("<h5>", "Heading 5"));
        selectBox.add(createOptionElement("<h6>", "Heading 6"));
        selectBox.add(createOptionElement("<blockquote>", "Blockquote"));
        selectBox.add(createOptionElement("<pre>", "Preformatted"));
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

    function createEditorDiv(iconsPath, iframePage, width, height) {
        var div = document.createElement("div");
        div.style.display = "none";

        // Create iframe
        var iframe = createIFrame(iframePage, width, height);

        // Create select style section
        div.appendChild(createStyleSelectBox(iframe));
        div.appendChild(document.createElement("br"));

        // Create highlight button
        div.appendChild(createEditorButton("<strong>Highlight</strong>", function() {
            return doRichEditCommand(iframe, "bold");
        }));

        // Create subscript button
        div.appendChild(createEditorButton("S<sub>ubscript</sub>", function() {
            return doRichEditCommand(iframe, "subscript");
        }));

        // Create superscript button
        div.appendChild(createEditorButton("S<sup>uperscript</sup>", function() {
            return doRichEditCommand(iframe, "superscript");
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Create link button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/a.gif" alt="Add link">', function() {
            return addLink(iframe);
        }));

        // Create unlink button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/a-remove.gif" alt="Remove link">', function() {
            return doRichEditCommand(iframe, "unlink");
        }));

        // Create add image button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/img.gif" alt="Add image">', function() {
            return addImage(iframe);
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Add unordered list button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/ul.gif" alt="Add unordered list">', function() {
            return doRichEditCommand(iframe, "InsertUnorderedList");
        }));

        // Add ordered list button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/ol.gif" alt="Add ordered list">', function() {
            return doRichEditCommand(iframe, "InsertOrderedList");
        }));

        // Create delimiter
        div.appendChild(createDelimiter());

        // Create table with horizontal header button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/table_hh.gif" alt="Add table with horizontal header">', function() {
            return addTableWithHorizontalHeader(iframe);
        }));

        // Create table with vertical header button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/table_vh.gif" alt="Add table with vertical header">', function() {
            return addTableWithVerticalHeader(iframe);
        }));

        // Create table without border button
        div.appendChild(createEditorButton('<img src="' + iconsPath + '/table_vh.gif" alt="Add table without border">', function() {
            return addTableWithoutBorder(iframe);
        }));

        // Create delimiter
        div.appendChild(createDelimiter());
        div.appendChild(document.createElement("br"));

        // Add editable iframe
        div.appendChild(iframe);

        // Return the div
        return div;
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

    /**
     * Adds editor capabilities to a div element that embeds a text area.
     *
     * @param {String} id ID of the div to augment
     * @param {String} iconsPath Path in which the editor icons reside
     * @param {String} iframePage Path to an HTML page that is displayed inside the editor iframe
     * @param {number} width Width of the editor (in em)
     * @param {number} height Height of the editor (in em)
     */
    function addEditorCapabilities(id, iconsPath, iframePage, width, height) {
        var div = document.getElementById(id);

        div.appendChild(createEditorDiv(iconsPath, iframePage, width, height));
        div.appendChild(createViewSourceCheckBox(div));
        div.appendChild(document.createTextNode("View source"));
    }

    sbeditor.addEditorCapabilities = addEditorCapabilities;

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

    ////////// Functions that implement editor actions

    function doRichEditCommand(iframeElement, command, arg) {
        iframeElement.contentWindow.focus();
        getIFrameDocument(iframeElement).execCommand(command, false, arg);
        iframeElement.contentWindow.focus();
        return false;
    }

    function addLink(iframe) {
        var url = prompt("Enter link URL:", "http://");

        if(url === null || url == "") {
            alert("You must provide a URL!");
        } else {
            doRichEditCommand(iframe, "createLink", url);
        }

        return false;
    }

    function addImage(iframe) {
        var url = prompt("Enter image URL:", "http://");

        if(url === null || url == "") {
            alert("You must provide an URL!");
            return false;
        }

        var alt = prompt("Enter alternate text:", "image");

        if(alt === null || alt == "") {
            alert("You must provide alternate text!");
            return false;
        }

        var html = '<img src="'+url+'" alt="'+alt+'">';
        insertHTML(iframe, html);

        return false;
    }

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

    function queryRows() {
        var rows = prompt("Number of rows (excluding the header):", "1");
        rows = parseInt(rows);

        if(isNaN(rows) || rows <= 0) {
            alert("You must specify at least one row!");
            throw "You must specify at least one row!";
        }

        return rows;
    }

    function queryCols() {
        var cols = prompt("Number of columns:", "1");
        cols = parseInt(cols);

        if(isNaN(cols) || cols <= 0) {
            alert("You must specify at least one column!");
            throw "You must specify at least one column!";
        }

        return cols;
    }

    function addTableWithHorizontalHeader(iframe) {
        try {
            var rows = queryRows();
            var cols = queryCols();
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
    }

    function addTableWithVerticalHeader(iframe) {
        try {
            var rows = queryRows();
            var cols = queryCols();
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
    }

    function addTableWithoutBorder(iframe) {
        try {
            var rows = queryRows();
            var cols = queryCols();
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
    }

    this.sbeditor = sbeditor;
})();
