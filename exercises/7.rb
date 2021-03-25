def input_students
  month = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
  'august', 'september', 'octobar', 'november', 'december']
  #create an empty array.
  students = []
  while true do
    puts "Please enter the name of student"
    #get the first name.
    name = gets.chomp
    #get info about cohort
    puts "Enter student cohort"
    cohort = gets.chomp
    #if cohort is not entered set a default value of 'N/A.'
    name = "N/A" if name.empty?
    if cohort.empty?
      cohort = "N/A"
    elsif !month.include?(cohort.downcase)
      puts "invalid cohort, re-enter the name and cohort"
      next 
    end  
    #add a student hash to our array.
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    #get another name from user.
    puts "press return to add another student or type 'stop' to finish"
    input = gets.chomp
    break if input == "stop"
  end
  #return the student array.
  students
end  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(names)
  names.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end    
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end   
#now calling the methods
students = input_students
print_header
print(students)
print_footer(students)