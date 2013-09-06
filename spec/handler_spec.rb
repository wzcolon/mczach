require 'spec_helper'

describe Handler do

  let(:request_data) {
    {
      application_name: 'CrazyApp',
      time_in_ruby: 20,
      time_in_db:   3,
      time_rendering: 100
    }
  }

  let(:handler) { Handler.new(request_data) }

  describe 'instance_methods' do

    describe 'initialize' do

      it 'initializes with request_data and readers' do
        expect(handler.request_data).to include(application_name: 'CrazyApp')
        expect(handler.application_name).to eq('CrazyApp')
        expect(handler.time_in_ruby).to eq(20)
        expect(handler.time_in_db).to eq(3)
        expect(handler.time_rendering).to eq(100)
      end
    end

    describe 'log' do

      it 'saves a log record' do
        handler.log
        expect(RequestLog.last.time_in_ruby).to eq(20)
      end

      context 'when an application already exists in the db' do

        it 'adds a new log record' do
          count = RequestLog.all.count
          handler.log
          expect(RequestLog.all.count).to eq(count + 1)
        end
      end

      context 'when an application does not exist in the db' do

        it 'adds a new log record' do
          count = RequestLog.all.count handler.log
          expect(RequestLog.all.count).to eq(count + 1)
        end


        it 'adds a new application record' do
          handler.application_name = "Bob's App"
          handler.log
          expect(Application.last.name).to eq("Bob's App")
        end
      end

      describe 'check_for_errors' do

        let(:request_data) {
          {
            application_name: 'CrazyApp',
            time_in_db:   3,
            time_rendering: 100
          }
        }

        it 'adds to the error array when part of the expected request is missing' do
          handler.log
          expect(handler.errors).to include('time_in_ruby cannot be nil.')
        end
      end

    end
  end
end
