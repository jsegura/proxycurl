require "httparty"

module Proxycurl
  class Client
    include HTTParty

    base_uri "https://nubela.co/proxycurl/api/"
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
  end

  def linkedin_person_profile(url)
    response = self.class.get("/linkedin", { query: {
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
end
