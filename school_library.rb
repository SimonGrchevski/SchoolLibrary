require_relative './teacher'
require_relative './student'
require_relative './rental'
require_relative './person'
require_relative './generate'

class SchoolLibrary
  def initialize
    @books = []
    @people = []
    @rentals = []
    @actions = []
    @teacher = '1'
    @student = '2'
    @create_rental_failure = 'F'
    @exit_code = Print.options_size
    init_actions
  end

  def print_options
    Print.options
  end

  def list_all_books
    Print.entity_info(@books)
  end

  def list_all_people
    Print.entity_info(@people)
  end

  def create_book
    @books.push(Generate.book)
  end

  def create_teacher
    @people.push(Generate.teacher)
  end

  def create_student
    @people.push(Generate.student)
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
        Print.error('Wrong input,try again!')
      end
    end
  end

  def book_for_rental
    unless @books.size.eql? 0
      loop do
        puts 'Select a Book from the following list by number '
        Print.entity_with_index(@books)
        book = gets.chomp.to_i
        case book
        when 0..@books.size - 1 then return @books[book]
        else
          Print.error('That book does not exist, try again!')
        end
      end
    end
    @create_rental_failure
  end

  def person_that_rents
    unless @people.size.eql? 0
      loop do
        puts 'Select a person from the following list by number '
        Print.entity_with_index(@people)
        person = gets.chomp.to_i
        case person
        when 0..@people.size - 1
          return @people[person]
        else
          Print.error('That person does not exist')
        end
      end
    end
    @create_rental_failure
  end

  def ask_for_date
    puts 'Enter the date of the rental'
    gets.chomp
  end

  def create_rental
    book = book_for_rental
    person = person_that_rents
    unless book.is_a?(Book) && person.is_a?(Person)
      Print.error('Err: There isnt any book or person!')
      return
    end
    date = ask_for_date
    Print.success('Rental created successfully')
    @rentals.push(Rental.new(date, book, person))
  end

  def id_from_user
    puts 'ID of person'
    gets.chomp.to_i
  end

  def list_rentals
    id = id_from_user
    Print.enitiy_info_if_id(@rentals, id)
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
      user_inp = gets.chomp.to_i - 1
      case user_inp
      when 0..@actions.size - 1
        @actions[user_inp].call
      when @exit_code.to_i - 1
        keep_running = false
      end
    end
  end
end
