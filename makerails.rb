require 'sketchup'

UI.menu("Draw").add_item("Make new SUrail") {

  prompts = ["Rail: Length",
             "Rail: Type",
             "Rail: Width",
             "Rail: Height",
             "Rail: Color",
             "Support: Diameter",
             "Support: Height",
             "Support: Feet Width",
             "Support: Density",
             "Support: Color",
             "Skirting: Distance From Snow",
             "Skirting: Width",
             "Skirting: Color"]

  defaults = ["1", "Tube", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]

  list = ["", "Tube|Bar|Handrail", "", "", "", "", "", "", "", "", "", "", ""]

  input = UI.inputbox(prompts, defaults, list, "MakeRail")

  if results = true

    create_rail(input)
    
  end

}

def create_rail(userInput)

  rLength     = userInput[0]
  rType       = userInput[1]
  rWidth      = userInput[2]
  rHeight     = userInput[3]
  rColor      = userInput[4]
  sDiameter   = userInput[5]
  sHeight     = userInput[6]
  sSpan       = userInput[7]
  sDensity    = userInput[8]
  sColor      = userInput[9]
  kHeight     = userInput[10]
  kWidth      = userInput[11]
  kColor      = userInput[12]

  model = Sketchup.active_model
  entities = model.entities

end