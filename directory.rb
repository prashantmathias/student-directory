def input_students
  puts "Please enter the name of the student"

  students = []
  @studentscount = []


  name = gets.chomp
  puts "Please enter hobbies"
  hobbies = gets.chomp
  puts "Please enter country of birth"
  country = gets.chomp
  puts "Please enter height"
  height = gets.chomp

  while !name.empty? do
    @studentscount << {name: name}
    students << {name: name, cohort: :november, hobbies: hobbies,
                 country: country, height: height}
    puts "Now we have #{students.count} students"
    puts "Please enter next name or hit enter 4 times to exit"
    name = gets.chomp
    puts "Please enter hobbies"
    hobbies = gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
    puts "Please enter height"
    height = gets.chomp

  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  while !names.empty? do
    x = names.shift
    puts "#{x[:name]} (#{x[:cohort]} cohort), hobbies: #{x[:hobbies]}, country of birth: #{x[:country]}, Height: #{x[:height]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(@studentscount)
