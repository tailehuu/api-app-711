# frozen_string_literal: true

class NoneArgumentService < ApplicationService
  def execute
    raise StandardError, 'something went wrong'

    true_with_message 'success'
  rescue StandardError => e
    false_with_error e.message
  end
end
