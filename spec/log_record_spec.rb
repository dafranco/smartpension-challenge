# frozen_string_literal: true

require 'log_record'

RSpec.describe LogRecord do
  describe '#initialize' do
    it 'should fail if it doesn\'t receive a String' do
      expect { LogRecord.new(2) }.to raise_error(ArgumentError)
    end
  end

  describe '#as_map' do
    it 'should return ip and page as keys and corresponding values' do
      page = '/home'
      ip = '192.168.0.2'
      map = LogRecord.new("#{page} #{ip}").as_map
      expect(map[:ip]).to eq(ip)
      expect(map[:page]).to eq(page)
    end
  end

  describe '#ip' do
    it 'should return first position of the received record' do
      page = '/home'
      ip = '192.168.0.2'
      map = LogRecord.new("#{page} #{ip}").as_map
      expect(map[:ip]).to eq(ip)
    end
  end

  describe '#map' do
    it 'should return second position of the received record' do
      page = '/home'
      ip = '192.168.0.2'
      map = LogRecord.new("#{page} #{ip}").as_map
      expect(map[:page]).to eq(page)
    end
  end
end
