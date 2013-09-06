class RequestLog < ActiveRecord::Base

  validates  :time_in_ruby, :time_in_db, :time_rendering, :request_time, presence: true

  belongs_to :application

end
