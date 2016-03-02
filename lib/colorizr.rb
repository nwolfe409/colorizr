class String

  def self.color_codes
    {red: "31", green: "32", yellow: "33", blue: "34", pink: "95", light_blue: "94", white: "97", light_grey: "37", black: "30"}
  end
  
  def self.create_colors   
    self.color_codes.each { |color, code| self.send(:define_method, "#{color}") { "\e[#{code}m" + self + "\e[0m" } }
  end
  
  def self.colors
    self.color_codes.keys
  end

  def self.sample_colors
    self.colors.each { |color| puts "This is " + "#{color}".send(color) }
  end      

end

String.create_colors