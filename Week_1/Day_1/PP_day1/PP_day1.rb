


class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end


ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]


def array_printer (array)

  array.each { |language| puts " Language Name is: #{language.name} and the Age is: #{language.age} and the Type is: #{language.type}" }

end

puts "\n"
array_printer(array_of_languages)


puts "\n"
aged_languages = array_of_languages.map{|language| ProgrammingLanguage.new(language.name, language.age+1, language.type) }
puts "The programming languages aged one year are:"
array_printer(aged_languages)

puts "\n"
sorted_languages = array_of_languages.sort {|x,y| y.age<=>x.age}
puts "The programming languages sorted by age are:"
array_printer(sorted_languages)

puts "\n"
no_java = array_of_languages.delete_if {|language| language.name == "Java" }
puts "The programming languages without Java are:"
array_printer(no_java)

puts "\n"
shuffled_languages = sorted_languages.shuffle
puts "The programming languages are shuffled:"
array_printer(shuffled_languages)

puts "\n"
popped_languages = array_of_languages.pop(2)
puts "These programming languages are removed from array and returned:"
array_printer(popped_languages)

puts "\n"
Ruby_included = array_of_languages.include?("Ruby")
puts "The list of languages includes Ruby? #{Ruby_included}"

array_printer(array_of_languages)
