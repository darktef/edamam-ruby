module Edamam
  class FoodDatabase
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def search_by_ingredient(ingredient)
      status_code, response = connection.get(
        client,
        Utils::Api::FOOD_PARSER_URL,
        ingr: ingredient
      )

      process_search_reseponse(status_code, response)
    end

    def nutrients(food_id)
      food_body = prepare_food_body(food_id)
      status_code, response = connection.post(
        client,
        Utils::Api::FOOD_NUTRIENTS_URL,
        body: food_body
      )
      process_nutritients_response(status_code, response)
    end

    private

    def prepare_food_body(food_id)
      {
        ingredients: [
          {
            quantity: 1,
            measureURI: "http://www.edamam.com/ontologies/edamam.owl#Measure_unit",
            foodId: food_id
          }
        ]
      }
    end

    def process_nutritients_response(status, body)
      return body unless status

      Response::TotalNutrients.new(total_nutrients: body["totalNutrients"])
    end

    def process_search_reseponse(status, body)
      return body unless status


      Response::SearchResult.new(body)
    end

    def connection
      @connection ||= Utils::Connection.new
    end
  end
end
