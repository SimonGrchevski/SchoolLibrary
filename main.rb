LIST_ALL_BOOKS_CODE = '0'
LIST_ALL_PEOPLE_CODE = '1'
CREATE_A_PERSON_CODE = '2'
CREATE_A_BOOK_CODE = '3'
CREATE_A_RENTAL_CODE = '4'
LIST_ALL_RENTALS_CODE = '5'
EXIT_CODE = 6

def print_options
  puts "#{LIST_ALL_BOOKS_CODE}) List all books"
  puts "#{LIST_ALL_PEOPLE_CODE}) List all people"
  puts "#{CREATE_A_PERSON_CODE}) Create a person"
  puts "#{CREATE_A_BOOK_CODE}) Create a book"
  puts "#{CREATE_A_RENTAL_CODE}) Create a rental"
  puts "#{LIST_ALL_RENTALS_CODE}) List all rentals for a given person id"
  puts "#{EXIT_CODE}) Terminate"
end

def main
  books = []
  people = []
  rentals = []
  loop do
    print_options
    case gets.chomp
    when LIST_ALL_BOOKS_CODE
      puts 'LIST ALL BOOKS'
    when LIST_ALL_PEOPLE_CODE
      puts 'LIST ALL BOOKS'
    when CREATE_A_PERSON_CODE
      puts 'LIST ALL BOOKS'
    when CREATE_A_BOOK_CODE
      puts 'LIST ALL BOOKS'
    when CREATE_A_RENTAL_CODE
      puts 'LIST ALL BOOKS'
    when LIST_ALL_RENTALS_CODE
      puts 'LIST ALL BOOKS'
    else puts 'END'
    end
  end
end

main()