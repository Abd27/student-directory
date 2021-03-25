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
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(names)
  counter = 0
  while counter < names.length do
    puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
    counter += 1
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