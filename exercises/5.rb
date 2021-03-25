def input_students
  puts "Please enter the names of students"
  #create an empty array.
  students = []
  #get the first name.
  name = gets.chomp
  #while name is not empty, repeat this code.
  while !name.empty? do
    #get info about hobby.
    puts "Enter hobby"
    hobby = gets.chomp
    #get info about country of birth.
    puts "Enter student's country of birth"
    cob = gets.chomp
    #get info about height.
    puts "Enter student height in cms"
    height = gets.chomp
    #add a student hash to our array.
    students << {
      name: name, 
      cohort: :november,
      hobby: hobby,
      cob: cob,
      height: height
      }
    puts "Now we have #{students.count} students"
    #get another name from user.
    puts "Enter another name or just hit return finish"
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
  names.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort), hobby: #{student[:hobby]}, C.O.B: #{student[:cob]}, height: #{student[:height]}cm"
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
