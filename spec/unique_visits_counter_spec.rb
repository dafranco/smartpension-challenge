# frozen_string_literal: true

require 'unique_visits_counter'

RSpec.describe UniqueVisitsCounter do
  def add_repeated_records(records)
    repeated_ip = '10.0.0.3'
    repeated_page = '/faq'
    4.times do
      records << LogRecord.new("#{repeated_page} #{repeated_ip}")
    end
  end

  describe '#count' do
    it 'shows only pages with uniq visits' do
      unique_ip = '192.168.0.1'
      unique_page = '/unique'
      records = []

      add_repeated_records(records)
      records << LogRecord.new("#{unique_page} #{unique_ip}")

      result = UniqueVisitsCounter.new(records).count

      expect(result).to be_a(Array)
      expect(result).to eq([[unique_page, 1]])
    end

    it 'adds up multiple uniq visits to a page' do
      uniq_ip_one = '192.168.0.10'
      uniq_ip_two = '192.168.0.11'
      unique_page = '/uniq'
      records = []

      add_repeated_records(records)

      records << LogRecord.new("#{unique_page} #{uniq_ip_one}")
      records << LogRecord.new("#{unique_page} #{uniq_ip_two}")

      result = UniqueVisitsCounter.new(records).count

      expect(result).to eq([[unique_page, 2]])
    end

    it 'does not count ips that visited multiple pages' do
      test_ip = '192.168.0.1'
      visited_page_one = '/home'
      visited_page_two = '/about'
      records = []

      records << LogRecord.new("#{visited_page_one} #{test_ip}")
      records << LogRecord.new("#{visited_page_two} #{test_ip}")

      expect(UniqueVisitsCounter.new(records).count).to eq([])
    end
  end
end
