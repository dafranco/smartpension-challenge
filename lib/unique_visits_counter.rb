# frozen_string_literal: true

require 'log_counter'

# handles an Array of LogRecord and returns
# pages having uniq visits
class UniqueVisitsCounter < LogCounter
  def group_by_count
    results = {}
    @log_records.group_by(&:ip)
                .select { |_k, v| v.size == 1 }
                .each do |_k, v|
                  results[v.first.page] ||= 0
                  results[v.first.page] += 1
                end
    results
  end
end
