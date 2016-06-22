require 'pry'

class Login
  def initialize
    @credentials = {:john => "johannus", :patv => "ironhack", :valentina => "mirror" }
  end



  def validate(user, pw)

    if ( @credentials[user.to_sym] != nil ) && @credentials[user.to_sym] == pw
      true
    elsif  ( @credentials[user.to_sym] == nil )
      false
    end
  end


  def sign_up(user, pw)
    @credentials[user.to_sym] = pw
    

  end

end
