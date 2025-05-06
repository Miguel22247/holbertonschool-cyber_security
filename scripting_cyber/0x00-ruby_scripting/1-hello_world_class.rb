class HelloWorld
  def initialize
    @message = "Hello, World!"
  end

  def print_hello
    puts @message
  end
end

# Create an instance of HelloWorld and call the print_hello method
hello = HelloWorld.new
hello.print_hello