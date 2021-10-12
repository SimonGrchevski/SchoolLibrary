require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown')
    super( age, name)
    @specialization = specialization
  end

  def can_use_services?
    @parent_permission
  end

  def info
    "[Teacher] Name: #{@name} ID: #{@id} Age: #{@age}"
  end
end
