# frozen_string_literal: true

require 'log_file'

RSpec.describe LogFile do
  let(:fake_log_path) { 'spec/examples/fake.log' }

  describe '#initialize' do
    it 'should raise an exception for non-existing file path' do
      expect { LogFile.new('fake') }.to raise_exception(FileNotFound)
    end

    it 'should initialize properly for a valid path' do
      expect { LogFile.new('spec/examples/fake.log') }.not_to raise_exception
    end
  end

  describe '#records' do
    let(:log_file) { LogFile.new(fake_log_path) }

    it 'should return all the records in an Array' do
      expect(log_file.records).to be_an(Array)
    end

    it 'should return records matching file' do
      expect(log_file.records[0].ip).to eq('192.168.0.1')
      expect(log_file.records[0].page).to eq('/home')
    end
  end
end
