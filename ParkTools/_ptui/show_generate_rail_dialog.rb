
module ParkTools


  def self.show_generate_rail_dialog

    width = 400
    height = 500

    dialog = UI::WebDialog.new("Generate Rails", false,
                               "Generate Rails", width, height, 250, 150, false);

    # Set up min and max params
    dialog.min_width = width
    dialog.min_height = height
    dialog.max_width = width
    dialog.max_height = height

    dialog.set_file('/Users/kyle/Library/Application Support/SketchUp 2015/SketchUp/Plugins/ParkTools/_ptui/HTML_dialogs/show_generate_rail_dialog.html')
    dialog.show

  end # end show_generate_rail_dialog


end # end ParkTools