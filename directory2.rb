require 'csv'
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  @name = STDIN.gets.chomp
  @cohort = "november"

    while !@name.empty? do
      add_students
      puts "Now we have #{@students.count} students"
      @name = STDIN.gets.chomp
    end
end

def load_students(filename = "students.csv")

  if File.exists?(filename)
      CSV.foreach(filename)do |row|
      @name, @cohort = row
      add_students

    end
  else
      puts "Sorry, #{filename} doesn't exist."
      exit
  end
end

def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list"
  puts "4. Load list"
  puts "5. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
    action_message
  when "2"
    show_students
    action_message
  when "3"
    save_students
    action_message
  when "4"
    puts "Please enter filename"
    fname = STDIN.gets.chomp
    load_students(fname)
    action_message
  when "5"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def action_message
  puts "Success!"
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
    puts "Please enter file name"
    filename = STDIN.gets.chomp

    CSV.open(filename, "w") do |csv|
    @students.each do |student|
    csv << [student[:name], student[:cohort]]
    end
    end

end

def try_load_students
  filename = ARGV.first
  return if filename.nil?

  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
