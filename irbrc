require 'irb/completion'

require 'rubygems'
begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  #Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

begin
  # load hirb
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Could not load Hirb: #{err}"
end



