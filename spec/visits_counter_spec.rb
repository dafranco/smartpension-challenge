# frozen_string_literal: true

require 'visits_counter'

RSpec.describe VisitsCounter do
  describe '#count' do
    it 'should add up same pages' do
      page_to_sum = '/home'
      expected_count = 4
      records = []

      expected_count.times do
        records << LogRecord.new("#{page_to_sum} 1")
      end

      expect(VisitsCounter.new(records).count.first).to eq([page_to_sum, expected_count])
    end

    it 'should add up different pages by occurrences' do
      first_page_to_sum = '/home'
      first_expected_count = 4
      second_page_to_sum = '/about'
      second_expected_count = 2
      records = []

      first_expected_count.times do
        records << LogRecord.new("#{first_page_to_sum} 1")
      end

      second_expected_count.times do
        records << LogRecord.new("#{second_page_to_sum} 1")
      end

      expect(VisitsCounter.new(records).count).to include([first_page_to_sum, first_expected_count])
      expect(VisitsCounter.new(records).count).to include([second_page_to_sum, second_expected_count])
    end
  end
end
