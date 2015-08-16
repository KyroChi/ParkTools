/* updates slider and textbox */
function updateValue(val, selector) {

    document.getElementById( selector ).value = val;

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
function max(getValueOf, setValueOf) {

    getMaxValue = document.getElementById( getValueOf ).value;

    setMaxValue = document.getElementById( setValueOf );
    setMaxValue.setAttribute("max", getMaxValue);

}

function railWidth(val, selector, getValue, setValue) {

    updateValue(val, selector);
    max(getValue, setValue);

}