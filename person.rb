class Person
  attr_accessor :name, :age
  attr_writer :id
  def initialize(age, name='unknown', parent_permission=true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def is_of_age?
    age >=18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
