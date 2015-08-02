require 'sketchup'

UI.menu("Draw").add_item("Make new SUrail") {

  prompts = ["Rail: Type",
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

  defaults = ["Bar", "15", "5", "2", "6", "1", "3", "2", "1", "1", "1", "1", "1","1"]

  list = ["Tube|Bar|Handrail", "", "", "", "", "", "", "", "", "", "", "", "", ""]

  input = UI.inputbox(prompts, defaults, list, "MakeRail")

  if results = true

    create_rail(*input)

  end

}

def create_rail(t, l, w, h, o, c, d, h2, s, d2, c2, h3, w2, c3)

  rType       = t
  rLength     = l.to_f * 12
  rWidth      = w.to_f #* 12
  rHeight     = h.to_f #* 12
  rOver       = o.to_f
  rColor      = c.to_f #* 12
  sDiameter   = d.to_f #* 12
  sHeight     = h2.to_f * 12
  sSpan       = s.to_f #* 12
  sDensity    = d2.to_f + 2#* 12
  sColor      = c2.to_f #* 12
  kHeight     = h3.to_f #* 12
  kWidth      = w2.to_f #* 12
  kColor      = c3.to_f #* 12

  entities = Sketchup.active_model.active_entities

  # Generate sliding surface if tube is chosen
  #TODO Fix this mechanic
  if rType == "Tube"
    centerPoint = Geom::Point3d.new(rWidth, rWidth, 0)
    vector = Geom::Vector3d.new 0, 1, 0
    vector2 = vector.normalize!

    edges = entities.add_circle centerPoint, vector2, rWidth
  end




  # Generate sliding surface if bar is chosen
  if rType == "Bar"

    pt1 = [0, 0, sHeight]
    pt2 = [0, rLength, sHeight]
    pt3 = [rWidth, rLength, sHeight]
    pt4 = [rWidth, 0, sHeight]

    surface = entities.add_face pt1, pt2, pt3, pt4
    surface.pushpull -rHeight

  end




  # Generate supports
  supportIn = (rWidth - sDiameter) / 2
  supportSpan = rLength - sDiameter - (2 * rOver)
  supportGap = supportSpan / (sDensity - 1)
  currentGap = 0.0

  for support in 1..sDensity

    pt1 = [supportIn, rOver + currentGap, 0]
    pt2 = [supportIn, rOver + currentGap + sDiameter, 0]
    pt3 = [supportIn + sDiameter, rOver + currentGap + sDiameter, 0]
    pt4 = [supportIn + sDiameter, rOver + currentGap, 0]

    support = entities.add_face pt1, pt2, pt3, pt4
    support.pushpull -sHeight

    currentGap += supportGap

  end




  # Generate Skirting
  skirtingIn = (rWidth - kWidth) / 2
  skirtingSpan = rlength - (2 * rOver) - (sDiameter * sDensity)
  skirtingGap = skirtingSpan / (sDensity - 1)
  skirtingStart = rOver + sDiameter

  for skirting in 1..sDensity

    pt1 = [skirtingIn, skirtingStart, kHeight]
    pt2 = [skirtingIn, skirtingStart + skirtingGap, kHeight]
    pt3 = [skirtingIn + skirtingStart + skirtingGap, kHeight]
    pt4 = [skirtingIn + kWidth, skirtingStart, kHeight]

    skirting = entities.add_face pt1, pt2, pt3, pt4
    skirting.pushpull -(sHeight - kHeight)

    skirtingStart += skirtingGap + sDiameter

  end

  UI.messagebox("Debug")
end