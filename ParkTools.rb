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

require 'sketchup.rb'
require 'extensions.rb'

module ParkTools

  unless file_loaded?( __FILE__ )

    park_tools = SketchupExtension.new( 'ParkTools', 'ParkTools/core.rb' )
    Sketchup.register_extension( park_tools, true )

  end


end

file_loaded( __FILE__ )
