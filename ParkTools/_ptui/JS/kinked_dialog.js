/**
 * Created by kyle on 8/16/15.
 */

var current_kink = 0;

function create_form() {

    var appendTo = document.getElementById('first_object');

    var p = document.createElement("P");
    p.innerHTML = 'Kink ' + current_kink;

    var remove_kink = document.createElement("INPUT");
    remove_kink.type = 'button';
    remove_kink.value = 'Remove Kink';

    // Append elements

    appendTo.appendChild(p);
    appendTo.appendChild(remove_kink);
    add_break(appendTo);

    create_new_field('Segment Length: ', 0, 100, 1, 50, 's_length', appendTo);

    create_new_field('Segment Angle: ', 0, 100, 1, 50, 's_angle', appendTo);

    create_new_field('Segment Axis: ', 0, 100, 1, 50, 's_axis', appendTo);

    add_line(appendTo);

    current_kink += 1;
}


function add_break(append) {

    var br = document.createElement("BR");
    append.appendChild(br);

}


function add_line(append) {
    var div = document.createElement("DIV");
    div.className = 'row';

    var line = document.createElement("DIV");
    div.className = 'col-full divider';

    div.appendChild(line);
    append.appendChild(div);
}


function create_new_field(field_name, min, max, step, value, output_value, append) {

    var field = document.createElement("P");
    field.innerHTML = field_name;

    var field_input_box = document.createElement("INPUT");
    field_input_box.type = 'text';
    field_input_box.className = 'selector_1';
    field_input_box.min = min;
    field_input_box.max = max;
    field_input_box.step = step;
    field_input_box.value = value;
    field_input_box.id = output_value + '_1';

    //field_input_box.setAttribute("oninput", updateValue(field_input_box.id, field_input_slider.id));

    var field_input_slider = document.createElement("INPUT");
    field_input_slider.type = 'range';
    field_input_slider.className = 'selector_2';
    field_input_slider.min = min;
    field_input_slider.max = max;
    field_input_slider.step = step;
    field_input_slider.value = value;
    field_input_slider.id = output_value + '_2';

    //field_input_slider.setAttribute("oninput", updateValue(field_input_slider.id, field_input_box.id));

    append.appendChild(field);
    append.appendChild(field_input_box);
    append.appendChild(field_input_slider);
    add_break(append);

}


function updateValue(val, selector) {

    val = document.getElementById( val ).value;
    document.getElementById( selector ).value = val;

}