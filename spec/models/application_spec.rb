require 'spec_helper'

describe Application do

  it { should have_many(:request_logs) }

  it { should validate_presence_of(:name) }

end
