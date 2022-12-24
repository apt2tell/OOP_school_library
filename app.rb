require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

# rubocop:disable Metrics/ClassLength
# App class
class App
  attr_reader :book, :people, :rental

  def initialize
    @book = []
    @people = []
    @rental = []
  end

  # method to run App
  def run
    puts library_menu
    input = gets.chomp
    if input <= '6'
      options(input)
    elsif input == '7'
      puts 'Thanks for using our App'
    else
      puts 'Please selecct a number from 1 - 7'
    end
  end

  # library menu method
  def library_menu
    puts ''
    puts ''
    puts 'Welcome to School Library App!'
    puts ''
    puts ''
    puts 'Please choose one option by entering a number'
    puts ''
    puts ''
    puts '1 - List all  books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  # define options method
  def options(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      'Enter a number btw 1 - 7'
    end
  end

  # define show_menu method
  def show_menu
    puts ''
    print 'Press Enter to go back to menu'
    gets.chomp
    puts ''
    run
  end

  # define list_books method
  def list_books
    if @book.empty?
      puts 'No books'
      show_menu
    end
    puts 'List all books:'
    puts ''
    @book.each_with_index do |item, idx|
      puts "#{idx} Title: #{item.title}, Author: #{item.author}"
    end
    show_menu
  end

  # define list_people method
  def list_people
    if @people.empty?
      puts 'No people'
      show_menu
    end
    puts 'List of people:'
    puts ''
    @people.each_with_index do |item, idx|
      puts "#{idx} -- [#{item.class}] Name: #{item.name}, Age: #{item.age}"
    end
    show_menu
  end

  # define create_person method
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? Please input number: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please select 1 or 2'
    end
  end

  # define create_book method
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book.push(book)
    puts 'book successfully created!'
    show_menu
  end

  # define create_rental method
  def create_rental
    puts 'Select a book from list [Enter number]: '
    @book.each_with_index { |item, idx| puts "#{idx}-- #{item.title}, #{item.author}" }
    index = gets.chomp.to_i
    book = @book[index]
    puts 'Select a person from list [Enter number]: '
    @people.each_with_index { |item, idx| puts "#{idx}- #{item.name}" }
    person_id = gets.chomp.to_i
    person = @people[person_id]

    print 'Date(yyyy/mm/dd): '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    puts rental
    @rental.push(rental)

    puts 'Rental successfully created!'

    show_menu
  end

  # define list_rentals
  def list_rentals
    puts 'Select a person id (Enter person id)'
    @people.each { |item| puts "id: #{item.id}, Person: #{item.name}" }
    print 'person id: '
    id = gets.chomp.to_i
    @rental.each do |item|
      puts "Date: #{item.date}, Book: #{item.book.title} by #{item.book.author}" if item.person.id.to_i == id
    end
    show_menu
  end

  private

  # define create_student method
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    puts ''

    parent_permission = gets.chomp.upcase
    new_student = Student.new(age, parent_permission, name)
    @people.push(new_student)
    puts 'Student created successfully'
    show_menu
  end

  # define create_teacher method
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Teacher created successfully'
    show_menu
  end
end
# rubocop:enable Metrics/ClassLength
