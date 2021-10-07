require './book'
require './teacher'
require './student'
require './rental'

LIST_ALL_BOOKS_CODE = '1'.freeze
LIST_ALL_PEOPLE_CODE = '2'.freeze
CREATE_A_PERSON_CODE = '3'.freeze
CREATE_A_BOOK_CODE = '4'.freeze
CREATE_A_RENTAL_CODE = '5'.freeze
LIST_ALL_RENTALS_CODE = '6'.freeze
EXIT_CODE = '7'.freeze


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
  system 'clear'
  puts 'Enter the title of the book'
  title = gets.chomp
  puts 'Enter the author of the book'
  author = gets.chomp
  puts 'Book created successfully'
  Book.new(title, author)
end

def create_teacher
  system 'clear'
  puts 'Enter the name of the teacher'
  name = gets.chomp
  puts 'Enter the age of the teacher'
  age = gets.chomp
  puts 'Enter the specialization'
  spec = gets.chomp
  puts 'Teacher created successfully'
  Teacher.new(age, spec, name)
end

def create_student
  system 'clear'
  puts 'Enter the name of the student'
  name = gets.chomp
  puts 'Enter the age of the student'
  age = gets.chomp
  puts 'Has a parent permission [Y/N]'
  permission = gets.chomp
  Student.new(age, name, permission.upcase.match?('Y'))
end

def create_person 
  teacher = '1'
  student = '2'
  loop do
    system 'clear'
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

def get_book_for_rental( books )
  loop do 
    puts 'Select a Book from the following list by number '
      books.each_with_index do |book, i|
        puts "#{i}) #{book.info}"
      end

    book = gets.chomp.to_i
    case book
    when 0..books.size
      return books[book]
    else 
      puts 'That book does not exist'
    end
  end
end

def get_person_that_rents(people)
loop do 
    puts 'Select a person from the following list by number '
      people.each_with_index do |person, i|
        puts "#{i}) #{person.info}"
      end

    person = gets.chomp.to_i
    case person
    when 0..people.size
        return people[person]
    else 
      puts 'That person does not exist'
    end
  end
end

def get_date 
  puts 'Enter the date of the rental'
  gets.chomp
end

def create_rental(books, people)
  system 'clear'
  book = get_book_for_rental(books)
  person = get_person_that_rents(people)
  date = get_date
  puts 'Rental created successfully'
  Rental.new(date, book, person)
end

def get_id
  puts 'ID of person'
  gets.chomp.to_i
end

def list_rentals(rentals)
  system 'clear'
  id = get_id
  rentals.each do |rent|
    if( rent.person.id === id)
      puts rent.info
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
      books.each {|book| puts book.info }
    when LIST_ALL_PEOPLE_CODE
      people.each { |pep| puts pep.info }
    when CREATE_A_PERSON_CODE
      people.push(create_person)
    when CREATE_A_BOOK_CODE
      books.push(create_book)
    when CREATE_A_RENTAL_CODE
      rentals.push(create_rental(books, people))
    when LIST_ALL_RENTALS_CODE
      list_rentals(rentals)
    else 
      puts 'Thank you for using this app.'
      return
    end
  end
end

main()