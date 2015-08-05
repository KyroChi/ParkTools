module ParkTools

  def self.show_test_dialog

    dlg = UI::WebDialog.new("DialogTest", false,
                            "DialogTest", 200, 150, 150, 150, false);

    html = <<-HTML

    <head>
      <link rel="stylesheet" type="text/css" href="rubygrid.css">
    </head>

    <form>
      <input id="start2" onClick="window.alert('alert from javascript');" type="button" size="100" value="input">
      </br>
      <a href="skp:ruby_messagebox@from link">link</a>
    </form>

    HTML

    dlg.set_html html
    dlg.add_action_callback("ruby_messagebox") {|dialog, params|
      UI.messagebox("You called ruby_messagebox with: " + params.to_s)
    }
    dlg.show

  end

end # end ParkTools