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

    dialog.set_file('/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_ptui/HTML_dialogs/generate_rail_dialog.html')
    dialog.show_modal

    dialog.set_on_close {

      rails = dialog.get_element_value( "rails_rails" )

      for r in 1..rails.to_i

        rail_name = dialog.get_element_value( "r_name" )

        UI.messagebox(rail_name)

        rail_type = dialog.get_element_value( "r_type" )

        UI.messagebox(rail_type)

        rail_length = dialog.get_element_value( "r_length" )

        UI.messagebox(rail_length)

        rail_width = dialog.get_element_value( "r_width" )
        rail_thickness = dialog.get_element_value( "r_thickness" )
        rail_overhang = dialog.get_element_value( "r_overhang" )

        support_width = dialog.get_element_value( "s_width" )
        support_height = dialog.get_element_value( "s_height" )
        support_density = dialog.get_element_value( "s_density" )

        skirting_height = dialog.get_element_value( "k_height" )
        skirting_thickness = dialog.get_element_value( "k_thickness" )

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

      end

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