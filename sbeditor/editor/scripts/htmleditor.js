/**
 * @static @class sbeditor
 *
 * Exposes functions to manage the state of embedded HTML editors
 */

(function() {
    var sbeditor = {};

    function getIFrameDocument(iframeElement) {
        if (iframeElement.contentDocument) {
            return iframeElement.contentDocument; // For normal browsers
        } else {
            return iframeElement.document; // For Internet Explorer
       }
    }

    /* Enables the design mode of an iframe in the given div element */
    function enableDesignMode(htmlDivElement) {
        var iframeElement = htmlDivElement.getElementsByTagName("iframe")[0];
        var iframeDocument = getIFrameDocument(iframeElement);

        if(navigator.appName.indexOf("Microsoft") != -1) {
            iframeDocument.body.contentEditable = true;
        } else {
            iframeDocument.designMode = "On";
        }
    }

    /* Make editor visible and textarea invisible */
    function switchHTML(htmlDivElement, textAreaDivElement) {
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
    function switchTextArea(htmlDivElement, textAreaDivElement) {
        if(textAreaDivElement.style.display != "block") {
            htmlDivElement.style.display = "none";
            textAreaDivElement.style.display = "block";

            /* Set HTML code in the textarea */

            var iframeElement = htmlDivElement.getElementsByTagName("iframe")[0];
            var textAreaElement = textAreaDivElement.getElementsByTagName("textarea")[0];
            textAreaElement.value = getIFrameDocument(iframeElement).body.innerHTML;
        }
    }

    function extractDivElements(editorDivElement) {
        var divElements = editorDivElement.getElementsByTagName("div");
        return {
            htmlDivElement: divElements[0],
            textAreaDivElement: divElements[1]
        };
    }

    function initEditor(editorDivElements) {
        for(var i = 0; i < editorDivElements.length; i++) {
            var editorDivElement = editorDivElements[i];

            var divElements = extractDivElements(editorDivElement);

            /* Switch to HTML editor mode and enable design mode in the iframe */
            switchHTML(divElements.htmlDivElement, divElements.textAreaDivElement);
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

            /* Add a submit handler to each form */
            formElement.onsubmit = function() {
                for(var i = 0; i < editorDivElements.length; i++) {
                    var editorDivElement = editorDivElements[i];

                    var divElements = extractDivElements(editorDivElement);
                    switchTextArea(divElements.htmlDivElement, divElements.textAreaDivElement);
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

    /**
     * Executes a rich text edit command in a given editor component.
     *
     * @param {String} id ID of the HTML editor
     * @param {String} command Rich text edit command to execute
     * @param {String} arg Arguments of the richt text editor command
     */
    function doRichEditCommand(id, command, arg) {
        var editorDivElement = document.getElementById(id);
        var iframeElement = editorDivElement.getElementsByTagName("div")[0].getElementsByTagName("iframe")[0];

        iframeElement.contentWindow.focus();
        getIFrameDocument(iframeElement).execCommand(command, false, arg);
        iframeElement.contentWindow.focus();
    }

    sbeditor.doRichEditCommand = doRichEditCommand;

    /**
     * Creates a hyperlink and attaches it to the given document.
     *
     * @param {String} id ID of the HTML editor
     */
    function addLink(id) {
        var url = prompt("Enter link URL:", "http://");

        if(url == "") {
            alert("You must provide a URL!");
        } else {
            doRichEditCommand(id, "createLink", url);
        }
    }
    
    sbeditor.addLink = addLink;

    /**
     * Attaches an image to the given editor.
     *
     * @param {String} id ID of the HTML editor
     */
    function addImage(id) {
        var url = prompt("Enter image URL:", "http://");

        if(url === null || url == "") {
            alert("You must provide an URL!");
            return;
        }

        var alt = prompt("Enter alternate text:", "image");

        if(alt === null || alt == "") {
            alert("You must provide alternate text!");
            return;
        }

        var html = '<img src="'+url+'" alt="'+alt+'">';
        insertHTML(id, html);
    }

    sbeditor.addImage = addImage;

    /**
     * Inserts HTML code in the given editor component.
     *
     * @param {String} id ID of the HTML editor
     * @param {String} html HTML code to insert
     */
    function insertHTML(id, html) {
        var editorDivElement = document.getElementById(id);
        var iframeElement = editorDivElement.getElementsByTagName("div")[0].getElementsByTagName("iframe")[0];
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
    }
    
    sbeditor.insertHTML = insertHTML;

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

    /**
     * Adds a table with a horizontal header to the given editor component.
     *
     * @param {String} id ID of the HTML editor
     */
    function addTableWithHorizontalHeader(id) {
        try {
            var rows = queryRows();
            var cols = queryCols();
        } catch(e) {
            return;
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
        insertHTML(id, html);
    }

    sbeditor.addTableWithHorizontalHeader = addTableWithHorizontalHeader;

    /**
     * Adds a table with a vertical header to the given editor component.
     *
     * @param {String} id ID of the HTML editor
     */
    function addTableWithVerticalHeader(id) {
        try {
            var rows = queryRows();
            var cols = queryCols();
        } catch(e) {
            return;
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
        insertHTML(id, html);
    }

    sbeditor.addTableWithVerticalHeader = addTableWithVerticalHeader;

    /**
     * Adds a table without a border to the given editor component.
     *
     * @param {String} id ID of the HTML editor
     */
    function addTableWithoutBorder(id) {
        try {
            var rows = queryRows();
            var cols = queryCols();
        } catch(e) {
            return;
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
        insertHTML(id, html);
    }

    sbeditor.addTableWithoutBorder = addTableWithoutBorder;

    /**
     * Changes the view of the rich text editor
     *
     * @param {String} id ID of the rich text editor
     * @param {Boolean} checked true to switch to the textarea view, false to switch to the editor view
     */
    function toggleView(id, checked) {
        var editorDivElement = document.getElementById(id);
        var divElements = extractDivElements(editorDivElement);

        if(checked) {
            switchTextArea(divElements.htmlDivElement, divElements.textAreaDivElement);
        } else {
            switchHTML(divElements.htmlDivElement, divElements.textAreaDivElement);
        }
    }

    sbeditor.toggleView = toggleView;

    this.sbeditor = sbeditor;
})();
