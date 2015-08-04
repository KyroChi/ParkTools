########################################################################################################################
#                                                                                                                      #
# ParkTools Plugin for SketchUp2015+                                                                                   #
# Designed and built by:                                                                                               #
# - Kyle Chickering                                                                                                    #
# -                                                                                                                    #
#                                                                                                                      #
# With help from:                                                                                                      #
# - Your Name Here                                                                                                     #
#                                                                                                                      #
# This plugin is free to use, if you want to modify this plugin feel free to submit changes to this                    #
# plugin's GitHub page. You can do this by submitting a pull request or submitting a merge request with a              #
# fork.                                                                                                                #
#                                                                                                                      #
# If you find any bugs please report them at the plugin's GitHub page by submitting an issue                           #
#                                                                                                                      #
# If there is a feature that you think this plugin should have feel free to submit an issue outlining the feature      #
# and how it works in detail                                                                                           #
#                                                                                                                      #
# GitHub repository                                                                                                    #
# https://github.com/KyroChi/ParkTools                                                                                 #
#                                                                                                                      #
# If you would like to talk to me about development or just Terrain Park design in general feel free to add            #
# me on Skype @ 'KyleSesHello'                                                                                         #
#                                                                                                                      #
# Please don't send me issues that should be posted at GitHub, but for general development or talking shop             #
# that is the best way to get a-hold of me.                                                                            #
#                                                                                                                      #
# Created in RubyMine by JetBrains on an Educational License                                                           #
# ^^ Check out JetBrains and RubyMine, you will never go back!                                                         #
#                                                                                                                      #
########################################################################################################################





require 'sketchup'





  # Create menu option for generating rails
  UI.menu("Tools").add_item("Generate Rail BETADEBBUGER") {





    # All the prompts, defaults and lists for the input window
    prompts = ["Raul: Name",
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

    # If numbers are entered than create a rail
    if true

    create_rail(*input)

    end
  }





  # Main function that creates rails in the ParkTools toolkit
  # TODO break create_rail into seperate functions to improve devlopment
  def create_rail (n, t, l, w, h, o, c, d, h2, s, d2, c2, h3, w2, c3)





    # Intialize entities for manipulation
    model = Sketchup.active_model
    entities = model.active_entities





    # Convert inputbox's output array into usable variables
    r_name       = n.to_s
    r_type       = t
    r_length     = l.to_f * 12
    r_width      = w.to_f #* 12
    r_height     = h.to_f #* 12
    r_over       = o.to_f
    r_color      = c.to_f #* 12
    s_diameter   = d.to_f #* 12
    s_height     = h2.to_f * 12
    s_span       = s.to_f #* 12
    s_density    = d2.to_f + 2#* 12
    s_color      = c2.to_f #* 12
    k_height     = h3.to_f #* 12
    k_width      = w2.to_f #* 12
    k_color      = c3.to_f #* 12




    model.start_operation('Generate Rail')
    # Generate sliding surface if tube is chosen
    if r_type == "Tube"

      radius = r_width / 2
      center_point = Geom::Point3d.new(radius,0,s_height)
      circle_orientation = Geom::Vector3d.new(0,1,0)

      circle_perimeter = entities.add_circle center_point, circle_orientation, radius
      circle = circle_perimeter[0]
      tube_face = circle.curve

      tube = entities.add_face tube_face
      tube.pushpull r_length

    end





    # Generate sliding surface if bar is chosen
    if r_type == "Bar"

      pt1 = [0, 0, s_height]
      pt2 = [0, r_length, s_height]
      pt3 = [r_width, r_length, s_height]
      pt4 = [r_width, 0, s_height]

      surface = entities.add_face pt1, pt2, pt3, pt4
      surface.pushpull -r_height

    end





    # Generate sliding surface if bar is chosen
    #TODO implement Double Barrel rail
    if r_type == "Double Barrel"
      location = 0
      for barrel in 1..2

        radius = r_width / 2
        center_point = Geom::Point3d.new(radius + location,0,s_height)
        circle_orientation = Geom::Vector3d.new(0,1,0)

        circle_perimeter = entities.add_circle center_point, circle_orientation, radius
        circle = circle_perimeter[0]
        tube_face = circle.curve

        tube = entities.add_face tube_face
        tube.pushpull r_length

        location += radius

      end
    end





    # Generate supports

    # How far the outer edges of the support are from the outer edges of the surface
    support_in = (r_width - s_diameter) / 2
    # The distance from the centers of the two endcap supports
    support_span = r_length - s_diameter - (2 * r_over)
    # The distance between supports
    support_gap = support_span / (s_density - 1)
    # The current distance from the origin point, used in the for loop
    current_gap = 0.0

    # Creates all the required supports
    for support in 1..s_density

      # Creates a x, y coord cloud that represents the support footprint
      pt1 = [support_in, r_over + current_gap, 0]
      pt2 = [support_in, r_over + current_gap + s_diameter, 0]
      pt3 = [support_in + s_diameter, r_over + current_gap + s_diameter, 0]
      pt4 = [support_in + s_diameter, r_over + current_gap, 0]

      # Creates and extrudes supports from x, y coord cloud
      support = entities.add_face pt1, pt2, pt3, pt4
      support.pushpull -s_height

      # Adds a gap so the next support is further down the rail
      current_gap += support_gap

    end





    # Generate Skirting

    # How far the outer edge of the skirting is from the outer edge of the surface
    skirting_in = (r_width - k_width) / 2
    # How long each section of skirting is
    skirting_span = support_span / (s_density - 1) - s_diameter
    # Origin point of the skirting
    skirting_start = (r_over + s_diameter)

    # Creates required skirting sections
    for skirting in 1..(s_density - 1)

      # Creates a x, y coord cloud that represents the skirting footprint
      pt1 = [skirting_in, skirting_start, k_height]
      pt2 = [skirting_in, skirting_start + skirting_span, k_height]
      pt3 = [skirting_in + k_width, skirting_start + skirting_span, k_height]
      pt4 = [skirting_in + k_width, skirting_start, k_height]

      # Creates and extrudes skirting from x, y coord cloud
      skirting = entities.add_face pt1, pt2, pt3, pt4
      skirting.pushpull -(s_height - k_height)

      # Increases distange from origin so that skirting is located properly
      skirting_start += skirting_span + s_diameter

    end
    model.commit_operation

    # Turn on for debug or creation conformation
    #UI.messagebox(r_name + " Created")

  end