require 'rubygems'
require 'sinatra'
require 'haml'
require 'serialport'

class Led
  attr_accessor :serial

  def initialize(port, baud)
    @serial = SerialPort.open(port, baud, 8, 1, SerialPort::NONE)
  end

  def set_colour(r,g,b)
    data = "#{r} #{g} #{b}\n"
    data.each_char { |c| serial.write(c.chr) }
  end
end

$led = Led.new('/dev/tty.usbmodemfa141', 9600)

get '/' do
  haml :index
end

# :rgb => FF00FF
post '/set' do
  r = params[:rgb][0..1].to_i(16)
  g = params[:rgb][2..3].to_i(16)
  b = params[:rgb][4..5].to_i(16)

  $led.set_colour(r,g,b)
end
# while true do
#   0.upto(51) do |r|
#     led.set_colour(r*5, 0, 0)
#     sleep(0.02)
#   end
#
#   51.downto(0) do |r|
#     led.set_colour(r*5, 0, 0)
#     sleep(0.02)
#   end
# end

__END__

@@ layout
%html
  %head
    %script(src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js' type='text/javascript')
    %script(type="text/javascript" src="farbtastic.js")
    %link(rel="stylesheet" href="farbtastic.css" type="text/css")
  %body
    = yield

@@ index
%div#colorpicker

:javascript
  $(function() {
      $.farbtastic('#colorpicker', function(color) {
        var rgb = color.substr(1);
        $.ajax({
          type: 'POST',
          url: '/set',
          data: 'rgb=' + rgb,
          success: function() {
          }
        });
      });

      return false;
  });
