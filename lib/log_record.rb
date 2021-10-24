# frozen_string_literal: true

# encapsulates log records to have a clear interface
class LogRecord
  attr_accessor :raw_record

  def initialize(raw_record)
    raise ArgumentError unless raw_record.is_a?(String)

    @raw_record = raw_record.split(' ')
  end

  def ip
    as_map[:ip]
  end

  def page
    as_map[:page]
  end

  def as_map
    @as_map ||= { page: raw_record[0], ip: raw_record[1] }
  end
end
