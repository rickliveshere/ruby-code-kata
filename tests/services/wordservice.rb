require "test/unit"
require_relative '../../src/services/wordservice'
require_relative '../../src/data/wordrepository'

class TestWordService < Test::Unit::TestCase

  def setup
    repository = WordRepository.new()
    @service = WordService.new(repository)
  end

  def teardown
    ## Nothing really
  end

  def test_transform_raise_error_if_input_empty
    input = ""
    output = "dog"

    assert_raise(RuntimeError, "Missing input") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_expected_output_empty
    input = "cat"
    output = ""

    assert_raise(RuntimeError, "Missing expected output") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_input_nil
    input = nil
    output = "dog"

    assert_raise(RuntimeError) do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_expected_output_nil
    input = "cat"
    output = nil

    assert_raise(RuntimeError) do
      @service.transform(input, output)
    end
  end

  #def test_can_transform_cat_into_cot
  #  input = "cat"
  #  output = "dog"

  #  expected = [input, "cot", "cog", output]

  #  actual = @service.transform(input, output)

  #  puts "Expected: " + expected 

  #  assert_true(actual.is_a? String)
  #  assert_equal(expected, actual, "cat has not been transformed into cot")
  #end

end