class WordRepository
  def initialize(data_source)
    @data_source = data_source
  end

  def get()
  	word_list = @data_source.download_string(ENV["WORD_LIST_DATA_SOURCE"])
  	word_list.scrub.split(/\r?\n/)
  end
end