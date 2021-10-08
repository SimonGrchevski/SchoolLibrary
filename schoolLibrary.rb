require './book'
require './teacher'
require './student'
require './rental'
require './person'

class SchoolLibrary

  def initialize
    @books = []
    @people = []
    @rentals = []
    @actions = []
    @options = [
      'List all books',
      'List all people',
      'Create a person',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person id',
      'Terminate'
    ]
    @teacher = '1'.freeze
    @student = '2'.freeze
    @create_rental_failure = 'F'.freeze
    @EXIT_CODE = @options.size
    init_actions
  end

  def print_error(err)
    case err
    when @create_rental_failure
      puts 'Err: There isnt any book or person!'
    end
  end

  def print_options
    @options.each_with_index { |o, i| puts "#{i+1} #{o}" }
  end

  def list_all_books
    @books.each { |book| puts book.info }
  end

  def list_all_people
    @people.each { |person| puts person.info }
  end

  def create_book
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    puts 'Book created successfully'
    @books.push(Book.new(title, author))
  end

  def create_teacher
    puts 'Enter the name of the teacher'
    name = gets.chomp
    puts 'Enter the age of the teacher'
    age = gets.chomp
    puts 'Enter the specialization'
    spec = gets.chomp
    puts 'Teacher created successfully'
    @people.push(Teacher.new(age, spec, name))
  end

  def create_student
    puts 'Enter the name of the student'
    name = gets.chomp
    puts 'Enter the age of the student'
    age = gets.chomp
    puts 'Has a parent permission [Y/N]'
    permission = gets.chomp
    @people.push(
      Student.new(age, name, permission.upcase.match?('Y'))
    )
  end

  def create_person
    loop do
      system 'clear'
      puts "#{@teacher}) To create teacher"
      puts "#{@student}) To create student"
      case gets.chomp
      when @teacher
        return create_teacher
      when @student
        return create_student
      else
        puts 'Wrong input,try again!'
      end
    end
  end

  def get_book_for_rental
    unless @books.size === 0
      loop do
        puts 'Select a Book from the following list by number '
        @books.each_with_index do |book, i|
          puts "#{i}) #{book.info}"
        end
        book = gets.chomp.to_i
        case book
        when 0..@books.size-1
          return @books[book]
        else
          puts 'That book does not exist, try again!'
        end
      end
    end
    @create_rental_failure
  end

  def get_person_that_rents
    unless @people.size === 0
      loop do
        puts 'Select a person from the following list by number '
        @people.each_with_index do |person, i|
          puts "#{i}) #{person.info}"
        end

        person = gets.chomp.to_i
        case person
        when 0..@people.size-1
          return @people[person]
        else
          puts 'That person does not exist'
        end
      end
    end
    @create_rental_failure
  end

  def get_date
    puts 'Enter the date of the rental'
    gets.chomp
  end

  def create_rental
    book = get_book_for_rental
    person = get_person_that_rents
    unless book.is_a?(Book) && person.is_a?(Person)
      print_error(@create_rental_failure)
      return
    end
    date = get_date
    puts 'Rental created successfully'
    @rentals.push(Rental.new(date, book, person))
  end

  def get_id
    puts 'ID of person'
    gets.chomp.to_i
  end

  def list_rentals()
    id = get_id
    @rentals.each do |rent|
      puts rent.info if rent.person.id <=> id
    end
  end

  def init_actions
    @actions.push(
      method(:list_all_books),
      method(:list_all_people),
      method(:create_person),
      method(:create_book),
      method(:create_rental),
      method(:list_rentals)
    )
  end

  def run
    keep_running = true
    while keep_running
      print_options
      user_inp = gets.chomp.to_i-1
      case user_inp
      when 0..@actions.size - 1
        @actions[user_inp].call
      when @EXIT_CODE.to_i-1
        keep_running = false
      end
    end
  end
end
