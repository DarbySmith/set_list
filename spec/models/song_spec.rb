require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it {should belong_to :artist}
  end
end