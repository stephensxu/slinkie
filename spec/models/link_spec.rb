require 'rails_helper'

RSpec.describe Link, :type => :model do
  describe '#valid?' do
    it { should validate_presence_of(:url) }
    it { should belong_to(:user) }
    # it { should validate_presence_of(:private) }
  end

  describe '#save' do
    let(:link) { FactoryGirl.build(:link) }

    it 'sets short_name' do
      expect {
        link.save
      }.to change(link, :short_name).from(nil).to(String)
    end
  end

  describe '#to_param' do
    let(:link) { FactoryGirl.create(:link) }
    it 'returns the short_name' do
      expect(link.to_param).to eq(link.short_name)
    end
  end

  describe '#clicked!' do
    let(:link) { FactoryGirl.create(:link) }
    it "increments the value of click_count" do
      request = ActionController::TestRequest.new(:host => "http://www.awesome.com")
      expect {
        p "BEFORE CLICKS: #{link.reload.clicks.count }"
        link.clicked!(:referrer => request.referrer)
        p "BEFORE CLICKS: #{link.reload.clicks.count }"
      }.to change{ link.reload.clicks_count }.by(1)
    end
  end

  describe '#editable_by?' do
    context 'when link is not anonymous' do
      let(:other_user) { FactoryGirl.build_stubbed(:user) }
      let(:link)       { FactoryGirl.build_stubbed(:link_with_user) }

      it 'returns true for the user who created the link' do
        expect(link).to be_editable_by(link.user)
      end

      it 'returns false for a user who did not create the link' do
        expect(link).to_not be_editable_by(other_user)
      end

      it 'returns false for an anonymous user' do
        expect(link).to_not be_editable_by(nil)
      end
    end

    context 'when link is anonymous' do
      let(:other_user) { FactoryGirl.build_stubbed(:user) }
      let(:link)       { FactoryGirl.build_stubbed(:link) }

      it 'returns false for an actual user' do
        expect(link).to_not be_editable_by(other_user)
      end

      it 'returns false for an anonymous user' do
        expect(link).to_not be_editable_by(nil)
      end
    end
  end
end
