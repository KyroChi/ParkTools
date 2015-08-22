/*

This document contains functions to assist in the DHTML WebUI dialog boxes

 */


/*

These functions create various input menus

_caption is the text prepended to the input box, recommended 'Caption: '
_class is the class of the input element, for SketchupUI with dialog.css use 'selector'
_id is the unique id of the input element, make sure that every object has a UNIQUE id
_appendToID is the id of the HTML object that the new input box will be appended to

 */

/* Creates a simple input text box
   _default_value is the value that will be displayed initially in the text box */
function createInputBox(_caption, _default_value, _id, _appendToID) {

    var _appendTo = document.getElementById(_appendToID);

    var inputBox = document.createElement("INPUT");
    inputBox.setAttribute('type', 'text');
    inputBox.setAttribute('class', 'selector');
    inputBox.setAttribute('value', _default_value);
    inputBox.setAttribute('id', _id);

    _appendTo.appendChild(addCaption(_caption));
    _appendTo.appendChild(inputBox);
    _appendTo.appendChild(addBreak());

}


/* Creates a selection dropdown menu
   Options is an array of options in the selection menu, for example ['selection 1', 'selection 2'] */
function createSelectorMenu (_caption, _id, _options, _appendToID) {

    var selectorMenu = document.createElement("SELECT");
    selectorMenu.setAttribute('class', 'selector');
    selectorMenu.setAttribute('id', _id);

    for (var i = 0; i < _options.length; i++) {

        var optionValue = document.createElement("OPTION");
        optionValue.setAttribute('value', _options[i]);
        optionValue.innerHTML = _options[i];

        selectorMenu.appendChild(optionValue);

    }

    var _appendTo = document.getElementById(_appendToID);
    _appendTo.appendChild(addCaption(_caption));
    _appendTo.appendChild(selectorMenu);
    _appendTo.appendChild(addBreak());

}


/* Creates a input box and linked input slider
   _maxBool specifies a scaler maximum
   If _maxBool is false than _maxAttachElement is the maximum value
   If _maxBool is true than _maxAttachElement is the id of the element that specifies scaler maximum */
function createInputSlider (_caption, _id, _value, _min, _maxBool, _maxElement, _step, _appendToID) {

    var _id_1 = _id.concat('_1');
    var _id_2 = _id.concat('_2');

    var inputSliderInputBox = document.createElement("INPUT");
    inputSliderInputBox.className = 'selector_1';
    inputSliderInputBox.id = _id_1;
    inputSliderInputBox.value = _value;

    var inputSlider = document.createElement("INPUT");
    inputSlider.setAttribute('type', 'range');
    inputSlider.className = 'selector_2';
    inputSlider.id = _id_2;
    inputSlider.value = _value;
    inputSlider.setAttribute('min', _min);
    inputSlider.setAttribute('max', _maxElement);
    inputSlider.step = _step;

    // Sets live display of slider value and visa versa
    inputSlider.addEventListener('input', function(){inputSliderInputBox.value = inputSlider.value});
    inputSliderInputBox.addEventListener('input', function(){inputSlider.value = inputSliderInputBox.value});

    // Sets scaler maximum if _maxBool is true
    if (_maxBool) {

        inputSlider.setAttribute('max', max(_maxElement));

    } else {

        inputSlider.setAttribute('max', _maxElement);

    }

    inputSliderInputBox.addEventListener('input', updateValues(inputSlider, inputSliderInputBox));
    inputSlider.addEventListener('input', updateValues(inputSliderInputBox, inputSlider));

    var _appendTo = document.getElementById(_appendToID);
    _appendTo.appendChild(addCaption(_caption));
    _appendTo.appendChild(inputSliderInputBox);
    _appendTo.appendChild(inputSlider);
    _appendTo.appendChild(addBreak());

}


/* adds a line break to the DOM */
function addBreak() {

    return document.createElement("BR");

}


/* adds a caption with the caption provided */
function addCaption(caption) {

    var cap = document.createElement("P");
    cap.innerHTML = caption;

    return cap;

}


function updateValues(getValue, setValue) {

    setValue.value = getValue.value;

}


function createNewName(_name, _appendTo) {

    var appendTo = document.getElementById(_appendTo);

    var name = document.createElement("P");
    name.className = 'center';
    name.innerHTML = _name;

    appendTo.appendChild(name);

}


/* updates slider and textbox */
function updateValue(getValueID, setValueID) {

    document.getElementById(setValueID).value = document.getElementById(getValueID).value;

}


/* Sets the max value given an input's value */
function max(elementID) {

    var element = document.getElementById(elementID);
    return element.value;

}

/* Creates a new header and line divider in DOM */
function createNewHeader(_header, _appendTo) {

    var appendTo = document.getElementById(_appendTo);

    var div_1 = document.createElement("DIV");
    div_1.className = "row";

    var div_2 = document.createElement("DIV");
    div_2.className = "col-full";

    var line = document.createElement("HR");
    line.className = "col-full divider";

    var heading = document.createElement("P");
    heading.className = "heading";
    heading.innerHTML = _header;

    div_2.appendChild(heading);
    div_1.appendChild(div_2);
    div_1.appendChild(line);
    appendTo.appendChild(div_1);

}


var rails = 0;


function getRails() {

    document.getElementById("rails_rails").value = rails + 1;

}


function onBegin() {

    createNewName("Rail " + rails, 'home');

    createNewHeader('Rail Attributes', 'home');
    createInputBox('Rail Name: ', 'Rail ' + rails, 'r_name', 'home');
    createSelectorMenu('Rail Type: ', 'r_type', ['Bar', 'Tube'], 'home');
    createInputSlider('Rail Length: ', 'r_length', 15, 5, false, 100, 5, 'home');
    createInputSlider('Rail Width: ', 'r_width', 6, 1, false, 24, .25, 'home');
    createInputSlider('Rail Thickness: ', 'r_thickness', 2, .5, false, 12, .25, 'home');
    createInputSlider('Rail Overhang: ', 'r_overhang', 6, 0, false, 24, .25, 'home');

    createNewHeader('Support Attributes', 'home');
    createInputSlider('Support Width: ', 's_width', 3, 1, false, 24, .25, 'home');
    createInputSlider('Support Height: ', 's_height', 2, 0, false, 6, .25, 'home');
    createInputSlider('Support Density: ', 's_density', 1, 0, false, 10, 1, 'home');

    createNewHeader('Skirting Attributes', 'home');
    createInputSlider('Skirting Height: ', 'k_height', 8, 0, false, 36, .25, 'home');
    createInputSlider('Skirting Thickness: ', 'k_thickness',.75, 0, false, 4, .25, 'home');

    createNewHeader('', 'home');

    rails += 1;

}


function passValuesToRuby() {

    //document.getElementById("ruby_r_name").value = document.getElementById("r_name").value;
    //alert(document.getElementById("r_length").value);
    //document.getElementById("ruby_r_type").value = document.getElementById("r_type").value;
    //document.getElementById("ruby_r_length").value = document.getElementById("r_length_0").value;
    //document.getElementById("ruby_r_width").value = document.getElementById("r_width_0").value;
    //document.getElementById("ruby_r_thickness").value = document.getElementById("r_thickness_0").value;
    //document.getElementById("ruby_r_overhang").value = document.getElementById("r_overhang_0").value;

    //document.getElementById("ruby_s_thickness").value = document.getElementById("s_width_0").value;
    //document.getElementById("ruby_s_height").value = document.getElementById("s_height_0").value;
    //document.getElementById("ruby_s_density").value = document.getElementById("s_density_0").value;

    //document.getElementById("ruby_k_height").value = document.getElementById("k_height_0").value;
    //document.getElementById("ruby_k_thickness").value = document.getElementById("k_thickness_0").value;

}