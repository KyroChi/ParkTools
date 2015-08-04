# Handles functionality for ParkTools

require 'ParkTools/rails'

module ParkTools

  # Create menu option for generating rails
  menu = UI.menu("Tools")
  sub_menu = menu.add_submenu("Park Tools")
  input_menu = sub_menu.add_item("Generate Rail Core") {

    # All the prompts, defaults and lists for the input window
    prompts = ["Rail: Name",
               "Rail: Type",
               "Rail: Length",
               "Rail: Width",
               "Rail: Thickness",
               "Rail: Overhang",
               "Rail: Color",
               "Support: Diameter",
               "Support: Height",
               "Support: Feet Width",
               "Support: Density",
               "Support: Color",
               "Skirting: Distance From Snow",
               "Skirting: Width",
               "Skirting: Color"]

    defaults = ["New Rail", "Bar", "15", "5", "2", "6", "1", "3", "2", "1", "1", "1", "8", "1","1"]

    list = ["", "Tube|Bar|Double Barrel", "", "", "", "", "", "", "", "", "", "", "", "", ""]

    # Create input window
    input = UI.inputbox(prompts, defaults, list, "Park Tools Rail Generator")

    create_rail(*input)

  }

  test_menu = sub_menu.add_item("Test") {

    test_method

  }

end # ParkTools Module