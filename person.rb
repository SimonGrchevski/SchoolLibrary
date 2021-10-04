class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(0..5000)
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
