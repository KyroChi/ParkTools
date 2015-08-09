/* updates slider and textbox */
function updateValue(val, selector) {

    document.getElementById( selector ).value = val;

}

/* Gets all the input values from HTML dialog box */
function getValues() {

    var rail_name = document.getElementById( "r_name" ).value;

    var rail_type = document.getElementById( "r_type").value;

    var rail_length = document.getElementById( "r_length_1" ).value;

    var rail_width = document.getElementById( "r_width_1" ).value;

    var rail_thickness = document.getElementById( "r_thickness_1" ).value;

    var rail_overhang = document.getElementById( "r_overhang_1" ).value;

    var rail_color = '#ffffff';

}

function pushValues() {

    window.alert(rail_name + rail_type + rail_length + rail_width + rail_thickness + rail_overhang + rail_color);

}

/* creates Ruby variables from DHTML variables */
function translateRuby() {

    document.getElementById( "ruby_rail_name" ).value = rail_name;

}