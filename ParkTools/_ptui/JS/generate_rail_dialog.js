/* updates slider and textbox */
function updateValue(getValueID, setValueID) {

    document.getElementById(setValueID).value = document.getElementById(getValueID).value;

}

/* sets all the variables that are needed to create a rail */
var rail_name;
var rail_type;
var rail_length;
var rail_width;
var rail_thickness;
var rail_overhang;
var rail_color;

var support_width;
var support_height;
var support_density;
var support_color;

var skirting_height;
var skirting_thickness;
var skirting_color;

/* Gets all the input values from HTML dialog box */
function getValues() {

    rail_name = document.getElementById( "r_name" ).value;
    document.getElementById( "ruby_rail_name" ).value = rail_name;

    rail_type = document.getElementById( "r_type").value;
    document.getElementById( "ruby_rail_type" ).value = rail_type;

    rail_length = document.getElementById( "r_length_1" ).value;
    document.getElementById( "ruby_rail_length" ).value = rail_length;

    rail_width = document.getElementById( "r_width_1" ).value;
    document.getElementById( "ruby_rail_width" ).value = rail_width;

    rail_thickness = document.getElementById( "r_thickness_1" ).value;
    document.getElementById( "ruby_rail_thickness" ).value = rail_thickness;

    rail_overhang = document.getElementById( "r_overhang_1" ).value;
    document.getElementById( "ruby_rail_overhang" ).value = rail_overhang;

    rail_color = document.getElementById( "r_color" ).value;
    document.getElementById( "ruby_rail_color" ).value = rail_color;


    support_width = document.getElementById( "s_width_1" ).value;
    document.getElementById( "ruby_support_width" ).value = support_width;

    support_height = document.getElementById( "s_height_1" ).value;
    document.getElementById( "ruby_support_height" ).value = support_height;

    support_density = document.getElementById( "s_density_1" ).value;
    document.getElementById( "ruby_support_density" ).value = support_density;

    support_color = document.getElementById( "s_color" ).value;
    document.getElementById( "ruby_support_color" ).value = support_color;


    skirting_height = document.getElementById( "k_height_1" ).value;
    document.getElementById( "ruby_skirting_height" ).value = skirting_height;

    skirting_thickness = document.getElementById( "k_thickness_1" ).value;
    document.getElementById( "ruby_skirting_thickness" ).value = skirting_thickness;

    skirting_color = document.getElementById( "k_color" ).value;
    document.getElementById( "ruby_skirting_color" ).value = skirting_color;

}


/* Sets the max value given an input's value */
function max(elementID) {

    var element = document.getElementById(elementID);
    return element.value;

}

/*

These functions create various input menus

_caption is the text prepended to the input box, recommended 'Caption: '
_class is the class of the input element, for SketchupUI with dialog.css use 'selector'
_id is the unique id of the input element, make sure that every object has a UNIQUE id
_appendToID is the id of the HTML object that the new input box will be appended to

 */

// Creates a simple input text box
// _default_value is the value that will be displayed initially in the text box
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


// Creates a selection dropdown menu
// Options is an array of options in the selection menu, for example ['selection 1', 'selection 2']
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


// Creates a input box and linked input slider
// _maxBool specifies a scaler maximum
// If _maxBool is false than _maxAttachElement is the maximum value
// If _maxBool is true than _maxAttachElement is the id of the element that specifies scaler maximum
function createInputSlider (_caption, _id, _value, _min, _maxBool, _maxElement, _step, _appendToID) {

    var inputSliderInputBox = document.createElement("INPUT");
    inputSliderInputBox.setAttribute('class', 'selector_1');
    inputSliderInputBox.setAttribute('id', _id + '_1');
    inputSliderInputBox.setAttribute('value', _value);

    var inputSlider = document.createElement("INPUT");
    inputSlider.setAttribute('type', 'range');
    inputSlider.setAttribute('class', 'selector_2');
    inputSlider.setAttribute('id', _id + '_2');
    inputSlider.setAttribute('value', _value);
    inputSlider.setAttribute('min', _min);
    inputSlider.setAttribute('max', _maxElement);
    inputSlider.setAttribute('step', _step);

    // Sets scaler maximum if _maxBool is true
    if (_maxBool) {

        inputSlider.setAttribute('max', max(_maxElement));

    } else {

        inputSlider.setAttribute('max', _maxElement);

    }

    var _appendTo = document.getElementById(_appendToID);
    _appendTo.appendChild(addCaption(_caption));
    _appendTo.appendChild(inputSliderInputBox);
    _appendTo.appendChild(inputSlider);
    _appendTo.appendChild(addBreak());

}


// adds a line break to the DOM
function addBreak() {

    return document.createElement("BR");

}


// adds a caption with the caption provided
function addCaption(caption) {

    var cap = document.createElement("P");
    cap.innerHTML = caption;

    return cap;

}