module UkCompaniesHouse
  module Company
    class << self

      def client
        UkCompaniesHouse::Client.new
      end

      # Search company information
      def search(query, items_per_page = nil, start_index = nil)
        params = {q: query}
        if items_per_page
          params[:items_per_page] = items_per_page
        end
        if start_index
          params[:start_index] = start_index
        end
        client.get("search/companies", params)
      end

      # Basic company information
      def basic_information(company_number)
        number = "#{company_number}".gsub(/[^a-zA-Z0-9]/, "")
        client.get("/company/#{number}")
      end

      # Registered office address
      def office_address(company_number)
        client.get("company/#{company_number}/registered-office-address/")
      end

      # List of all company officers
      def officers(company_number)
        client.get("company/#{company_number}/officers/")
      end

      # Get the filing history list of a company
      def filing_history(company_number, transaction_id)
        client.get("company/#{company_number}/filing-history/#{transaction_id}/")
      end

      # Get the filing history list of a company
      def filing_history_list(company_number, category = nil, items_per_page = nil, start_index = nil)
        params = {category: category}
        if items_per_page
          params[:items_per_page] = items_per_page
        end
        if start_index
          params[:start_index] = start_index
        end
        client.get("company/#{company_number}/officers/", params)
      end

      # Company insolvency information.
      def insolvency(company_number)
        client.get("company/#{company_number}/insolvency/")
      end

      # Individual charge information for company.
      def charge(company_number, charge_id)
        client.get("company/#{company_number}/charges/#{charge_id}/")
      end

      # List of charges for a company.
      def charges(company_number, items_per_page = nil, start_index = nil)
        params = {}
        if items_per_page
          params[:items_per_page] = items_per_page
        end
        if start_index
          params[:start_index] = start_index
        end
        client.get("company/#{company_number}/charges/", params)
      end

      # List of uk-establishments companies
      def uk_establishments(company_number)
        client.get("/company/#{company_number}/uk-establishments/")
      end

      # List of uk-establishments companies
      def corporate_entities(company_number)
        client.get("/company/#{company_number}/persons-with-significant-control/")
      end

      # Get details of an individual person with significant control
      def individual_person(company_number, psc_id)
        client.get("/company/#{company_number}/persons-with-significant-control/individual/#{psc_id}")
      end

      # Get details of a corporate entity with significant control
      def corporate_entity(company_number, psc_id)
        client.get("/company/#{company_number}/persons-with-significant-control/corporate-entity/#{psc_id}")
      end

      # Get details of a legal person with significant control
      def legal_persons(company_number, psc_id)
        client.get("/company/#{company_number}/persons-with-significant-control/legal-person/#{psc_id}")
      end

      # List of all persons with significant control statements
      def list_statements(company_number)
        client.get("/company/#{company_number}/persons-with-significant-control-statements")
      end

      # Get details of a person with significant control statement
      def statements(company_number)
        client.get("/company/#{company_number}/persons-with-significant-control-statements/#{statement_id}")
      end

      # Get details of a person with significant control statement
      def get_super_secure_person(company_number, super_secure_id)
        client.get("/company/#{company_number}/persons-with-significant-control/super-secure/#{super_secure_id}")
      end

      # Company registers information
      def registers(company_number)
        client.get("/company/#{company_number}/registers")
      end

      # Company exemptions information
      def exemptions(company_number)
        client.get("/company/#{company_number}/exemptions")
      end

    end
  end
end
