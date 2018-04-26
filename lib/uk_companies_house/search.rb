module UkCompaniesHouse
  module Search
    class << self

      def client
        UkCompaniesHouse::Client.new
      end

      # Search Companies House
      def all(q, items_per_page = nil, start_index = nil)
        params = {q: q,
                  items_per_page: items_per_page,
                  start_index: start_index}
        client.get("search/", params)
      end

      #Search company information
      def company(q, items_per_page = nil, start_index = nil)
        params = {q: q,
                  items_per_page: items_per_page,
                  start_index: start_index}
        client.get("search/companies/", params)
      end

      # Search for officer information
      def officers(q, items_per_page = nil, start_index = nil)
        params = {q: q,
                  items_per_page: items_per_page,
                  start_index: start_index}
        client.get("search/officers", params)
      end

      # Search for disqualified officer information
      def disqualified_officers(q, items_per_page = nil, start_index = nil)
        params = {q: q,
                  items_per_page: items_per_page,
                  start_index: start_index}
        client.get("search/disqualified-officers/", params)
      end

    end
  end
end
