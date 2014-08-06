require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:links) }
  
  describe "#valid?" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should ensure_length_of(:email).is_at_least(6) }
    it { should ensure_length_of(:password).is_at_least(6) }
    it { should allow_value("waffle@gmail.com", "foo+bar@gmail.io").for(:email) }
    it { should_not allow_value("@", "jim@", "@iams", "stephens@1234ji").for(:email) }
    it { should_not allow_value("1", "123", "12345", "abcde").for(:password) }
    it { should validate_confirmation_of(:password) }
  end
end
