require "test/unit"
require_relative "../src/utility/httpclient"

class TestHttpClient < Test::Unit::TestCase

  def setup
    @client = HttpClient.new()
  end

  def teardown
    ## Nothing really
  end

  def test_download_string_from_uri
    expected = File.read("tests/wordlist.txt")
    actual = @client.download_string("http://codekata.com/data/wordlist.txt")

    puts "Expected: " + expected 

    assert_true(actual.is_a? String)
    assert(actual.include?(expected), "Expected string has been downloaded")
  end

end