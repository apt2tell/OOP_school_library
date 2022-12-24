require_relative './app'

# main method
def main
  app = App.new
  puts ''
  puts 'Welcome'
  puts ''
  app.run
end

main
