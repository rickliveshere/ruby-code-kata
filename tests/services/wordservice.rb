require "test/unit"
require_relative "../../src/utility/httpclient"
require_relative '../../src/services/wordservice'
require_relative '../../src/data/wordrepository'

class TestWordService < Test::Unit::TestCase

  def setup
    data_source = HttpClient.new()
    repository = WordRepository.new(data_source)
    @service = WordService.new(repository)
  end

  def teardown
    ## Nothing really
  end

  def test_transform_raise_error_if_input_empty
    input = ""
    output = "dog"

    exception = assert_raise(RuntimeError, "Missing input") do
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

    assert_raise(RuntimeError, "Missing input") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_expected_output_nil
    input = "cat"
    output = nil

    assert_raise(RuntimeError, "Missing expected output") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_input_not_string
    input = 123
    output = "dog"

    assert_raise(RuntimeError, "Input not a string") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_expected_output_not_string
    input = "cat"
    output = 123

    assert_raise(RuntimeError, "Expected output not a string") do
      @service.transform(input, output)
    end
  end

  def test_transform_raise_error_if_input_and_expected_output_length_not_equal
    input = "cat"
    output = "doggy"

    assert_raise(RuntimeError, "Input length must equal expected_output length") do
      @service.transform(input, output)
    end
  end

  def test_can_transform_return_array
    input = "cat"
    output = "dog"

    result = @service.transform(input, output)

    assert_true(result.is_a? Array)
  end

end