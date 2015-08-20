# HTML Generate Rail dialog box

require 'ParkTools/function'

module ParkTools


  def self.show_generate_rail_dialog

    width = 380
    height = 500

    dialog = UI::WebDialog.new("Generate Rail", false,
                               "Generate Rail", width, height, 250, 150, false)

    # Set up min and max params
    dialog.min_width = width
    dialog.min_height = height
    dialog.max_width = width
    dialog.max_height = height

    dialog.set_file('/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_ptui/HTML_dialogs/new_generate_rail_dialog.html')
    dialog.show_modal

    dialog.set_on_close {

      rail_name = dialog.get_element_value( "r_name_0" )
      rail_type = dialog.get_element_value( "r_type_0" )
      rail_length = dialog.get_element_value( "r_length_0" )
      rail_width = dialog.get_element_value( "r_width_0" )
      rail_thickness = dialog.get_element_value( "r_thickness_0" )
      rail_overhang = dialog.get_element_value( "r_overhang_0" )

      support_width = dialog.get_element_value( "s_width_0" )
      support_height = dialog.get_element_value( "s_height_0" )
      support_density = dialog.get_element_value( "s_density_0" )

      skirting_height = dialog.get_element_value( "k_height_0" )
      skirting_thickness = dialog.get_element_value( "k_thickness_0" )

      rail_inputs = [rail_name,
                     rail_type,
                     rail_length,
                     rail_width,
                     rail_thickness,
                     rail_overhang,
                     0,

                     support_width,
                     support_height,
                     0,
                     support_density,
                     0,

                     skirting_height,
                     skirting_thickness,
                     0]

      create_rail(*rail_inputs)

    }

  end # end show_generate_rail_dialog



  def self.show_settings_dialog

    width = 380
    height = 500

    dialog = UI::WebDialog.new("Settings", false,
                               "Settings", width, height, 250, 150, false)

    # Set up min and max params
    dialog.min_width = width
    dialog.min_height = height
    dialog.max_width = width
    dialog.max_height = height

    dialog.set_file('')
    dialog.show_modal

  end # end show_settings_dialog



  def self.show_kink_rail_test

    width = 380
    height = 500

    dialog = UI::WebDialog.new("Settings", false,
                               "Settings", width, height, 250, 150, false)

    # Set up min and max params
    dialog.min_width = width
    dialog.min_height = height
    dialog.max_width = width
    dialog.max_height = height

    dialog.set_file('')
    dialog.show_modal

  end # end show_kink_rail_test


end # end ParkTools