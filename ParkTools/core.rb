# Handles user interactions; menus, toolbars, ect

require 'ParkTools/function.rb'
require 'ParkTools/rails'

module ParkTools

  # Create ParkTools menu in Tools > ParkTools
  menu = UI.menu("Tools")
  sub_menu = menu.add_submenu("Park Tools")

  input_menu = sub_menu.add_item("Generate Rail Core") {

    generate_rail_input

  }

  test_menu = sub_menu.add_item("Test") {

    test_method

  }

  inspectors = sub_menu.add_item("Inspector Inputs") {

    prompts = ["Color"]
    defaults = [""]

    input = UI.inputbox(prompts, defaults, 'Color Changer')

    UI.show_inspector "Materials"
  }


  # Create ParkTools Toolbar
  toolbar = UI::Toolbar.new "ParkTools"

  generate_rail_command = UI::Command.new("Generate Rail") {

    generate_rail_input

  }
  generate_rail_command.small_icon = "GenRailSmall.png"
  generate_rail_command.large_icon = "GenRailLarge.png.png"
  toolbar = toolbar.add_item generate_rail_command
  toolbar.show
  puts generate_rail_command.small_icon

end # ParkTools Module