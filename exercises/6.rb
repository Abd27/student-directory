puts "Please enter the names of students".center(50)
def input_students
  puts "Please enter the names of students"
  puts "To finish, just git return twice"
  #create an empty array.
  students = []
  #get the first name.
  name = gets.chomp
  #while name is not empty, repeat this code.
  while !name.empty? do
    #add a student hash to our array.
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from user.
    name = gets.chomp
  end
  #return the student array.
  students
end  
def print_header
  puts "The students of Villains Academy".center(110)
  puts "-------------".center(110)
end
def print(names)
  names.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(20,"1").center(110)
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