require './nameable'

# BaseDecorator class
class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # implement correct_name
  def correct_name
    @nameable.correct_name
  end
end
