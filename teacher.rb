# frozen_string_literal: true

require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    @parent_permission
  end
end
