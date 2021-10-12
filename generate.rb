require_relative './book'
require_relative './print'

class Generate
  def self.book
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    Print.success('Book created successfully')
    Book.new(title, author)
  end

  def self.teacher
    puts 'Enter the name of the teacher'
    name = gets.chomp
    puts 'Enter the age of the teacher'
    age = gets.chomp
    puts 'Enter the specialization'
    spec = gets.chomp
    Print.success('Teacher created successfully')
    Teacher.new(age, spec, name)
  end

  def student
    puts 'Enter the name of the student'
    name = gets.chomp
    puts 'Enter the age of the student'
    age = gets.chomp
    puts 'Has a parent permission [Y/N]'
    permission = gets.chomp
    Print.success('Student created successfully')
    Student.new(age, name, permission.upcase.match?('Y'))
  end
end
