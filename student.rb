require_relative './person'

class Student < Person
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def info
    "[Student] Name: #{@name} ID: #{@id} Age: #{@age}"
  end

  def play_hookey
    '¯\(ツ)/¯'
  end
end
