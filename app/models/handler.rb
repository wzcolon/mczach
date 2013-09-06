class Handler

  attr_accessor :request_data, :application_name, :time_in_ruby, :time_in_db, :time_rendering, :request_time, :errors
  
  def initialize(request_data)
    self.request_data     = request_data
    self.application_name = request_data.fetch(:application_name, nil).to_s
    self.time_in_ruby     = request_data.fetch(:time_in_ruby, nil)
    self.time_in_db       = request_data.fetch(:time_in_db, nil)
    self.time_rendering   = request_data.fetch(:time_rendering, nil)
    self.request_time     = request_time
    self.errors           = []
  end

  def log
    return false unless check_for_errors
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

  def check_for_errors
    instance_values.each do |k, v|
      next if k == 'errors'
      v.blank? ? errors << "#{k} cannot be nil." : next
    end

    errors.empty?
  end

  private

  def find_or_create_application
    @application ||= (Application.find_by_name(application_name) || Application.create!(name: application_name))
  end

  def request_time
    time_rendering.to_f + time_in_db.to_f + time_in_ruby.to_f
  end
end
