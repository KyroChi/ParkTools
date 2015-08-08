function sample_function () {

    var rail_name = document.getElementById( "r_name" ).value;

    var rail_length = document.getElementsByClassName( "r_length" ).value;
    rail_length = 15;

    var rail_width = document.getElementById( "r_width" ).value;
    var rail_thickness = document.getElementById( "r_thickness" ).value;
    var rail_overhang = document.getElementById( "r_overhang" ).value;

    alert(rail_name + rail_length + rail_width + rail_thickness + rail_overhang);
}

function updateTextInput(val) {
    document.getElementById("r_length_1").value = val;
}

function updateDOMSlide(val) {
    document.getElementById("r_length_2").value = val;
}