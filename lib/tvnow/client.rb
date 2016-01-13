require 'open-uri'
require 'rss'

module Tvnow
  class Client
    API_URL = 'http://tv.so-net.ne.jp/rss/schedulesByCurrentTime.action?group=10&stationAreaId=23'

    def get_program_list
      program = get_program
      restruct_program_list(program)
    rescue
      raise ParseError, "Failed to parse"
    end

    private

    def get_program
      RSS::Parser.parse(open(API_URL).read)
    end

    def restruct_program_list(program)
      program.items.map do |item|
        info = item.title
        {
          description: item.description,
          title: item.title,
        }
      end
    end
  end

  class ParseError < StandardError; end
end
