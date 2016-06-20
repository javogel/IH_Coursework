class Lexiconomitron


  def eat_t(string)
    return string.split("").select {|x| x.downcase != 't'}.join("")
  end


  def shazam(array)
    return [eat_t(array[0].reverse), eat_t(array[-1].reverse)]
  end


  def oompa_loompa(array)
    array_oomped = array.select{|x| x.length <= 3}
    return array_oomped.map! {|y| eat_t(y)}
  end

end
