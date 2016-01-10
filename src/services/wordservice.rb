class WordService
  def initialize(word_repository)
    @word_repository = word_repository
  end

  def transform(input, expected_output)

  	raise "Missing input" if input.nil? || input.empty?
  	raise "Missing expected output" if expected_output.nil? || expected_output.empty?

    @word_repository.get()


  end
end