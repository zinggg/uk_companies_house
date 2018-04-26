module UkCompaniesHouse
  module Officer
    class << self

      def client
        UkCompaniesHouse::Client.new
      end

      # List of all officer appointments
      def appointments(officer_id)
        client.get("officers/#{officer_id}/appointments/")
      end

      # Get a natural officer's disqualifications
      def natural_disqualified(officer_id)
        client.get("/disqualified-officers/natural/#{officer_id}/")
      end

      # Get a corporate officer's disqualifications
      def corporate_disqualified(officer_id)
        client.get("/disqualified-officers/corporate/#{officer_id}")
      end

    end
  end
end
