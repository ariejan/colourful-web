# Colourful Web

This is a prototype (hence no tests) of controlling the Arduino board from a web interface.

## How to use

 1) Load the arduino sketch onto your board
 2) Build the proper setup on your breadboard (details to follow)
    - Red -> Pin 3
    - Green -> Pin 5
    - Blue -> Pin 6
 3) Run `bundle install` for the ruby project
 4) `ruby app.rb`
 5) ??
 6) Profit!

## Caveats

 * You may need to edit `app.rb` to use the proper serial port for your system

## Next steps?

None at the moment, but I'm considering to use an AmbiLight™ instead of LED. Then
create a proper API for it so I can hook-up the CI server or something else.
