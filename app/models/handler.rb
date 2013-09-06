class Handler

  attr_accessor :request_data, :application_name, :time_in_ruby, :time_in_db, :time_rendering, :request_time, :errors
  
  def initialize(request_data)
    self.request_data     = request_data
    self.application_name = request_data.fetch(:application_name, nil).to_s
    self.time_in_ruby     = request_data.fetch(:time_in_ruby, nil).to_f
    self.time_in_db       = request_data.fetch(:time_in_db, nil).to_f
    self.time_rendering   = request_data.fetch(:time_rendering, nil).to_f
    self.request_time     = request_time
    self.errors           = []
  end

  def log
    RequestLog.new.tap do |log|
      log.application      = find_or_create_application
      log.time_in_ruby     = time_in_ruby
      log.time_in_db       = time_in_db
      log.time_rendering   = time_rendering
      log.request_time     = request_time
      log.save!
    end
  end

  def results
    { results: "logged request successfully."}
  end

  private

  def find_or_create_application
    @application ||= (Application.find_by_name(application_name) || Application.create!(name: application_name))
  end

  def request_time
    time_rendering + time_in_db + time_in_ruby
  end
end
