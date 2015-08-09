# Handles user interactions; menus, toolbars, ect

require 'ParkTools/function.rb'
require 'ParkTools/core'
require 'ParkTools/rails'

# Dialog dependencies
require 'ParkTools/_ptui/test_dialog'
require 'ParkTools/_ptui/dialogs'

module ParkTools

  # Create a Tools > ParkTools menu ----------------------------

  menu = UI.menu("Tools")
  menu.add_separator
  sub_menu = menu.add_submenu("Park Tools")

  # ------------------------------------------------------------



  # Tools > ParkTools > Generate Rail Core ---------------------

  input_menu = sub_menu.add_item("Generate Rail Core") {

    generate_rail_input

  }

  # ------------------------------------------------------------



  # Tools > ParkTools > WebUI ----------------------------------

  test_web = sub_menu.add_item("WebUI") {

    show_generate_rail_dialog

  }

  # ------------------------------------------------------------



  # Create ParkTools Toolbar -----------------------------------

  toolbar = UI::Toolbar.new "ParkTools"

  # ------------------------------------------------------------



  # ToolBar Generate Rail Command ------------------------------

  generate_rail_command = UI::Command.new("Generate Rail") {

    generate_rail_input

  }
  generate_rail_command.small_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/GenRailSmall.png"
  generate_rail_command.large_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/GenRailLarge.png"
  toolbar = toolbar.add_item generate_rail_command
  puts generate_rail_command.small_icon
  toolbar.show

  # ------------------------------------------------------------



  # ToolBar Generate Rail webui --------------------------------

  test_web_ui = UI::Command.new("webui") {

    show_generate_rail_dialog

  }
  test_web_ui.small_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/TestSmall.png"
  test_web_ui.large_icon = "/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_icons/TestLarge.png"
  toolbar = toolbar.add_item test_web_ui
  puts test_web_ui.small_icon
  toolbar.show

  # ------------------------------------------------------------

end # ParkTools Module