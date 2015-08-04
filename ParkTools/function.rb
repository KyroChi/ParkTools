# Defines methods that are accessed by the ParkTools UI

require'ParkTools/rails.rb'

module ParkTools


  # UI command to access the generate rail prompt
  def self.generate_rail_input

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

  end


end