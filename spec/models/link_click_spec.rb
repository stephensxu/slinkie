require 'rails_helper'

RSpec.describe LinkClick, :type => :model do
    describe "#valid?" do
    it { should validate_presence_of(:link_id) }
    it { should allow_value("http://www.awesome.com", "foo+bar@gmail.io").for(:referrer) }
    it { should belong_to(:link) }
  end
end
