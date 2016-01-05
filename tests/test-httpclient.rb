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
    actual = @client.download_string("http://codekata.com/data/wordlist.txt")

    assert_true(actual.is_a? String)
    assert_equal("test", actual,  "Expected string has been downloaded")
  end

end