# frozen_string_literal: true

# !/usr/bin/env ruby
$LOAD_PATH << './lib'

require 'log_file'
require 'visits_counter'
require 'unique_visits_counter'

ARGV.each do |log_path|
  4.times { puts '' }
  puts "Analizing file #{log_path}"
  log_records = LogFile.new(log_path).lines

  puts 'Count of visits are: '
  VisitsCounter.new(log_records).count.each { |e| puts "#{e[0]}: #{e[1]}" }

  puts ''
  puts 'Uniq visits are: '
  UniqueVisitsCounter.new(log_records).count.each { |e| puts "#{e[0]}: #{e[1]}" }
end
