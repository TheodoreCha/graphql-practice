# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Link, type: :request do
  describe 'GraphQL query for looking up links' do
    it 'returns links' do
      Link.create(url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client')

      query = <<-GRAPHQL
        query {
          allLinks {
            id
            url
          }
        }
      GRAPHQL

      post '/graphql', params: { query: query }

      json = JSON.parse(response.body)
      data = json['data']['allLinks']

      expect(data).to eq([{"id"=>"1", "url"=>"http://dev.apollodata.com/"}])
    end
  end
end
