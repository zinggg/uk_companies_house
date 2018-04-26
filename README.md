# Uk Companies House API

UK Companies House API

Companies House digitally records almost all information it receives, and makes this available to the public through its own website and through the Companies House RESTful API.

https://developer.companieshouse.gov.uk/api/docs/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uk_companies_house'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install uk_companies_house

## Setup

Initialize the the gem by setting your personal API key:

```
    UkCompaniesHouse.api_key = 'YOUR_API_KEY'
```

Or create ENV variable UK_COMPANIES_HOUSE_API_KEY ( ENV['UK_COMPANIES_HOUSE_API_KEY'] ) with you API KEY

## Usage

The path "company/06790962/filing-history" can be replaced by any other path available in the companieshouse.gov.uk documentation:
https://developer.companieshouse.gov.uk/api/docs/

Get request for any URL ( "company/06790962/filing-history" can be changed to any path ):
```
UkCompaniesHouse::Client.new.get("company/06790962/filing-history")
```
(POST url have same format)
To send new request via POST just change get to post:
example:
```
UkCompaniesHouse::Client.new.post("company/06790962/filing-history", { q: "any params with any query can be added", extra2: "more params" })
```

## Example

```
filing_history = UkCompaniesHouse::Company.filing_history('06790962', 'MzE5NTI2NjkwOGFkaXF6a2N4')

# the parsed response is in the body
=> filing_history.body
{
	"date": "2018-01-15",
	"description_values": {
		"made_up_date": "2018-01-14"
	},
	"category": "confirmation-statement",
	"description": "confirmation-statement-with-no-updates",
	"type": "CS01",
	"links": {
		"self": "/company/06790962/filing-history/MzE5NTI2NjkwOGFkaXF6a2N4",
		"document_metadata": "https://document-api.companieshouse.gov.uk/document/Ky1jcl7swkFk-X3TDV-xxCdVCNqhSS2uzlpzPMsJpDk"
	},
	"action_date": "2018-01-14",
	"pages": 3,
	"barcode": "X6XOKYQJ",
	"transaction_id": "MzE5NTI2NjkwOGFkaXF6a2N4"
}

```


##Available methods:

### Global search:

```
# Search Companies House
UkCompaniesHouse::Search.all("query text", items_per_page, start_index)

# Search company information
UkCompaniesHouse::Search.company("query text", items_per_page, start_index)

# Search for officer information
UkCompaniesHouse::Search.officers("query text", items_per_page, start_index)

# Search for disqualified officer information
UkCompaniesHouse::Search.disqualified_officers("query text", items_per_page, start_index)

```


### Company:

```
# Search company information
UkCompaniesHouse::Company.search(q: "Query text")
UkCompaniesHouse::Company.search(q: "Query Text, items_per_page = 5, start_index = 5)

# Basic company information
UkCompaniesHouse::Company.basic_information(company_number)

# Registered office address
UkCompaniesHouse::Company.office_address(company_number)

# List of all company officers
UkCompaniesHouse::Company.officers(company_number)

# Get the filing history list of a company
UkCompaniesHouse::Company.filing_history(company_number, transaction_id)

# Get the filing history list of a company
UkCompaniesHouse::Company.filing_history_list(company_number, category, items_per_page, start_index)

# Company insolvency information.
UkCompaniesHouse::Company.insolvency(company_number)

# Individual charge information for company.
UkCompaniesHouse::Company.charge(company_number, charge_id)

# List of uk-establishments companies
UkCompaniesHouse::Company.uk_establishments(company_number)

# List the company persons with significant control
UkCompaniesHouse::Company.corporate_entities(company_number

# Get details of an individual person with significant control
UkCompaniesHouse::Company.individual_person(company_number, psc_id)

# Get details of a corporate entity with significant control
UkCompaniesHouse::Company.corporate_entity(company_number, psc_id)

# Get details of a legal person with significant contro
UkCompaniesHouse::Company.legal_persons(company_number, psc_id)

# List of all persons with significant control statements
UkCompaniesHouse::Company.list_statements(company_number)

# Get details of a person with significant control statement
UkCompaniesHouse::Company.statements(company_number)

# Get company registers information
UkCompaniesHouse::Company.registers(company_number)

# Company exemptions information
UkCompaniesHouse::Company.exemptions(company_number)

```


### Officer:

```
# List of all officer appointments
UkCompaniesHouse::Officer.appointments(officer_id)

# Get a natural officer's disqualifications
UkCompaniesHouse::Officer.natural_disqualified(officer_id)

# Get a corporate officer's disqualifications
UkCompaniesHouse::Officer.corporate_disqualified(officer_id)

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zinggg/uk_companies_house. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UkCompaniesHouse project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/uk_companies_house/blob/master/CODE_OF_CONDUCT.md).
