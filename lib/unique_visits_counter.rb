# frozen_string_literal: true

require 'log_counter'

# handles an Array of LogRecord and returns
# pages having uniq visits
class UniqueVisitsCounter < LogCounter
  def group_by_count
    results = {}
    @log_records.group_by(&:ip)
                .select { |_ip, visits| visits.size == 1 }
                .each do |_ip, visits|
                  results[visits.first.page] ||= 0
                  results[visits.first.page] += 1
                end
    results
  end
end
