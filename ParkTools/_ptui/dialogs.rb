# HTML Generate Rail dialog box

require 'ParkTools/rails'

module ParkTools


  def self.show_generate_rail_dialog

    width = 380
    height = 500

    dialog = UI::WebDialog.new("Generate Rail", false,
                               "Generate Rail", width, height, 250, 150, false);

    # Set up min and max params
    dialog.min_width = width
    dialog.min_height = height
    dialog.max_width = width
    dialog.max_height = height

    dialog.set_file('/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_ptui/HTML_dialogs/show_generate_rail_dialog.html')
    dialog.show_modal

    dialog.set_on_close {

      rail_name = dialog.get_element_value( "ruby_rail_name" )
      rail_type = dialog.get_element_value( "ruby_rail_type" )
      rail_length = dialog.get_element_value( "ruby_rail_length" )
      rail_width = dialog.get_element_value( "ruby_rail_width" )
      rail_thickness = dialog.get_element_value( "ruby_rail_thickness" )
      rail_overhang = dialog.get_element_value( "ruby_rail_overhang" )
      rail_color = dialog.get_element_value( "ruby_rail_color" )

      support_width = dialog.get_element_value( "ruby_support_width" )
      support_height = dialog.get_element_value( "ruby_support_height" )
      support_density = dialog.get_element_value( "ruby_support_density" )
      support_color = dialog.get_element_value( "ruby_support_color" )

      skirting_height = dialog.get_element_value( "ruby_skirting_height" )
      skirting_thickness = dialog.get_element_value( "ruby_skirting_thickness" )
      skirting_color = dialog.get_element_value( "ruby_skirting_color" )

      rail_inputs = [rail_name,
                     rail_type,
                     rail_length,
                     rail_width,
                     rail_thickness,
                     rail_overhang,
                     rail_color,
                     support_width,
                     support_height,
                     6,
                     support_density,
                     support_color,
                     skirting_height,
                     skirting_thickness,
                     skirting_color]

      create_rail(*rail_inputs)

    }

  end # end show_generate_rail_dialog


end # end ParkTools