# frozen_string_literal: true

require 'log_counter'

# Handles an Array of records and count the amount
# of visits every page had
class VisitsCounter < LogCounter
  def group_by_count
    results = {}

    @log_records.each do |record|
      results[record.page] ||= 0
      results[record.page] += 1
    end

    results
  end
end
