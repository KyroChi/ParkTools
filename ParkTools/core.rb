# Handles user interactions; menus, toolbars, ect

require 'ParkTools/function.rb'
require 'ParkTools/core'
require 'ParkTools/rails'

# Dialog dependencies
require 'ParkTools/_ptui/test_dialog'
require 'ParkTools/_ptui/show_generate_rail_dialog'

module ParkTools

  # Create ParkTools menu in Tools > ParkTools
  menu = UI.menu("Tools")
  menu.add_separator
  sub_menu = menu.add_submenu("Park Tools")

  input_menu = sub_menu.add_item("Generate Rail Core") {

    generate_rail_input

  }

  test_menu = sub_menu.add_item("Test") {

    test_method

  }

  test_web = sub_menu.add_item("WebUI") {

    show_generate_rail_dialog

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
  generate_rail_command.small_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/GenRailSmall.png"
  generate_rail_command.large_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/GenRailLarge.png"
  toolbar = toolbar.add_item generate_rail_command
  toolbar.show
  puts generate_rail_command.small_icon

  test_web_ui = UI::Command.new("Generate Rail") {

    show_generate_rail_dialog

  }
  test_web_ui.small_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/TestSmall.png"
  test_web_ui.large_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/TestLarge.png"
  toolbar = toolbar.add_item test_web_ui
  toolbar.show
  puts test_web_ui.small_icon

end # ParkTools Module