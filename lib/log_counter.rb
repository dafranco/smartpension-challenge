# frozen_string_literal: true

# Parent class outlining the algorithm to count pagevisits by
# different criterias. Subclassed must implement logic for grouping
class LogCounter
  def initialize(log_records)
    @log_records = log_records
  end

  def count
    sort_desc(group_by_count)
  end

  def group_by_count
    raise NotImplementedError
  end

  private

  def sort_desc(results)
    results.map { |k, v| [k, v] }.sort_by { |e| e[1] }.reverse!
  end
end
