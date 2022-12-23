require './rental'

# Book class
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(date, person)
    Rental.new(date, person, self)
  end
end
