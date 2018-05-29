#!/usr/bin/ruby
include Math

def total_7screen_dtn_width( w, a )
  r = a * Math::PI / 180  # angle in radians
  w2 = w*cos(r)
  w3 = w*cos(r*2)

  total = w + 2*(w2 + w3)
end

screens = [
  { :size => 65, :width => 57.7 },
  { :size => 70, :width => 61.4 },
  { :size => 75, :width => 66.5 },
  { :size => 85, :width => 74.9 },
  { :size => 7, :width => 7.0 }
]

angles = [ 20, 25, 30 ]


angles.each do |angle|
    puts "A 7 Screen DTN with Angle: #{angle}"
    screens.each do |s|
      tw = total_7screen_dtn_width( s[:width], angle )
      tw_feet = tw / 12.0
      puts "\t#{s[:size]}'' screen size is #{ sprintf( "%.3f", tw_feet) } feet wide total - #{tw}"
    end
end
