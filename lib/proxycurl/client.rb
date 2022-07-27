require "httparty"

module Proxycurl
  class Client
    include HTTParty

    base_uri "https://nubela.co/proxycurl/api"
    format :json

    def initialize(api_key)
      self.class.default_options.merge!(headers: { "Authorization" => "Bearer #{api_key}" })
    end

    def linkedin_company_profile(url)
      response = self.class.get("/linkedin/company", { query: {
        resolve_numeric_id: false,
        categories: :include,
        funding_data: :include,
        extra: :include,
        exit_data: :include,
        acquisitions: :include,
        url: url,
      } })
      response.parsed_response
    end

    def linkedin_company_lookup(params)
      response = self.class.get("/linkedin/company/resolve", { query: params })
      response.parsed_response
    end

    def linkedin_person_profile(url)
      response = self.class.get("/v2/linkedin", { query: {
        skills: :include,
        inferred_salary: :include,
        personal_email: :include,
        personal_contact_number: :include,
        twitter_profile_id: :include,
        facebook_profile_id: :include,
        github_profile_id: :include,
        extra: :include,
        url: url,
      } })
      response.parsed_response
    end

    def linkedin_company_employees(params)
      response = self.class.get("/linkedin/company/employees", { query: params })
      response.parsed_response
    end

    def credit_balance
      response = self.class.get("/credit-balance")
      response.parsed_response
    end

    def linkedin_company_count(params)
      response = self.class.get("/linkedin/company/employees/count", { query: params })
      response.parsed_response
    end

    def linkedin_company_employees(params)
      response = self.class.get("/linkedin/company/employees/", { query: params })
      response.parsed_response
    end
  end
end
