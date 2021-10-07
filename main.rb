require './book'
require './teacher'
require './student'


LIST_ALL_BOOKS_CODE = '0'.freeze
LIST_ALL_PEOPLE_CODE = '1'.freeze
CREATE_A_PERSON_CODE = '2'.freeze
CREATE_A_BOOK_CODE = '3'.freeze
CREATE_A_RENTAL_CODE = '4'.freeze
LIST_ALL_RENTALS_CODE = '5'.freeze
EXIT_CODE = '6'.freeze


def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
  puts "#{CREATE_A_PERSON_CODE}) Create a person"
  puts "#{CREATE_A_BOOK_CODE}) Create a book"
  puts "#{CREATE_A_RENTAL_CODE}) Create a rental"
  puts "#{LIST_ALL_RENTALS_CODE}) List all rentals for a given person id"
  puts "#{EXIT_CODE}) Terminate"
end

def create_book
  puts 'Enter the title of the book'
  title = gets.chomp
  puts 'Enter the author of the book'
  author = gets.chomp
  puts 'Book created successfully'
  Book.new(title, author)
end

def create_teacher 
  puts 'Enter the name of the teacher'
  name = gets.chomp
  puts 'Enter the age of the teacher'
  age = gets.chomp
  puts 'Enter the specialization'
  spec = gets.chomp
  Teacher.new(age, spec, name)
end

def create_student
  puts 'Enter the name of the student'
  name = gets.chomp
  puts 'Enter the age of the student'
  age = gets.chomp
  puts 'Has a parent permission [Y/N]'
  permission = gets.chomp
  Student.new(age, name, permission.upcase.match?('Y'))
end

def create_person 
  teacher = '0'
  student = '1'
  loop do
    puts "#{teacher}) To create teacher"
    puts "#{student}) To create student"
    case gets.chomp
    when teacher
      return create_teacher
    when student
      return create_student
    else
      puts 'Wrong input,try again!'
    end
  end
end

def main
  books = []
  people = []
  rentals = []
  loop do
    print_options
    case gets.chomp
    when LIST_ALL_BOOKS_CODE
      books.each {|book| puts book.title; puts book.author}
    when LIST_ALL_PEOPLE_CODE
      people.each do |pep|
        pep.print_info
      end
    when CREATE_A_PERSON_CODE
      people.push(create_person)
    when CREATE_A_BOOK_CODE
      books.push(create_book)
    when CREATE_A_RENTAL_CODE
      puts 'LIST ALL BOOKS'
    when LIST_ALL_RENTALS_CODE
      puts 'LIST ALL BOOKS'
    else puts 'END'
    end
  end
end

main()