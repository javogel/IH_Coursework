class Login
  def initialize

  end


  def self.validate(user, pw)
    @@credentials = {:john => "johannus", :patv => "ironhack", :valentina => "mirror" }
    if ( @@credentials[user.to_sym] != nil ) && @@credentials[user.to_sym] == pw
      true
    else
      false
    end
  end

end
