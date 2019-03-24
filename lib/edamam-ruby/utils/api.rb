module Edamam
  module Utils
    module Api
      BASE_URL = "https://api.edamam.com".freeze

      FOOD_DATABASE_URL = "/api/food-database".freeze

			FOOD_PARSER_URL = (FOOD_DATABASE_URL + "/parser").freeze
			FOOD_NUTRIENTS_URL = (FOOD_DATABASE_URL + "/nutrients").freeze
    end
  end
end
