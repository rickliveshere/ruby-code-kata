class WordService
  def initialize(word_repository)
    @word_repository = word_repository
  end

  def transform(input, expected_output)

  	raise "Input not a string" if !input.is_a? String
  	raise "Expected output not a string" if !expected_output.is_a? String

  	raise "Missing input" if input.nil? || input.empty?
  	raise "Missing expected output" if expected_output.nil? || expected_output.empty?

  	raise "Input length must equal expected_output length" if input.length != expected_output.length

    @word_repository.get()


  end
end