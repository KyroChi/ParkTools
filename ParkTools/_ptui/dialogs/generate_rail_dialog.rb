module ParkTools


  def self.show_generate_rail_dialog

    dialog = UI::WebDialog.new("Generate Rails", false,
                               "Generate Rails", 200, 150, 150, 150, false);

    html = <<-HTML

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Test</title>
        <link rel="stylesheet" type="text/css" href="rubygrid.css">
    </head>

    <body>
        <div class="block">
            <div class="row">
                <div class="col-half">
                    <p>This is a class dialog</p>
                </div>
                <div class="col-half">
                    <p>CSS injection</p>
                </div>
            </div>
        </div>
    </body>

</html>

    HTML

    dialog.set_html html
    dialog.show

  end # end show_generate_rail_dialog


end # end ParkTools