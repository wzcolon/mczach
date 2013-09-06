require 'spec_helper'

describe Api::LogsController do

  describe 'log' do

    let(:request_data) {
      {
        application_name: 'CrazyApp',
        time_in_ruby: 20,
        time_in_db:   3,
        time_rendering: 100
      }
    }

    context "when successful" do

      it 'returns a results hash' do
        post "/api/logs/log", request_data: request_data
        expect(response.body).to include("results")
      end
    end

    context "when unsuccessful" do
      
      it 'returns a error message' do
        request_data.delete(:application_name)
        post "/api/logs/log", request_data: request_data
        expect(response.body).to include("application_name cannot be nil.")
      end

      it 'saves a log' do
        post "/api/logs/log", request_data: request_data
        expect(RequestLog.last.time_in_ruby).to eq(20)
      end
    end
  end
end
