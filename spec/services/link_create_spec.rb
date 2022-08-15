# frozen_string_literal: true

require "rails_helper"

describe LinkCreate do
  it "creates a user and sends an email verification email" do
    result = nil

    expect {
      result = described_class.call(
        url: 'http://dev.apollodata.com/',
        description: 'Awesome GraphQL Client'
      )
    }.to change(Link, :count).by(1)

    list = Link.last!
    expect(result[:url]).to eq(list.url)
  end
end
