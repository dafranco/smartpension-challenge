# frozen_string_literal: true

require 'log_record'

class FileNotFound < StandardError; end

# This class encapsulates the IO handling of logfiles
class LogFile
  attr_reader :log_path

  def initialize(log_path)
    raise FileNotFound unless File.file?(log_path)

    @log_path = log_path
  end

  def lines
    @lines ||= build_lines
  end

  private

  def build_lines
    IO.readlines(log_path).map { |e| LogRecord.new(e) }
  end
end
