require './person.rb'

# Teacher class
class Teacher < Person
  def initialize(specialization, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
