@students = []
def input_students
  month = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
  'august', 'september', 'octobar', 'november', 'december', 'N/A']
  #changed while to loop
  loop do
    puts "Please enter the name of student or type 'stop' to finish."
    name = STDIN.gets.chomp
    break if name == 'stop'
    name = "N/A" if name.empty?
    puts "Enter student cohort"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "N/A"
    elsif !month.include?(cohort)
      puts "invalid cohort, re-enter the name and cohort"
      next 
    end
    update_student_list(name, cohort)
    puts @students.length == 1 ? "Now we have 1 student" : "Now we have #{@students.count} students"
  end
end
def update_student_list(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end    
def print_header
  puts "The students of Villains Academy".center(115)
  puts "------------".center(115)
end
def print_students_list
  #changed while loop to .each itirator
  @students.each.with_index(1) do |student, index|    
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(115)
  end 
end
def print_footer
  puts @students.count == 1 ? "Overall, we have #{@students.count} great student" : "Overall, we have #{@students.count} great students"
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to student.csv"
  puts "4. Load the list from student.csv"
  puts "9. Exit"
end
def show_students 
    print_header
    print_students_list
    print_footer  
end
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    update_student_list(name, cohort)
  end
  file.close
end
def try_load_students(filename = "students.csv")
  filename = ARGV.first if !ARGV.empty?
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(60, "`")
  else
    puts "Sorry, #{filename} doesn't exist.".center(60,"`")
    exit
  end  
end      
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
      puts "the list is saved"
    when "4"
      load_students
      puts "the list is loaded and ready to be shown"    
    when "9"
      exit
    else
      puts "I don't Know what you mean, try again"
  end
end 
#adding an intractive menu
def intractive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
try_load_students
intractive_menu        