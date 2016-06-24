def input_students
  puts "Please enter the name of the student"

  students = []
  @studentscount = []



  typo = ["january","february","march","april","may","june","july","august",
           "september","october","november","december"]

  name = gets.chomp
  puts "Please enter cohort"
  cohort = gets.chomp
  if cohort.empty?
     cohort = :november
  elsif typo.collect {|x| x if x == cohort.downcase}.join == ""
    puts "Please check for typos"
  else
    cohort
  end
  puts "Please enter hobbies"
  hobbies = gets.chomp
  puts "Please enter country of birth"
  country = gets.chomp
  puts "Please enter height"
  height = gets.chomp

  while !name.empty? do
    @studentscount << {name: name}
    students << {name: name, cohort: cohort.to_sym, hobbies: hobbies,
                 country: country, height: height}
    puts "Now we have #{students.count} students"
    puts "Please enter next name or hit enter 5 times to exit"
    name = gets.chomp
    puts "Please enter cohort"
    cohort = gets.chomp
    if cohort.empty?
       cohort = :november
    elsif typo.collect {|x| x if x == cohort.downcase}.join == ""
      puts "Please check for typos"
    else
      cohort
    end
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
  puts "The students of Villains Academy's #{@enter_cohort} cohort".center(60)
  puts "-------------".center(60)
end

def print(names)
  while !names.empty? do
    x = names.shift
    if x[:cohort] == @enter_cohort
      puts "#{x[:name]} (#{x[:cohort]} cohort), hobbies: #{x[:hobbies]}, country of birth: #{x[:country]}, Height: #{x[:height]}".center(60)
    else
      puts "No students in the #{@enter_cohort} cohort"
    end

  end
end

def print_footer(names)
  if names.count > 1
     puts "Overall, we have #{names.count} great students".center(60)
  else
    puts "Overall, we have #{names.count} great student".center(60)
  end
end

@enter_cohort = :november

students = input_students
print_header
print(students)
print_footer(@studentscount)
