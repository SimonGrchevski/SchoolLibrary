require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    classroom.students.push(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hookey
    '¯\(ツ)/¯'
  end
end
