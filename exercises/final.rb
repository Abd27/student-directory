def input_students
  #create an empty array.
  month = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
  'august', 'september', 'octobar', 'november', 'december', 'N/A']
  #create an empty array.
  students = []
  
  while true do
    #get the name.
    puts "Please enter the name of student or type 'stop' to finish."
    name = gets.gsub("\n", "")
    break if name == 'stop'
    #get info about cohort
    puts "Enter student cohort"
    cohort = gets.gsub("\n", "")
    #if cohort is not entered set a default value of 'N/A.'
    name = "N/A" if name.empty?
    if cohort.empty?
      cohort = "N/A"
    elsif !month.include?(cohort)
      puts "invalid cohort, re-enter the name and cohort"
      next 
    end
    #get info about hobby.
    puts "Enter hobby"
    hobby = gets.gsub("\n", "")
    #get info about country of birth.
    puts "Enter student's country of birth"
    cob = gets.gsub("\n", "")
    #get info about height.
    puts "Enter student height in cms"
    height = gets.gsub("\n", "")
    #add a student hash to our array.
    students << {
      name: name,
      month_index: month.index(cohort), 
      cohort: cohort.to_sym,
      hobby: hobby,
      cob: cob,
      height: height
      }
    puts students.length == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
  end
  #return the student array.
  students
end
def arrange_by_cohort(names)
  arranged = names.sort_by do |student|
    student[:month_index]
  end
  arranged
end  
def specific(names)
  specific_students = []
  unless names.empty?
    puts "Enter the initial letter"
    input = gets.gsub("\n", "").upcase
    counter = 0
    while counter < names.length do
      if names[counter][:name][0] == input && names[counter][:name].length < 12
        specific_students.push(names[counter])
      end
      counter += 1
    end
  end  
  specific_students
end  
def print_header
  puts "The students of Villains Academy".center(115)
  puts "------------".center(115)
end
def print_specific(names)
  counter = 0
  while counter < names.length do    
    puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort), hobby: #{names[counter][:hobby]}, C.O.B: #{names[counter][:cob]}, height: #{names[counter][:height]}cm".center(115)
      counter += 1 
  end 
end
def print_footer(names)
  puts names.count == 1 ? "Overall, we have #{names.count} great student for this catagory" : "Overall, we have #{names.count} great students for this catagory"
end

       

#now calling the methods
students = specific(arrange_by_cohort(input_students))
if !students.empty?
  print_header
  print_specific(students)
  print_footer(students)
else
  puts "There are no students on the list"
end  