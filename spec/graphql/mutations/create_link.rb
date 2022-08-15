# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::CreateLink do
  describe  do
    it "calls LinkCreate service" do
      allow(LinkCreate).to receive(:call)
      query = <<-GRAPHQL
        mutation CreateLink($url: String!, $description: String!) {
          createLink(
            url: $url
            description: $description
          ) {
            id
            url
          }
        }
      GRAPHQL
      GraphqlTutorialSchema.execute(query, variables: {
        url: "test@example.com",
        description: "bad"
      })

      expect(LinkCreate).to have_received(:call).with(
        url: 'test@example.com',
        description: 'bad'
      )
    end
  end
end
