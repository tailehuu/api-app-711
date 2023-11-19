# frozen_string_literal: true

class WithArgumentService < ApplicationService
  def initialize(name)
    super()
    @name = name
  end

  def execute
    Rails.logger.info("name: #{name}")
    true_with_message 'success'
  rescue StandardError => e
    false_with_error e.message
  end

  private

  attr_reader :name
end
