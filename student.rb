require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', parent_permission= true)
    super(age, name, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def print_info
    puts "[Student] Name: #{@name} ID: #{@id} Age: #{@age}"
  end

  def play_hookey
    '¯\(ツ)/¯'
  end
end
