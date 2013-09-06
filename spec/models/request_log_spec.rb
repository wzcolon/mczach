require 'spec_helper'

describe RequestLog do

  it { should belong_to(:application) }

  it { should validate_presence_of(:time_rendering) }
  it { should validate_presence_of(:time_in_ruby) }
  it { should validate_presence_of(:request_time) }
  it { should validate_presence_of(:time_in_db) }
end
