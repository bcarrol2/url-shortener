require './test/test_helper'

RSpec.describe Api::V1::ConvertsController, type: :controller do

  describe 'post #create' do
    let(:convert) do
      post :create, params: { long_url: 'ww', url_endpoint: '1111111', new_url: 'http://localhost:3000/api/v1/show/1111111' }.to_json
    end

    it "check for invalid url" do
      expect('Long url is too short')
    end
  end
end