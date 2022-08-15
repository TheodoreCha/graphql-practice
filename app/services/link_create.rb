# frozen_string_literal: true

class LinkCreate
  def self.call(...)
    new(...).call
  end

  def initialize(url:, description:)
    @url = url
    @description = description
  end

  def call
    link = Link.new(
      url: @url,
      description: @description
    )

    if link.save
      link
    else
      'fail'
    end
  end
end
