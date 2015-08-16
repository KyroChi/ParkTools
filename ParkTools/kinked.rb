# segments (1, 2, 3, 3+)
# separate menus for each
# specify angles for each segment
# Face.followme follows an array of edges
#
# create surface
# find where supports go
# find where skirting goes

# foreach newkink in kinks do stuff
# newkink = [length, kink angle, h/v]
# kinks [newkink, newkink, newkink]

# seperate handling for support density?

module ParkTools

  def self.create_kinked_rail(rail_name, rail_type, rail_width, rail_thickness, rail_overhang, support_width,
      support_height, skirting_thickness, skirting_height, kinks)

    # Code
    rail_name = rail_name
    rail_type = rail_type
    rail_width = rail_width
    rail_thickness = rail_thickness
    rail_overhang = rail_overhang

    support_width = support_width
    support_height = support_height
    
    skirting_thickness = skirting_thickness
    skirting_height = skirting_height

    kinks = kinks

  end

end