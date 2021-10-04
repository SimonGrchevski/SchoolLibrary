require "./person.rb"

class Student < Person
  def initialize(age, classroom, name="unknown", parent_permission=true)
    super(age,name,parent_permission)
    @classroom = classroom
  end

  def play_hookey
    '¯\(ツ)/¯'
  end

  def classroom
    @classroom
  end

  def info
    puts "name: $#{@name} age: $#{age}"
  end
end

student = Student.new(13, 33)
puts student.classroom
