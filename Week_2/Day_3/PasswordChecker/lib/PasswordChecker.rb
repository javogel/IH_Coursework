class PasswordChecker

  def initialize

  end


  def check_password(username, password)

      if (username == nil) || (password == nil)
        return false
      end
      username_name = username.split('@')
      username_email = username_name[1].split('.')
      user = username_name[0]
      email = username_email[0]



      digits = password.scan(/\d/).length
      special = password.scan(/\W/).length
      uppercase = password.scan(/\p{Upper}/).length
      lowercase = password.scan(/\p{Lower}/).length
      contains_name = password.include? user
      contains_email = password.include? email



      if password.length < 7
        false
      elsif  (uppercase < 1)  || (lowercase < 1) || (digits < 1) || ( special < 1)
        false
      elsif contains_email || contains_name
        false
      else
        true
      end
  end

end
