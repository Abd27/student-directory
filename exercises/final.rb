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
def specific(names)
  specific_students = []
  puts "Enter the initial letter"
  input = gets.chomp.upcase
  counter = 0
  while counter < names.length do
    if names[counter][:name][0] == input && names[counter][:name].length < 12
      specific_students.push(names[counter])
    end
    counter += 1
  end
  specific_students
end  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_specific(names)
  counter = 0
  while counter < names.length do    
    puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort), hobby: #{names[counter][:hobby]}, C.O.B: #{names[counter][:cob]}, height: #{names[counter][:height]}cm"
      counter += 1 
  end 
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students for this catagory"
end

       

#now calling the methods
students = specific(input_students)

print_header
print_specific(students)
print_footer(students)

