module Edamam
  module Response
    class SearchResult
      attr_reader :search_string, :parsed, :hints, :next_page_link

      def initialize(response_body)
        @search_string = response_body["text"]
        @parsed = response_body["parsed"].map do |p|
          Food.new(p["food"])
        end
        @hints = response_body["hints"].map do |h|
          Food.new(h["food"])
        end
        @next_page_link = response_body.dig("_links", "next", "href")
      end
    end
  end
end
