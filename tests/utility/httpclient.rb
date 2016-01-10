require "test/unit"

class TestHttpClient < Test::Unit::TestCase

  def setup
    @client = HttpClient.new()
  end

  def teardown
  ## Nothing really
  end

  def test_download_string_from_uri
    expected = File.read("tests/wordlist.txt")
    actual = @client.download_string(ENV["WORD_LIST_DATA_SOURCE"])

    assert_true(actual.is_a? String)
    assert(actual.include?(expected), "Expected string has been downloaded")
  end

end